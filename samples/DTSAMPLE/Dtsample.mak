# Microsoft Developer Studio Generated NMAKE File, Based on Dtsample.dsp
!IF "$(CFG)" == ""
CFG=Dtsample - Win32 ALPHA Debug Access32 Static United Kingdom
!MESSAGE No configuration specified. Defaulting to Dtsample - Win32 ALPHA Debug Access32 Static United Kingdom.
!ENDIF 

!IF "$(CFG)" != "Dtsample - Win32 Release" && "$(CFG)" != "Dtsample - Win32 Debug" && "$(CFG)" != "Dtsample - Win32 ALPHA Release" && "$(CFG)" != "Dtsample - Win32 ALPHA Debug" && "$(CFG)" != "Dtsample - Win32 Release Access32" && "$(CFG)" != "Dtsample - Win32 Debug Access32" && "$(CFG)" != "Dtsample - Win32 ALPHA Debug Access32" && "$(CFG)" != "Dtsample - Win32 ALPHA Release Access32" && "$(CFG)" != "Dtsample - Win32 Release Access32 Static" && "$(CFG)" != "Dtsample - Win32 Release Access32 Static Spanish" && "$(CFG)" != "Dtsample - Win32 Release Access32 Static German" && "$(CFG)" != "Dtsample - Win32 Release Access32 Static Latin American" && "$(CFG)" != "Dtsample - Win32 Debug Access32 Static" && "$(CFG)" != "Dtsample - Win32 Debug Access32 Static Spanish" && "$(CFG)" != "Dtsample - Win32 Debug Access32 Static German" && "$(CFG)" != "Dtsample - Win32 Debug Access32 Static Latin American" && "$(CFG)" != "Dtsample - Win32 ALPHA Release Access32 Static" && "$(CFG)" != "Dtsample - Win32 ALPHA Release Access32 Static Spanish" && "$(CFG)" != "Dtsample - Win32 ALPHA Release Access32 Static German" && "$(CFG)" != "Dtsample - Win32 ALPHA Release Access32 Static Latin American" &&\
 "$(CFG)" != "Dtsample - Win32 ALPHA Debug Access32 Static" && "$(CFG)" != "Dtsample - Win32 ALPHA Debug Access32 Static Spanish" && "$(CFG)" != "Dtsample - Win32 ALPHA Debug Access32 Static German" && "$(CFG)" != "Dtsample - Win32 ALPHA Debug Access32 Static Latin American" && "$(CFG)" != "Dtsample - Win32 Release Access32 Static United Kingdom" && "$(CFG)" != "Dtsample - Win32 Debug Access32 Static United Kingdom" && "$(CFG)" != "Dtsample - Win32 ALPHA Release Access32 Static United Kingdom" && "$(CFG)" != "Dtsample - Win32 ALPHA Debug Access32 Static United Kingdom"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "Dtsample.mak" CFG="Dtsample - Win32 ALPHA Debug Access32 Static United Kingdom"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Dtsample - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 ALPHA Release" (based on "Win32 (ALPHA) Application")
