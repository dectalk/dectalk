# Microsoft Developer Studio Generated NMAKE File, Based on licenin7.dsp
!IF "$(CFG)" == ""
CFG=licenin7 - Win32 ALPHA WP Debug
!MESSAGE No configuration specified. Defaulting to licenin7 - Win32 ALPHA WP Debug.
!ENDIF 

!IF "$(CFG)" != "licenin7 - Win32 Release" && "$(CFG)" != "licenin7 - Win32 Debug" && "$(CFG)" != "licenin7 - Win32 ALPHA Release" && "$(CFG)" != "licenin7 - Win32 ALPHA Debug" && "$(CFG)" != "licenin7 - Win32 WP Release" && "$(CFG)" != "licenin7 - Win32 WP Debug" && "$(CFG)" != "licenin7 - Win32 ALPHA WP Release" && "$(CFG)" != "licenin7 - Win32 ALPHA WP Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "licenin7.mak" CFG="licenin7 - Win32 ALPHA WP Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "licenin7 - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "licenin7 - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE "licenin7 - Win32 ALPHA Release" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "licenin7 - Win32 ALPHA Debug" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "licenin7 - Win32 WP Release" (based on "Win32 (x86) Console Application")
!MESSAGE "licenin7 - Win32 WP Debug" (based on "Win32 (x86) Console Application")
!MESSAGE "licenin7 - Win32 ALPHA WP Release" (based on "Win32 (ALPHA) Console Application")
!MESSAGE "licenin7 - Win32 ALPHA WP Debug" (based on "Win32 (ALPHA) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "licenin7 - Win32 Release"

OUTDIR=.\build\licenin7\release
INTDIR=.\build\licenin7\release\link
# Begin Custom Macros
OutDir=.\build\licenin7\release
# End Custom Macros

ALL : "$(OUTDIR)\licenin7.exe"


CLEAN :
	-@erase "$(INTDIR)\Crypt2.obj"
	-@erase "$(INTDIR)\liceninc.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\licenin7.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D LICENSE_INCREMENT=7 /Fp"$(INTDIR)\licenin7.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\licenin7.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\licenin7.pdb" /machine:I386 /out:"$(OUTDIR)\licenin7.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Crypt2.obj" \
	"$(INTDIR)\liceninc.obj"

"$(OUTDIR)\licenin7.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "licenin7 - Win32 Debug"

OUTDIR=.\build\licenin7\debug
INTDIR=.\build\licenin7\debug\link
# Begin Custom Macros
OutDir=.\build\licenin7\debug
# End Custom Macros

ALL : "$(OUTDIR)\licenin7.exe"


CLEAN :
	-@erase "$(INTDIR)\Crypt2.obj"
	-@erase "$(INTDIR)\liceninc.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\licenin7.exe"
	-@erase "$(OUTDIR)\licenin7.ilk"
	-@erase "$(OUTDIR)\licenin7.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D LICENSE_INCREMENT=7 /Fp"$(INTDIR)\licenin7.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\licenin7.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\licenin7.pdb" /debug /machine:I386 /out:"$(OUTDIR)\licenin7.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Crypt2.obj" \
	"$(INTDIR)\liceninc.obj"

"$(OUTDIR)\licenin7.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "licenin7 - Win32 ALPHA Release"

OUTDIR=.\alpha\licenin7\release
INTDIR=.\alpha\licenin7\release\link

ALL : 


CLEAN :
	-@erase 

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\licenin7.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\licenin7.pdb" /machine:ALPHA /out:"$(OUTDIR)\licenin7.exe" 
LINK32_OBJS= \
	

!ELSEIF  "$(CFG)" == "licenin7 - Win32 ALPHA Debug"

OUTDIR=.\alpha\licenin7\debug
INTDIR=.\alpha\licenin7\debug\link

ALL : 


CLEAN :
	-@erase 

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\licenin7.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\licenin7.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\licenin7.exe" 
LINK32_OBJS= \
	

!ELSEIF  "$(CFG)" == "licenin7 - Win32 WP Release"

OUTDIR=.\wbuild\licenin7\release
INTDIR=.\wbuild\licenin7\release\link
# Begin Custom Macros
OutDir=.\wbuild\licenin7\release
# End Custom Macros

ALL : "$(OUTDIR)\licenin7.exe"


CLEAN :
	-@erase "$(INTDIR)\Crypt2.obj"
	-@erase "$(INTDIR)\liceninc.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\licenin7.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /O2 /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D LICENSE_INCREMENT=7 /D "WILLOWPOND" /Fp"$(INTDIR)\licenin7.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\licenin7.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\licenin7.pdb" /machine:I386 /out:"$(OUTDIR)\licenin7.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Crypt2.obj" \
	"$(INTDIR)\liceninc.obj"

"$(OUTDIR)\licenin7.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "licenin7 - Win32 WP Debug"

OUTDIR=.\wbuild\licenin7\debug
INTDIR=.\wbuild\licenin7\debug\link
# Begin Custom Macros
OutDir=.\wbuild\licenin7\debug
# End Custom Macros

ALL : "$(OUTDIR)\licenin7.exe"


CLEAN :
	-@erase "$(INTDIR)\Crypt2.obj"
	-@erase "$(INTDIR)\liceninc.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\licenin7.exe"
	-@erase "$(OUTDIR)\licenin7.ilk"
	-@erase "$(OUTDIR)\licenin7.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D LICENSE_INCREMENT=7 /D "WILLOWPOND" /Fp"$(INTDIR)\licenin7.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\licenin7.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\licenin7.pdb" /debug /machine:I386 /out:"$(OUTDIR)\licenin7.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Crypt2.obj" \
	"$(INTDIR)\liceninc.obj"

"$(OUTDIR)\licenin7.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "licenin7 - Win32 ALPHA WP Release"

OUTDIR=.\walpha\licenin7\release
INTDIR=.\walpha\licenin7\release\link

ALL : 


CLEAN :
	-@erase 

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\licenin7.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\licenin7.pdb" /machine:ALPHA /out:"$(OUTDIR)\licenin7.exe" 
LINK32_OBJS= \
	

!ELSEIF  "$(CFG)" == "licenin7 - Win32 ALPHA WP Debug"

OUTDIR=.\walpha\licenin7\debug
INTDIR=.\walpha\licenin7\debug\link

ALL : 


CLEAN :
	-@erase 

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\licenin7.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\licenin7.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\licenin7.exe" 
LINK32_OBJS= \
	

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("licenin7.dep")
!INCLUDE "licenin7.dep"
!ELSE 
!MESSAGE Warning: cannot find "licenin7.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "licenin7 - Win32 Release" || "$(CFG)" == "licenin7 - Win32 Debug" || "$(CFG)" == "licenin7 - Win32 ALPHA Release" || "$(CFG)" == "licenin7 - Win32 ALPHA Debug" || "$(CFG)" == "licenin7 - Win32 WP Release" || "$(CFG)" == "licenin7 - Win32 WP Debug" || "$(CFG)" == "licenin7 - Win32 ALPHA WP Release" || "$(CFG)" == "licenin7 - Win32 ALPHA WP Debug"
SOURCE=..\..\dapi\src\Api\Crypt2.c

!IF  "$(CFG)" == "licenin7 - Win32 Release"


"$(INTDIR)\Crypt2.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "licenin7 - Win32 Debug"


"$(INTDIR)\Crypt2.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "licenin7 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "licenin7 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "licenin7 - Win32 WP Release"


"$(INTDIR)\Crypt2.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "licenin7 - Win32 WP Debug"


"$(INTDIR)\Crypt2.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "licenin7 - Win32 ALPHA WP Release"

!ELSEIF  "$(CFG)" == "licenin7 - Win32 ALPHA WP Debug"

!ENDIF 

SOURCE=.\liceninc.c

!IF  "$(CFG)" == "licenin7 - Win32 Release"


"$(INTDIR)\liceninc.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "licenin7 - Win32 Debug"


"$(INTDIR)\liceninc.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "licenin7 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "licenin7 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "licenin7 - Win32 WP Release"


"$(INTDIR)\liceninc.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "licenin7 - Win32 WP Debug"


"$(INTDIR)\liceninc.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "licenin7 - Win32 ALPHA WP Release"

!ELSEIF  "$(CFG)" == "licenin7 - Win32 ALPHA WP Debug"

!ENDIF 


!ENDIF 

