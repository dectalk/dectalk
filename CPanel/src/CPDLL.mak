# Microsoft Developer Studio Generated NMAKE File, Based on CPDLL.dsp
!IF "$(CFG)" == ""
CFG=CPDLL - Win32 ALPHA Debug
!MESSAGE No configuration specified. Defaulting to CPDLL - Win32 ALPHA Debug.
!ENDIF 

!IF "$(CFG)" != "CPDLL - Win32 Release" && "$(CFG)" != "CPDLL - Win32 Debug" && "$(CFG)" != "CPDLL - Win32 ALPHA Release" && "$(CFG)" != "CPDLL - Win32 ALPHA Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "CPDLL.mak" CFG="CPDLL - Win32 ALPHA Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "CPDLL - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "CPDLL - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "CPDLL - Win32 ALPHA Release" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "CPDLL - Win32 ALPHA Debug" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "CPDLL - Win32 Release"

OUTDIR=.\..\build\release
INTDIR=.\..\build\release\link
# Begin Custom Macros
OutDir=.\..\build\release
# End Custom Macros

ALL : "$(OUTDIR)\cpanel.dll"


CLEAN :
	-@erase "$(INTDIR)\cpanel.obj"
	-@erase "$(INTDIR)\cpapi.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\cpanel.dll"
	-@erase "$(OUTDIR)\cpanel.exp"
	-@erase "$(OUTDIR)\cpanel.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /Fp"$(INTDIR)\CPDLL.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CPDLL.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comctl32.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\cpanel.pdb" /machine:I386 /def:".\cpanel.def" /out:"$(OUTDIR)\cpanel.dll" /implib:"$(OUTDIR)\cpanel.lib" 
DEF_FILE= \
	".\cpanel.def"
LINK32_OBJS= \
	"$(INTDIR)\cpanel.obj" \
	"$(INTDIR)\cpapi.obj"

"$(OUTDIR)\cpanel.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CPDLL - Win32 Debug"

OUTDIR=.\..\build\debug
INTDIR=.\..\build\debug\link
# Begin Custom Macros
OutDir=.\..\build\debug
# End Custom Macros

ALL : "$(OUTDIR)\cpanel.dll"


CLEAN :
	-@erase "$(INTDIR)\cpanel.obj"
	-@erase "$(INTDIR)\cpapi.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\cpanel.dll"
	-@erase "$(OUTDIR)\cpanel.exp"
	-@erase "$(OUTDIR)\cpanel.ilk"
	-@erase "$(OUTDIR)\cpanel.lib"
	-@erase "$(OUTDIR)\cpanel.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /Fp"$(INTDIR)\CPDLL.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CPDLL.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comctl32.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\cpanel.pdb" /debug /machine:I386 /def:".\cpanel.def" /out:"$(OUTDIR)\cpanel.dll" /implib:"$(OUTDIR)\cpanel.lib" 
DEF_FILE= \
	".\cpanel.def"
LINK32_OBJS= \
	"$(INTDIR)\cpanel.obj" \
	"$(INTDIR)\cpapi.obj"

"$(OUTDIR)\cpanel.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CPDLL - Win32 ALPHA Release"

OUTDIR=.\..\alpha\release
INTDIR=.\..\alpha\release\link
# Begin Custom Macros
OutDir=.\..\alpha\release
# End Custom Macros

ALL : "$(OUTDIR)\cpanel.dll"


CLEAN :
	-@erase "$(OUTDIR)\cpanel.dll"
	-@erase "$(OUTDIR)\cpanel.exp"
	-@erase "$(OUTDIR)\cpanel.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CPDLL.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=comctl32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\cpanel.pdb" /machine:ALPHA /def:".\cpanel.def" /out:"$(OUTDIR)\cpanel.dll" /implib:"$(OUTDIR)\cpanel.lib" 
DEF_FILE= \
	".\cpanel.def"
LINK32_OBJS= \
	

"$(OUTDIR)\cpanel.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CPDLL - Win32 ALPHA Debug"

OUTDIR=.\..\alpha\debug
INTDIR=.\..\alpha\debug\link
# Begin Custom Macros
OutDir=.\..\alpha\debug
# End Custom Macros

ALL : "$(OUTDIR)\cpanel.dll"


CLEAN :
	-@erase "$(OUTDIR)\cpanel.dll"
	-@erase "$(OUTDIR)\cpanel.exp"
	-@erase "$(OUTDIR)\cpanel.ilk"
	-@erase "$(OUTDIR)\cpanel.lib"
	-@erase "$(OUTDIR)\cpanel.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CPDLL.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=comctl32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\cpanel.pdb" /debug /machine:ALPHA /def:".\cpanel.def" /out:"$(OUTDIR)\cpanel.dll" /implib:"$(OUTDIR)\cpanel.lib" 
DEF_FILE= \
	".\cpanel.def"
LINK32_OBJS= \
	

"$(OUTDIR)\cpanel.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("CPDLL.dep")
!INCLUDE "CPDLL.dep"
!ELSE 
!MESSAGE Warning: cannot find "CPDLL.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "CPDLL - Win32 Release" || "$(CFG)" == "CPDLL - Win32 Debug" || "$(CFG)" == "CPDLL - Win32 ALPHA Release" || "$(CFG)" == "CPDLL - Win32 ALPHA Debug"
SOURCE=.\cpanel.c

!IF  "$(CFG)" == "CPDLL - Win32 Release"


"$(INTDIR)\cpanel.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "CPDLL - Win32 Debug"


"$(INTDIR)\cpanel.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "CPDLL - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "CPDLL - Win32 ALPHA Debug"

!ENDIF 

SOURCE=.\cpapi.c

!IF  "$(CFG)" == "CPDLL - Win32 Release"


"$(INTDIR)\cpapi.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "CPDLL - Win32 Debug"


"$(INTDIR)\cpapi.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "CPDLL - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "CPDLL - Win32 ALPHA Debug"

!ENDIF 


!ENDIF 

