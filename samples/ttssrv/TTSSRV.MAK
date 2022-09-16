# Microsoft Developer Studio Generated NMAKE File, Based on ttssrv.dsp
!IF "$(CFG)" == ""
CFG=ttssrv - Win32 ALPHA Debug United Kingdom
!MESSAGE No configuration specified. Defaulting to ttssrv - Win32 ALPHA Debug United Kingdom.
!ENDIF 

!IF "$(CFG)" != "ttssrv - Win32 Release" && "$(CFG)" != "ttssrv - Win32 Debug" && "$(CFG)" != "ttssrv - Win32 Release Spanish" && "$(CFG)" != "ttssrv - Win32 Release German" && "$(CFG)" != "ttssrv - Win32 Release Latin American" && "$(CFG)" != "ttssrv - Win32 Debug Spanish" && "$(CFG)" != "ttssrv - Win32 Debug German" && "$(CFG)" != "ttssrv - Win32 Debug Latin American" && "$(CFG)" != "ttssrv - Win32 Release United Kingdom" && "$(CFG)" != "ttssrv - Win32 Debug United Kingdom" && "$(CFG)" != "ttssrv - Win32 ALPHA Release" && "$(CFG)" != "ttssrv - Win32 ALPHA Release Spanish" && "$(CFG)" != "ttssrv - Win32 ALPHA Release German" && "$(CFG)" != "ttssrv - Win32 ALPHA Release Latin American" && "$(CFG)" != "ttssrv - Win32 ALPHA Debug" && "$(CFG)" != "ttssrv - Win32 ALPHA Debug Spanish" && "$(CFG)" != "ttssrv - Win32 ALPHA Debug German" && "$(CFG)" != "ttssrv - Win32 ALPHA Debug Latin American" && "$(CFG)" != "ttssrv - Win32 ALPHA Release United Kingdom" && "$(CFG)" != "ttssrv - Win32 ALPHA Debug United Kingdom"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "ttssrv.mak" CFG="ttssrv - Win32 ALPHA Debug United Kingdom"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "ttssrv - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "ttssrv - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE "ttssrv - Win32 Release Spanish" (based on "Win32 (x86) Application")
!MESSAGE "ttssrv - Win32 Release German" (based on "Win32 (x86) Application")
!MESSAGE "ttssrv - Win32 Release Latin American" (based on "Win32 (x86) Application")
!MESSAGE "ttssrv - Win32 Debug Spanish" (based on "Win32 (x86) Application")
!MESSAGE "ttssrv - Win32 Debug German" (based on "Win32 (x86) Application")
!MESSAGE "ttssrv - Win32 Debug Latin American" (based on "Win32 (x86) Application")
!MESSAGE "ttssrv - Win32 Release United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "ttssrv - Win32 Debug United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "ttssrv - Win32 ALPHA Release" (based on "Win32 (ALPHA) Application")
!MESSAGE "ttssrv - Win32 ALPHA Release Spanish" (based on "Win32 (ALPHA) Application")
!MESSAGE "ttssrv - Win32 ALPHA Release German" (based on "Win32 (ALPHA) Application")
!MESSAGE "ttssrv - Win32 ALPHA Release Latin American" (based on "Win32 (ALPHA) Application")
!MESSAGE "ttssrv - Win32 ALPHA Debug" (based on "Win32 (ALPHA) Application")
!MESSAGE "ttssrv - Win32 ALPHA Debug Spanish" (based on "Win32 (ALPHA) Application")
!MESSAGE "ttssrv - Win32 ALPHA Debug German" (based on "Win32 (ALPHA) Application")
!MESSAGE "ttssrv - Win32 ALPHA Debug Latin American" (based on "Win32 (ALPHA) Application")
!MESSAGE "ttssrv - Win32 ALPHA Release United Kingdom" (based on "Win32 (ALPHA) Application")
!MESSAGE "ttssrv - Win32 ALPHA Debug United Kingdom" (based on "Win32 (ALPHA) Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "ttssrv - Win32 Release"

OUTDIR=.\build\us\Release
INTDIR=.\build\us\Release\link
# Begin Custom Macros
OutDir=.\build\us\Release
# End Custom Macros

ALL : "$(OUTDIR)\ttssrv.exe"


CLEAN :
	-@erase "$(INTDIR)\ttssrv.obj"
	-@erase "$(INTDIR)\ttssrv.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\ttssrv.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "ENGLISH" /D "ENGLISH_US" /Fp"$(INTDIR)\ttssrv.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\ttssrv.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ttssrv.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\us\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\ttssrv.pdb" /machine:I386 /out:"$(OUTDIR)\ttssrv.exe" 
LINK32_OBJS= \
	"$(INTDIR)\ttssrv.obj" \
	"$(INTDIR)\ttssrv.res"

"$(OUTDIR)\ttssrv.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "ttssrv - Win32 Debug"

OUTDIR=.\build\us\Debug
INTDIR=.\build\us\Debug\link
# Begin Custom Macros
OutDir=.\build\us\Debug
# End Custom Macros

ALL : "$(OUTDIR)\ttssrv.exe"


CLEAN :
	-@erase "$(INTDIR)\ttssrv.obj"
	-@erase "$(INTDIR)\ttssrv.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\ttssrv.exe"
	-@erase "$(OUTDIR)\ttssrv.ilk"
	-@erase "$(OUTDIR)\ttssrv.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "ENGLISH" /D "ENGLISH_US" /Fp"$(INTDIR)\ttssrv.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\ttssrv.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ttssrv.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\ttssrv.pdb" /debug /machine:I386 /out:"$(OUTDIR)\ttssrv.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\ttssrv.obj" \
	"$(INTDIR)\ttssrv.res"

"$(OUTDIR)\ttssrv.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "ttssrv - Win32 Release Spanish"

OUTDIR=.\build\sp\Release
INTDIR=.\build\sp\Release\link
# Begin Custom Macros
OutDir=.\build\sp\Release
# End Custom Macros

ALL : "$(OUTDIR)\ttssrv.exe"


CLEAN :
	-@erase "$(INTDIR)\ttssrv.obj"
	-@erase "$(INTDIR)\ttssrv.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\ttssrv.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SPANISH" /D "SPANISH_SP" /Fp"$(INTDIR)\ttssrv.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\ttssrv.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ttssrv.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\sp\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\ttssrv.pdb" /machine:I386 /out:"$(OUTDIR)\ttssrv.exe" 
LINK32_OBJS= \
	"$(INTDIR)\ttssrv.obj" \
	"$(INTDIR)\ttssrv.res"

"$(OUTDIR)\ttssrv.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "ttssrv - Win32 Release German"

OUTDIR=.\build\gr\Release
INTDIR=.\build\gr\Release\link
# Begin Custom Macros
OutDir=.\build\gr\Release
# End Custom Macros

ALL : "$(OUTDIR)\ttssrv.exe"


CLEAN :
	-@erase "$(INTDIR)\ttssrv.obj"
	-@erase "$(INTDIR)\ttssrv.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\ttssrv.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GERMAN" /Fp"$(INTDIR)\ttssrv.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\ttssrv.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ttssrv.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\gr\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\ttssrv.pdb" /machine:I386 /out:"$(OUTDIR)\ttssrv.exe" 
LINK32_OBJS= \
	"$(INTDIR)\ttssrv.obj" \
	"$(INTDIR)\ttssrv.res"

"$(OUTDIR)\ttssrv.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "ttssrv - Win32 Release Latin American"

OUTDIR=.\build\la\Release
INTDIR=.\build\la\Release\link
# Begin Custom Macros
OutDir=.\build\la\Release
# End Custom Macros

ALL : "$(OUTDIR)\ttssrv.exe"


CLEAN :
	-@erase "$(INTDIR)\ttssrv.obj"
	-@erase "$(INTDIR)\ttssrv.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\ttssrv.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SPANISH" /D "SPANISH_LA" /Fp"$(INTDIR)\ttssrv.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\ttssrv.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ttssrv.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\la\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\ttssrv.pdb" /machine:I386 /out:"$(OUTDIR)\ttssrv.exe" 
LINK32_OBJS= \
	"$(INTDIR)\ttssrv.obj" \
	"$(INTDIR)\ttssrv.res"

"$(OUTDIR)\ttssrv.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "ttssrv - Win32 Debug Spanish"

OUTDIR=.\build\sp\Debug
INTDIR=.\build\sp\Debug\link
# Begin Custom Macros
OutDir=.\build\sp\Debug
# End Custom Macros

ALL : "$(OUTDIR)\ttssrv.exe"


CLEAN :
	-@erase "$(INTDIR)\ttssrv.obj"
	-@erase "$(INTDIR)\ttssrv.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\ttssrv.exe"
	-@erase "$(OUTDIR)\ttssrv.ilk"
	-@erase "$(OUTDIR)\ttssrv.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SPANISH" /D "SPANISH_SP" /Fp"$(INTDIR)\ttssrv.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\ttssrv.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ttssrv.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\sp\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\ttssrv.pdb" /debug /machine:I386 /out:"$(OUTDIR)\ttssrv.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\ttssrv.obj" \
	"$(INTDIR)\ttssrv.res"

"$(OUTDIR)\ttssrv.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "ttssrv - Win32 Debug German"

OUTDIR=.\build\gr\Debug
INTDIR=.\build\gr\Debug\link
# Begin Custom Macros
OutDir=.\build\gr\Debug
# End Custom Macros

ALL : "$(OUTDIR)\ttssrv.exe"


CLEAN :
	-@erase "$(INTDIR)\ttssrv.obj"
	-@erase "$(INTDIR)\ttssrv.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\ttssrv.exe"
	-@erase "$(OUTDIR)\ttssrv.ilk"
	-@erase "$(OUTDIR)\ttssrv.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "GERMAN" /Fp"$(INTDIR)\ttssrv.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\ttssrv.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ttssrv.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\gr\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\ttssrv.pdb" /debug /machine:I386 /out:"$(OUTDIR)\ttssrv.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\ttssrv.obj" \
	"$(INTDIR)\ttssrv.res"

"$(OUTDIR)\ttssrv.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "ttssrv - Win32 Debug Latin American"

OUTDIR=.\build\la\Debug
INTDIR=.\build\la\Debug\link
# Begin Custom Macros
OutDir=.\build\la\Debug
# End Custom Macros

ALL : "$(OUTDIR)\ttssrv.exe"


CLEAN :
	-@erase "$(INTDIR)\ttssrv.obj"
	-@erase "$(INTDIR)\ttssrv.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\ttssrv.exe"
	-@erase "$(OUTDIR)\ttssrv.ilk"
	-@erase "$(OUTDIR)\ttssrv.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SPANISH" /D "SPANISH_LA" /Fp"$(INTDIR)\ttssrv.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\ttssrv.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ttssrv.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\la\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\ttssrv.pdb" /debug /machine:I386 /out:"$(OUTDIR)\ttssrv.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\ttssrv.obj" \
	"$(INTDIR)\ttssrv.res"

"$(OUTDIR)\ttssrv.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "ttssrv - Win32 Release United Kingdom"

OUTDIR=.\build\uk\Release
INTDIR=.\build\uk\Release\link
# Begin Custom Macros
OutDir=.\build\uk\Release
# End Custom Macros

ALL : "$(OUTDIR)\ttssrv.exe"


CLEAN :
	-@erase "$(INTDIR)\ttssrv.obj"
	-@erase "$(INTDIR)\ttssrv.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\ttssrv.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "ENGLISH" /D "ENGLISH_US" /Fp"$(INTDIR)\ttssrv.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\ttssrv.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ttssrv.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\uk\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\ttssrv.pdb" /machine:I386 /out:"$(OUTDIR)\ttssrv.exe" 
LINK32_OBJS= \
	"$(INTDIR)\ttssrv.obj" \
	"$(INTDIR)\ttssrv.res"

"$(OUTDIR)\ttssrv.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "ttssrv - Win32 Debug United Kingdom"

OUTDIR=.\build\uk\Debug
INTDIR=.\build\uk\Debug\link
# Begin Custom Macros
OutDir=.\build\uk\Debug
# End Custom Macros

ALL : "$(OUTDIR)\ttssrv.exe"


CLEAN :
	-@erase "$(INTDIR)\ttssrv.obj"
	-@erase "$(INTDIR)\ttssrv.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\ttssrv.exe"
	-@erase "$(OUTDIR)\ttssrv.ilk"
	-@erase "$(OUTDIR)\ttssrv.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "ENGLISH" /D "ENGLISH_US" /Fp"$(INTDIR)\ttssrv.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\ttssrv.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ttssrv.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\uk\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\ttssrv.pdb" /debug /machine:I386 /out:"$(OUTDIR)\ttssrv.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\ttssrv.obj" \
	"$(INTDIR)\ttssrv.res"

"$(OUTDIR)\ttssrv.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Release"

OUTDIR=.\alpha\us\Release
INTDIR=.\alpha\us\Release\link
# Begin Custom Macros
OutDir=.\alpha\us\Release
# End Custom Macros

ALL : "$(OUTDIR)\ttssrv.exe"


CLEAN :
	-@erase "$(INTDIR)\ttssrv.res"
	-@erase "$(OUTDIR)\ttssrv.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\ttssrv.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ttssrv.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\us\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\ttssrv.pdb" /machine:ALPHA /out:"$(OUTDIR)\ttssrv.exe" 
LINK32_OBJS= \
	"$(INTDIR)\ttssrv.res"

"$(OUTDIR)\ttssrv.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Release Spanish"

OUTDIR=.\alpha\sp\Release
INTDIR=.\alpha\sp\Release\link
# Begin Custom Macros
OutDir=.\alpha\sp\Release
# End Custom Macros

ALL : "$(OUTDIR)\ttssrv.exe"


CLEAN :
	-@erase "$(INTDIR)\ttssrv.res"
	-@erase "$(OUTDIR)\ttssrv.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\ttssrv.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ttssrv.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\sp\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\ttssrv.pdb" /machine:ALPHA /out:"$(OUTDIR)\ttssrv.exe" 
LINK32_OBJS= \
	"$(INTDIR)\ttssrv.res"

"$(OUTDIR)\ttssrv.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Release German"

OUTDIR=.\alpha\gr\Release
INTDIR=.\alpha\gr\Release\link
# Begin Custom Macros
OutDir=.\alpha\gr\Release
# End Custom Macros

ALL : "$(OUTDIR)\ttssrv.exe"


CLEAN :
	-@erase "$(INTDIR)\ttssrv.res"
	-@erase "$(OUTDIR)\ttssrv.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\ttssrv.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ttssrv.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\gr\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\ttssrv.pdb" /machine:ALPHA /out:"$(OUTDIR)\ttssrv.exe" 
LINK32_OBJS= \
	"$(INTDIR)\ttssrv.res"

"$(OUTDIR)\ttssrv.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Release Latin American"

OUTDIR=.\alpha\la\Release
INTDIR=.\alpha\la\Release\link
# Begin Custom Macros
OutDir=.\alpha\la\Release
# End Custom Macros

ALL : "$(OUTDIR)\ttssrv.exe"


CLEAN :
	-@erase "$(INTDIR)\ttssrv.res"
	-@erase "$(OUTDIR)\ttssrv.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\ttssrv.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ttssrv.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\la\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\ttssrv.pdb" /machine:ALPHA /out:"$(OUTDIR)\ttssrv.exe" 
LINK32_OBJS= \
	"$(INTDIR)\ttssrv.res"

"$(OUTDIR)\ttssrv.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Debug"

OUTDIR=.\alpha\us\debug
INTDIR=.\alpha\us\debug\link
# Begin Custom Macros
OutDir=.\alpha\us\debug
# End Custom Macros

ALL : "$(OUTDIR)\ttssrv.exe"


CLEAN :
	-@erase "$(INTDIR)\ttssrv.res"
	-@erase "$(OUTDIR)\ttssrv.exe"
	-@erase "$(OUTDIR)\ttssrv.ilk"
	-@erase "$(OUTDIR)\ttssrv.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\ttssrv.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ttssrv.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\ttssrv.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\ttssrv.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\ttssrv.res"

"$(OUTDIR)\ttssrv.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Debug Spanish"

OUTDIR=.\alpha\sp\debug
INTDIR=.\alpha\sp\debug\link
# Begin Custom Macros
OutDir=.\alpha\sp\debug
# End Custom Macros

ALL : "$(OUTDIR)\ttssrv.exe"


CLEAN :
	-@erase "$(INTDIR)\ttssrv.res"
	-@erase "$(OUTDIR)\ttssrv.exe"
	-@erase "$(OUTDIR)\ttssrv.ilk"
	-@erase "$(OUTDIR)\ttssrv.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\ttssrv.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ttssrv.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\sp\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\ttssrv.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\ttssrv.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\ttssrv.res"

"$(OUTDIR)\ttssrv.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Debug German"

OUTDIR=.\alpha\gr\debug
INTDIR=.\alpha\gr\debug\link
# Begin Custom Macros
OutDir=.\alpha\gr\debug
# End Custom Macros

ALL : "$(OUTDIR)\ttssrv.exe"


CLEAN :
	-@erase "$(INTDIR)\ttssrv.res"
	-@erase "$(OUTDIR)\ttssrv.exe"
	-@erase "$(OUTDIR)\ttssrv.ilk"
	-@erase "$(OUTDIR)\ttssrv.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\ttssrv.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ttssrv.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\gr\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\ttssrv.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\ttssrv.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\ttssrv.res"

"$(OUTDIR)\ttssrv.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Debug Latin American"

OUTDIR=.\alpha\la\debug
INTDIR=.\alpha\la\debug\link
# Begin Custom Macros
OutDir=.\alpha\la\debug
# End Custom Macros

ALL : "$(OUTDIR)\ttssrv.exe"


CLEAN :
	-@erase "$(INTDIR)\ttssrv.res"
	-@erase "$(OUTDIR)\ttssrv.exe"
	-@erase "$(OUTDIR)\ttssrv.ilk"
	-@erase "$(OUTDIR)\ttssrv.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\ttssrv.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ttssrv.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\la\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\ttssrv.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\ttssrv.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\ttssrv.res"

"$(OUTDIR)\ttssrv.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Release United Kingdom"

OUTDIR=.\alpha\uk\release
INTDIR=.\alpha\uk\release\link
# Begin Custom Macros
OutDir=.\alpha\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\ttssrv.exe"


CLEAN :
	-@erase "$(INTDIR)\ttssrv.res"
	-@erase "$(OUTDIR)\ttssrv.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\ttssrv.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ttssrv.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\uk\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\ttssrv.pdb" /machine:ALPHA /out:"$(OUTDIR)\ttssrv.exe" 
LINK32_OBJS= \
	"$(INTDIR)\ttssrv.res"

"$(OUTDIR)\ttssrv.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Debug United Kingdom"

OUTDIR=.\alpha\uk\debug
INTDIR=.\alpha\uk\debug\link
# Begin Custom Macros
OutDir=.\alpha\uk\debug
# End Custom Macros

ALL : "$(OUTDIR)\ttssrv.exe"


CLEAN :
	-@erase "$(INTDIR)\ttssrv.res"
	-@erase "$(OUTDIR)\ttssrv.exe"
	-@erase "$(OUTDIR)\ttssrv.ilk"
	-@erase "$(OUTDIR)\ttssrv.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\ttssrv.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ttssrv.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\uk\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\ttssrv.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\ttssrv.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\ttssrv.res"

"$(OUTDIR)\ttssrv.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("ttssrv.dep")
!INCLUDE "ttssrv.dep"
!ELSE 
!MESSAGE Warning: cannot find "ttssrv.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "ttssrv - Win32 Release" || "$(CFG)" == "ttssrv - Win32 Debug" || "$(CFG)" == "ttssrv - Win32 Release Spanish" || "$(CFG)" == "ttssrv - Win32 Release German" || "$(CFG)" == "ttssrv - Win32 Release Latin American" || "$(CFG)" == "ttssrv - Win32 Debug Spanish" || "$(CFG)" == "ttssrv - Win32 Debug German" || "$(CFG)" == "ttssrv - Win32 Debug Latin American" || "$(CFG)" == "ttssrv - Win32 Release United Kingdom" || "$(CFG)" == "ttssrv - Win32 Debug United Kingdom" || "$(CFG)" == "ttssrv - Win32 ALPHA Release" || "$(CFG)" == "ttssrv - Win32 ALPHA Release Spanish" || "$(CFG)" == "ttssrv - Win32 ALPHA Release German" || "$(CFG)" == "ttssrv - Win32 ALPHA Release Latin American" || "$(CFG)" == "ttssrv - Win32 ALPHA Debug" || "$(CFG)" == "ttssrv - Win32 ALPHA Debug Spanish" || "$(CFG)" == "ttssrv - Win32 ALPHA Debug German" || "$(CFG)" == "ttssrv - Win32 ALPHA Debug Latin American" || "$(CFG)" == "ttssrv - Win32 ALPHA Release United Kingdom" || "$(CFG)" == "ttssrv - Win32 ALPHA Debug United Kingdom"
SOURCE=.\ttssrv.c

!IF  "$(CFG)" == "ttssrv - Win32 Release"

CPP_SWITCHES=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "ENGLISH" /D "ENGLISH_US" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /Fp"$(INTDIR)\ttssrv.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\ttssrv.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "ttssrv - Win32 Debug"

CPP_SWITCHES=/nologo /MT /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "ENGLISH" /D "ENGLISH_US" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /Fp"$(INTDIR)\ttssrv.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\ttssrv.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "ttssrv - Win32 Release Spanish"

CPP_SWITCHES=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SPANISH" /D "SPANISH_SP" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /Fp"$(INTDIR)\ttssrv.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\ttssrv.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "ttssrv - Win32 Release German"

CPP_SWITCHES=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GERMAN" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /Fp"$(INTDIR)\ttssrv.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\ttssrv.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "ttssrv - Win32 Release Latin American"

CPP_SWITCHES=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SPANISH" /D "SPANISH_LA" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /Fp"$(INTDIR)\ttssrv.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\ttssrv.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "ttssrv - Win32 Debug Spanish"

CPP_SWITCHES=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SPANISH" /D "SPANISH_SP" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /Fp"$(INTDIR)\ttssrv.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\ttssrv.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "ttssrv - Win32 Debug German"

CPP_SWITCHES=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "GERMAN" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /Fp"$(INTDIR)\ttssrv.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\ttssrv.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "ttssrv - Win32 Debug Latin American"

CPP_SWITCHES=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SPANISH" /D "SPANISH_LA" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /Fp"$(INTDIR)\ttssrv.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\ttssrv.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "ttssrv - Win32 Release United Kingdom"

CPP_SWITCHES=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "ENGLISH" /D "ENGLISH_US" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /Fp"$(INTDIR)\ttssrv.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\ttssrv.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "ttssrv - Win32 Debug United Kingdom"

CPP_SWITCHES=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "ENGLISH" /D "ENGLISH_US" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /Fp"$(INTDIR)\ttssrv.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\ttssrv.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "ttssrv - Win32 ALPHA Debug United Kingdom"

!ENDIF 

SOURCE=.\ttssrv.rc

"$(INTDIR)\ttssrv.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)



!ENDIF 

