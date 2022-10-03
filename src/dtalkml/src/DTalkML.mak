# Microsoft Developer Studio Generated NMAKE File, Based on DTalkML.dsp
!IF "$(CFG)" == ""
CFG=DTalkML - Win32 Release
!MESSAGE No configuration specified. Defaulting to DTalkML - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "DTalkML - Win32 Release" && "$(CFG)" != "DTalkML - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "DTalkML.mak" CFG="DTalkML - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "DTalkML - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "DTalkML - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
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
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api\\" /I "..\.." /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\DTalkML.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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

ALL : "$(OUTDIR)\DECTALK.dll"


CLEAN :
	-@erase "$(INTDIR)\dtalk_ml.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\DECTALK.dll"
	-@erase "$(OUTDIR)\DECTALK.exp"
	-@erase "$(OUTDIR)\DECTALK.ilk"
	-@erase "$(OUTDIR)\DECTALK.lib"
	-@erase "$(OUTDIR)\DECTALK.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api\\" /I "..\.." /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\DTalkML.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\DECTALK.pdb" /debug /machine:I386 /def:"..\..\dapi\src\dectalk.def" /out:"$(OUTDIR)\DECTALK.dll" /implib:"$(OUTDIR)\DECTALK.lib" /pdbtype:sept 
DEF_FILE= \
	"..\..\dapi\src\dectalk.def"
LINK32_OBJS= \
	"$(INTDIR)\dtalk_ml.obj"

"$(OUTDIR)\DECTALK.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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


!IF "$(CFG)" == "DTalkML - Win32 Release" || "$(CFG)" == "DTalkML - Win32 Debug"
SOURCE=.\dtalk_ml.c

"$(INTDIR)\dtalk_ml.obj" : $(SOURCE) "$(INTDIR)"



!ENDIF 

