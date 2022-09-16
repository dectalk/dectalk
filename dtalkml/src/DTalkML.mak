# Microsoft Developer Studio Generated NMAKE File, Based on DTalkML.dsp
!IF "$(CFG)" == ""
CFG=DTalkML - Win32 ALPHA Debug
!MESSAGE No configuration specified. Defaulting to DTalkML - Win32 ALPHA Debug.
!ENDIF 

!IF "$(CFG)" != "DTalkML - Win32 Release" && "$(CFG)" != "DTalkML - Win32 Debug" && "$(CFG)" != "DTalkML - Win32 ALPHA Release" && "$(CFG)" != "DTalkML - Win32 ALPHA Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "DTalkML.mak" CFG="DTalkML - Win32 ALPHA Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "DTalkML - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "DTalkML - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "DTalkML - Win32 ALPHA Release" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "DTalkML - Win32 ALPHA Debug" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "DTalkML - Win32 Release"

OUTDIR=.\..\Build\Release
INTDIR=.\..\Build\Release\link
# Begin Custom Macros
OutDir=.\..\Build\Release
# End Custom Macros

ALL : "$(OUTDIR)\DECTALK.dll"


CLEAN :
	-@erase "$(INTDIR)\dtalk_ml.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\DECTALK.dll"
	-@erase "$(OUTDIR)\DECTALK.exp"
	-@erase "$(OUTDIR)\DECTALK.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "\work\rnd\dapi\src\api\\" /I "..\..\dapi\src\api\\" /I "..\.." /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /Fp"$(INTDIR)\DTalkML.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\DTalkML.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\DECTALK.pdb" /machine:I386 /def:"..\..\dapi\src\dectalk.def" /out:"$(OUTDIR)\DECTALK.dll" /implib:"$(OUTDIR)\DECTALK.lib" 
DEF_FILE= \
	"..\..\dapi\src\dectalk.def"
LINK32_OBJS= \
	"$(INTDIR)\dtalk_ml.obj"

"$(OUTDIR)\DECTALK.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "DTalkML - Win32 Debug"

OUTDIR=.\..\Build\Debug
INTDIR=.\..\Build\Debug\link
# Begin Custom Macros
OutDir=.\..\Build\Debug
# End Custom Macros

ALL : "$(OUTDIR)\DECtalk.dll"


CLEAN :
	-@erase "$(INTDIR)\dtalk_ml.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\DECtalk.dll"
	-@erase "$(OUTDIR)\DECtalk.exp"
	-@erase "$(OUTDIR)\DECtalk.ilk"
	-@erase "$(OUTDIR)\DECtalk.lib"
	-@erase "$(OUTDIR)\DECtalk.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "\work\rnd\dapi\src\api\\" /I "..\..\dapi\src\api\\" /I "..\.." /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /Fp"$(INTDIR)\DTalkML.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\DTalkML.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\DECtalk.pdb" /debug /machine:I386 /def:"..\..\dapi\src\dectalk.def" /out:"$(OUTDIR)\DECtalk.dll" /implib:"$(OUTDIR)\DECtalk.lib" /pdbtype:sept 
DEF_FILE= \
	"..\..\dapi\src\dectalk.def"
LINK32_OBJS= \
	"$(INTDIR)\dtalk_ml.obj"

"$(OUTDIR)\DECtalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "DTalkML - Win32 ALPHA Release"

OUTDIR=.\..\alpha\Release
INTDIR=.\..\alpha\Release\link
# Begin Custom Macros
OutDir=.\..\alpha\Release
# End Custom Macros

ALL : "$(OUTDIR)\DECTALK.dll"


CLEAN :
	-@erase "$(OUTDIR)\DECTALK.dll"
	-@erase "$(OUTDIR)\DECTALK.exp"
	-@erase "$(OUTDIR)\DECTALK.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\DTalkML.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\DECTALK.pdb" /machine:ALPHA /def:"..\..\dapi\src\dectalk.def" /out:"$(OUTDIR)\DECTALK.dll" /implib:"$(OUTDIR)\DECTALK.lib" 
DEF_FILE= \
	"..\..\dapi\src\dectalk.def"
LINK32_OBJS= \
	

"$(OUTDIR)\DECTALK.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "DTalkML - Win32 ALPHA Debug"

OUTDIR=.\..\alpha\Debug
INTDIR=.\..\alpha\Debug\link
# Begin Custom Macros
OutDir=.\..\alpha\Debug
# End Custom Macros

ALL : "$(OUTDIR)\DECtalk.dll"


CLEAN :
	-@erase "$(OUTDIR)\DECtalk.dll"
	-@erase "$(OUTDIR)\DECtalk.exp"
	-@erase "$(OUTDIR)\DECtalk.ilk"
	-@erase "$(OUTDIR)\DECtalk.lib"
	-@erase "$(OUTDIR)\DECtalk.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\DTalkML.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\DECtalk.pdb" /debug /machine:ALPHA /def:"..\..\dapi\src\dectalk.def" /out:"$(OUTDIR)\DECtalk.dll" /implib:"$(OUTDIR)\DECtalk.lib" /pdbtype:sept 
DEF_FILE= \
	"..\..\dapi\src\dectalk.def"
LINK32_OBJS= \
	

"$(OUTDIR)\DECtalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("DTalkML.dep")
!INCLUDE "DTalkML.dep"
!ELSE 
!MESSAGE Warning: cannot find "DTalkML.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "DTalkML - Win32 Release" || "$(CFG)" == "DTalkML - Win32 Debug" || "$(CFG)" == "DTalkML - Win32 ALPHA Release" || "$(CFG)" == "DTalkML - Win32 ALPHA Debug"
SOURCE=.\dtalk_ml.c

!IF  "$(CFG)" == "DTalkML - Win32 Release"


"$(INTDIR)\dtalk_ml.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DTalkML - Win32 Debug"


"$(INTDIR)\dtalk_ml.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DTalkML - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "DTalkML - Win32 ALPHA Debug"

!ENDIF 


!ENDIF 

