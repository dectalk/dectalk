# Microsoft Developer Studio Generated NMAKE File, Based on windic.dsp
!IF "$(CFG)" == ""
CFG=windic - Win32 ALPHA Debug Static United Kingdom
!MESSAGE No configuration specified. Defaulting to windic - Win32 ALPHA Debug Static United Kingdom.
!ENDIF 

!IF "$(CFG)" != "windic - Win32 Release" && "$(CFG)" != "windic - Win32 Debug" && "$(CFG)" != "windic - Win32 ALPHA Release" && "$(CFG)" != "windic - Win32 ALPHA Debug" && "$(CFG)" != "windic - Win32 Release Static" && "$(CFG)" != "windic - Win32 Debug Static" && "$(CFG)" != "windic - Win32 Release Static Spanish" && "$(CFG)" != "windic - Win32 Release Static German" && "$(CFG)" != "windic - Win32 Release Static Latin American" && "$(CFG)" != "windic - Win32 Debug Static Spanish" && "$(CFG)" != "windic - Win32 Debug Static German" && "$(CFG)" != "windic - Win32 Debug Static Latin American" && "$(CFG)" != "windic - Win32 ALPHA Release Static" && "$(CFG)" != "windic - Win32 ALPHA Release Static Spanish" && "$(CFG)" != "windic - Win32 ALPHA Release Static German" && "$(CFG)" != "windic - Win32 ALPHA Release Static Latin American" && "$(CFG)" != "windic - Win32 ALPHA Debug Static" && "$(CFG)" != "windic - Win32 ALPHA Debug Static Spanish" && "$(CFG)" != "windic - Win32 ALPHA Debug Static German" && "$(CFG)" != "windic - Win32 ALPHA Debug Static Latin American" && "$(CFG)" != "windic - Win32 Release Static United Kingdom" && "$(CFG)" != "windic - Win32 Debug Static United Kingdom" &&\
 "$(CFG)" != "windic - Win32 ALPHA Release Static United Kingdom" && "$(CFG)" != "windic - Win32 ALPHA Debug Static United Kingdom"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "windic.mak" CFG="windic - Win32 ALPHA Debug Static United Kingdom"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "windic - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 ALPHA Release" (based on "Win32 (ALPHA) Application")
