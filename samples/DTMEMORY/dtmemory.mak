# Microsoft Developer Studio Generated NMAKE File, Based on Dtmemory.dsp
!IF "$(CFG)" == ""
CFG=Dtmemory - Win32 Debug French
!MESSAGE No configuration specified. Defaulting to Dtmemory - Win32 Debug French.
!ENDIF 

!IF "$(CFG)" != "Dtmemory - Win32 Release" && "$(CFG)" != "Dtmemory - Win32 Debug" && "$(CFG)" != "Dtmemory - Win32 Release Spanish" && "$(CFG)" != "Dtmemory - Win32 Release German" && "$(CFG)" != "Dtmemory - Win32 Release Latin American" && "$(CFG)" != "Dtmemory - Win32 Debug Spanish" && "$(CFG)" != "Dtmemory - Win32 Debug German" && "$(CFG)" != "Dtmemory - Win32 Debug Latin American" && "$(CFG)" != "Dtmemory - Win32 Release United Kingdom" && "$(CFG)" != "Dtmemory - Win32 Debug United Kingdom" && "$(CFG)" != "Dtmemory - Win32 Release French" && "$(CFG)" != "Dtmemory - Win32 Debug French"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "Dtmemory.mak" CFG="Dtmemory - Win32 Debug French"
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
!MESSAGE "Dtmemory - Win32 Release United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "Dtmemory - Win32 Debug United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "Dtmemory - Win32 Release French" (based on "Win32 (x86) Application")
!MESSAGE "Dtmemory - Win32 Debug French" (based on "Win32 (x86) Application")
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

!ELSEIF  "$(CFG)" == "Dtmemory - Win32 Release French"

OUTDIR=.\build\fr\release
INTDIR=.\build\fr\release\link
# Begin Custom Macros
OutDir=.\build\fr\release
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
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "FRENCH" /Fp"$(INTDIR)\Dtmemory.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
LINK32_FLAGS=..\..\dapi\build\dectalk\fr\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtmemory.pdb" /machine:I386 /out:"$(OUTDIR)\Dtmemory.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtmemory.obj" \
	"$(INTDIR)\dtmemory.res"

"$(OUTDIR)\Dtmemory.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtmemory - Win32 Debug French"

OUTDIR=.\build\fr\debug
INTDIR=.\build\fr\debug\link
# Begin Custom Macros
OutDir=.\build\fr\debug
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
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "FRENCH" /Fp"$(INTDIR)\Dtmemory.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
LINK32_FLAGS=..\..\dapi\build\dectalk\fr\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtmemory.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Dtmemory.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtmemory.obj" \
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


!IF "$(CFG)" == "Dtmemory - Win32 Release" || "$(CFG)" == "Dtmemory - Win32 Debug" || "$(CFG)" == "Dtmemory - Win32 Release Spanish" || "$(CFG)" == "Dtmemory - Win32 Release German" || "$(CFG)" == "Dtmemory - Win32 Release Latin American" || "$(CFG)" == "Dtmemory - Win32 Debug Spanish" || "$(CFG)" == "Dtmemory - Win32 Debug German" || "$(CFG)" == "Dtmemory - Win32 Debug Latin American" || "$(CFG)" == "Dtmemory - Win32 Release United Kingdom" || "$(CFG)" == "Dtmemory - Win32 Debug United Kingdom" || "$(CFG)" == "Dtmemory - Win32 Release French" || "$(CFG)" == "Dtmemory - Win32 Debug French"
SOURCE=.\dtmemory.c

"$(INTDIR)\dtmemory.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\dtmemory.rc

"$(INTDIR)\dtmemory.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)



!ENDIF 

