# Microsoft Developer Studio Generated NMAKE File, Based on ctitest.dsp
!IF "$(CFG)" == ""
CFG=ctitest - Win32 Debug
!MESSAGE No configuration specified. Defaulting to ctitest - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "ctitest - Win32 Release" && "$(CFG)" !=\
 "ctitest - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "ctitest.mak" CFG="ctitest - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "ctitest - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "ctitest - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "ctitest - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\ctitest.exe"

!ELSE 

ALL : "$(OUTDIR)\ctitest.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\ctitest.obj"
	-@erase "$(INTDIR)\ctitest.pch"
	-@erase "$(INTDIR)\ctitest.res"
	-@erase "$(INTDIR)\ctitestDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\waveplay.obj"
	-@erase "$(OUTDIR)\ctitest.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D\
 "_AFXDLL" /Fp"$(INTDIR)\ctitest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\"\
 /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\Release/
CPP_SBRS=.
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o NUL /win32 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\ctitest.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ctitest.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib /nologo /subsystem:windows /incremental:no\
 /pdb:"$(OUTDIR)\ctitest.pdb" /machine:I386 /out:"$(OUTDIR)\ctitest.exe" 
LINK32_OBJS= \
	"$(INTDIR)\ctitest.obj" \
	"$(INTDIR)\ctitest.res" \
	"$(INTDIR)\ctitestDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\waveplay.obj" \
	".\dectalk.lib"

"$(OUTDIR)\ctitest.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "ctitest - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\ctitest.exe"

!ELSE 

ALL : "$(OUTDIR)\ctitest.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\ctitest.obj"
	-@erase "$(INTDIR)\ctitest.pch"
	-@erase "$(INTDIR)\ctitest.res"
	-@erase "$(INTDIR)\ctitestDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\vc50.pdb"
	-@erase "$(INTDIR)\waveplay.obj"
	-@erase "$(OUTDIR)\ctitest.exe"
	-@erase "$(OUTDIR)\ctitest.ilk"
	-@erase "$(OUTDIR)\ctitest.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS"\
 /D "_AFXDLL" /Fp"$(INTDIR)\ctitest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\"\
 /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\Debug/
CPP_SBRS=.
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o NUL /win32 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\ctitest.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ctitest.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib /nologo /subsystem:windows /incremental:yes\
 /pdb:"$(OUTDIR)\ctitest.pdb" /debug /machine:I386 /out:"$(OUTDIR)\ctitest.exe"\
 /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\ctitest.obj" \
	"$(INTDIR)\ctitest.res" \
	"$(INTDIR)\ctitestDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\waveplay.obj" \
	".\dectalk.lib"

"$(OUTDIR)\ctitest.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 

.c{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<


!IF "$(CFG)" == "ctitest - Win32 Release" || "$(CFG)" ==\
 "ctitest - Win32 Debug"
SOURCE=.\ctitest.cpp

!IF  "$(CFG)" == "ctitest - Win32 Release"

DEP_CPP_CTITE=\
	".\ctitest.h"\
	".\ctitestDlg.h"\
	".\ttsapi.h"\
	".\waveplay.h"\
	

"$(INTDIR)\ctitest.obj" : $(SOURCE) $(DEP_CPP_CTITE) "$(INTDIR)"\
 "$(INTDIR)\ctitest.pch"


!ELSEIF  "$(CFG)" == "ctitest - Win32 Debug"

DEP_CPP_CTITE=\
	".\ctitest.h"\
	".\ctitestDlg.h"\
	".\ttsapi.h"\
	".\waveplay.h"\
	

"$(INTDIR)\ctitest.obj" : $(SOURCE) $(DEP_CPP_CTITE) "$(INTDIR)"\
 "$(INTDIR)\ctitest.pch"


!ENDIF 

SOURCE=.\ctitest.rc
DEP_RSC_CTITES=\
	".\res\ctitest.ico"\
	".\res\ctitest.rc2"\
	".\res\ico00001.ico"\
	".\res\ico00002.ico"\
	".\res\icon1.ico"\
	

"$(INTDIR)\ctitest.res" : $(SOURCE) $(DEP_RSC_CTITES) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


SOURCE=.\ctitestDlg.cpp

!IF  "$(CFG)" == "ctitest - Win32 Release"

DEP_CPP_CTITEST=\
	".\ctitest.h"\
	".\ctitestDlg.h"\
	".\ttsapi.h"\
	".\waveplay.h"\
	

"$(INTDIR)\ctitestDlg.obj" : $(SOURCE) $(DEP_CPP_CTITEST) "$(INTDIR)"\
 "$(INTDIR)\ctitest.pch"


!ELSEIF  "$(CFG)" == "ctitest - Win32 Debug"

DEP_CPP_CTITEST=\
	".\ctitest.h"\
	".\ctitestDlg.h"\
	".\ttsapi.h"\
	".\waveplay.h"\
	

"$(INTDIR)\ctitestDlg.obj" : $(SOURCE) $(DEP_CPP_CTITEST) "$(INTDIR)"\
 "$(INTDIR)\ctitest.pch"


!ENDIF 

SOURCE=.\StdAfx.cpp
DEP_CPP_STDAF=\
	".\StdAfx.h"\
	

!IF  "$(CFG)" == "ctitest - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D\
 "_AFXDLL" /Fp"$(INTDIR)\ctitest.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\"\
 /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\ctitest.pch" : $(SOURCE) $(DEP_CPP_STDAF)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "ctitest - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D\
 "_WINDOWS" /D "_AFXDLL" /Fp"$(INTDIR)\ctitest.pch" /Yc"stdafx.h"\
 /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\ctitest.pch" : $(SOURCE) $(DEP_CPP_STDAF)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\waveplay.cpp
DEP_CPP_WAVEP=\
	".\ctitest.h"\
	".\waveplay.h"\
	

"$(INTDIR)\waveplay.obj" : $(SOURCE) $(DEP_CPP_WAVEP) "$(INTDIR)"\
 "$(INTDIR)\ctitest.pch"



!ENDIF 