!MESSAGE "Dtsample - Win32 ALPHA Debug" (based on "Win32 (ALPHA) Application")
!MESSAGE "Dtsample - Win32 Release Access32" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 Debug Access32" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 ALPHA Debug Access32" (based on "Win32 (ALPHA) Application")
!MESSAGE "Dtsample - Win32 ALPHA Release Access32" (based on "Win32 (ALPHA) Application")
!MESSAGE "Dtsample - Win32 Release Access32 Static" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 Release Access32 Static Spanish" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 Release Access32 Static German" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 Release Access32 Static Latin American" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 Debug Access32 Static" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 Debug Access32 Static Spanish" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 Debug Access32 Static German" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 Debug Access32 Static Latin American" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 ALPHA Release Access32 Static" (based on "Win32 (ALPHA) Application")
!MESSAGE "Dtsample - Win32 ALPHA Release Access32 Static Spanish" (based on "Win32 (ALPHA) Application")
!MESSAGE "Dtsample - Win32 ALPHA Release Access32 Static German" (based on "Win32 (ALPHA) Application")
!MESSAGE "Dtsample - Win32 ALPHA Release Access32 Static Latin American" (based on "Win32 (ALPHA) Application")
!MESSAGE "Dtsample - Win32 ALPHA Debug Access32 Static" (based on "Win32 (ALPHA) Application")
!MESSAGE "Dtsample - Win32 ALPHA Debug Access32 Static Spanish" (based on "Win32 (ALPHA) Application")
!MESSAGE "Dtsample - Win32 ALPHA Debug Access32 Static German" (based on "Win32 (ALPHA) Application")
!MESSAGE "Dtsample - Win32 ALPHA Debug Access32 Static Latin American" (based on "Win32 (ALPHA) Application")
!MESSAGE "Dtsample - Win32 Release Access32 Static United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 Debug Access32 Static United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 ALPHA Release Access32 Static United Kingdom" (based on "Win32 (ALPHA) Application")
!MESSAGE "Dtsample - Win32 ALPHA Debug Access32 Static United Kingdom" (based on "Win32 (ALPHA) Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "Dtsample - Win32 Release"

OUTDIR=.\build\ml\release
INTDIR=.\build\ml\release\link
# Begin Custom Macros
OutDir=.\build\ml\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe" "$(OUTDIR)\Dtsample.bsc"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(INTDIR)\dtsample.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtsample.bsc"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtsample.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\dtsample.sbr"

"$(OUTDIR)\Dtsample.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=..\..\dtalkml\build\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:I386 /out:"$(OUTDIR)\Dtsample.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug"

OUTDIR=.\build\ml\debug
INTDIR=.\build\ml\debug\link
# Begin Custom Macros
OutDir=.\build\ml\debug
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe" "$(OUTDIR)\Dtsample.bsc"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(INTDIR)\dtsample.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Dtsample.bsc"
	-@erase "$(OUTDIR)\Dtsample.exe"
	-@erase "$(OUTDIR)\Dtsample.ilk"
	-@erase "$(OUTDIR)\Dtsample.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtsample.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\dtsample.sbr"

"$(OUTDIR)\Dtsample.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=..\..\dtalkml\build\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtsample.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Dtsample.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Release"

OUTDIR=.\alpha\ml\release
INTDIR=.\alpha\ml\release\link
# Begin Custom Macros
OutDir=.\alpha\ml\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtsample.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dtalkml\alpha\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:ALPHA /out:"$(OUTDIR)\Dtsample.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Debug"

OUTDIR=.\alpha\ml\debug
INTDIR=.\alpha\ml\debug\link
# Begin Custom Macros
OutDir=.\alpha\ml\debug
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(OUTDIR)\Dtsample.exe"
	-@erase "$(OUTDIR)\Dtsample.ilk"
	-@erase "$(OUTDIR)\Dtsample.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtsample.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dtalkml\alpha\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtsample.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\Dtsample.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32"

OUTDIR=.\build\ml\access32
INTDIR=.\build\ml\access32\link
# Begin Custom Macros
OutDir=.\build\ml\access32
# End Custom Macros

ALL : "$(OUTDIR)\Dtaccess.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtaccess.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "ACCESS32" /D "TYPING_MODE" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtsample.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dtalkml\build\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtaccess.pdb" /machine:I386 /out:"$(OUTDIR)\Dtaccess.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtaccess.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32"

OUTDIR=.\build\ml\a32debug
INTDIR=.\build\ml\a32debug\link
# Begin Custom Macros
OutDir=.\build\ml\a32debug
# End Custom Macros

ALL : "$(OUTDIR)\Dtaccess.exe" "$(OUTDIR)\Dtaccess.bsc"


CLEAN :
	-@erase "$(INTDIR)\dtaccess.res"
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Dtaccess.bsc"
	-@erase "$(OUTDIR)\Dtaccess.exe"
	-@erase "$(OUTDIR)\Dtaccess.ilk"
	-@erase "$(OUTDIR)\Dtaccess.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "ACCESS32" /D "TYPING_MODE" /D "WIN32" /D "_WINDOWS" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtaccess.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtaccess.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\dtsample.sbr"

"$(OUTDIR)\Dtaccess.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=..\..\dtalkml\build\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtaccess.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Dtaccess.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtaccess.res"

"$(OUTDIR)\Dtaccess.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Debug Access32"

OUTDIR=.\alpha\ml\access32
INTDIR=.\alpha\ml\access32\link

ALL : ".\alpha\ml\a32debug\Dtaccess.exe"


CLEAN :
	-@erase "$(OUTDIR)\Dtaccess.pdb"
	-@erase ".\alpha\ml\a32debug\Dtaccess.exe"
	-@erase ".\alpha\ml\a32debug\Dtaccess.ilk"
	-@erase ".\alpha\ml\a32debug\link\dtaccess.res"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"alpha\ml\a32debug\link/dtaccess.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"alpha\ml\a32debug/Dtaccess.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dtalkml\alpha\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtaccess.pdb" /debug /machine:ALPHA /out:"alpha\ml\a32debug/Dtaccess.exe" 
LINK32_OBJS= \
	".\alpha\ml\a32debug\link\dtaccess.res"

".\alpha\ml\a32debug\Dtaccess.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Release Access32"

OUTDIR=.\alpha\ml\access32
INTDIR=.\alpha\ml\access32\link
# Begin Custom Macros
OutDir=.\alpha\ml\access32
# End Custom Macros

ALL : "$(OUTDIR)\Dtaccess.exe"


CLEAN :
	-@erase "$(INTDIR)\dtaccess.res"
	-@erase "$(OUTDIR)\Dtaccess.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtaccess.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtaccess.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dtalkml\alpha\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtaccess.pdb" /machine:ALPHA /out:"$(OUTDIR)\Dtaccess.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtaccess.res"

"$(OUTDIR)\Dtaccess.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static"

OUTDIR=.\build\us\a32stat
INTDIR=.\build\us\a32stat\link
# Begin Custom Macros
OutDir=.\build\us\a32stat
# End Custom Macros

ALL : "$(OUTDIR)\Dtaccess.exe"


CLEAN :
	-@erase "$(INTDIR)\dtaccess.res"
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtaccess.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "ACCESS32" /D "TYPING_MODE" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "ENGLISH" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtaccess.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o".\build\us\access32/Dtaccess.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\us\release\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtaccess.pdb" /machine:I386 /out:"$(OUTDIR)\Dtaccess.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtaccess.res"

"$(OUTDIR)\Dtaccess.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static Spanish"

OUTDIR=.\build\sp\a32stat
INTDIR=.\build\sp\a32stat\link
# Begin Custom Macros
OutDir=.\build\sp\a32stat
# End Custom Macros

ALL : "$(OUTDIR)\Dtaccess.exe" "$(OUTDIR)\link\dtaccess.res\dtaccess.res"


CLEAN :
	-@erase "$(INTDIR)\dtaccess.res\dtaccess.res"
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtaccess.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "SPANISH" /D "WIN32" /D "_WINDOWS" /D "ACCESS32" /D "TYPING_MODE" /D "SPANISH_SP" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\dtaccess.res\dtaccess.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o".\build\sp\access32/Dtaccess.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\sp\release\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtaccess.pdb" /machine:I386 /out:"$(OUTDIR)\Dtaccess.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj"

"$(OUTDIR)\Dtaccess.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static German"

OUTDIR=.\build\gr\a32stat
INTDIR=.\build\gr\a32stat\link
# Begin Custom Macros
OutDir=.\build\gr\a32stat
# End Custom Macros

ALL : "$(OUTDIR)\Dtaccess.exe"


CLEAN :
	-@erase "$(INTDIR)\dtaccess.res"
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtaccess.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "ACCESS32" /D "TYPING_MODE" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\dtaccess.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o".\build\gr\access32/Dtaccess.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\gr\release\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtaccess.pdb" /machine:I386 /out:"$(OUTDIR)\Dtaccess.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtaccess.res"

"$(OUTDIR)\Dtaccess.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static Latin American"

OUTDIR=.\build\la\a32stat
INTDIR=.\build\la\a32stat\link
# Begin Custom Macros
OutDir=.\build\la\a32stat
# End Custom Macros

ALL : "$(OUTDIR)\Dtaccess.exe"


CLEAN :
	-@erase "$(INTDIR)\dtaccess.res"
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtaccess.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "ACCESS32" /D "TYPING_MODE" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\dtaccess.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o".\build\la\access32/Dtaccess.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\la\release\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtaccess.pdb" /machine:I386 /out:"$(OUTDIR)\Dtaccess.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtaccess.res"

"$(OUTDIR)\Dtaccess.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static"

OUTDIR=.\build\us\da32stat
INTDIR=.\build\us\da32stat\link
# Begin Custom Macros
OutDir=.\build\us\da32stat
# End Custom Macros

ALL : "$(OUTDIR)\Dtaccess.exe"


CLEAN :
	-@erase "$(INTDIR)\dtaccess.res"
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Dtaccess.exe"
	-@erase "$(OUTDIR)\Dtaccess.ilk"
	-@erase "$(OUTDIR)\Dtaccess.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "ACCESS32" /D "TYPING_MODE" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "ENGLISH" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtaccess.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o".\build\us\a32debug/Dtaccess.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\us\debug\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtaccess.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Dtaccess.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtaccess.res"

"$(OUTDIR)\Dtaccess.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static Spanish"

OUTDIR=.\build\sp\da32stat
INTDIR=.\build\sp\da32stat\link
# Begin Custom Macros
OutDir=.\build\sp\da32stat
# End Custom Macros

ALL : "$(OUTDIR)\Dtaccess.exe"


CLEAN :
	-@erase "$(INTDIR)\dtaccess.res"
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Dtaccess.exe"
	-@erase "$(OUTDIR)\Dtaccess.ilk"
	-@erase "$(OUTDIR)\Dtaccess.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "SPANISH" /D "WIN32" /D "_WINDOWS" /D "ACCESS32" /D "TYPING_MODE" /D "SPANISH_SP" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\dtaccess.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o".\build\sp\a32debug/Dtaccess.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\sp\debug\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtaccess.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Dtaccess.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtaccess.res"

"$(OUTDIR)\Dtaccess.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static German"

OUTDIR=.\build\gr\da32stat
INTDIR=.\build\gr\da32stat\link
# Begin Custom Macros
OutDir=.\build\gr\da32stat
# End Custom Macros

ALL : "$(OUTDIR)\Dtaccess.exe"


CLEAN :
	-@erase "$(INTDIR)\dtaccess.res"
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Dtaccess.exe"
	-@erase "$(OUTDIR)\Dtaccess.ilk"
	-@erase "$(OUTDIR)\Dtaccess.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "ACCESS32" /D "TYPING_MODE" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\dtaccess.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o".\build\gr\a32debug/Dtaccess.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\gr\debug\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtaccess.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Dtaccess.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtaccess.res"

"$(OUTDIR)\Dtaccess.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static Latin American"

OUTDIR=.\build\la\da32stat
INTDIR=.\build\la\da32stat\link
# Begin Custom Macros
OutDir=.\build\la\da32stat
# End Custom Macros

ALL : "$(OUTDIR)\Dtaccess.exe"


CLEAN :
	-@erase "$(INTDIR)\dtaccess.res"
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Dtaccess.exe"
	-@erase "$(OUTDIR)\Dtaccess.ilk"
	-@erase "$(OUTDIR)\Dtaccess.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "ACCESS32" /D "TYPING_MODE" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\dtaccess.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o".\build\la\a32debug/Dtaccess.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\la\debug\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtaccess.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Dtaccess.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtaccess.res"

"$(OUTDIR)\Dtaccess.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Release Access32 Static"

OUTDIR=.\alpha\us\a32stat
INTDIR=.\alpha\us\a32stat\link
# Begin Custom Macros
OutDir=.\alpha\us\a32stat
# End Custom Macros

ALL : "$(OUTDIR)\Dtaccess.exe"


CLEAN :
	-@erase "$(INTDIR)\dtaccess.res"
	-@erase "$(OUTDIR)\Dtaccess.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtaccess.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtaccess.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dtstatic\us\release\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtaccess.pdb" /machine:ALPHA /out:"$(OUTDIR)\Dtaccess.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtaccess.res"

"$(OUTDIR)\Dtaccess.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Release Access32 Static Spanish"

OUTDIR=.\alpha\sp\a32stat
INTDIR=.\alpha\sp\a32stat\link
# Begin Custom Macros
OutDir=.\alpha\sp\a32stat
# End Custom Macros

ALL : "$(OUTDIR)\Dtaccess.exe"


CLEAN :
	-@erase "$(INTDIR)\dtaccess.res"
	-@erase "$(OUTDIR)\Dtaccess.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\dtaccess.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtaccess.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dtstatic\sp\release\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtaccess.pdb" /machine:ALPHA /out:"$(OUTDIR)\Dtaccess.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtaccess.res"

"$(OUTDIR)\Dtaccess.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Release Access32 Static German"

OUTDIR=.\alpha\gr\a32stat
INTDIR=.\alpha\gr\a32stat\link
# Begin Custom Macros
OutDir=.\alpha\gr\a32stat
# End Custom Macros

ALL : "$(OUTDIR)\Dtaccess.exe"


CLEAN :
	-@erase "$(INTDIR)\dtaccess.res"
	-@erase "$(OUTDIR)\Dtaccess.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\dtaccess.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtaccess.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dtstatic\gr\release\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtaccess.pdb" /machine:ALPHA /out:"$(OUTDIR)\Dtaccess.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtaccess.res"

"$(OUTDIR)\Dtaccess.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Release Access32 Static Latin American"

OUTDIR=.\alpha\la\a32stat
INTDIR=.\alpha\la\a32stat\link
# Begin Custom Macros
OutDir=.\alpha\la\a32stat
# End Custom Macros

ALL : "$(OUTDIR)\Dtaccess.exe"


CLEAN :
	-@erase "$(INTDIR)\dtaccess.res"
	-@erase "$(OUTDIR)\Dtaccess.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\dtaccess.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtaccess.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dtstatic\la\release\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtaccess.pdb" /machine:ALPHA /out:"$(OUTDIR)\Dtaccess.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtaccess.res"

"$(OUTDIR)\Dtaccess.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Debug Access32 Static"

OUTDIR=.\alpha\us\da32stat
INTDIR=.\alpha\us\da32stat\link
# Begin Custom Macros
OutDir=.\alpha\us\da32stat
# End Custom Macros

ALL : "$(OUTDIR)\Dtaccess.exe"


CLEAN :
	-@erase "$(INTDIR)\dtaccess.res"
	-@erase "$(OUTDIR)\Dtaccess.exe"
	-@erase "$(OUTDIR)\Dtaccess.ilk"
	-@erase "$(OUTDIR)\Dtaccess.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtaccess.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtaccess.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dtstatic\us\debug\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtaccess.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\Dtaccess.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtaccess.res"

"$(OUTDIR)\Dtaccess.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Debug Access32 Static Spanish"

OUTDIR=.\alpha\sp\da32stat
INTDIR=.\alpha\sp\da32stat\link
# Begin Custom Macros
OutDir=.\alpha\sp\da32stat
# End Custom Macros

ALL : "$(OUTDIR)\Dtaccess.exe"


CLEAN :
	-@erase "$(INTDIR)\dtaccess.res"
	-@erase "$(OUTDIR)\Dtaccess.exe"
	-@erase "$(OUTDIR)\Dtaccess.ilk"
	-@erase "$(OUTDIR)\Dtaccess.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\dtaccess.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtaccess.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dtstatic\sp\debug\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtaccess.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\Dtaccess.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtaccess.res"

"$(OUTDIR)\Dtaccess.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Debug Access32 Static German"

OUTDIR=.\alpha\gr\da32stat
INTDIR=.\alpha\gr\da32stat\link
# Begin Custom Macros
OutDir=.\alpha\gr\da32stat
# End Custom Macros

ALL : "$(OUTDIR)\Dtaccess.exe"


CLEAN :
	-@erase "$(INTDIR)\dtaccess.res"
	-@erase "$(OUTDIR)\Dtaccess.exe"
	-@erase "$(OUTDIR)\Dtaccess.ilk"
	-@erase "$(OUTDIR)\Dtaccess.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\dtaccess.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtaccess.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dtstatic\gr\debug\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtaccess.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\Dtaccess.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtaccess.res"

"$(OUTDIR)\Dtaccess.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Debug Access32 Static Latin American"

OUTDIR=.\alpha\la\da32stat
INTDIR=.\alpha\la\da32stat\link
# Begin Custom Macros
OutDir=.\alpha\la\da32stat
# End Custom Macros

ALL : "$(OUTDIR)\Dtaccess.exe"


CLEAN :
	-@erase "$(INTDIR)\dtaccess.res"
	-@erase "$(OUTDIR)\Dtaccess.exe"
	-@erase "$(OUTDIR)\Dtaccess.ilk"
	-@erase "$(OUTDIR)\Dtaccess.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\dtaccess.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtaccess.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dtstatic\la\debug\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtaccess.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\Dtaccess.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtaccess.res"

"$(OUTDIR)\Dtaccess.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static United Kingdom"

OUTDIR=.\build\uk\a32stat
INTDIR=.\build\uk\a32stat\link
# Begin Custom Macros
OutDir=.\build\uk\a32stat
# End Custom Macros

ALL : "$(OUTDIR)\Dtaccess.exe"


CLEAN :
	-@erase "$(INTDIR)\dtaccess.res"
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtaccess.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "ACCESS32" /D "TYPING_MODE" /D "ENGLISH_UK" /D "WIN32" /D "_WINDOWS" /D "ENGLISH" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\dtaccess.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o".\build\uk\access32/Dtaccess.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\uk\release\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtaccess.pdb" /machine:I386 /out:"$(OUTDIR)\Dtaccess.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtaccess.res"

"$(OUTDIR)\Dtaccess.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static United Kingdom"

OUTDIR=.\build\us\da32stat
INTDIR=.\build\uk\da32stat\link

ALL : ".\build\uk\da32stat\Dtaccess.exe"


CLEAN :
	-@erase "$(INTDIR)\dtaccess.res"
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Dtaccess.pdb"
	-@erase ".\build\uk\da32stat\Dtaccess.exe"
	-@erase ".\build\uk\da32stat\Dtaccess.ilk"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "ACCESS32" /D "TYPING_MODE" /D "ENGLISH_UK" /D "WIN32" /D "_WINDOWS" /D "ENGLISH" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\dtaccess.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o".\build\uk\a32debug/Dtaccess.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\uk\debug\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtaccess.pdb" /debug /machine:I386 /out:".\build\uk\da32stat/Dtaccess.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtaccess.res"

".\build\uk\da32stat\Dtaccess.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Release Access32 Static United Kingdom"

OUTDIR=.\alpha\uk\a32stat
INTDIR=.\alpha\uk\a32stat\link
# Begin Custom Macros
OutDir=.\alpha\uk\a32stat
# End Custom Macros

ALL : "$(OUTDIR)\Dtaccess.exe"


CLEAN :
	-@erase "$(INTDIR)\dtaccess.res"
	-@erase "$(OUTDIR)\Dtaccess.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\dtaccess.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o".\alpha\uk\access32/Dtaccess.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dtstatic\uk\release\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtaccess.pdb" /machine:ALPHA /out:"$(OUTDIR)\Dtaccess.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtaccess.res"

"$(OUTDIR)\Dtaccess.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Debug Access32 Static United Kingdom"

OUTDIR=.\alpha\uk\da32stat
INTDIR=.\alpha\uk\da32stat\link
# Begin Custom Macros
OutDir=.\alpha\uk\da32stat
# End Custom Macros

ALL : "$(OUTDIR)\Dtaccess.exe"


CLEAN :
	-@erase "$(INTDIR)\dtaccess.res"
	-@erase "$(OUTDIR)\Dtaccess.exe"
	-@erase "$(OUTDIR)\Dtaccess.ilk"
	-@erase "$(OUTDIR)\Dtaccess.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\dtaccess.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o".\alpha\uk\a32debug/Dtaccess.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dtstatic\uk\debug\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtaccess.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\Dtaccess.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtaccess.res"

"$(OUTDIR)\Dtaccess.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Dtsample.dep")
!INCLUDE "Dtsample.dep"
!ELSE 
!MESSAGE Warning: cannot find "Dtsample.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "Dtsample - Win32 Release" || "$(CFG)" == "Dtsample - Win32 Debug" || "$(CFG)" == "Dtsample - Win32 ALPHA Release" || "$(CFG)" == "Dtsample - Win32 ALPHA Debug" || "$(CFG)" == "Dtsample - Win32 Release Access32" || "$(CFG)" == "Dtsample - Win32 Debug Access32" || "$(CFG)" == "Dtsample - Win32 ALPHA Debug Access32" || "$(CFG)" == "Dtsample - Win32 ALPHA Release Access32" || "$(CFG)" == "Dtsample - Win32 Release Access32 Static" || "$(CFG)" == "Dtsample - Win32 Release Access32 Static Spanish" || "$(CFG)" == "Dtsample - Win32 Release Access32 Static German" || "$(CFG)" == "Dtsample - Win32 Release Access32 Static Latin American" || "$(CFG)" == "Dtsample - Win32 Debug Access32 Static" || "$(CFG)" == "Dtsample - Win32 Debug Access32 Static Spanish" || "$(CFG)" == "Dtsample - Win32 Debug Access32 Static German" || "$(CFG)" == "Dtsample - Win32 Debug Access32 Static Latin American" || "$(CFG)" == "Dtsample - Win32 ALPHA Release Access32 Static" || "$(CFG)" == "Dtsample - Win32 ALPHA Release Access32 Static Spanish" || "$(CFG)" == "Dtsample - Win32 ALPHA Release Access32 Static German" || "$(CFG)" == "Dtsample - Win32 ALPHA Release Access32 Static Latin American" ||\
 "$(CFG)" == "Dtsample - Win32 ALPHA Debug Access32 Static" || "$(CFG)" == "Dtsample - Win32 ALPHA Debug Access32 Static Spanish" || "$(CFG)" == "Dtsample - Win32 ALPHA Debug Access32 Static German" || "$(CFG)" == "Dtsample - Win32 ALPHA Debug Access32 Static Latin American" || "$(CFG)" == "Dtsample - Win32 Release Access32 Static United Kingdom" || "$(CFG)" == "Dtsample - Win32 Debug Access32 Static United Kingdom" || "$(CFG)" == "Dtsample - Win32 ALPHA Release Access32 Static United Kingdom" || "$(CFG)" == "Dtsample - Win32 ALPHA Debug Access32 Static United Kingdom"
