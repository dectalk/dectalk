# Microsoft Developer Studio Generated NMAKE File, Based on say.dsp
!IF "$(CFG)" == ""
CFG=say - Win32 Debug Static Latin American
!MESSAGE No configuration specified. Defaulting to say - Win32 Debug Static Latin American.
!ENDIF 

!IF "$(CFG)" != "say - Win32 Release" && "$(CFG)" != "say - Win32 Debug" && "$(CFG)" != "say - Win32 Release Spanish" && "$(CFG)" != "say - Win32 Release German" && "$(CFG)" != "say - Win32 Release Latin American" && "$(CFG)" != "say - Win32 Debug Spanish" && "$(CFG)" != "say - Win32 Debug German" && "$(CFG)" != "say - Win32 Debug Latin American" && "$(CFG)" != "say - Win32 ALPHA Release" && "$(CFG)" != "say - Win32 ALPHA Debug" && "$(CFG)" != "say - Win32 ALPHA Release Spanish" && "$(CFG)" != "say - Win32 ALPHA Release German" && "$(CFG)" != "say - Win32 ALPHA Release Latin American" && "$(CFG)" != "say - Win32 ALPHA Debug Spanish" && "$(CFG)" != "say - Win32 ALPHA Debug German" && "$(CFG)" != "say - Win32 ALPHA Debug Latin American" && "$(CFG)" != "say - Win32 Release United Kingdom" && "$(CFG)" != "say - Win32 Debug United Kingdom" && "$(CFG)" != "say - Win32 ALPHA Release United Kingdom" && "$(CFG)" != "say - Win32 ALPHA Debug United Kingdom" && "$(CFG)" != "say - Win32 Release Static" && "$(CFG)" != "say - Win32 Release Static Spanish" && "$(CFG)" != "say - Win32 Release Static United Kingdom" && "$(CFG)" != "say - Win32 Release Static German" && "$(CFG)" !=\
 "say - Win32 Release Static Latin American" && "$(CFG)" != "say - Win32 Debug Static" && "$(CFG)" != "say - Win32 Debug Static Spanish" && "$(CFG)" != "say - Win32 Debug Static United Kingdom" && "$(CFG)" != "say - Win32 Debug Static German" && "$(CFG)" != "say - Win32 Debug Static Latin American" && "$(CFG)" != "say - Win32 ALPHA Release Static" && "$(CFG)" != "say - Win32 ALPHA Release Static German" && "$(CFG)" != "say - Win32 ALPHA Release Static Latin American" && "$(CFG)" != "say - Win32 ALPHA Release Static Spanish" && "$(CFG)" != "say - Win32 ALPHA Release Static United Kingdom"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "say.mak" CFG="say - Win32 Debug Static Latin American"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "say - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Release Spanish" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Release German" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Release Latin American" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Debug Spanish" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Debug German" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Debug Latin American" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 ALPHA Release" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "say - Win32 ALPHA Debug" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "say - Win32 ALPHA Release Spanish" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "say - Win32 ALPHA Release German" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "say - Win32 ALPHA Release Latin American" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "say - Win32 ALPHA Debug Spanish" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "say - Win32 ALPHA Debug German" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "say - Win32 ALPHA Debug Latin American" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "say - Win32 Release United Kingdom" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Debug United Kingdom" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 ALPHA Release United Kingdom" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "say - Win32 ALPHA Debug United Kingdom" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "say - Win32 Release Static" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Release Static Spanish" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Release Static United Kingdom" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Release Static German" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Release Static Latin American" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Debug Static" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Debug Static Spanish" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Debug Static United Kingdom" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Debug Static German" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Debug Static Latin American" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 ALPHA Release Static" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "say - Win32 ALPHA Release Static German" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "say - Win32 ALPHA Release Static Latin American" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "say - Win32 ALPHA Release Static Spanish" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "say - Win32 ALPHA Release Static United Kingdom" (based on "Win32 (ALPHA) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "say - Win32 Release"

OUTDIR=.\build\us\release
INTDIR=.\build\us\release\link
# Begin Custom Macros
OutDir=.\build\us\release
# End Custom Macros

ALL : "$(OUTDIR)\say.exe"


CLEAN :
	-@erase "$(INTDIR)\say.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\say.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D "ENGLISH_US" /D "ENGLISH" /Fp"$(INTDIR)\say.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\say.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\us\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\say.pdb" /machine:I386 /out:"$(OUTDIR)\say.exe" 
LINK32_OBJS= \
	"$(INTDIR)\say.obj"

"$(OUTDIR)\say.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "say - Win32 Debug"

OUTDIR=.\build\us\debug
INTDIR=.\build\us\debug\link
# Begin Custom Macros
OutDir=.\build\us\debug
# End Custom Macros

ALL : "$(OUTDIR)\say.exe"


CLEAN :
	-@erase "$(INTDIR)\say.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\say.exe"
	-@erase "$(OUTDIR)\say.ilk"
	-@erase "$(OUTDIR)\say.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D "ENGLISH_US" /D "ENGLISH" /Fp"$(INTDIR)\say.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\say.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\say.pdb" /debug /machine:I386 /out:"$(OUTDIR)\say.exe" 
LINK32_OBJS= \
	"$(INTDIR)\say.obj"

"$(OUTDIR)\say.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "say - Win32 Release Spanish"

OUTDIR=.\build\sp\release
INTDIR=.\build\sp\release\link
# Begin Custom Macros
OutDir=.\build\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\say.exe"


CLEAN :
	-@erase "$(INTDIR)\say.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\say.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "SPANISH" /D "SPANISH_SP" /Fp"$(INTDIR)\say.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\say.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\sp\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\say.pdb" /machine:I386 /out:"$(OUTDIR)\say.exe" 
LINK32_OBJS= \
	"$(INTDIR)\say.obj"

"$(OUTDIR)\say.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "say - Win32 Release German"

OUTDIR=.\build\gr\release
INTDIR=.\build\gr\release\link
# Begin Custom Macros
OutDir=.\build\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\say.exe"


CLEAN :
	-@erase "$(INTDIR)\say.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\say.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "GERMAN" /Fp"$(INTDIR)\say.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\say.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\gr\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\say.pdb" /machine:I386 /out:"$(OUTDIR)\say.exe" 
LINK32_OBJS= \
	"$(INTDIR)\say.obj"

"$(OUTDIR)\say.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "say - Win32 Release Latin American"

OUTDIR=.\build\la\release
INTDIR=.\build\la\release\link
# Begin Custom Macros
OutDir=.\build\la\release
# End Custom Macros

ALL : "$(OUTDIR)\say.exe"


CLEAN :
	-@erase "$(INTDIR)\say.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\say.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "SPANISH" /D "SPANISH_LA" /Fp"$(INTDIR)\say.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\say.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\la\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\say.pdb" /machine:I386 /out:"$(OUTDIR)\say.exe" 
LINK32_OBJS= \
	"$(INTDIR)\say.obj"

"$(OUTDIR)\say.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "say - Win32 Debug Spanish"

OUTDIR=.\build\sp\debug
INTDIR=.\build\sp\debug\link
# Begin Custom Macros
OutDir=.\build\sp\debug
# End Custom Macros

ALL : "$(OUTDIR)\say.exe"


CLEAN :
	-@erase "$(INTDIR)\say.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\say.exe"
	-@erase "$(OUTDIR)\say.ilk"
	-@erase "$(OUTDIR)\say.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "SPANISH" /D "SPANISH_SP" /Fp"$(INTDIR)\say.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\say.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\sp\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\say.pdb" /debug /machine:I386 /out:"$(OUTDIR)\say.exe" 
LINK32_OBJS= \
	"$(INTDIR)\say.obj"

"$(OUTDIR)\say.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "say - Win32 Debug German"

OUTDIR=.\build\gr\debug
INTDIR=.\build\gr\debug\link
# Begin Custom Macros
OutDir=.\build\gr\debug
# End Custom Macros

ALL : "$(OUTDIR)\say.exe"


CLEAN :
	-@erase "$(INTDIR)\say.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\say.exe"
	-@erase "$(OUTDIR)\say.ilk"
	-@erase "$(OUTDIR)\say.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "GERMAN" /Fp"$(INTDIR)\say.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\say.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\gr\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\say.pdb" /debug /machine:I386 /out:"$(OUTDIR)\say.exe" 
LINK32_OBJS= \
	"$(INTDIR)\say.obj"

"$(OUTDIR)\say.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "say - Win32 Debug Latin American"

OUTDIR=.\build\la\debug
INTDIR=.\build\la\debug\link
# Begin Custom Macros
OutDir=.\build\la\debug
# End Custom Macros

ALL : "$(OUTDIR)\say.exe"


CLEAN :
	-@erase "$(INTDIR)\say.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\say.exe"
	-@erase "$(OUTDIR)\say.ilk"
	-@erase "$(OUTDIR)\say.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "SPANISH" /D "SPANISH_LA" /Fp"$(INTDIR)\say.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\say.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\la\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\say.pdb" /debug /machine:I386 /out:"$(OUTDIR)\say.exe" 
LINK32_OBJS= \
	"$(INTDIR)\say.obj"

"$(OUTDIR)\say.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release"

OUTDIR=.\alpha\us\release
INTDIR=.\alpha\us\release\link

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\say.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\us\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\say.pdb" /machine:ALPHA /out:"$(OUTDIR)\say.exe" 
LINK32_OBJS= \
	

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Debug"

OUTDIR=.\alpha\us\debug
INTDIR=.\alpha\us\debug\link

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\say.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\say.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\say.exe" 
LINK32_OBJS= \
	

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release Spanish"

OUTDIR=.\alpha\sp\release
INTDIR=.\alpha\sp\release\link

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\say.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\sp\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\say.pdb" /machine:ALPHA /out:"$(OUTDIR)\say.exe" 
LINK32_OBJS= \
	

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release German"

OUTDIR=.\alpha\gr\release
INTDIR=.\alpha\gr\release\link

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\say.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\gr\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\say.pdb" /machine:ALPHA /out:"$(OUTDIR)\say.exe" 
LINK32_OBJS= \
	

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release Latin American"

OUTDIR=.\alpha\la\release
INTDIR=.\alpha\la\release\link

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\say.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\la\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\say.pdb" /machine:ALPHA /out:"$(OUTDIR)\say.exe" 
LINK32_OBJS= \
	

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Debug Spanish"

OUTDIR=.\alpha\sp\debug
INTDIR=.\alpha\sp\debug\link

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\say.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\sp\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\say.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\say.exe" 
LINK32_OBJS= \
	

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Debug German"

OUTDIR=.\alpha\gr\debug
INTDIR=.\alpha\gr\debug\link

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\say.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\gr\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\say.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\say.exe" 
LINK32_OBJS= \
	

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Debug Latin American"

OUTDIR=.\alpha\la\debug
INTDIR=.\alpha\la\debug\link

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\say.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\la\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\say.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\say.exe" 
LINK32_OBJS= \
	

!ELSEIF  "$(CFG)" == "say - Win32 Release United Kingdom"

OUTDIR=.\build\uk\release
INTDIR=.\build\uk\release\link
# Begin Custom Macros
OutDir=.\build\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\say.exe"


CLEAN :
	-@erase "$(INTDIR)\say.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\say.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D "ENGLISH_UK" /D "ENGLISH" /Fp"$(INTDIR)\say.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\say.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\uk\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\say.pdb" /machine:I386 /out:"$(OUTDIR)\say.exe" 
LINK32_OBJS= \
	"$(INTDIR)\say.obj"

"$(OUTDIR)\say.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "say - Win32 Debug United Kingdom"

OUTDIR=.\build\uk\debug
INTDIR=.\build\uk\debug\link
# Begin Custom Macros
OutDir=.\build\uk\debug
# End Custom Macros

ALL : "$(OUTDIR)\say.exe"


CLEAN :
	-@erase "$(INTDIR)\say.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\say.exe"
	-@erase "$(OUTDIR)\say.ilk"
	-@erase "$(OUTDIR)\say.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D "ENGLISH_UK" /D "ENGLISH" /Fp"$(INTDIR)\say.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\say.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\uk\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\say.pdb" /debug /machine:I386 /out:"$(OUTDIR)\say.exe" 
LINK32_OBJS= \
	"$(INTDIR)\say.obj"

"$(OUTDIR)\say.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release United Kingdom"

OUTDIR=.\alpha\uk\release
INTDIR=.\alpha\uk\release\link

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\say.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\uk\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\say.pdb" /machine:ALPHA /out:"$(OUTDIR)\say.exe" 
LINK32_OBJS= \
	

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Debug United Kingdom"

OUTDIR=.\alpha\uk\debug
INTDIR=.\alpha\uk\debug\link

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\say.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\uk\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\say.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\say.exe" 
LINK32_OBJS= \
	

!ELSEIF  "$(CFG)" == "say - Win32 Release Static"

OUTDIR=.\build\us\static
INTDIR=.\build\us\static\link
# Begin Custom Macros
OutDir=.\build\us\static
# End Custom Macros

ALL : "$(OUTDIR)\say.exe"


CLEAN :
	-@erase "$(INTDIR)\say.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\say.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D "ENGLISH_US" /D "ENGLISH" /Fp"$(INTDIR)\say.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\say.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstaticS\us\release\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\say.pdb" /machine:I386 /out:"$(OUTDIR)\say.exe" 
LINK32_OBJS= \
	"$(INTDIR)\say.obj"

"$(OUTDIR)\say.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "say - Win32 Release Static Spanish"

OUTDIR=.\build\sp\static
INTDIR=.\build\sp\static\link
# Begin Custom Macros
OutDir=.\build\sp\static
# End Custom Macros

ALL : "$(OUTDIR)\say.exe"


CLEAN :
	-@erase "$(INTDIR)\say.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\say.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "SPANISH" /D "SPANISH_SP" /Fp"$(INTDIR)\say.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\say.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstaticS\sp\release\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\say.pdb" /machine:I386 /out:"$(OUTDIR)\say.exe" 
LINK32_OBJS= \
	"$(INTDIR)\say.obj"

"$(OUTDIR)\say.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "say - Win32 Release Static United Kingdom"

OUTDIR=.\build\uk\static
INTDIR=.\build\uk\static\link
# Begin Custom Macros
OutDir=.\build\uk\static
# End Custom Macros

ALL : "$(OUTDIR)\say.exe"


CLEAN :
	-@erase "$(INTDIR)\say.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\say.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D "ENGLISH_UK" /D "ENGLISH" /Fp"$(INTDIR)\say.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\say.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstaticS\uk\release\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\say.pdb" /machine:I386 /out:"$(OUTDIR)\say.exe" 
LINK32_OBJS= \
	"$(INTDIR)\say.obj"

"$(OUTDIR)\say.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "say - Win32 Release Static German"

OUTDIR=.\build\gr\static
INTDIR=.\build\gr\static\link
# Begin Custom Macros
OutDir=.\build\gr\static
# End Custom Macros

ALL : "$(OUTDIR)\say.exe"


CLEAN :
	-@erase "$(INTDIR)\say.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\say.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "GERMAN" /Fp"$(INTDIR)\say.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\say.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstaticS\gr\release\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\say.pdb" /machine:I386 /out:"$(OUTDIR)\say.exe" 
LINK32_OBJS= \
	"$(INTDIR)\say.obj"

"$(OUTDIR)\say.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "say - Win32 Release Static Latin American"

OUTDIR=.\build\la\static
INTDIR=.\build\la\static\link
# Begin Custom Macros
OutDir=.\build\la\static
# End Custom Macros

ALL : "$(OUTDIR)\say.exe"


CLEAN :
	-@erase "$(INTDIR)\say.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\say.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "SPANISH" /D "SPANISH_LA" /Fp"$(INTDIR)\say.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\say.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstaticS\la\release\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\say.pdb" /machine:I386 /out:"$(OUTDIR)\say.exe" 
LINK32_OBJS= \
	"$(INTDIR)\say.obj"

"$(OUTDIR)\say.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "say - Win32 Debug Static"

OUTDIR=.\build\us\Dstatic
INTDIR=.\build\us\Dstatic\link
# Begin Custom Macros
OutDir=.\build\us\Dstatic
# End Custom Macros

ALL : "$(OUTDIR)\say.exe"


CLEAN :
	-@erase "$(INTDIR)\say.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\say.exe"
	-@erase "$(OUTDIR)\say.ilk"
	-@erase "$(OUTDIR)\say.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D "ENGLISH_US" /D "ENGLISH" /Fp"$(INTDIR)\say.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\say.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstaticS\us\debug\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\say.pdb" /debug /machine:I386 /out:"$(OUTDIR)\say.exe" 
LINK32_OBJS= \
	"$(INTDIR)\say.obj"

"$(OUTDIR)\say.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "say - Win32 Debug Static Spanish"

OUTDIR=.\build\sp\Dstatic
INTDIR=.\build\sp\Dstatic\link
# Begin Custom Macros
OutDir=.\build\sp\Dstatic
# End Custom Macros

ALL : "$(OUTDIR)\say.exe"


CLEAN :
	-@erase "$(INTDIR)\say.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\say.exe"
	-@erase "$(OUTDIR)\say.ilk"
	-@erase "$(OUTDIR)\say.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "SPANISH" /D "SPANISH_SP" /Fp"$(INTDIR)\say.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\say.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstaticS\sp\debug\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\say.pdb" /debug /machine:I386 /out:"$(OUTDIR)\say.exe" 
LINK32_OBJS= \
	"$(INTDIR)\say.obj"

"$(OUTDIR)\say.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "say - Win32 Debug Static United Kingdom"

OUTDIR=.\build\uk\Dstatic
INTDIR=.\build\uk\Dstatic\link
# Begin Custom Macros
OutDir=.\build\uk\Dstatic
# End Custom Macros

ALL : "$(OUTDIR)\say.exe"


CLEAN :
	-@erase "$(INTDIR)\say.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\say.exe"
	-@erase "$(OUTDIR)\say.ilk"
	-@erase "$(OUTDIR)\say.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D "ENGLISH_UK" /D "ENGLISH" /Fp"$(INTDIR)\say.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\say.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstaticS\uk\debug\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\say.pdb" /debug /machine:I386 /out:"$(OUTDIR)\say.exe" 
LINK32_OBJS= \
	"$(INTDIR)\say.obj"

"$(OUTDIR)\say.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "say - Win32 Debug Static German"

OUTDIR=.\build\gr\Dstatic
INTDIR=.\build\gr\Dstatic\link
# Begin Custom Macros
OutDir=.\build\gr\Dstatic
# End Custom Macros

ALL : "$(OUTDIR)\say.exe"


CLEAN :
	-@erase "$(INTDIR)\say.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\say.exe"
	-@erase "$(OUTDIR)\say.ilk"
	-@erase "$(OUTDIR)\say.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "GERMAN" /Fp"$(INTDIR)\say.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\say.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstaticS\gr\debug\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\say.pdb" /debug /machine:I386 /out:"$(OUTDIR)\say.exe" 
LINK32_OBJS= \
	"$(INTDIR)\say.obj"

"$(OUTDIR)\say.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "say - Win32 Debug Static Latin American"

OUTDIR=.\build\la\Dstatic
INTDIR=.\build\la\Dstatic\link
# Begin Custom Macros
OutDir=.\build\la\Dstatic
# End Custom Macros

ALL : "$(OUTDIR)\say.exe"


CLEAN :
	-@erase "$(INTDIR)\say.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\say.exe"
	-@erase "$(OUTDIR)\say.ilk"
	-@erase "$(OUTDIR)\say.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "SPANISH" /D "SPANISH_LA" /Fp"$(INTDIR)\say.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\say.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstaticS\la\debug\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\say.pdb" /debug /machine:I386 /out:"$(OUTDIR)\say.exe" 
LINK32_OBJS= \
	"$(INTDIR)\say.obj"

"$(OUTDIR)\say.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release Static"

OUTDIR=.\alpha\us\static
INTDIR=.\alpha\us\static\link

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\say.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dtstaticS\us\release\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\say.pdb" /machine:ALPHA /out:"$(OUTDIR)\say.exe" 
LINK32_OBJS= \
	

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release Static German"

OUTDIR=.\alpha\gr\static
INTDIR=.\alpha\gr\static\link

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\say.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dtstaticS\gr\release\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\say.pdb" /machine:ALPHA /out:"$(OUTDIR)\say.exe" 
LINK32_OBJS= \
	

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release Static Latin American"

OUTDIR=.\alpha\la\static
INTDIR=.\alpha\la\static\link

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\say.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dtstaticS\la\release\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\say.pdb" /machine:ALPHA /out:"$(OUTDIR)\say.exe" 
LINK32_OBJS= \
	

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release Static Spanish"

OUTDIR=.\alpha\sp\static
INTDIR=.\alpha\sp\static\link

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\say.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dtstaticS\sp\release\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\say.pdb" /machine:ALPHA /out:"$(OUTDIR)\say.exe" 
LINK32_OBJS= \
	

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release Static United Kingdom"

OUTDIR=.\alpha\uk\static
INTDIR=.\alpha\uk\static\link

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\say.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dtstaticS\uk\release\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\say.pdb" /machine:ALPHA /out:"$(OUTDIR)\say.exe" 
LINK32_OBJS= \
	

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("say.dep")
!INCLUDE "say.dep"
!ELSE 
!MESSAGE Warning: cannot find "say.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "say - Win32 Release" || "$(CFG)" == "say - Win32 Debug" || "$(CFG)" == "say - Win32 Release Spanish" || "$(CFG)" == "say - Win32 Release German" || "$(CFG)" == "say - Win32 Release Latin American" || "$(CFG)" == "say - Win32 Debug Spanish" || "$(CFG)" == "say - Win32 Debug German" || "$(CFG)" == "say - Win32 Debug Latin American" || "$(CFG)" == "say - Win32 ALPHA Release" || "$(CFG)" == "say - Win32 ALPHA Debug" || "$(CFG)" == "say - Win32 ALPHA Release Spanish" || "$(CFG)" == "say - Win32 ALPHA Release German" || "$(CFG)" == "say - Win32 ALPHA Release Latin American" || "$(CFG)" == "say - Win32 ALPHA Debug Spanish" || "$(CFG)" == "say - Win32 ALPHA Debug German" || "$(CFG)" == "say - Win32 ALPHA Debug Latin American" || "$(CFG)" == "say - Win32 Release United Kingdom" || "$(CFG)" == "say - Win32 Debug United Kingdom" || "$(CFG)" == "say - Win32 ALPHA Release United Kingdom" || "$(CFG)" == "say - Win32 ALPHA Debug United Kingdom" || "$(CFG)" == "say - Win32 Release Static" || "$(CFG)" == "say - Win32 Release Static Spanish" || "$(CFG)" == "say - Win32 Release Static United Kingdom" || "$(CFG)" == "say - Win32 Release Static German" || "$(CFG)" ==\
 "say - Win32 Release Static Latin American" || "$(CFG)" == "say - Win32 Debug Static" || "$(CFG)" == "say - Win32 Debug Static Spanish" || "$(CFG)" == "say - Win32 Debug Static United Kingdom" || "$(CFG)" == "say - Win32 Debug Static German" || "$(CFG)" == "say - Win32 Debug Static Latin American" || "$(CFG)" == "say - Win32 ALPHA Release Static" || "$(CFG)" == "say - Win32 ALPHA Release Static German" || "$(CFG)" == "say - Win32 ALPHA Release Static Latin American" || "$(CFG)" == "say - Win32 ALPHA Release Static Spanish" || "$(CFG)" == "say - Win32 ALPHA Release Static United Kingdom"
SOURCE=.\say.c

!IF  "$(CFG)" == "say - Win32 Release"


"$(INTDIR)\say.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "say - Win32 Debug"


"$(INTDIR)\say.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "say - Win32 Release Spanish"


"$(INTDIR)\say.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "say - Win32 Release German"


"$(INTDIR)\say.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "say - Win32 Release Latin American"


"$(INTDIR)\say.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "say - Win32 Debug Spanish"


"$(INTDIR)\say.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "say - Win32 Debug German"


"$(INTDIR)\say.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "say - Win32 Debug Latin American"


"$(INTDIR)\say.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "say - Win32 Release United Kingdom"


"$(INTDIR)\say.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "say - Win32 Debug United Kingdom"


"$(INTDIR)\say.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "say - Win32 Release Static"


"$(INTDIR)\say.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "say - Win32 Release Static Spanish"


"$(INTDIR)\say.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "say - Win32 Release Static United Kingdom"


"$(INTDIR)\say.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "say - Win32 Release Static German"


"$(INTDIR)\say.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "say - Win32 Release Static Latin American"


"$(INTDIR)\say.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "say - Win32 Debug Static"


"$(INTDIR)\say.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "say - Win32 Debug Static Spanish"


"$(INTDIR)\say.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "say - Win32 Debug Static United Kingdom"


"$(INTDIR)\say.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "say - Win32 Debug Static German"


"$(INTDIR)\say.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "say - Win32 Debug Static Latin American"


"$(INTDIR)\say.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release Static"

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release Static German"

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release Static Latin American"

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release Static Spanish"

!ELSEIF  "$(CFG)" == "say - Win32 ALPHA Release Static United Kingdom"

!ENDIF 


!ENDIF 

