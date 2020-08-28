# Microsoft Developer Studio Generated NMAKE File, Based on dtdemo.dsp
!IF "$(CFG)" == ""
CFG=dtdemo - Win32 Debug French
!MESSAGE No configuration specified. Defaulting to dtdemo - Win32 Debug French.
!ENDIF 

!IF "$(CFG)" != "dtdemo - Win32 Release" && "$(CFG)" != "dtdemo - Win32 Debug" && "$(CFG)" != "dtdemo - Win32 Release Spanish" && "$(CFG)" != "dtdemo - Win32 Release German" && "$(CFG)" != "dtdemo - Win32 Release Latin American" && "$(CFG)" != "dtdemo - Win32 Debug Spanish" && "$(CFG)" != "dtdemo - Win32 Debug German" && "$(CFG)" != "dtdemo - Win32 Debug Latin American" && "$(CFG)" != "dtdemo - Win32 Release United Kingdom" && "$(CFG)" != "dtdemo - Win32 Debug United Kingdom" && "$(CFG)" != "dtdemo - Win32 Release French" && "$(CFG)" != "dtdemo - Win32 Debug French"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "dtdemo.mak" CFG="dtdemo - Win32 Debug French"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "dtdemo - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "dtdemo - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE "dtdemo - Win32 Release Spanish" (based on "Win32 (x86) Application")
!MESSAGE "dtdemo - Win32 Release German" (based on "Win32 (x86) Application")
!MESSAGE "dtdemo - Win32 Release Latin American" (based on "Win32 (x86) Application")
!MESSAGE "dtdemo - Win32 Debug Spanish" (based on "Win32 (x86) Application")
!MESSAGE "dtdemo - Win32 Debug German" (based on "Win32 (x86) Application")
!MESSAGE "dtdemo - Win32 Debug Latin American" (based on "Win32 (x86) Application")
!MESSAGE "dtdemo - Win32 Release United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "dtdemo - Win32 Debug United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "dtdemo - Win32 Release French" (based on "Win32 (x86) Application")
!MESSAGE "dtdemo - Win32 Debug French" (based on "Win32 (x86) Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "dtdemo - Win32 Release"

OUTDIR=.\..\build\dtdemo\us\release
INTDIR=.\..\build\dtdemo\us\release\link
# Begin Custom Macros
OutDir=.\..\build\dtdemo\us\release
# End Custom Macros

ALL : "$(OUTDIR)\dtdemo.exe"


CLEAN :
	-@erase "$(INTDIR)\acxf1c.obj"
	-@erase "$(INTDIR)\brent.obj"
	-@erase "$(INTDIR)\circuit.obj"
	-@erase "$(INTDIR)\diffuse.obj"
	-@erase "$(INTDIR)\fixfft32.obj"
	-@erase "$(INTDIR)\frame.obj"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\inithl.obj"
	-@erase "$(INTDIR)\llinit.obj"
	-@erase "$(INTDIR)\log10table.obj"
	-@erase "$(INTDIR)\nasalf1x.obj"
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\Speak.obj"
	-@erase "$(INTDIR)\speak.res"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\voice.obj"
	-@erase "$(OUTDIR)\dtdemo.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I ".\api" /I "..\.." /D "NDEBUG" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /D "ENGLISH" /D "ACNA" /Fp"$(INTDIR)\dtdemo.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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

MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\speak.res" /d "NDEBUG" /d "DEMO" /d "ENGLISH_US" /d "ENGLISH" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dtdemo.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\build\dtstatic\us\demo\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\dtdemo.pdb" /machine:I386 /out:"$(OUTDIR)\dtdemo.exe" 
LINK32_OBJS= \
	"$(INTDIR)\acxf1c.obj" \
	"$(INTDIR)\brent.obj" \
	"$(INTDIR)\circuit.obj" \
	"$(INTDIR)\diffuse.obj" \
	"$(INTDIR)\fixfft32.obj" \
	"$(INTDIR)\frame.obj" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
	"$(INTDIR)\llinit.obj" \
	"$(INTDIR)\nasalf1x.obj" \
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\Speak.obj" \
	"$(INTDIR)\voice.obj" \
	"$(INTDIR)\speak.res" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\log10table.obj"

"$(OUTDIR)\dtdemo.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dtdemo - Win32 Debug"

OUTDIR=.\..\build\dtdemo\us\debug
INTDIR=.\..\build\dtdemo\us\debug\link
# Begin Custom Macros
OutDir=.\..\build\dtdemo\us\debug
# End Custom Macros

ALL : "$(OUTDIR)\dtdemo.exe"


CLEAN :
	-@erase "$(INTDIR)\acxf1c.obj"
	-@erase "$(INTDIR)\brent.obj"
	-@erase "$(INTDIR)\circuit.obj"
	-@erase "$(INTDIR)\diffuse.obj"
	-@erase "$(INTDIR)\fixfft32.obj"
	-@erase "$(INTDIR)\frame.obj"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\inithl.obj"
	-@erase "$(INTDIR)\llinit.obj"
	-@erase "$(INTDIR)\log10table.obj"
	-@erase "$(INTDIR)\nasalf1x.obj"
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\Speak.obj"
	-@erase "$(INTDIR)\speak.res"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\voice.obj"
	-@erase "$(OUTDIR)\dtdemo.exe"
	-@erase "$(OUTDIR)\dtdemo.ilk"
	-@erase "$(OUTDIR)\dtdemo.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\api" /I "..\.." /D "_DEBUG" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /D "ENGLISH" /D "ACNA" /Fp"$(INTDIR)\dtdemo.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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

MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\speak.res" /d "_DEBUG" /d "DEMO" /d "ENGLISH_US" /d "ENGLISH" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dtdemo.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\build\dtstatic\us\dbgdemo\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\dtdemo.pdb" /debug /machine:I386 /out:"$(OUTDIR)\dtdemo.exe" 
LINK32_OBJS= \
	"$(INTDIR)\acxf1c.obj" \
	"$(INTDIR)\brent.obj" \
	"$(INTDIR)\circuit.obj" \
	"$(INTDIR)\diffuse.obj" \
	"$(INTDIR)\fixfft32.obj" \
	"$(INTDIR)\frame.obj" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
	"$(INTDIR)\llinit.obj" \
	"$(INTDIR)\nasalf1x.obj" \
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\Speak.obj" \
	"$(INTDIR)\voice.obj" \
	"$(INTDIR)\speak.res" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\log10table.obj"

"$(OUTDIR)\dtdemo.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dtdemo - Win32 Release Spanish"

OUTDIR=.\..\build\dtdemo\sp\release
INTDIR=.\..\build\dtdemo\sp\release\link
# Begin Custom Macros
OutDir=.\..\build\dtdemo\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\dtdemo.exe"


CLEAN :
	-@erase "$(INTDIR)\acxf1c.obj"
	-@erase "$(INTDIR)\brent.obj"
	-@erase "$(INTDIR)\circuit.obj"
	-@erase "$(INTDIR)\diffuse.obj"
	-@erase "$(INTDIR)\fixfft32.obj"
	-@erase "$(INTDIR)\frame.obj"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\inithl.obj"
	-@erase "$(INTDIR)\llinit.obj"
	-@erase "$(INTDIR)\log10table.obj"
	-@erase "$(INTDIR)\nasalf1x.obj"
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\Speak.obj"
	-@erase "$(INTDIR)\speak.res"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\voice.obj"
	-@erase "$(OUTDIR)\dtdemo.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I ".\api" /I "..\.." /D "NDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /Fp"$(INTDIR)\dtdemo.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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

MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC=rc.exe
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\speak.res" /d "NDEBUG" /d "DEMO" /d "SPANISH" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dtdemo.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\build\dtstatic\sp\demo\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\dtdemo.pdb" /machine:I386 /out:"$(OUTDIR)\dtdemo.exe" 
LINK32_OBJS= \
	"$(INTDIR)\acxf1c.obj" \
	"$(INTDIR)\brent.obj" \
	"$(INTDIR)\circuit.obj" \
	"$(INTDIR)\diffuse.obj" \
	"$(INTDIR)\fixfft32.obj" \
	"$(INTDIR)\frame.obj" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
	"$(INTDIR)\llinit.obj" \
	"$(INTDIR)\nasalf1x.obj" \
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\Speak.obj" \
	"$(INTDIR)\voice.obj" \
	"$(INTDIR)\speak.res" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\log10table.obj"

"$(OUTDIR)\dtdemo.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dtdemo - Win32 Release German"

OUTDIR=.\..\build\dtdemo\gr\release
INTDIR=.\..\build\dtdemo\gr\release\link
# Begin Custom Macros
OutDir=.\..\build\dtdemo\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\dtdemo.exe"


CLEAN :
	-@erase "$(INTDIR)\acxf1c.obj"
	-@erase "$(INTDIR)\brent.obj"
	-@erase "$(INTDIR)\circuit.obj"
	-@erase "$(INTDIR)\diffuse.obj"
	-@erase "$(INTDIR)\fixfft32.obj"
	-@erase "$(INTDIR)\frame.obj"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\inithl.obj"
	-@erase "$(INTDIR)\llinit.obj"
	-@erase "$(INTDIR)\log10table.obj"
	-@erase "$(INTDIR)\nasalf1x.obj"
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\Speak.obj"
	-@erase "$(INTDIR)\speak.res"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\voice.obj"
	-@erase "$(OUTDIR)\dtdemo.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I ".\api" /I "..\.." /D "NDEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /Fp"$(INTDIR)\dtdemo.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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

MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC=rc.exe
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\speak.res" /d "NDEBUG" /d "DEMO" /d "GERMAN" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dtdemo.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\build\dtstatic\gr\demo\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\dtdemo.pdb" /machine:I386 /out:"$(OUTDIR)\dtdemo.exe" 
LINK32_OBJS= \
	"$(INTDIR)\acxf1c.obj" \
	"$(INTDIR)\brent.obj" \
	"$(INTDIR)\circuit.obj" \
	"$(INTDIR)\diffuse.obj" \
	"$(INTDIR)\fixfft32.obj" \
	"$(INTDIR)\frame.obj" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
	"$(INTDIR)\llinit.obj" \
	"$(INTDIR)\nasalf1x.obj" \
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\Speak.obj" \
	"$(INTDIR)\voice.obj" \
	"$(INTDIR)\speak.res" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\log10table.obj"

"$(OUTDIR)\dtdemo.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dtdemo - Win32 Release Latin American"

OUTDIR=.\..\build\dtdemo\la\release
INTDIR=.\..\build\dtdemo\la\release\link
# Begin Custom Macros
OutDir=.\..\build\dtdemo\la\release
# End Custom Macros

ALL : "$(OUTDIR)\dtdemo.exe"


CLEAN :
	-@erase "$(INTDIR)\acxf1c.obj"
	-@erase "$(INTDIR)\brent.obj"
	-@erase "$(INTDIR)\circuit.obj"
	-@erase "$(INTDIR)\diffuse.obj"
	-@erase "$(INTDIR)\fixfft32.obj"
	-@erase "$(INTDIR)\frame.obj"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\inithl.obj"
	-@erase "$(INTDIR)\llinit.obj"
	-@erase "$(INTDIR)\log10table.obj"
	-@erase "$(INTDIR)\nasalf1x.obj"
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\Speak.obj"
	-@erase "$(INTDIR)\speak.res"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\voice.obj"
	-@erase "$(OUTDIR)\dtdemo.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I ".\api" /I "..\.." /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /Fp"$(INTDIR)\dtdemo.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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

MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC=rc.exe
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\speak.res" /d "NDEBUG" /d "DEMO" /d "SPANISH" /d "LATIN_AMERICAN" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dtdemo.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\build\dtstatic\la\demo\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\dtdemo.pdb" /machine:I386 /out:"$(OUTDIR)\dtdemo.exe" 
LINK32_OBJS= \
	"$(INTDIR)\acxf1c.obj" \
	"$(INTDIR)\brent.obj" \
	"$(INTDIR)\circuit.obj" \
	"$(INTDIR)\diffuse.obj" \
	"$(INTDIR)\fixfft32.obj" \
	"$(INTDIR)\frame.obj" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
	"$(INTDIR)\llinit.obj" \
	"$(INTDIR)\nasalf1x.obj" \
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\Speak.obj" \
	"$(INTDIR)\voice.obj" \
	"$(INTDIR)\speak.res" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\log10table.obj"

"$(OUTDIR)\dtdemo.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dtdemo - Win32 Debug Spanish"

OUTDIR=.\..\build\dtdemo\sp\debug
INTDIR=.\..\build\dtdemo\sp\debug\link
# Begin Custom Macros
OutDir=.\..\build\dtdemo\sp\debug
# End Custom Macros

ALL : "$(OUTDIR)\dtdemo.exe"


CLEAN :
	-@erase "$(INTDIR)\acxf1c.obj"
	-@erase "$(INTDIR)\brent.obj"
	-@erase "$(INTDIR)\circuit.obj"
	-@erase "$(INTDIR)\diffuse.obj"
	-@erase "$(INTDIR)\fixfft32.obj"
	-@erase "$(INTDIR)\frame.obj"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\inithl.obj"
	-@erase "$(INTDIR)\llinit.obj"
	-@erase "$(INTDIR)\log10table.obj"
	-@erase "$(INTDIR)\nasalf1x.obj"
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\Speak.obj"
	-@erase "$(INTDIR)\speak.res"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\voice.obj"
	-@erase "$(OUTDIR)\dtdemo.exe"
	-@erase "$(OUTDIR)\dtdemo.ilk"
	-@erase "$(OUTDIR)\dtdemo.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\api" /I "..\.." /D "_DEBUG" /D "SPANISH" /D "SPANISH_SP" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /Fp"$(INTDIR)\dtdemo.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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

MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC=rc.exe
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\speak.res" /d "_DEBUG" /d "DEMO" /d "SPANISH" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dtdemo.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\build\dtstatic\sp\dbgdemo\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\dtdemo.pdb" /debug /machine:I386 /out:"$(OUTDIR)\dtdemo.exe" 
LINK32_OBJS= \
	"$(INTDIR)\acxf1c.obj" \
	"$(INTDIR)\brent.obj" \
	"$(INTDIR)\circuit.obj" \
	"$(INTDIR)\diffuse.obj" \
	"$(INTDIR)\fixfft32.obj" \
	"$(INTDIR)\frame.obj" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
	"$(INTDIR)\llinit.obj" \
	"$(INTDIR)\nasalf1x.obj" \
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\Speak.obj" \
	"$(INTDIR)\voice.obj" \
	"$(INTDIR)\speak.res" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\log10table.obj"

"$(OUTDIR)\dtdemo.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dtdemo - Win32 Debug German"

OUTDIR=.\..\build\dtdemo\gr\debug
INTDIR=.\..\build\dtdemo\gr\debug\link
# Begin Custom Macros
OutDir=.\..\build\dtdemo\gr\debug
# End Custom Macros

ALL : "$(OUTDIR)\dtdemo.exe"


CLEAN :
	-@erase "$(INTDIR)\acxf1c.obj"
	-@erase "$(INTDIR)\brent.obj"
	-@erase "$(INTDIR)\circuit.obj"
	-@erase "$(INTDIR)\diffuse.obj"
	-@erase "$(INTDIR)\fixfft32.obj"
	-@erase "$(INTDIR)\frame.obj"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\inithl.obj"
	-@erase "$(INTDIR)\llinit.obj"
	-@erase "$(INTDIR)\log10table.obj"
	-@erase "$(INTDIR)\nasalf1x.obj"
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\Speak.obj"
	-@erase "$(INTDIR)\speak.res"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\voice.obj"
	-@erase "$(OUTDIR)\dtdemo.exe"
	-@erase "$(OUTDIR)\dtdemo.ilk"
	-@erase "$(OUTDIR)\dtdemo.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\api" /I "..\.." /D "_DEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /Fp"$(INTDIR)\dtdemo.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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

MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC=rc.exe
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\speak.res" /d "_DEBUG" /d "DEMO" /d "GERMAN" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dtdemo.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\build\dtstatic\gr\dbgdemo\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\dtdemo.pdb" /debug /machine:I386 /out:"$(OUTDIR)\dtdemo.exe" 
LINK32_OBJS= \
	"$(INTDIR)\acxf1c.obj" \
	"$(INTDIR)\brent.obj" \
	"$(INTDIR)\circuit.obj" \
	"$(INTDIR)\diffuse.obj" \
	"$(INTDIR)\fixfft32.obj" \
	"$(INTDIR)\frame.obj" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
	"$(INTDIR)\llinit.obj" \
	"$(INTDIR)\nasalf1x.obj" \
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\Speak.obj" \
	"$(INTDIR)\voice.obj" \
	"$(INTDIR)\speak.res" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\log10table.obj"

"$(OUTDIR)\dtdemo.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dtdemo - Win32 Debug Latin American"

OUTDIR=.\..\build\dtdemo\la\debug
INTDIR=.\..\build\dtdemo\la\debug\link
# Begin Custom Macros
OutDir=.\..\build\dtdemo\la\debug
# End Custom Macros

ALL : "$(OUTDIR)\dtdemo.exe"


CLEAN :
	-@erase "$(INTDIR)\acxf1c.obj"
	-@erase "$(INTDIR)\brent.obj"
	-@erase "$(INTDIR)\circuit.obj"
	-@erase "$(INTDIR)\diffuse.obj"
	-@erase "$(INTDIR)\fixfft32.obj"
	-@erase "$(INTDIR)\frame.obj"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\inithl.obj"
	-@erase "$(INTDIR)\llinit.obj"
	-@erase "$(INTDIR)\log10table.obj"
	-@erase "$(INTDIR)\nasalf1x.obj"
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\Speak.obj"
	-@erase "$(INTDIR)\speak.res"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\voice.obj"
	-@erase "$(OUTDIR)\dtdemo.exe"
	-@erase "$(OUTDIR)\dtdemo.ilk"
	-@erase "$(OUTDIR)\dtdemo.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\api" /I "..\.." /D "_DEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /Fp"$(INTDIR)\dtdemo.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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

MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC=rc.exe
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\speak.res" /d "_DEBUG" /d "DEMO" /d "SPANISH" /d "LATIN_AMERICAN" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dtdemo.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\build\dtstatic\la\dbgdemo\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\dtdemo.pdb" /debug /machine:I386 /out:"$(OUTDIR)\dtdemo.exe" 
LINK32_OBJS= \
	"$(INTDIR)\acxf1c.obj" \
	"$(INTDIR)\brent.obj" \
	"$(INTDIR)\circuit.obj" \
	"$(INTDIR)\diffuse.obj" \
	"$(INTDIR)\fixfft32.obj" \
	"$(INTDIR)\frame.obj" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
	"$(INTDIR)\llinit.obj" \
	"$(INTDIR)\nasalf1x.obj" \
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\Speak.obj" \
	"$(INTDIR)\voice.obj" \
	"$(INTDIR)\speak.res" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\log10table.obj"

"$(OUTDIR)\dtdemo.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dtdemo - Win32 Release United Kingdom"

OUTDIR=.\..\build\dtdemo\uk\release
INTDIR=.\..\build\dtdemo\uk\release\link
# Begin Custom Macros
OutDir=.\..\build\dtdemo\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\dtdemo.exe"


CLEAN :
	-@erase "$(INTDIR)\acxf1c.obj"
	-@erase "$(INTDIR)\brent.obj"
	-@erase "$(INTDIR)\circuit.obj"
	-@erase "$(INTDIR)\diffuse.obj"
	-@erase "$(INTDIR)\fixfft32.obj"
	-@erase "$(INTDIR)\frame.obj"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\inithl.obj"
	-@erase "$(INTDIR)\llinit.obj"
	-@erase "$(INTDIR)\log10table.obj"
	-@erase "$(INTDIR)\nasalf1x.obj"
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\Speak.obj"
	-@erase "$(INTDIR)\speak.res"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\voice.obj"
	-@erase "$(OUTDIR)\dtdemo.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I ".\api" /I "..\.." /D "NDEBUG" /D "ENGLISH_UK" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /D "ENGLISH" /Fp"$(INTDIR)\dtdemo.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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

MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC=rc.exe
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\speak.res" /d "NDEBUG" /d "DEMO" /d "ENGLISH_US" /d "ENGLISH" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dtdemo.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\build\dtstatic\uk\demo\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\dtdemo.pdb" /machine:I386 /out:"$(OUTDIR)\dtdemo.exe" 
LINK32_OBJS= \
	"$(INTDIR)\acxf1c.obj" \
	"$(INTDIR)\brent.obj" \
	"$(INTDIR)\circuit.obj" \
	"$(INTDIR)\diffuse.obj" \
	"$(INTDIR)\fixfft32.obj" \
	"$(INTDIR)\frame.obj" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
	"$(INTDIR)\llinit.obj" \
	"$(INTDIR)\nasalf1x.obj" \
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\Speak.obj" \
	"$(INTDIR)\voice.obj" \
	"$(INTDIR)\speak.res" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\log10table.obj"

"$(OUTDIR)\dtdemo.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dtdemo - Win32 Debug United Kingdom"

OUTDIR=.\..\build\dtdemo\uk\debug
INTDIR=.\..\build\dtdemo\uk\debug\link
# Begin Custom Macros
OutDir=.\..\build\dtdemo\uk\debug
# End Custom Macros

ALL : "$(OUTDIR)\dtdemo.exe"


CLEAN :
	-@erase "$(INTDIR)\acxf1c.obj"
	-@erase "$(INTDIR)\brent.obj"
	-@erase "$(INTDIR)\circuit.obj"
	-@erase "$(INTDIR)\diffuse.obj"
	-@erase "$(INTDIR)\fixfft32.obj"
	-@erase "$(INTDIR)\frame.obj"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\inithl.obj"
	-@erase "$(INTDIR)\llinit.obj"
	-@erase "$(INTDIR)\log10table.obj"
	-@erase "$(INTDIR)\nasalf1x.obj"
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\Speak.obj"
	-@erase "$(INTDIR)\speak.res"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\voice.obj"
	-@erase "$(OUTDIR)\dtdemo.exe"
	-@erase "$(OUTDIR)\dtdemo.ilk"
	-@erase "$(OUTDIR)\dtdemo.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\api" /I "..\.." /D "_DEBUG" /D "ENGLISH_UK" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /D "ENGLISH" /Fp"$(INTDIR)\dtdemo.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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

MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC=rc.exe
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\speak.res" /d "_DEBUG" /d "DEMO" /d "ENGLISH_US" /d "ENGLISH" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dtdemo.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\build\dtstatic\uk\dbgdemo\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\dtdemo.pdb" /debug /machine:I386 /out:"$(OUTDIR)\dtdemo.exe" 
LINK32_OBJS= \
	"$(INTDIR)\acxf1c.obj" \
	"$(INTDIR)\brent.obj" \
	"$(INTDIR)\circuit.obj" \
	"$(INTDIR)\diffuse.obj" \
	"$(INTDIR)\fixfft32.obj" \
	"$(INTDIR)\frame.obj" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
	"$(INTDIR)\llinit.obj" \
	"$(INTDIR)\nasalf1x.obj" \
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\Speak.obj" \
	"$(INTDIR)\voice.obj" \
	"$(INTDIR)\speak.res" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\log10table.obj"

"$(OUTDIR)\dtdemo.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dtdemo - Win32 Release French"

OUTDIR=.\..\build\dtdemo\fr\release
INTDIR=.\..\build\dtdemo\fr\release\link
# Begin Custom Macros
OutDir=.\..\build\dtdemo\fr\release
# End Custom Macros

ALL : "$(OUTDIR)\dtdemo.exe"


CLEAN :
	-@erase "$(INTDIR)\acxf1c.obj"
	-@erase "$(INTDIR)\brent.obj"
	-@erase "$(INTDIR)\circuit.obj"
	-@erase "$(INTDIR)\diffuse.obj"
	-@erase "$(INTDIR)\fixfft32.obj"
	-@erase "$(INTDIR)\frame.obj"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\inithl.obj"
	-@erase "$(INTDIR)\llinit.obj"
	-@erase "$(INTDIR)\log10table.obj"
	-@erase "$(INTDIR)\nasalf1x.obj"
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\Speak.obj"
	-@erase "$(INTDIR)\speak.res"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\voice.obj"
	-@erase "$(OUTDIR)\dtdemo.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I ".\api" /I "..\.." /D "NDEBUG" /D "FRENCH" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /Fp"$(INTDIR)\dtdemo.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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

MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\speak.res" /d "NDEBUG" /d "DEMO" /d "ENGLISH_US" /d "ENGLISH" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dtdemo.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\build\dtstatic\fr\demo\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\dtdemo.pdb" /machine:I386 /out:"$(OUTDIR)\dtdemo.exe" 
LINK32_OBJS= \
	"$(INTDIR)\acxf1c.obj" \
	"$(INTDIR)\brent.obj" \
	"$(INTDIR)\circuit.obj" \
	"$(INTDIR)\diffuse.obj" \
	"$(INTDIR)\fixfft32.obj" \
	"$(INTDIR)\frame.obj" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
	"$(INTDIR)\llinit.obj" \
	"$(INTDIR)\nasalf1x.obj" \
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\Speak.obj" \
	"$(INTDIR)\voice.obj" \
	"$(INTDIR)\speak.res" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\log10table.obj"

"$(OUTDIR)\dtdemo.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dtdemo - Win32 Debug French"

OUTDIR=.\..\build\dtdemo\fr\debug
INTDIR=.\..\build\dtdemo\fr\debug\link
# Begin Custom Macros
OutDir=.\..\build\dtdemo\fr\debug
# End Custom Macros

ALL : "$(OUTDIR)\dtdemo.exe"


CLEAN :
	-@erase "$(INTDIR)\acxf1c.obj"
	-@erase "$(INTDIR)\brent.obj"
	-@erase "$(INTDIR)\circuit.obj"
	-@erase "$(INTDIR)\diffuse.obj"
	-@erase "$(INTDIR)\fixfft32.obj"
	-@erase "$(INTDIR)\frame.obj"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\inithl.obj"
	-@erase "$(INTDIR)\llinit.obj"
	-@erase "$(INTDIR)\log10table.obj"
	-@erase "$(INTDIR)\nasalf1x.obj"
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\Speak.obj"
	-@erase "$(INTDIR)\speak.res"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\voice.obj"
	-@erase "$(OUTDIR)\dtdemo.exe"
	-@erase "$(OUTDIR)\dtdemo.ilk"
	-@erase "$(OUTDIR)\dtdemo.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\api" /I "..\.." /D "_DEBUG" /D "FRENCH" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /Fp"$(INTDIR)\dtdemo.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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

MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\speak.res" /d "_DEBUG" /d "DEMO" /d "ENGLISH_US" /d "ENGLISH" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dtdemo.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\build\dtstatic\fr\dbgdemo\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\dtdemo.pdb" /debug /machine:I386 /out:"$(OUTDIR)\dtdemo.exe" 
LINK32_OBJS= \
	"$(INTDIR)\acxf1c.obj" \
	"$(INTDIR)\brent.obj" \
	"$(INTDIR)\circuit.obj" \
	"$(INTDIR)\diffuse.obj" \
	"$(INTDIR)\fixfft32.obj" \
	"$(INTDIR)\frame.obj" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
	"$(INTDIR)\llinit.obj" \
	"$(INTDIR)\nasalf1x.obj" \
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\Speak.obj" \
	"$(INTDIR)\voice.obj" \
	"$(INTDIR)\speak.res" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\log10table.obj"

"$(OUTDIR)\dtdemo.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("dtdemo.dep")
!INCLUDE "dtdemo.dep"
!ELSE 
!MESSAGE Warning: cannot find "dtdemo.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "dtdemo - Win32 Release" || "$(CFG)" == "dtdemo - Win32 Debug" || "$(CFG)" == "dtdemo - Win32 Release Spanish" || "$(CFG)" == "dtdemo - Win32 Release German" || "$(CFG)" == "dtdemo - Win32 Release Latin American" || "$(CFG)" == "dtdemo - Win32 Debug Spanish" || "$(CFG)" == "dtdemo - Win32 Debug German" || "$(CFG)" == "dtdemo - Win32 Debug Latin American" || "$(CFG)" == "dtdemo - Win32 Release United Kingdom" || "$(CFG)" == "dtdemo - Win32 Debug United Kingdom" || "$(CFG)" == "dtdemo - Win32 Release French" || "$(CFG)" == "dtdemo - Win32 Debug French"
SOURCE=.\hlsyn\acxf1c.c

"$(INTDIR)\acxf1c.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\hlsyn\brent.c

"$(INTDIR)\brent.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\hlsyn\circuit.c

"$(INTDIR)\circuit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\hlsyn\diffuse.c

"$(INTDIR)\diffuse.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\hlsyn\fixfft32.c

"$(INTDIR)\fixfft32.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\hlsyn\frame.c

"$(INTDIR)\frame.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\hlsyn\hlframe.c

"$(INTDIR)\hlframe.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\hlsyn\inithl.c

"$(INTDIR)\inithl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\hlsyn\llinit.c

"$(INTDIR)\llinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\hlsyn\log10table.c

"$(INTDIR)\log10table.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\hlsyn\nasalf1x.c

"$(INTDIR)\nasalf1x.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\hlsyn\reson.c

"$(INTDIR)\reson.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\hlsyn\sample.c

"$(INTDIR)\sample.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\samples\speak\Speak.c

!IF  "$(CFG)" == "dtdemo - Win32 Release"

CPP_SWITCHES=/nologo /MT /W3 /GX /O2 /I ".\api" /I "..\.." /D "NDEBUG" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /D "ENGLISH" /Fp"$(INTDIR)\dtdemo.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Speak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "dtdemo - Win32 Debug"

CPP_SWITCHES=/nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\api" /I "..\.." /D "_DEBUG" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /D "ENGLISH" /Fp"$(INTDIR)\dtdemo.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Speak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "dtdemo - Win32 Release Spanish"

CPP_SWITCHES=/nologo /MT /W3 /GX /O2 /I ".\api" /I "..\.." /D "NDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /Fp"$(INTDIR)\dtdemo.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Speak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "dtdemo - Win32 Release German"

CPP_SWITCHES=/nologo /MT /W3 /GX /O2 /I ".\api" /I "..\.." /D "NDEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /Fp"$(INTDIR)\dtdemo.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Speak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "dtdemo - Win32 Release Latin American"

CPP_SWITCHES=/nologo /MT /W3 /GX /O2 /I ".\api" /I "..\.." /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /Fp"$(INTDIR)\dtdemo.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Speak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "dtdemo - Win32 Debug Spanish"

CPP_SWITCHES=/nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\api" /I "..\.." /D "_DEBUG" /D "SPANISH" /D "SPANISH_SP" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /Fp"$(INTDIR)\dtdemo.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Speak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "dtdemo - Win32 Debug German"

CPP_SWITCHES=/nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\api" /I "..\.." /D "_DEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /Fp"$(INTDIR)\dtdemo.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Speak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "dtdemo - Win32 Debug Latin American"

CPP_SWITCHES=/nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\api" /I "..\.." /D "_DEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /Fp"$(INTDIR)\dtdemo.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Speak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "dtdemo - Win32 Release United Kingdom"

CPP_SWITCHES=/nologo /MT /W3 /GX /O2 /I ".\api" /I "..\.." /D "NDEBUG" /D "ENGLISH_UK" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /D "ENGLISH" /Fp"$(INTDIR)\dtdemo.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Speak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "dtdemo - Win32 Debug United Kingdom"

CPP_SWITCHES=/nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\api" /I "..\.." /D "_DEBUG" /D "ENGLISH_UK" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /D "ENGLISH" /Fp"$(INTDIR)\dtdemo.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Speak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "dtdemo - Win32 Release French"

CPP_SWITCHES=/nologo /MT /W3 /GX /O2 /I ".\api" /I "..\.." /D "NDEBUG" /D "FRENCH" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /Fp"$(INTDIR)\dtdemo.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Speak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "dtdemo - Win32 Debug French"

CPP_SWITCHES=/nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\api" /I "..\.." /D "_DEBUG" /D "FRENCH" /D "WIN32" /D "_WINDOWS" /D "DEMO" /D "DTDEMO" /Fp"$(INTDIR)\dtdemo.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Speak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=..\..\samples\speak\speak.rc

!IF  "$(CFG)" == "dtdemo - Win32 Release"


"$(INTDIR)\speak.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\speak.res" /i "\work\ad\samples\speak" /i "\work\rnd\samples\speak" /i "\work\rnd.007\samples\speak" /i "D:\Work\rnd\samples\speak" /d "NDEBUG" /d "DEMO" /d "ENGLISH_US" /d "ENGLISH" $(SOURCE)


!ELSEIF  "$(CFG)" == "dtdemo - Win32 Debug"


"$(INTDIR)\speak.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\speak.res" /i "\work\ad\samples\speak" /i "\work\rnd\samples\speak" /i "\work\rnd.007\samples\speak" /i "D:\Work\rnd\samples\speak" /d "_DEBUG" /d "DEMO" /d "ENGLISH_US" /d "ENGLISH" $(SOURCE)


!ELSEIF  "$(CFG)" == "dtdemo - Win32 Release Spanish"


"$(INTDIR)\speak.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\speak.res" /i "\work\ad\samples\speak" /i "\work\rnd\samples\speak" /i "\work\rnd.007\samples\speak" /i "D:\Work\rnd\samples\speak" /d "NDEBUG" /d "DEMO" /d "SPANISH" $(SOURCE)


!ELSEIF  "$(CFG)" == "dtdemo - Win32 Release German"


"$(INTDIR)\speak.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\speak.res" /i "\work\ad\samples\speak" /i "\work\rnd\samples\speak" /i "\work\rnd.007\samples\speak" /i "D:\Work\rnd\samples\speak" /d "NDEBUG" /d "DEMO" /d "GERMAN" $(SOURCE)


!ELSEIF  "$(CFG)" == "dtdemo - Win32 Release Latin American"


"$(INTDIR)\speak.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\speak.res" /i "\work\ad\samples\speak" /i "\work\rnd\samples\speak" /i "\work\rnd.007\samples\speak" /i "D:\Work\rnd\samples\speak" /d "NDEBUG" /d "DEMO" /d "SPANISH" /d "LATIN_AMERICAN" $(SOURCE)


!ELSEIF  "$(CFG)" == "dtdemo - Win32 Debug Spanish"


"$(INTDIR)\speak.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\speak.res" /i "\work\ad\samples\speak" /i "\work\rnd\samples\speak" /i "\work\rnd.007\samples\speak" /i "D:\Work\rnd\samples\speak" /d "_DEBUG" /d "DEMO" /d "SPANISH" $(SOURCE)


!ELSEIF  "$(CFG)" == "dtdemo - Win32 Debug German"


"$(INTDIR)\speak.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\speak.res" /i "\work\ad\samples\speak" /i "\work\rnd\samples\speak" /i "\work\rnd.007\samples\speak" /i "D:\Work\rnd\samples\speak" /d "_DEBUG" /d "DEMO" /d "GERMAN" $(SOURCE)


!ELSEIF  "$(CFG)" == "dtdemo - Win32 Debug Latin American"


"$(INTDIR)\speak.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\speak.res" /i "\work\ad\samples\speak" /i "\work\rnd\samples\speak" /i "\work\rnd.007\samples\speak" /i "D:\Work\rnd\samples\speak" /d "_DEBUG" /d "DEMO" /d "SPANISH" /d "LATIN_AMERICAN" $(SOURCE)


!ELSEIF  "$(CFG)" == "dtdemo - Win32 Release United Kingdom"


"$(INTDIR)\speak.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\speak.res" /i "\work\ad\samples\speak" /i "\work\rnd\samples\speak" /i "\work\rnd.007\samples\speak" /i "D:\Work\rnd\samples\speak" /d "NDEBUG" /d "DEMO" /d "ENGLISH_US" /d "ENGLISH" $(SOURCE)


!ELSEIF  "$(CFG)" == "dtdemo - Win32 Debug United Kingdom"


"$(INTDIR)\speak.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\speak.res" /i "\work\ad\samples\speak" /i "\work\rnd\samples\speak" /i "\work\rnd.007\samples\speak" /i "D:\Work\rnd\samples\speak" /d "_DEBUG" /d "DEMO" /d "ENGLISH_US" /d "ENGLISH" $(SOURCE)


!ELSEIF  "$(CFG)" == "dtdemo - Win32 Release French"


"$(INTDIR)\speak.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\speak.res" /i "\work\ad\samples\speak" /i "\work\rnd\samples\speak" /i "\work\rnd.007\samples\speak" /i "D:\Work\rnd\samples\speak" /d "NDEBUG" /d "DEMO" /d "ENGLISH_US" /d "ENGLISH" $(SOURCE)


!ELSEIF  "$(CFG)" == "dtdemo - Win32 Debug French"


"$(INTDIR)\speak.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\speak.res" /i "\work\ad\samples\speak" /i "\work\rnd\samples\speak" /i "\work\rnd.007\samples\speak" /i "D:\Work\rnd\samples\speak" /d "_DEBUG" /d "DEMO" /d "ENGLISH_US" /d "ENGLISH" $(SOURCE)


!ENDIF 

SOURCE=.\hlsyn\sqrttable.c

"$(INTDIR)\sqrttable.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\hlsyn\voice.c

"$(INTDIR)\voice.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)



!ENDIF 