SOURCE=.\dtsample.c

!IF  "$(CFG)" == "Dtsample - Win32 Release"


"$(INTDIR)\dtsample.obj"	"$(INTDIR)\dtsample.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug"


"$(INTDIR)\dtsample.obj"	"$(INTDIR)\dtsample.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32"


"$(INTDIR)\dtsample.obj"	"$(INTDIR)\dtsample.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static Spanish"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static German"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static Latin American"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static Spanish"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static German"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static Latin American"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Release Access32 Static"

!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Release Access32 Static Spanish"

!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Release Access32 Static German"

!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Release Access32 Static Latin American"

!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Debug Access32 Static"

!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Debug Access32 Static Spanish"

!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Debug Access32 Static German"

!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Debug Access32 Static Latin American"

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static United Kingdom"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static United Kingdom"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Release Access32 Static United Kingdom"

!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Debug Access32 Static United Kingdom"

!ENDIF 

SOURCE=.\dtsample.rc

!IF  "$(CFG)" == "Dtsample - Win32 Release"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Release"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Debug"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32"


"$(INTDIR)\dtaccess.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Debug Access32"


".\alpha\ml\a32debug\link\dtaccess.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Release Access32"


"$(INTDIR)\dtaccess.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static"


"$(INTDIR)\dtaccess.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static Spanish"