!MESSAGE "windic - Win32 ALPHA Debug" (based on "Win32 (ALPHA) Application")
!MESSAGE "windic - Win32 Release Static" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Debug Static" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Release Static Spanish" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Release Static German" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Release Static Latin American" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Debug Static Spanish" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Debug Static German" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Debug Static Latin American" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 ALPHA Release Static" (based on "Win32 (ALPHA) Application")
!MESSAGE "windic - Win32 ALPHA Release Static Spanish" (based on "Win32 (ALPHA) Application")
!MESSAGE "windic - Win32 ALPHA Release Static German" (based on "Win32 (ALPHA) Application")
!MESSAGE "windic - Win32 ALPHA Release Static Latin American" (based on "Win32 (ALPHA) Application")
!MESSAGE "windic - Win32 ALPHA Debug Static" (based on "Win32 (ALPHA) Application")
!MESSAGE "windic - Win32 ALPHA Debug Static Spanish" (based on "Win32 (ALPHA) Application")
!MESSAGE "windic - Win32 ALPHA Debug Static German" (based on "Win32 (ALPHA) Application")
!MESSAGE "windic - Win32 ALPHA Debug Static Latin American" (based on "Win32 (ALPHA) Application")
!MESSAGE "windic - Win32 Release Static United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Debug Static United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 ALPHA Release Static United Kingdom" (based on "Win32 (ALPHA) Application")
!MESSAGE "windic - Win32 ALPHA Debug Static United Kingdom" (based on "Win32 (ALPHA) Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "windic - Win32 Release"

OUTDIR=.\build\ml\release
INTDIR=.\build\ml\release\link
# Begin Custom Macros
OutDir=.\build\ml\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "NDEBUG" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "ENGLISH" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\windic.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dtalkml\build\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:I386 /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 Debug"

OUTDIR=.\build\ml\debug
INTDIR=.\build\ml\debug\link
# Begin Custom Macros
OutDir=.\build\ml\debug
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"
	-@erase "$(OUTDIR)\windic.ilk"
	-@erase "$(OUTDIR)\windic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "_DEBUG" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "ENGLISH" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\windic.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dtalkml\build\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\windic.pdb" /debug /machine:I386 /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Release"

OUTDIR=.\alpha\ml\release
INTDIR=.\alpha\ml\release\link
# Begin Custom Macros
OutDir=.\alpha\ml\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\windic.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dtalkml\alpha\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:ALPHA /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Debug"

OUTDIR=.\alpha\ml\debug
INTDIR=.\alpha\ml\debug\link
# Begin Custom Macros
OutDir=.\alpha\ml\debug
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"
	-@erase "$(OUTDIR)\windic.ilk"
	-@erase "$(OUTDIR)\windic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\windic.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dtalkml\alpha\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\windic.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 Release Static"

OUTDIR=.\build\us\wdicstat
INTDIR=.\build\us\wdicstat\link
# Begin Custom Macros
OutDir=.\build\us\wdicstat
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "NDEBUG" /D "WINDIC_C_STATIC" /D "TYPING_MODE" /D "ACCESS32" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "ENGLISH" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\windic.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\us\release\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:I386 /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 Debug Static"

OUTDIR=.\build\us\dbgstat
INTDIR=.\build\us\dbgstat\link
# Begin Custom Macros
OutDir=.\build\us\dbgstat
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"
	-@erase "$(OUTDIR)\windic.ilk"
	-@erase "$(OUTDIR)\windic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "_DEBUG" /D "WINDIC_C_STATIC" /D "TYPING_MODE" /D "ACCESS32" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "ENGLISH" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\windic.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\us\debug\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\windic.pdb" /debug /machine:I386 /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 Release Static Spanish"

OUTDIR=.\build\sp\wdicstat
INTDIR=.\build\sp\wdicstat\link
# Begin Custom Macros
OutDir=.\build\sp\wdicstat
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "NDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "WIN32" /D "_WINDOWS" /D "TYPING_MODE" /D "ACCESS32" /D "WINDIC_C_STATIC" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\windic.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\sp\release\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:I386 /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 Release Static German"

OUTDIR=.\build\gr\wdicstat
INTDIR=.\build\gr\wdicstat\link
# Begin Custom Macros
OutDir=.\build\gr\wdicstat
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "NDEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "TYPING_MODE" /D "ACCESS32" /D "WINDIC_C_STATIC" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\windic.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\gr\release\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:I386 /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 Release Static Latin American"

OUTDIR=.\build\la\wdicstat
INTDIR=.\build\la\wdicstat\link
# Begin Custom Macros
OutDir=.\build\la\wdicstat
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "TYPING_MODE" /D "ACCESS32" /D "WINDIC_C_STATIC" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\windic.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\la\release\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:I386 /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 Debug Static Spanish"

OUTDIR=.\build\sp\dbgstat
INTDIR=.\build\sp\dbgstat\link
# Begin Custom Macros
OutDir=.\build\sp\dbgstat
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"
	-@erase "$(OUTDIR)\windic.ilk"
	-@erase "$(OUTDIR)\windic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "_DEBUG" /D "SPANISH" /D "SPANISH_SP" /D "WIN32" /D "_WINDOWS" /D "TYPING_MODE" /D "ACCESS32" /D "WINDIC_C_STATIC" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\windic.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\sp\debug\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\windic.pdb" /debug /machine:I386 /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 Debug Static German"

OUTDIR=.\build\gr\dbgstat
INTDIR=.\build\gr\dbgstat\link
# Begin Custom Macros
OutDir=.\build\gr\dbgstat
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"
	-@erase "$(OUTDIR)\windic.ilk"
	-@erase "$(OUTDIR)\windic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "_DEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "TYPING_MODE" /D "ACCESS32" /D "WINDIC_C_STATIC" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\windic.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\gr\debug\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\windic.pdb" /debug /machine:I386 /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 Debug Static Latin American"

OUTDIR=.\build\la\dbgstat
INTDIR=.\build\la\dbgstat\link
# Begin Custom Macros
OutDir=.\build\la\dbgstat
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"
	-@erase "$(OUTDIR)\windic.ilk"
	-@erase "$(OUTDIR)\windic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "_DEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "TYPING_MODE" /D "ACCESS32" /D "WINDIC_C_STATIC" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\windic.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\la\debug\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\windic.pdb" /debug /machine:I386 /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Release Static"

OUTDIR=.\alpha\us\wdicstat
INTDIR=.\alpha\us\wdicstat\link
# Begin Custom Macros
OutDir=.\alpha\us\wdicstat
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\windic.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dtstatic\us\release\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:ALPHA /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Release Static Spanish"

OUTDIR=.\alpha\sp\wdicstat
INTDIR=.\alpha\sp\wdicstat\link
# Begin Custom Macros
OutDir=.\alpha\sp\wdicstat
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\windic.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dtstatic\sp\release\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:ALPHA /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Release Static German"

OUTDIR=.\alpha\gr\wdicstat
INTDIR=.\alpha\gr\wdicstat\link
# Begin Custom Macros
OutDir=.\alpha\gr\wdicstat
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\windic.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dtstatic\gr\release\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:ALPHA /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Release Static Latin American"

OUTDIR=.\alpha\la\wdicstat
INTDIR=.\alpha\la\wdicstat\link
# Begin Custom Macros
OutDir=.\alpha\la\wdicstat
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\windic.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dtstatic\la\release\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:ALPHA /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Debug Static"

OUTDIR=.\alpha\us\dbgstat
INTDIR=.\alpha\us\dbgstat\link
# Begin Custom Macros
OutDir=.\alpha\us\dbgstat
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"
	-@erase "$(OUTDIR)\windic.ilk"
	-@erase "$(OUTDIR)\windic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\windic.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dtstatic\us\debug\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\windic.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Debug Static Spanish"

OUTDIR=.\alpha\sp\dbgstat
INTDIR=.\alpha\sp\dbgstat\link
# Begin Custom Macros
OutDir=.\alpha\sp\dbgstat
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"
	-@erase "$(OUTDIR)\windic.ilk"
	-@erase "$(OUTDIR)\windic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\windic.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dtstatic\sp\debug\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\windic.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Debug Static German"

OUTDIR=.\alpha\gr\dbgstat
INTDIR=.\alpha\gr\dbgstat\link
# Begin Custom Macros
OutDir=.\alpha\gr\dbgstat
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"
	-@erase "$(OUTDIR)\windic.ilk"
	-@erase "$(OUTDIR)\windic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\windic.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dtstatic\gr\debug\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\windic.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Debug Static Latin American"

OUTDIR=.\alpha\la\dbgstat
INTDIR=.\alpha\la\dbgstat\link
# Begin Custom Macros
OutDir=.\alpha\la\dbgstat
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"
	-@erase "$(OUTDIR)\windic.ilk"
	-@erase "$(OUTDIR)\windic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\windic.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dtstatic\la\debug\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\windic.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 Release Static United Kingdom"

OUTDIR=.\build\uk\wdicstat
INTDIR=.\build\uk\wdicstat\link
# Begin Custom Macros
OutDir=.\build\uk\wdicstat
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "NDEBUG" /D "WINDIC_C_STATIC" /D "TYPING_MODE" /D "ACCESS32" /D "ENGLISH_UK" /D "WIN32" /D "_WINDOWS" /D "ENGLISH" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\windic.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\uk\release\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:I386 /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 Debug Static United Kingdom"

OUTDIR=.\build\uk\dbgstat
INTDIR=.\build\uk\dbgstat\link
# Begin Custom Macros
OutDir=.\build\uk\dbgstat
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"
	-@erase "$(OUTDIR)\windic.ilk"
	-@erase "$(OUTDIR)\windic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "_DEBUG" /D "WINDIC_C_STATIC" /D "TYPING_MODE" /D "ACCESS32" /D "ENGLISH_UK" /D "WIN32" /D "_WINDOWS" /D "ENGLISH" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\windic.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\uk\debug\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\windic.pdb" /debug /machine:I386 /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Release Static United Kingdom"

OUTDIR=.\alpha\uk\wdicstat
INTDIR=.\alpha\uk\wdicstat\link
# Begin Custom Macros
OutDir=.\alpha\uk\wdicstat
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\windic.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dtstatic\uk\release\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:ALPHA /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Debug Static United Kingdom"

OUTDIR=.\alpha\uk\dbgstat
INTDIR=.\alpha\uk\dbgstat\link
# Begin Custom Macros
OutDir=.\alpha\uk\dbgstat
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"
	-@erase "$(OUTDIR)\windic.ilk"
	-@erase "$(OUTDIR)\windic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\windic.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dtstatic\uk\debug\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\windic.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("windic.dep")
!INCLUDE "windic.dep"
!ELSE 
!MESSAGE Warning: cannot find "windic.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "windic - Win32 Release" || "$(CFG)" == "windic - Win32 Debug" || "$(CFG)" == "windic - Win32 ALPHA Release" || "$(CFG)" == "windic - Win32 ALPHA Debug" || "$(CFG)" == "windic - Win32 Release Static" || "$(CFG)" == "windic - Win32 Debug Static" || "$(CFG)" == "windic - Win32 Release Static Spanish" || "$(CFG)" == "windic - Win32 Release Static German" || "$(CFG)" == "windic - Win32 Release Static Latin American" || "$(CFG)" == "windic - Win32 Debug Static Spanish" || "$(CFG)" == "windic - Win32 Debug Static German" || "$(CFG)" == "windic - Win32 Debug Static Latin American" || "$(CFG)" == "windic - Win32 ALPHA Release Static" || "$(CFG)" == "windic - Win32 ALPHA Release Static Spanish" || "$(CFG)" == "windic - Win32 ALPHA Release Static German" || "$(CFG)" == "windic - Win32 ALPHA Release Static Latin American" || "$(CFG)" == "windic - Win32 ALPHA Debug Static" || "$(CFG)" == "windic - Win32 ALPHA Debug Static Spanish" || "$(CFG)" == "windic - Win32 ALPHA Debug Static German" || "$(CFG)" == "windic - Win32 ALPHA Debug Static Latin American" || "$(CFG)" == "windic - Win32 Release Static United Kingdom" || "$(CFG)" == "windic - Win32 Debug Static United Kingdom" ||\
 "$(CFG)" == "windic - Win32 ALPHA Release Static United Kingdom" || "$(CFG)" == "windic - Win32 ALPHA Debug Static United Kingdom"
SOURCE=.\usedic.c

!IF  "$(CFG)" == "windic - Win32 Release"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 Debug"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "windic - Win32 Release Static"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 Debug Static"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 Release Static Spanish"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 Release Static German"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 Release Static Latin American"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 Debug Static Spanish"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 Debug Static German"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 Debug Static Latin American"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Release Static"

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Release Static Spanish"

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Release Static German"

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Release Static Latin American"

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Debug Static"

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Debug Static Spanish"

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Debug Static German"

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Debug Static Latin American"

!ELSEIF  "$(CFG)" == "windic - Win32 Release Static United Kingdom"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 Debug Static United Kingdom"


"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Release Static United Kingdom"

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Debug Static United Kingdom"

!ENDIF 

SOURCE=.\windic.c

!IF  "$(CFG)" == "windic - Win32 Release"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 Debug"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "windic - Win32 Release Static"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 Debug Static"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 Release Static Spanish"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 Release Static German"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 Release Static Latin American"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 Debug Static Spanish"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 Debug Static German"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 Debug Static Latin American"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Release Static"

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Release Static Spanish"

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Release Static German"

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Release Static Latin American"

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Debug Static"

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Debug Static Spanish"

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Debug Static German"

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Debug Static Latin American"

!ELSEIF  "$(CFG)" == "windic - Win32 Release Static United Kingdom"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 Debug Static United Kingdom"


"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Release Static United Kingdom"

!ELSEIF  "$(CFG)" == "windic - Win32 ALPHA Debug Static United Kingdom"

!ENDIF 

SOURCE=.\windic.rc

"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)



!ENDIF 

