# Microsoft Developer Studio Generated NMAKE File, Based on Dtmemory.dsp
!IF "$(CFG)" == ""
CFG=Dtmemory - Win32 ALPHA Debug United Kingdom
!MESSAGE No configuration specified. Defaulting to Dtmemory - Win32 ALPHA Debug United Kingdom.
!ENDIF 

!IF "$(CFG)" != "Dtmemory - Win32 Release" && "$(CFG)" != "Dtmemory - Win32 Debug" && "$(CFG)" != "Dtmemory - Win32 Release Spanish" && "$(CFG)" != "Dtmemory - Win32 Release German" && "$(CFG)" != "Dtmemory - Win32 Release Latin American" && "$(CFG)" != "Dtmemory - Win32 Debug Spanish" && "$(CFG)" != "Dtmemory - Win32 Debug German" && "$(CFG)" != "Dtmemory - Win32 Debug Latin American" && "$(CFG)" != "Dtmemory - Win32 ALPHA Release" && "$(CFG)" != "Dtmemory - Win32 ALPHA Debug" && "$(CFG)" != "Dtmemory - Win32 ALPHA Release Spanish" && "$(CFG)" != "Dtmemory - Win32 ALPHA Release German" && "$(CFG)" != "Dtmemory - Win32 ALPHA Release Latin American" && "$(CFG)" != "Dtmemory - Win32 ALPHA Debug Spanish" && "$(CFG)" != "Dtmemory - Win32 ALPHA Debug German" && "$(CFG)" != "Dtmemory - Win32 ALPHA Debug Latin American" && "$(CFG)" != "Dtmemory - Win32 Release United Kingdom" && "$(CFG)" != "Dtmemory - Win32 Debug United Kingdom" && "$(CFG)" != "Dtmemory - Win32 ALPHA Release United Kingdom" && "$(CFG)" != "Dtmemory - Win32 ALPHA Debug United Kingdom"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "Dtmemory.mak" CFG="Dtmemory - Win32 ALPHA Debug United Kingdom"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Dtmemory - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "Dtmemory - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE "Dtmemory - Win32 Release Spanish" (based on "Win32 (x86) Application")
!MESSAGE "Dtmemory - Win32 Release German" (based on "Win32 (x86) Application")
!MESSAGE "Dtmemory - Win32 Release Latin American" (based on "Win32 (x86) Application")
!MESSAGE "Dtmemory - Win32 Debug Spanish" (based on "Win32 (x86) Application")
!MESSAGE "Dtmemory - Win32 Debug German" (based on "Win32 (x86) Application")
!MESSAGE "Dtmemory - Win32 Debug Latin American" (based on "Win32 (x86) Application")
!MESSAGE "Dtmemory - Win32 ALPHA Release" (based on "Win32 (ALPHA) Application")
!MESSAGE "Dtmemory - Win32 ALPHA Debug" (based on "Win32 (ALPHA) Application")
!MESSAGE "Dtmemory - Win32 ALPHA Release Spanish" (based on "Win32 (ALPHA) Application")
!MESSAGE "Dtmemory - Win32 ALPHA Release German" (based on "Win32 (ALPHA) Application")
!MESSAGE "Dtmemory - Win32 ALPHA Release Latin American" (based on "Win32 (ALPHA) Application")
!MESSAGE "Dtmemory - Win32 ALPHA Debug Spanish" (based on "Win32 (ALPHA) Application")
!MESSAGE "Dtmemory - Win32 ALPHA Debug German" (based on "Win32 (ALPHA) Application")
!MESSAGE "Dtmemory - Win32 ALPHA Debug Latin American" (based on "Win32 (ALPHA) Application")
!MESSAGE "Dtmemory - Win32 Release United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "Dtmemory - Win32 Debug United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "Dtmemory - Win32 ALPHA Release United Kingdom" (based on "Win32 (ALPHA) Application")
!MESSAGE "Dtmemory - Win32 ALPHA Debug United Kingdom" (based on "Win32 (ALPHA) Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "Dtmemory - Win32 Release"

OUTDIR=.\build\us\release
INTDIR=.\build\us\release\link
# Begin Custom Macros
OutDir=.\build\us\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtmemory.exe"


CLEAN :
	-@erase "$(INTDIR)\dtmemory.obj"
	-@erase "$(INTDIR)\dtmemory.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtmemory.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "ENGLISH_US" /D "ENGLISH" /Fp"$(INTDIR)\Dtmemory.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtmemory.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtmemory.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\us\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtmemory.pdb" /machine:I386 /out:"$(OUTDIR)\Dtmemory.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtmemory.obj" \
	"$(INTDIR)\dtmemory.res"

"$(OUTDIR)\Dtmemory.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtmemory - Win32 Debug"

OUTDIR=.\build\us\debug
INTDIR=.\build\us\debug\link
# Begin Custom Macros
OutDir=.\build\us\debug
# End Custom Macros

ALL : "$(OUTDIR)\Dtmemory.exe"


CLEAN :
	-@erase "$(INTDIR)\dtmemory.obj"
	-@erase "$(INTDIR)\dtmemory.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Dtmemory.exe"
	-@erase "$(OUTDIR)\Dtmemory.ilk"
	-@erase "$(OUTDIR)\Dtmemory.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "ENGLISH_US" /D "ENGLISH" /Fp"$(INTDIR)\Dtmemory.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtmemory.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtmemory.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtmemory.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Dtmemory.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtmemory.obj" \
	"$(INTDIR)\dtmemory.res"

"$(OUTDIR)\Dtmemory.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtmemory - Win32 Release Spanish"

OUTDIR=.\build\sp\release
INTDIR=.\build\sp\release\link
# Begin Custom Macros
OutDir=.\build\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtmemory.exe"


CLEAN :
	-@erase "$(INTDIR)\dtmemory.obj"
	-@erase "$(INTDIR)\dtmemory.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtmemory.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SPANISH" /D "SPANISH_SP" /Fp"$(INTDIR)\Dtmemory.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\dtmemory.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtmemory.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\sp\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtmemory.pdb" /machine:I386 /out:"$(OUTDIR)\Dtmemory.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtmemory.obj" \
	"$(INTDIR)\dtmemory.res"

"$(OUTDIR)\Dtmemory.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtmemory - Win32 Release German"

OUTDIR=.\build\gr\release
INTDIR=.\build\gr\release\link
# Begin Custom Macros
OutDir=.\build\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtmemory.exe"


CLEAN :
	-@erase "$(INTDIR)\dtmemory.obj"
	-@erase "$(INTDIR)\dtmemory.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtmemory.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GERMAN" /Fp"$(INTDIR)\Dtmemory.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\dtmemory.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtmemory.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\gr\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtmemory.pdb" /machine:I386 /out:"$(OUTDIR)\Dtmemory.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtmemory.obj" \
	"$(INTDIR)\dtmemory.res"

"$(OUTDIR)\Dtmemory.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtmemory - Win32 Release Latin American"

OUTDIR=.\build\la\release
INTDIR=.\build\la\release\link
# Begin Custom Macros
OutDir=.\build\la\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtmemory.exe"


CLEAN :
	-@erase "$(INTDIR)\dtmemory.obj"
	-@erase "$(INTDIR)\dtmemory.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtmemory.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SPANISH" /D "SPANISH_LA" /Fp"$(INTDIR)\Dtmemory.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\dtmemory.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtmemory.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\la\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtmemory.pdb" /machine:I386 /out:"$(OUTDIR)\Dtmemory.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtmemory.obj" \
	"$(INTDIR)\dtmemory.res"

"$(OUTDIR)\Dtmemory.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtmemory - Win32 Debug Spanish"

OUTDIR=.\build\sp\debug
INTDIR=.\build\sp\debug\link
# Begin Custom Macros
OutDir=.\build\sp\debug
# End Custom Macros

ALL : "$(OUTDIR)\Dtmemory.exe"


CLEAN :
	-@erase "$(INTDIR)\dtmemory.obj"
	-@erase "$(INTDIR)\dtmemory.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Dtmemory.exe"
	-@erase "$(OUTDIR)\Dtmemory.ilk"
	-@erase "$(OUTDIR)\Dtmemory.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SPANISH" /D "SPANISH_SP" /Fp"$(INTDIR)\Dtmemory.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\dtmemory.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtmemory.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\sp\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtmemory.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Dtmemory.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtmemory.obj" \
	"$(INTDIR)\dtmemory.res"

"$(OUTDIR)\Dtmemory.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtmemory - Win32 Debug German"

OUTDIR=.\build\gr\debug
INTDIR=.\build\gr\debug\link
# Begin Custom Macros
OutDir=.\build\gr\debug
# End Custom Macros

ALL : "$(OUTDIR)\Dtmemory.exe"


CLEAN :
	-@erase "$(INTDIR)\dtmemory.obj"
	-@erase "$(INTDIR)\dtmemory.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Dtmemory.exe"
	-@erase "$(OUTDIR)\Dtmemory.ilk"
	-@erase "$(OUTDIR)\Dtmemory.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "GERMAN" /Fp"$(INTDIR)\Dtmemory.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\dtmemory.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtmemory.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\gr\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtmemory.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Dtmemory.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtmemory.obj" \
	"$(INTDIR)\dtmemory.res"

"$(OUTDIR)\Dtmemory.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtmemory - Win32 Debug Latin American"

OUTDIR=.\build\la\debug
INTDIR=.\build\la\debug\link
# Begin Custom Macros
OutDir=.\build\la\debug
# End Custom Macros

ALL : "$(OUTDIR)\Dtmemory.exe"


CLEAN :
	-@erase "$(INTDIR)\dtmemory.obj"
	-@erase "$(INTDIR)\dtmemory.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Dtmemory.exe"
	-@erase "$(OUTDIR)\Dtmemory.ilk"
	-@erase "$(OUTDIR)\Dtmemory.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SPANISH" /D "SPANISH_LA" /Fp"$(INTDIR)\Dtmemory.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\dtmemory.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtmemory.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\la\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtmemory.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Dtmemory.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtmemory.obj" \
	"$(INTDIR)\dtmemory.res"

"$(OUTDIR)\Dtmemory.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtmemory - Win32 ALPHA Release"

OUTDIR=.\alpha\us\release
INTDIR=.\alpha\us\release\link
# Begin Custom Macros
OutDir=.\alpha\us\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtmemory.exe"


CLEAN :
	-@erase "$(INTDIR)\dtmemory.res"
	-@erase "$(OUTDIR)\Dtmemory.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtmemory.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtmemory.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\us\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtmemory.pdb" /machine:ALPHA /out:"$(OUTDIR)\Dtmemory.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtmemory.res"

"$(OUTDIR)\Dtmemory.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtmemory - Win32 ALPHA Debug"

OUTDIR=.\alpha\us\debug
INTDIR=.\alpha\us\debug\link
# Begin Custom Macros
OutDir=.\alpha\us\debug
# End Custom Macros

ALL : "$(OUTDIR)\Dtmemory.exe"


CLEAN :
	-@erase "$(INTDIR)\dtmemory.res"
	-@erase "$(OUTDIR)\Dtmemory.exe"
	-@erase "$(OUTDIR)\Dtmemory.ilk"
	-@erase "$(OUTDIR)\Dtmemory.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtmemory.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtmemory.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtmemory.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\Dtmemory.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtmemory.res"

"$(OUTDIR)\Dtmemory.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtmemory - Win32 ALPHA Release Spanish"

OUTDIR=.\alpha\sp\release
INTDIR=.\alpha\sp\release\link
# Begin Custom Macros
OutDir=.\alpha\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtmemory.exe"


CLEAN :
	-@erase "$(INTDIR)\dtmemory.res"
	-@erase "$(OUTDIR)\Dtmemory.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\dtmemory.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtmemory.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\sp\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtmemory.pdb" /machine:ALPHA /out:"$(OUTDIR)\Dtmemory.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtmemory.res"

"$(OUTDIR)\Dtmemory.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtmemory - Win32 ALPHA Release German"

OUTDIR=.\alpha\gr\release
INTDIR=.\alpha\gr\release\link
# Begin Custom Macros
OutDir=.\alpha\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtmemory.exe"


CLEAN :
	-@erase "$(INTDIR)\dtmemory.res"
	-@erase "$(OUTDIR)\Dtmemory.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\dtmemory.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtmemory.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\gr\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtmemory.pdb" /machine:ALPHA /out:"$(OUTDIR)\Dtmemory.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtmemory.res"

"$(OUTDIR)\Dtmemory.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtmemory - Win32 ALPHA Release Latin American"

OUTDIR=.\alpha\la\release
INTDIR=.\alpha\la\release\link
# Begin Custom Macros
OutDir=.\alpha\la\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtmemory.exe"


CLEAN :
	-@erase "$(INTDIR)\dtmemory.res"
	-@erase "$(OUTDIR)\Dtmemory.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\dtmemory.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtmemory.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\la\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtmemory.pdb" /machine:ALPHA /out:"$(OUTDIR)\Dtmemory.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtmemory.res"

"$(OUTDIR)\Dtmemory.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtmemory - Win32 ALPHA Debug Spanish"

OUTDIR=.\alpha\sp\debug
INTDIR=.\alpha\sp\debug\link
# Begin Custom Macros
OutDir=.\alpha\sp\debug
# End Custom Macros

ALL : "$(OUTDIR)\Dtmemory.exe"


CLEAN :
	-@erase "$(INTDIR)\dtmemory.res"
	-@erase "$(OUTDIR)\Dtmemory.exe"
	-@erase "$(OUTDIR)\Dtmemory.ilk"
	-@erase "$(OUTDIR)\Dtmemory.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\dtmemory.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtmemory.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\sp\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtmemory.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\Dtmemory.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtmemory.res"

"$(OUTDIR)\Dtmemory.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtmemory - Win32 ALPHA Debug German"

OUTDIR=.\alpha\gr\debug
INTDIR=.\alpha\gr\debug\link
# Begin Custom Macros
OutDir=.\alpha\gr\debug
# End Custom Macros

ALL : "$(OUTDIR)\Dtmemory.exe"


CLEAN :
	-@erase "$(INTDIR)\dtmemory.res"
	-@erase "$(OUTDIR)\Dtmemory.exe"
	-@erase "$(OUTDIR)\Dtmemory.ilk"
	-@erase "$(OUTDIR)\Dtmemory.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\dtmemory.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtmemory.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\gr\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtmemory.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\Dtmemory.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtmemory.res"

"$(OUTDIR)\Dtmemory.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtmemory - Win32 ALPHA Debug Latin American"

OUTDIR=.\alpha\la\debug
INTDIR=.\alpha\la\debug\link
# Begin Custom Macros
OutDir=.\alpha\la\debug
# End Custom Macros

ALL : "$(OUTDIR)\Dtmemory.exe"


CLEAN :
	-@erase "$(INTDIR)\dtmemory.res"
	-@erase "$(OUTDIR)\Dtmemory.exe"
	-@erase "$(OUTDIR)\Dtmemory.ilk"
	-@erase "$(OUTDIR)\Dtmemory.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\dtmemory.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtmemory.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\la\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtmemory.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\Dtmemory.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtmemory.res"

"$(OUTDIR)\Dtmemory.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtmemory - Win32 Release United Kingdom"

OUTDIR=.\build\uk\release
INTDIR=.\build\uk\release\link
# Begin Custom Macros
OutDir=.\build\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtmemory.exe"


CLEAN :
	-@erase "$(INTDIR)\dtmemory.obj"
	-@erase "$(INTDIR)\dtmemory.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtmemory.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "ENGLISH_UK" /D "ENGLISH" /Fp"$(INTDIR)\Dtmemory.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\dtmemory.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtmemory.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\uk\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtmemory.pdb" /machine:I386 /out:"$(OUTDIR)\Dtmemory.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtmemory.obj" \
	"$(INTDIR)\dtmemory.res"

"$(OUTDIR)\Dtmemory.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtmemory - Win32 Debug United Kingdom"

OUTDIR=.\build\uk\debug
INTDIR=.\build\uk\debug\link
# Begin Custom Macros
OutDir=.\build\uk\debug
# End Custom Macros

ALL : "$(OUTDIR)\Dtmemory.exe"


CLEAN :
	-@erase "$(INTDIR)\dtmemory.obj"
	-@erase "$(INTDIR)\dtmemory.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Dtmemory.exe"
	-@erase "$(OUTDIR)\Dtmemory.ilk"
	-@erase "$(OUTDIR)\Dtmemory.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "ENGLISH_UK" /D "ENGLISH" /Fp"$(INTDIR)\Dtmemory.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\dtmemory.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtmemory.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\uk\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtmemory.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Dtmemory.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtmemory.obj" \
	"$(INTDIR)\dtmemory.res"

"$(OUTDIR)\Dtmemory.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtmemory - Win32 ALPHA Release United Kingdom"

OUTDIR=.\alpha\uk\release
INTDIR=.\alpha\uk\release\link
# Begin Custom Macros
OutDir=.\alpha\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtmemory.exe"


CLEAN :
	-@erase "$(INTDIR)\dtmemory.res"
	-@erase "$(OUTDIR)\Dtmemory.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\dtmemory.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtmemory.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\uk\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtmemory.pdb" /machine:ALPHA /out:"$(OUTDIR)\Dtmemory.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtmemory.res"

"$(OUTDIR)\Dtmemory.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtmemory - Win32 ALPHA Debug United Kingdom"

OUTDIR=.\alpha\uk\debug
INTDIR=.\alpha\uk\debug\link
# Begin Custom Macros
OutDir=.\alpha\uk\debug
# End Custom Macros

ALL : "$(OUTDIR)\Dtmemory.exe"


CLEAN :
	-@erase "$(INTDIR)\dtmemory.res"
	-@erase "$(OUTDIR)\Dtmemory.exe"
	-@erase "$(OUTDIR)\Dtmemory.ilk"
	-@erase "$(OUTDIR)\Dtmemory.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\dtmemory.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtmemory.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\uk\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtmemory.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\Dtmemory.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtmemory.res"

"$(OUTDIR)\Dtmemory.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Dtmemory.dep")
!INCLUDE "Dtmemory.dep"
!ELSE 
!MESSAGE Warning: cannot find "Dtmemory.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "Dtmemory - Win32 Release" || "$(CFG)" == "Dtmemory - Win32 Debug" || "$(CFG)" == "Dtmemory - Win32 Release Spanish" || "$(CFG)" == "Dtmemory - Win32 Release German" || "$(CFG)" == "Dtmemory - Win32 Release Latin American" || "$(CFG)" == "Dtmemory - Win32 Debug Spanish" || "$(CFG)" == "Dtmemory - Win32 Debug German" || "$(CFG)" == "Dtmemory - Win32 Debug Latin American" || "$(CFG)" == "Dtmemory - Win32 ALPHA Release" || "$(CFG)" == "Dtmemory - Win32 ALPHA Debug" || "$(CFG)" == "Dtmemory - Win32 ALPHA Release Spanish" || "$(CFG)" == "Dtmemory - Win32 ALPHA Release German" || "$(CFG)" == "Dtmemory - Win32 ALPHA Release Latin American" || "$(CFG)" == "Dtmemory - Win32 ALPHA Debug Spanish" || "$(CFG)" == "Dtmemory - Win32 ALPHA Debug German" || "$(CFG)" == "Dtmemory - Win32 ALPHA Debug Latin American" || "$(CFG)" == "Dtmemory - Win32 Release United Kingdom" || "$(CFG)" == "Dtmemory - Win32 Debug United Kingdom" || "$(CFG)" == "Dtmemory - Win32 ALPHA Release United Kingdom" || "$(CFG)" == "Dtmemory - Win32 ALPHA Debug United Kingdom"
SOURCE=.\dtmemory.c

!IF  "$(CFG)" == "Dtmemory - Win32 Release"


"$(INTDIR)\dtmemory.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtmemory - Win32 Debug"


"$(INTDIR)\dtmemory.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtmemory - Win32 Release Spanish"


"$(INTDIR)\dtmemory.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtmemory - Win32 Release German"


"$(INTDIR)\dtmemory.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtmemory - Win32 Release Latin American"


"$(INTDIR)\dtmemory.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtmemory - Win32 Debug Spanish"


"$(INTDIR)\dtmemory.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtmemory - Win32 Debug German"


"$(INTDIR)\dtmemory.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtmemory - Win32 Debug Latin American"


"$(INTDIR)\dtmemory.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtmemory - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "Dtmemory - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "Dtmemory - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "Dtmemory - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "Dtmemory - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "Dtmemory - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "Dtmemory - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "Dtmemory - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "Dtmemory - Win32 Release United Kingdom"


"$(INTDIR)\dtmemory.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtmemory - Win32 Debug United Kingdom"


"$(INTDIR)\dtmemory.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtmemory - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "Dtmemory - Win32 ALPHA Debug United Kingdom"

!ENDIF 

SOURCE=.\dtmemory.rc

"$(INTDIR)\dtmemory.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)



!ENDIF 