"$(INTDIR)\dtaccess.res\dtaccess.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static German"


"$(INTDIR)\dtaccess.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static Latin American"


"$(INTDIR)\dtaccess.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static"


"$(INTDIR)\dtaccess.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static Spanish"


"$(INTDIR)\dtaccess.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static German"


"$(INTDIR)\dtaccess.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static Latin American"


"$(INTDIR)\dtaccess.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Release Access32 Static"


"$(INTDIR)\dtaccess.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Release Access32 Static Spanish"


"$(INTDIR)\dtaccess.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Release Access32 Static German"


"$(INTDIR)\dtaccess.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Release Access32 Static Latin American"


"$(INTDIR)\dtaccess.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Debug Access32 Static"


"$(INTDIR)\dtaccess.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Debug Access32 Static Spanish"


"$(INTDIR)\dtaccess.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Debug Access32 Static German"


"$(INTDIR)\dtaccess.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Debug Access32 Static Latin American"


"$(INTDIR)\dtaccess.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static United Kingdom"


"$(INTDIR)\dtaccess.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static United Kingdom"


"$(INTDIR)\dtaccess.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Release Access32 Static United Kingdom"


"$(INTDIR)\dtaccess.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 ALPHA Debug Access32 Static United Kingdom"


"$(INTDIR)\dtaccess.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ENDIF 


!ENDIF 

