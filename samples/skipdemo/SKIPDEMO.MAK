# Microsoft Developer Studio Generated NMAKE File, Based on skipdemo.dsp
!IF "$(CFG)" == ""
CFG=skipdemo - Win32 Debug
!MESSAGE No configuration specified. Defaulting to skipdemo - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "skipdemo - Win32 Release" && "$(CFG)" != "skipdemo - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "skipdemo.mak" CFG="skipdemo - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "skipdemo - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "skipdemo - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "skipdemo - Win32 Release"

OUTDIR=.\build\Release
INTDIR=.\build\Release\link
# Begin Custom Macros
OutDir=.\build\Release
# End Custom Macros

ALL : "$(OUTDIR)\skipdemo.exe"


CLEAN :
	-@erase "$(INTDIR)\skipdemo.obj"
	-@erase "$(INTDIR)\skipdemo.pch"
	-@erase "$(INTDIR)\skipdemo.res"
	-@erase "$(INTDIR)\skipdemoDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\skipdemo.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\skipdemo.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\skipdemo.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\skipdemo.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=/nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\skipdemo.pdb" /machine:I386 /out:"$(OUTDIR)\skipdemo.exe" 
LINK32_OBJS= \
	"$(INTDIR)\skipdemo.obj" \
	"$(INTDIR)\skipdemoDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\skipdemo.res" \
	".\dectalk.lib"

"$(OUTDIR)\skipdemo.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "skipdemo - Win32 Debug"

OUTDIR=.\build\Debug
INTDIR=.\build\Debug\link
# Begin Custom Macros
OutDir=.\build\Debug
# End Custom Macros

ALL : "$(OUTDIR)\skipdemo.exe"


CLEAN :
	-@erase "$(INTDIR)\skipdemo.obj"
	-@erase "$(INTDIR)\skipdemo.pch"
	-@erase "$(INTDIR)\skipdemo.res"
	-@erase "$(INTDIR)\skipdemoDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\skipdemo.exe"
	-@erase "$(OUTDIR)\skipdemo.ilk"
	-@erase "$(OUTDIR)\skipdemo.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\skipdemo.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\skipdemo.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\skipdemo.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=/nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\skipdemo.pdb" /debug /machine:I386 /out:"$(OUTDIR)\skipdemo.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\skipdemo.obj" \
	"$(INTDIR)\skipdemoDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\skipdemo.res" \
	".\dectalk.lib"

"$(OUTDIR)\skipdemo.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("skipdemo.dep")
!INCLUDE "skipdemo.dep"
!ELSE 
!MESSAGE Warning: cannot find "skipdemo.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "skipdemo - Win32 Release" || "$(CFG)" == "skipdemo - Win32 Debug"
SOURCE=.\skipdemo.cpp

"$(INTDIR)\skipdemo.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\skipdemo.pch"


SOURCE=.\skipdemo.rc

"$(INTDIR)\skipdemo.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


SOURCE=.\skipdemoDlg.cpp

"$(INTDIR)\skipdemoDlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\skipdemo.pch"


SOURCE=.\StdAfx.cpp

!IF  "$(CFG)" == "skipdemo - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\skipdemo.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\skipdemo.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "skipdemo - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\skipdemo.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\skipdemo.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 


!ENDIF 

