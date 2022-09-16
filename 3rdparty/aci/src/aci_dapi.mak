# Microsoft Developer Studio Generated NMAKE File, Based on aci_dapi.dsp
!IF "$(CFG)" == ""
CFG=aci_dapi - Win32 Debug
!MESSAGE No configuration specified. Defaulting to aci_dapi - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "aci_dapi - Win32 Release" && "$(CFG)" != "aci_dapi - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "aci_dapi.mak" CFG="aci_dapi - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "aci_dapi - Win32 Release" (based on "Win32 (x86) Static Library")
!MESSAGE "aci_dapi - Win32 Debug" (based on "Win32 (x86) Static Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "aci_dapi - Win32 Release"

OUTDIR=.\..\build\Release
INTDIR=.\..\build\Release\link
# Begin Custom Macros
OutDir=.\..\build\Release
# End Custom Macros

ALL : "$(OUTDIR)\aci_dapi.lib"


CLEAN :
	-@erase "$(INTDIR)\crypt2.obj"
	-@erase "$(INTDIR)\decstd97.obj"
	-@erase "$(INTDIR)\loaddict.obj"
	-@erase "$(INTDIR)\mmalloc.obj"
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\playaud.obj"
	-@erase "$(INTDIR)\playtone.obj"
	-@erase "$(INTDIR)\services.obj"
	-@erase "$(INTDIR)\sync.obj"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\vtmiont.obj"
	-@erase "$(OUTDIR)\aci_dapi.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\corecode\dapi\src\api" /I "..\corecode\dapi\src\cmd" /I "..\corecode\dapi\src\include" /I "..\corecode\dapi\src\nt" /I "..\corecode\dapi\src\ph" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /Fp"$(INTDIR)\aci_dapi.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\aci_dapi.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\aci_dapi.lib" 
LIB32_OBJS= \
	"$(INTDIR)\crypt2.obj" \
	"$(INTDIR)\decstd97.obj" \
	"$(INTDIR)\loaddict.obj" \
	"$(INTDIR)\mmalloc.obj" \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\playaud.obj" \
	"$(INTDIR)\playtone.obj" \
	"$(INTDIR)\services.obj" \
	"$(INTDIR)\sync.obj" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\vtmiont.obj"

"$(OUTDIR)\aci_dapi.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "aci_dapi - Win32 Debug"

OUTDIR=.\..\build\Debug
INTDIR=.\..\build\Debug\link
# Begin Custom Macros
OutDir=.\..\build\Debug
# End Custom Macros

ALL : "$(OUTDIR)\aci_dapi.lib"


CLEAN :
	-@erase "$(INTDIR)\crypt2.obj"
	-@erase "$(INTDIR)\decstd97.obj"
	-@erase "$(INTDIR)\loaddict.obj"
	-@erase "$(INTDIR)\mmalloc.obj"
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\playaud.obj"
	-@erase "$(INTDIR)\playtone.obj"
	-@erase "$(INTDIR)\services.obj"
	-@erase "$(INTDIR)\sync.obj"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\vtmiont.obj"
	-@erase "$(OUTDIR)\aci_dapi.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /GX /Z7 /Od /I "..\corecode\dapi\src\api" /I "..\corecode\dapi\src\cmd" /I "..\corecode\dapi\src\include" /I "..\corecode\dapi\src\nt" /I "..\corecode\dapi\src\ph" /D "_DEBUG" /D "PRINTFDEBUG" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /Fp"$(INTDIR)\aci_dapi.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\aci_dapi.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\aci_dapi.lib" 
LIB32_OBJS= \
	"$(INTDIR)\crypt2.obj" \
	"$(INTDIR)\decstd97.obj" \
	"$(INTDIR)\loaddict.obj" \
	"$(INTDIR)\mmalloc.obj" \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\playaud.obj" \
	"$(INTDIR)\playtone.obj" \
	"$(INTDIR)\services.obj" \
	"$(INTDIR)\sync.obj" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\vtmiont.obj"

"$(OUTDIR)\aci_dapi.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ENDIF 

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


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("aci_dapi.dep")
!INCLUDE "aci_dapi.dep"
!ELSE 
!MESSAGE Warning: cannot find "aci_dapi.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "aci_dapi - Win32 Release" || "$(CFG)" == "aci_dapi - Win32 Debug"
SOURCE=..\corecode\dapi\src\api\crypt2.c

"$(INTDIR)\crypt2.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\corecode\dapi\src\api\decstd97.c

"$(INTDIR)\decstd97.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\corecode\dapi\src\lts\loaddict.c

"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\corecode\dapi\src\nt\mmalloc.c

"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\corecode\dapi\src\nt\opthread.c

"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\corecode\dapi\src\nt\playaud.c

"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\corecode\dapi\src\vtm\playtone.c

"$(INTDIR)\playtone.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\corecode\dapi\src\kernel\services.c

"$(INTDIR)\services.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\corecode\dapi\src\vtm\sync.c

"$(INTDIR)\sync.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\corecode\dapi\src\api\ttsapi.c

"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\corecode\dapi\src\vtm\vtm.c

"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\corecode\dapi\src\vtm\vtmiont.c

"$(INTDIR)\vtmiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)



!ENDIF 

