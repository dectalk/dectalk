# Microsoft Developer Studio Generated NMAKE File, Based on TuneCheck.dsp
!IF "$(CFG)" == ""
CFG=TuneCheck - Win32 Debug Italian
!MESSAGE No configuration specified. Defaulting to TuneCheck - Win32 Debug Italian.
!ENDIF 

!IF "$(CFG)" != "TuneCheck - Win32 Release" && "$(CFG)" != "TuneCheck - Win32 Debug" && "$(CFG)" != "TuneCheck - Win32 Release German" && "$(CFG)" != "TuneCheck - Win32 Release Spanish" && "$(CFG)" != "TuneCheck - Win32 Release Latin American" && "$(CFG)" != "TuneCheck - Win32 Release United Kingdom" && "$(CFG)" != "TuneCheck - Win32 Debug German" && "$(CFG)" != "TuneCheck - Win32 Debug Spanish" && "$(CFG)" != "TuneCheck - Win32 Debug Latin American" && "$(CFG)" != "TuneCheck - Win32 Debug United Kingdom" && "$(CFG)" != "TuneCheck - Win32 Debug French" && "$(CFG)" != "TuneCheck - Win32 Release French" && "$(CFG)" != "TuneCheck - Win32 Debug Italian" && "$(CFG)" != "TuneCheck - Win32 Release Italian"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "TuneCheck.mak" CFG="TuneCheck - Win32 Debug Italian"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "TuneCheck - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "TuneCheck - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE "TuneCheck - Win32 Release German" (based on "Win32 (x86) Console Application")
!MESSAGE "TuneCheck - Win32 Release Spanish" (based on "Win32 (x86) Console Application")
!MESSAGE "TuneCheck - Win32 Release Latin American" (based on "Win32 (x86) Console Application")
!MESSAGE "TuneCheck - Win32 Release United Kingdom" (based on "Win32 (x86) Console Application")
!MESSAGE "TuneCheck - Win32 Debug German" (based on "Win32 (x86) Console Application")
!MESSAGE "TuneCheck - Win32 Debug Spanish" (based on "Win32 (x86) Console Application")
!MESSAGE "TuneCheck - Win32 Debug Latin American" (based on "Win32 (x86) Console Application")
!MESSAGE "TuneCheck - Win32 Debug United Kingdom" (based on "Win32 (x86) Console Application")
!MESSAGE "TuneCheck - Win32 Debug French" (based on "Win32 (x86) Console Application")
!MESSAGE "TuneCheck - Win32 Release French" (based on "Win32 (x86) Console Application")
!MESSAGE "TuneCheck - Win32 Debug Italian" (based on "Win32 (x86) Console Application")
!MESSAGE "TuneCheck - Win32 Release Italian" (based on "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "TuneCheck - Win32 Release"

OUTDIR=.\..\..\dapi\build\dectalk\us\release
INTDIR=.\us\release\link
# Begin Custom Macros
OutDir=.\..\..\dapi\build\dectalk\us\release\ 
# End Custom Macros

ALL : "$(OUTDIR)\TuneCheck.exe"


CLEAN :
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\Tunecheck.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\TuneCheck.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I ".\..\.." /I ".\..\..\dapi\src\api" /I ".\..\..\dapi\src\nt" /I ".\..\..\dapi\src\include" /D "NDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "BLD_DECTALK_DLL" /Fp"$(INTDIR)\TuneCheck.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\TuneCheck.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\us\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\TuneCheck.pdb" /machine:I386 /out:"$(OUTDIR)\TuneCheck.exe" 
LINK32_OBJS= \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\Tunecheck.obj"

"$(OUTDIR)\TuneCheck.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "TuneCheck - Win32 Debug"

OUTDIR=.\..\..\dapi\build\dectalk\us\debug
INTDIR=.\us\debug\link
# Begin Custom Macros
OutDir=.\..\..\dapi\build\dectalk\us\debug\ 
# End Custom Macros

ALL : "$(OUTDIR)\TuneCheck.exe"


CLEAN :
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\Tunecheck.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\TuneCheck.exe"
	-@erase "$(OUTDIR)\TuneCheck.ilk"
	-@erase "$(OUTDIR)\TuneCheck.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\..\.." /I ".\..\..\dapi\src\api" /I ".\..\..\dapi\src\nt" /I ".\..\..\dapi\src\include" /I ".\..\..\dapi\src\vtm" /D "_DEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "BLD_DECTALK_DLL" /Fp"$(INTDIR)\TuneCheck.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\TuneCheck.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\TuneCheck.pdb" /debug /machine:I386 /out:"$(OUTDIR)\TuneCheck.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\Tunecheck.obj"

"$(OUTDIR)\TuneCheck.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "TuneCheck - Win32 Release German"

OUTDIR=.\..\..\dapi\build\dectalk\gr\release
INTDIR=.\gr\release\link
# Begin Custom Macros
OutDir=.\..\..\dapi\build\dectalk\gr\release\ 
# End Custom Macros

ALL : "$(OUTDIR)\TuneCheck.exe"


CLEAN :
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\Tunecheck.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\TuneCheck.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I ".\..\..\\" /I ".\..\..\dapi\src\api" /I ".\..\.." /I ".\..\..\dapi\src\nt" /I ".\..\..\dapi\src\include" /D "NDEBUG" /D "GERMAN" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "BLD_DECTALK_DLL" /Fp"$(INTDIR)\TuneCheck.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\TuneCheck.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\gr\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\TuneCheck.pdb" /machine:I386 /out:"$(OUTDIR)\TuneCheck.exe" 
LINK32_OBJS= \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\Tunecheck.obj"

"$(OUTDIR)\TuneCheck.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "TuneCheck - Win32 Release Spanish"

OUTDIR=.\..\..\dapi\build\dectalk\sp\release
INTDIR=.\sp\release\link
# Begin Custom Macros
OutDir=.\..\..\dapi\build\dectalk\sp\release\ 
# End Custom Macros

ALL : "$(OUTDIR)\TuneCheck.exe"


CLEAN :
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\Tunecheck.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\TuneCheck.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I ".\..\..\\" /I ".\..\..\dapi\src\api" /I ".\..\.." /I ".\..\..\dapi\src\nt" /I ".\..\..\dapi\src\include" /D "NDEBUG" /D "SPANISH" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "BLD_DECTALK_DLL" /Fp"$(INTDIR)\TuneCheck.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\TuneCheck.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\sp\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\TuneCheck.pdb" /machine:I386 /out:"$(OUTDIR)\TuneCheck.exe" 
LINK32_OBJS= \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\Tunecheck.obj"

"$(OUTDIR)\TuneCheck.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "TuneCheck - Win32 Release Latin American"

OUTDIR=.\..\..\dapi\build\dectalk\la\release
INTDIR=.\la\release\link
# Begin Custom Macros
OutDir=.\..\..\dapi\build\dectalk\la\release\ 
# End Custom Macros

ALL : "$(OUTDIR)\TuneCheck.exe"


CLEAN :
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\Tunecheck.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\TuneCheck.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I ".\..\..\\" /I ".\..\..\dapi\src\api" /I ".\..\.." /I ".\..\..\dapi\src\nt" /I ".\..\..\dapi\src\include" /D "NDEBUG" /D "SPANISH_LA" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "BLD_DECTALK_DLL" /Fp"$(INTDIR)\TuneCheck.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\TuneCheck.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\la\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\TuneCheck.pdb" /machine:I386 /out:"$(OUTDIR)\TuneCheck.exe" 
LINK32_OBJS= \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\Tunecheck.obj"

"$(OUTDIR)\TuneCheck.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "TuneCheck - Win32 Release United Kingdom"

OUTDIR=.\..\..\dapi\build\dectalk\uk\release
INTDIR=.\uk\release\link
# Begin Custom Macros
OutDir=.\..\..\dapi\build\dectalk\uk\release\ 
# End Custom Macros

ALL : "$(OUTDIR)\TuneCheck.exe"


CLEAN :
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\Tunecheck.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\TuneCheck.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I ".\..\..\\" /I ".\..\..\dapi\src\api" /I ".\..\.." /I ".\..\..\dapi\src\nt" /I ".\..\..\dapi\src\include" /D "NDEBUG" /D "ENGLISH_UK" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "BLD_DECTALK_DLL" /Fp"$(INTDIR)\TuneCheck.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\TuneCheck.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\uk\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\TuneCheck.pdb" /machine:I386 /out:"$(OUTDIR)\TuneCheck.exe" 
LINK32_OBJS= \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\Tunecheck.obj"

"$(OUTDIR)\TuneCheck.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "TuneCheck - Win32 Debug German"

OUTDIR=.\..\..\dapi\build\dectalk\gr\debug
INTDIR=.\gr\debug\link
# Begin Custom Macros
OutDir=.\..\..\dapi\build\dectalk\gr\debug\ 
# End Custom Macros

ALL : "$(OUTDIR)\TuneCheck.exe"


CLEAN :
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\Tunecheck.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\TuneCheck.exe"
	-@erase "$(OUTDIR)\TuneCheck.ilk"
	-@erase "$(OUTDIR)\TuneCheck.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\..\..\\" /I ".\..\..\dapi\src\api" /I ".\..\.." /I ".\..\..\dapi\src\nt" /I ".\..\..\dapi\src\include" /D "_DEBUG" /D "GERMAN" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "BLD_DECTALK_DLL" /Fp"$(INTDIR)\TuneCheck.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\TuneCheck.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\gr\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\TuneCheck.pdb" /debug /machine:I386 /out:"$(OUTDIR)\TuneCheck.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\Tunecheck.obj"

"$(OUTDIR)\TuneCheck.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "TuneCheck - Win32 Debug Spanish"

OUTDIR=.\..\..\dapi\build\dectalk\sp\debug
INTDIR=.\sp\debug\link
# Begin Custom Macros
OutDir=.\..\..\dapi\build\dectalk\sp\debug\ 
# End Custom Macros

ALL : "$(OUTDIR)\TuneCheck.exe"


CLEAN :
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\Tunecheck.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\TuneCheck.exe"
	-@erase "$(OUTDIR)\TuneCheck.ilk"
	-@erase "$(OUTDIR)\TuneCheck.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\..\.." /I ".\..\..\dapi\src\api" /I ".\..\..\dapi\src\nt" /I ".\..\..\dapi\src\include" /D "_DEBUG" /D "SPANISH" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "BLD_DECTALK_DLL" /Fp"$(INTDIR)\TuneCheck.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\TuneCheck.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\sp\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\TuneCheck.pdb" /debug /machine:I386 /out:"$(OUTDIR)\TuneCheck.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\Tunecheck.obj"

"$(OUTDIR)\TuneCheck.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "TuneCheck - Win32 Debug Latin American"

OUTDIR=.\..\..\dapi\build\dectalk\la\debug
INTDIR=.\la\debug\link
# Begin Custom Macros
OutDir=.\..\..\dapi\build\dectalk\la\debug\ 
# End Custom Macros

ALL : "$(OUTDIR)\TuneCheck.exe"


CLEAN :
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\Tunecheck.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\TuneCheck.exe"
	-@erase "$(OUTDIR)\TuneCheck.ilk"
	-@erase "$(OUTDIR)\TuneCheck.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\..\..\\" /I ".\..\..\dapi\src\api" /I ".\..\.." /I ".\..\..\dapi\src\nt" /I ".\..\..\dapi\src\include" /D "_DEBUG" /D "SPANISH_LA" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "BLD_DECTALK_DLL" /Fp"$(INTDIR)\TuneCheck.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\TuneCheck.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\la\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\TuneCheck.pdb" /debug /machine:I386 /out:"$(OUTDIR)\TuneCheck.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\Tunecheck.obj"

"$(OUTDIR)\TuneCheck.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "TuneCheck - Win32 Debug United Kingdom"

OUTDIR=.\..\..\dapi\build\dectalk\uk\debug
INTDIR=.\uk\debug\link
# Begin Custom Macros
OutDir=.\..\..\dapi\build\dectalk\uk\debug\ 
# End Custom Macros

ALL : "$(OUTDIR)\TuneCheck.exe"


CLEAN :
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\Tunecheck.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\TuneCheck.exe"
	-@erase "$(OUTDIR)\TuneCheck.ilk"
	-@erase "$(OUTDIR)\TuneCheck.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\..\..\\" /I ".\..\..\dapi\src\api" /I ".\..\.." /I ".\..\..\dapi\src\nt" /I ".\..\..\dapi\src\include" /D "_DEBUG" /D "ENGLISH_UK" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "BLD_DECTALK_DLL" /Fp"$(INTDIR)\TuneCheck.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\TuneCheck.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\uk\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\TuneCheck.pdb" /debug /machine:I386 /out:"$(OUTDIR)\TuneCheck.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\Tunecheck.obj"

"$(OUTDIR)\TuneCheck.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "TuneCheck - Win32 Debug French"

OUTDIR=.\..\..\dapi\build\dectalk\fr\debug
INTDIR=.\fr\debug\link
# Begin Custom Macros
OutDir=.\..\..\dapi\build\dectalk\fr\debug\ 
# End Custom Macros

ALL : "$(OUTDIR)\TuneCheck.exe"


CLEAN :
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\Tunecheck.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\TuneCheck.exe"
	-@erase "$(OUTDIR)\TuneCheck.ilk"
	-@erase "$(OUTDIR)\TuneCheck.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\..\.." /I ".\..\..\dapi\src\api" /I ".\..\..\dapi\src\nt" /I ".\..\..\dapi\src\include" /D "_DEBUG" /D "FRENCH" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "BLD_DECTALK_DLL" /Fp"$(INTDIR)\TuneCheck.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\TuneCheck.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\fr\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\TuneCheck.pdb" /debug /machine:I386 /out:"$(OUTDIR)\TuneCheck.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\Tunecheck.obj"

"$(OUTDIR)\TuneCheck.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "TuneCheck - Win32 Release French"

OUTDIR=.\..\..\dapi\build\dectalk\fr\release
INTDIR=.\fr\release\link
# Begin Custom Macros
OutDir=.\..\..\dapi\build\dectalk\fr\release\ 
# End Custom Macros

ALL : "$(OUTDIR)\TuneCheck.exe"


CLEAN :
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\Tunecheck.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\TuneCheck.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I ".\..\.." /I ".\..\..\dapi\src\nt" /I ".\..\..\dapi\src\include" /I ".\..\..\dapi\src\api" /D "NDEBUG" /D "FRENCH" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "BLD_DECTALK_DLL" /Fp"$(INTDIR)\TuneCheck.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\TuneCheck.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\fr\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\TuneCheck.pdb" /machine:I386 /out:"$(OUTDIR)\TuneCheck.exe" 
LINK32_OBJS= \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\Tunecheck.obj"

"$(OUTDIR)\TuneCheck.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "TuneCheck - Win32 Debug Italian"

OUTDIR=.\..\..\dapi\build\dectalk\it\debug
INTDIR=.\it\debug\link
# Begin Custom Macros
OutDir=.\..\..\dapi\build\dectalk\it\debug\ 
# End Custom Macros

ALL : "$(OUTDIR)\TuneCheck.exe"


CLEAN :
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\Tunecheck.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\TuneCheck.exe"
	-@erase "$(OUTDIR)\TuneCheck.ilk"
	-@erase "$(OUTDIR)\TuneCheck.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\..\.." /I ".\..\..\dapi\src\api" /I ".\..\..\dapi\src\nt" /I ".\..\..\dapi\src\include" /I ".\..\..\dapi\src\vtm" /D "_DEBUG" /D "ITALIAN" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "BLD_DECTALK_DLL" /Fp"$(INTDIR)\TuneCheck.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\TuneCheck.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\TuneCheck.pdb" /debug /machine:I386 /out:"$(OUTDIR)\TuneCheck.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\Tunecheck.obj"

"$(OUTDIR)\TuneCheck.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "TuneCheck - Win32 Release Italian"

OUTDIR=.\..\..\dapi\build\dectalk\it\release
INTDIR=.\it\release\link
# Begin Custom Macros
OutDir=.\..\..\dapi\build\dectalk\it\release\ 
# End Custom Macros

ALL : "$(OUTDIR)\TuneCheck.exe"


CLEAN :
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\Tunecheck.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\TuneCheck.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I ".\..\.." /I ".\..\..\dapi\src\api" /I ".\..\..\dapi\src\nt" /I ".\..\..\dapi\src\include" /D "NDEBUG" /D "ITALIAN" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "BLD_DECTALK_DLL" /Fp"$(INTDIR)\TuneCheck.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\TuneCheck.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\us\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\TuneCheck.pdb" /machine:I386 /out:"$(OUTDIR)\TuneCheck.exe" 
LINK32_OBJS= \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\Tunecheck.obj"

"$(OUTDIR)\TuneCheck.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("TuneCheck.dep")
!INCLUDE "TuneCheck.dep"
!ELSE 
!MESSAGE Warning: cannot find "TuneCheck.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "TuneCheck - Win32 Release" || "$(CFG)" == "TuneCheck - Win32 Debug" || "$(CFG)" == "TuneCheck - Win32 Release German" || "$(CFG)" == "TuneCheck - Win32 Release Spanish" || "$(CFG)" == "TuneCheck - Win32 Release Latin American" || "$(CFG)" == "TuneCheck - Win32 Release United Kingdom" || "$(CFG)" == "TuneCheck - Win32 Debug German" || "$(CFG)" == "TuneCheck - Win32 Debug Spanish" || "$(CFG)" == "TuneCheck - Win32 Debug Latin American" || "$(CFG)" == "TuneCheck - Win32 Debug United Kingdom" || "$(CFG)" == "TuneCheck - Win32 Debug French" || "$(CFG)" == "TuneCheck - Win32 Release French" || "$(CFG)" == "TuneCheck - Win32 Debug Italian" || "$(CFG)" == "TuneCheck - Win32 Release Italian"
SOURCE=..\..\dapi\src\NT\opthread.c

"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Tunecheck.c

"$(INTDIR)\Tunecheck.obj" : $(SOURCE) "$(INTDIR)"



!ENDIF 

