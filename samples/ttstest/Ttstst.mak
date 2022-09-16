# Microsoft Developer Studio Generated NMAKE File, Based on Ttstst.dsp
!IF "$(CFG)" == ""
CFG=Ttstst - Win32 A2ADebug French
!MESSAGE No configuration specified. Defaulting to Ttstst - Win32 A2ADebug French.
!ENDIF 

!IF "$(CFG)" != "Ttstst - Win32 A2WRel" && "$(CFG)" != "Ttstst - Win32 A2WDebug" && "$(CFG)" != "Ttstst - Win32 A2ADebug" && "$(CFG)" != "Ttstst - Win32 A2ARel" && "$(CFG)" != "Ttstst - Win32 W2ADebug" && "$(CFG)" != "Ttstst - Win32 W2ARel" && "$(CFG)" != "Ttstst - Win32 W2WDebug" && "$(CFG)" != "Ttstst - Win32 W2WRel" && "$(CFG)" != "Ttstst - Win32 A2ARel Spanish" && "$(CFG)" != "Ttstst - Win32 A2ADebug Spanish" && "$(CFG)" != "Ttstst - Win32 A2ARel German" && "$(CFG)" != "Ttstst - Win32 A2ADebug German" && "$(CFG)" != "Ttstst - Win32 A2ARel Latin American" && "$(CFG)" != "Ttstst - Win32 A2ADebug Latin American" && "$(CFG)" != "Ttstst - Win32 A2ARel United Kingdom" && "$(CFG)" != "Ttstst - Win32 A2ADebug United Kingdom" && "$(CFG)" != "Ttstst - Win32 A2ADebug French" && "$(CFG)" != "Ttstst - Win32 A2ARel French"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "Ttstst.mak" CFG="Ttstst - Win32 A2ADebug French"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Ttstst - Win32 A2WRel" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 A2WDebug" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 A2ADebug" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 A2ARel" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 W2ADebug" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 W2ARel" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 W2WDebug" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 W2WRel" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 A2ARel Spanish" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 A2ADebug Spanish" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 A2ARel German" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 A2ADebug German" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 A2ARel Latin American" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 A2ADebug Latin American" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 A2ARel United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 A2ADebug United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 A2ADebug French" (based on "Win32 (x86) Application")
!MESSAGE "Ttstst - Win32 A2ARel French" (based on "Win32 (x86) Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "Ttstst - Win32 A2WRel"

OUTDIR=.\build\us\A2WRel
INTDIR=.\build\us\A2WRel\link

ALL : ".\build\us\release\Ttstest.exe"


CLEAN :
	-@erase "$(INTDIR)\DLGFINDM.OBJ"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\STDAFX.OBJ"
	-@erase "$(INTDIR)\TABISRCE.OBJ"
	-@erase "$(INTDIR)\TTSDLG.OBJ"
	-@erase "$(INTDIR)\TTSFNC.OBJ"
	-@erase "$(INTDIR)\TTSTST.OBJ"
	-@erase "$(INTDIR)\Ttstst.pch"
	-@erase "$(INTDIR)\TTSTST.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase ".\build\us\release\Ttstest.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_S_UNICODE" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\TTSTST.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Ttstst.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\sapi\build\dtlkttse\us\release\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /incremental:no /pdb:"$(OUTDIR)\Ttstest.pdb" /machine:I386 /out:".\build\us\release\Ttstest.exe" /SUBSYSTEM:windows,4.0 
LINK32_OBJS= \
	"$(INTDIR)\DLGFINDM.OBJ" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\STDAFX.OBJ" \
	"$(INTDIR)\TABISRCE.OBJ" \
	"$(INTDIR)\TTSDLG.OBJ" \
	"$(INTDIR)\TTSFNC.OBJ" \
	"$(INTDIR)\TTSTST.OBJ" \
	"$(INTDIR)\TTSTST.res"

".\build\us\release\Ttstest.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2WDebug"

OUTDIR=.\build\us\A2WDebug
INTDIR=.\build\us\A2WDebug\link
# Begin Custom Macros
OutDir=.\build\us\A2WDebug
# End Custom Macros

ALL : "$(OUTDIR)\Ttstest.exe"


CLEAN :
	-@erase "$(INTDIR)\DLGFINDM.OBJ"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\STDAFX.OBJ"
	-@erase "$(INTDIR)\TABISRCE.OBJ"
	-@erase "$(INTDIR)\TTSDLG.OBJ"
	-@erase "$(INTDIR)\TTSFNC.OBJ"
	-@erase "$(INTDIR)\TTSTST.OBJ"
	-@erase "$(INTDIR)\Ttstst.pch"
	-@erase "$(INTDIR)\TTSTST.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Ttstest.exe"
	-@erase "$(OUTDIR)\Ttstest.ilk"
	-@erase "$(OUTDIR)\Ttstest.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_S_UNICODE" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\TTSTST.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Ttstst.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\sapi\build\dtlkttse\us\debug\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /incremental:yes /pdb:"$(OUTDIR)\Ttstest.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Ttstest.exe" /SUBSYSTEM:windows,4.0 
LINK32_OBJS= \
	"$(INTDIR)\DLGFINDM.OBJ" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\STDAFX.OBJ" \
	"$(INTDIR)\TABISRCE.OBJ" \
	"$(INTDIR)\TTSDLG.OBJ" \
	"$(INTDIR)\TTSFNC.OBJ" \
	"$(INTDIR)\TTSTST.OBJ" \
	"$(INTDIR)\TTSTST.res"

"$(OUTDIR)\Ttstest.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug"

OUTDIR=.\build\us\A2ADebug
INTDIR=.\build\us\A2ADebug\link
# Begin Custom Macros
OutDir=.\build\us\A2ADebug
# End Custom Macros

ALL : "$(OUTDIR)\Ttstest.exe"


CLEAN :
	-@erase "$(INTDIR)\DLGFINDM.OBJ"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\STDAFX.OBJ"
	-@erase "$(INTDIR)\TABISRCE.OBJ"
	-@erase "$(INTDIR)\TTSDLG.OBJ"
	-@erase "$(INTDIR)\TTSFNC.OBJ"
	-@erase "$(INTDIR)\TTSTST.OBJ"
	-@erase "$(INTDIR)\Ttstst.pch"
	-@erase "$(INTDIR)\TTSTST.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Ttstest.exe"
	-@erase "$(OUTDIR)\Ttstest.ilk"
	-@erase "$(OUTDIR)\Ttstest.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /D "ENGLISH" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\TTSTST.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Ttstst.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\sapi\build\dtlkttse\us\debug\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /incremental:yes /pdb:"$(OUTDIR)\Ttstest.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Ttstest.exe" /SUBSYSTEM:windows,4.0 
LINK32_OBJS= \
	"$(INTDIR)\DLGFINDM.OBJ" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\STDAFX.OBJ" \
	"$(INTDIR)\TABISRCE.OBJ" \
	"$(INTDIR)\TTSDLG.OBJ" \
	"$(INTDIR)\TTSFNC.OBJ" \
	"$(INTDIR)\TTSTST.OBJ" \
	"$(INTDIR)\TTSTST.res"

"$(OUTDIR)\Ttstest.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel"

OUTDIR=.\build\us\release
INTDIR=.\build\us\release\link
# Begin Custom Macros
OutDir=.\build\us\release
# End Custom Macros

ALL : "$(OUTDIR)\Ttstest.exe"


CLEAN :
	-@erase "$(INTDIR)\DLGFINDM.OBJ"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\STDAFX.OBJ"
	-@erase "$(INTDIR)\TABISRCE.OBJ"
	-@erase "$(INTDIR)\TTSDLG.OBJ"
	-@erase "$(INTDIR)\TTSFNC.OBJ"
	-@erase "$(INTDIR)\TTSTST.OBJ"
	-@erase "$(INTDIR)\Ttstst.pch"
	-@erase "$(INTDIR)\TTSTST.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Ttstest.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /D "ENGLISH" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\TTSTST.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Ttstst.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\sapi\build\dtlkttse\us\release\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /incremental:no /pdb:"$(OUTDIR)\Ttstest.pdb" /machine:I386 /out:"$(OUTDIR)\Ttstest.exe" /SUBSYSTEM:windows,4.0 
LINK32_OBJS= \
	"$(INTDIR)\DLGFINDM.OBJ" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\STDAFX.OBJ" \
	"$(INTDIR)\TABISRCE.OBJ" \
	"$(INTDIR)\TTSDLG.OBJ" \
	"$(INTDIR)\TTSFNC.OBJ" \
	"$(INTDIR)\TTSTST.OBJ" \
	"$(INTDIR)\TTSTST.res"

"$(OUTDIR)\Ttstest.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2ADebug"

OUTDIR=.\build\us\W2ADebug
INTDIR=.\build\us\W2ADebug\link
# Begin Custom Macros
OutDir=.\build\us\W2ADebug
# End Custom Macros

ALL : "$(OUTDIR)\Ttstst.exe" "$(OUTDIR)\Ttstst.bsc"


CLEAN :
	-@erase "$(INTDIR)\DLGFINDM.OBJ"
	-@erase "$(INTDIR)\DLGFINDM.SBR"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\guidseg.sbr"
	-@erase "$(INTDIR)\STDAFX.OBJ"
	-@erase "$(INTDIR)\STDAFX.SBR"
	-@erase "$(INTDIR)\TABISRCE.OBJ"
	-@erase "$(INTDIR)\TABISRCE.SBR"
	-@erase "$(INTDIR)\TTSDLG.OBJ"
	-@erase "$(INTDIR)\TTSDLG.SBR"
	-@erase "$(INTDIR)\TTSFNC.OBJ"
	-@erase "$(INTDIR)\TTSFNC.SBR"
	-@erase "$(INTDIR)\TTSTST.OBJ"
	-@erase "$(INTDIR)\Ttstst.pch"
	-@erase "$(INTDIR)\TTSTST.res"
	-@erase "$(INTDIR)\TTSTST.SBR"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Ttstst.bsc"
	-@erase "$(OUTDIR)\Ttstst.exe"
	-@erase "$(OUTDIR)\Ttstst.ilk"
	-@erase "$(OUTDIR)\Ttstst.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_UNICODE" /D "_S_ANSI" /D "_AFXDLL" /D "ENGLISH_US" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\TTSTST.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Ttstst.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\DLGFINDM.SBR" \
	"$(INTDIR)\guidseg.sbr" \
	"$(INTDIR)\STDAFX.SBR" \
	"$(INTDIR)\TABISRCE.SBR" \
	"$(INTDIR)\TTSDLG.SBR" \
	"$(INTDIR)\TTSFNC.SBR" \
	"$(INTDIR)\TTSTST.SBR"

"$(OUTDIR)\Ttstst.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=..\..\sapi\build\dlkttse\us\debug\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /entry:"wWinMainCRTStartup" /incremental:yes /pdb:"$(OUTDIR)\Ttstst.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Ttstst.exe" /SUBSYSTEM:windows,4.0 
LINK32_OBJS= \
	"$(INTDIR)\DLGFINDM.OBJ" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\STDAFX.OBJ" \
	"$(INTDIR)\TABISRCE.OBJ" \
	"$(INTDIR)\TTSDLG.OBJ" \
	"$(INTDIR)\TTSFNC.OBJ" \
	"$(INTDIR)\TTSTST.OBJ" \
	"$(INTDIR)\TTSTST.res"

"$(OUTDIR)\Ttstst.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2ARel"

OUTDIR=.\build\us\W2ARel
INTDIR=.\build\us\W2ARel\link
# Begin Custom Macros
OutDir=.\build\us\W2ARel
# End Custom Macros

ALL : "$(OUTDIR)\Ttstst.exe" "$(OUTDIR)\Ttstst.bsc"


CLEAN :
	-@erase "$(INTDIR)\DLGFINDM.OBJ"
	-@erase "$(INTDIR)\DLGFINDM.SBR"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\guidseg.sbr"
	-@erase "$(INTDIR)\STDAFX.OBJ"
	-@erase "$(INTDIR)\STDAFX.SBR"
	-@erase "$(INTDIR)\TABISRCE.OBJ"
	-@erase "$(INTDIR)\TABISRCE.SBR"
	-@erase "$(INTDIR)\TTSDLG.OBJ"
	-@erase "$(INTDIR)\TTSDLG.SBR"
	-@erase "$(INTDIR)\TTSFNC.OBJ"
	-@erase "$(INTDIR)\TTSFNC.SBR"
	-@erase "$(INTDIR)\TTSTST.OBJ"
	-@erase "$(INTDIR)\Ttstst.pch"
	-@erase "$(INTDIR)\TTSTST.res"
	-@erase "$(INTDIR)\TTSTST.SBR"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Ttstst.bsc"
	-@erase "$(OUTDIR)\Ttstst.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_UNICODE" /D "_S_ANSI" /D "_AFXDLL" /D "ENGLISH_US" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\TTSTST.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Ttstst.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\DLGFINDM.SBR" \
	"$(INTDIR)\guidseg.sbr" \
	"$(INTDIR)\STDAFX.SBR" \
	"$(INTDIR)\TABISRCE.SBR" \
	"$(INTDIR)\TTSDLG.SBR" \
	"$(INTDIR)\TTSFNC.SBR" \
	"$(INTDIR)\TTSTST.SBR"

"$(OUTDIR)\Ttstst.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=..\..\sapi\build\dlkttse\us\release\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /entry:"wWinMainCRTStartup" /incremental:no /pdb:"$(OUTDIR)\Ttstst.pdb" /machine:I386 /out:"$(OUTDIR)\Ttstst.exe" /SUBSYSTEM:windows,4.0 
LINK32_OBJS= \
	"$(INTDIR)\DLGFINDM.OBJ" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\STDAFX.OBJ" \
	"$(INTDIR)\TABISRCE.OBJ" \
	"$(INTDIR)\TTSDLG.OBJ" \
	"$(INTDIR)\TTSFNC.OBJ" \
	"$(INTDIR)\TTSTST.OBJ" \
	"$(INTDIR)\TTSTST.res"

"$(OUTDIR)\Ttstst.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2WDebug"

OUTDIR=.\build\us\W2WDebug
INTDIR=.\build\us\W2WDebug\link
# Begin Custom Macros
OutDir=.\build\us\W2WDebug
# End Custom Macros

ALL : "$(OUTDIR)\Ttstst.exe" "$(OUTDIR)\Ttstst.bsc"


CLEAN :
	-@erase "$(INTDIR)\DLGFINDM.OBJ"
	-@erase "$(INTDIR)\DLGFINDM.SBR"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\guidseg.sbr"
	-@erase "$(INTDIR)\STDAFX.OBJ"
	-@erase "$(INTDIR)\STDAFX.SBR"
	-@erase "$(INTDIR)\TABISRCE.OBJ"
	-@erase "$(INTDIR)\TABISRCE.SBR"
	-@erase "$(INTDIR)\TTSDLG.OBJ"
	-@erase "$(INTDIR)\TTSDLG.SBR"
	-@erase "$(INTDIR)\TTSFNC.OBJ"
	-@erase "$(INTDIR)\TTSFNC.SBR"
	-@erase "$(INTDIR)\TTSTST.OBJ"
	-@erase "$(INTDIR)\Ttstst.pch"
	-@erase "$(INTDIR)\TTSTST.res"
	-@erase "$(INTDIR)\TTSTST.SBR"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Ttstst.bsc"
	-@erase "$(OUTDIR)\Ttstst.exe"
	-@erase "$(OUTDIR)\Ttstst.ilk"
	-@erase "$(OUTDIR)\Ttstst.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_UNICODE" /D "_AFXDLL" /D "ENGLISH_US" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\TTSTST.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Ttstst.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\DLGFINDM.SBR" \
	"$(INTDIR)\guidseg.sbr" \
	"$(INTDIR)\STDAFX.SBR" \
	"$(INTDIR)\TABISRCE.SBR" \
	"$(INTDIR)\TTSDLG.SBR" \
	"$(INTDIR)\TTSFNC.SBR" \
	"$(INTDIR)\TTSTST.SBR"

"$(OUTDIR)\Ttstst.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=..\..\sapi\build\dlkttse\us\debug\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /entry:"wWinMainCRTStartup" /incremental:yes /pdb:"$(OUTDIR)\Ttstst.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Ttstst.exe" /SUBSYSTEM:windows,4.0 
LINK32_OBJS= \
	"$(INTDIR)\DLGFINDM.OBJ" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\STDAFX.OBJ" \
	"$(INTDIR)\TABISRCE.OBJ" \
	"$(INTDIR)\TTSDLG.OBJ" \
	"$(INTDIR)\TTSFNC.OBJ" \
	"$(INTDIR)\TTSTST.OBJ" \
	"$(INTDIR)\TTSTST.res"

"$(OUTDIR)\Ttstst.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2WRel"

OUTDIR=.\build\us\W2WRel
INTDIR=.\build\us\W2WRel\link
# Begin Custom Macros
OutDir=.\build\us\W2WRel
# End Custom Macros

ALL : "$(OUTDIR)\Ttstst.exe" "$(OUTDIR)\Ttstst.bsc"


CLEAN :
	-@erase "$(INTDIR)\DLGFINDM.OBJ"
	-@erase "$(INTDIR)\DLGFINDM.SBR"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\guidseg.sbr"
	-@erase "$(INTDIR)\STDAFX.OBJ"
	-@erase "$(INTDIR)\STDAFX.SBR"
	-@erase "$(INTDIR)\TABISRCE.OBJ"
	-@erase "$(INTDIR)\TABISRCE.SBR"
	-@erase "$(INTDIR)\TTSDLG.OBJ"
	-@erase "$(INTDIR)\TTSDLG.SBR"
	-@erase "$(INTDIR)\TTSFNC.OBJ"
	-@erase "$(INTDIR)\TTSFNC.SBR"
	-@erase "$(INTDIR)\TTSTST.OBJ"
	-@erase "$(INTDIR)\Ttstst.pch"
	-@erase "$(INTDIR)\TTSTST.res"
	-@erase "$(INTDIR)\TTSTST.SBR"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Ttstst.bsc"
	-@erase "$(OUTDIR)\Ttstst.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_UNICODE" /D "_AFXDLL" /D "ENGLISH_US" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\TTSTST.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Ttstst.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\DLGFINDM.SBR" \
	"$(INTDIR)\guidseg.sbr" \
	"$(INTDIR)\STDAFX.SBR" \
	"$(INTDIR)\TABISRCE.SBR" \
	"$(INTDIR)\TTSDLG.SBR" \
	"$(INTDIR)\TTSFNC.SBR" \
	"$(INTDIR)\TTSTST.SBR"

"$(OUTDIR)\Ttstst.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=..\..\sapi\build\dlkttse\us\release\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /entry:"wWinMainCRTStartup" /incremental:no /pdb:"$(OUTDIR)\Ttstst.pdb" /machine:I386 /out:"$(OUTDIR)\Ttstst.exe" /SUBSYSTEM:windows,4.0 
LINK32_OBJS= \
	"$(INTDIR)\DLGFINDM.OBJ" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\STDAFX.OBJ" \
	"$(INTDIR)\TABISRCE.OBJ" \
	"$(INTDIR)\TTSDLG.OBJ" \
	"$(INTDIR)\TTSFNC.OBJ" \
	"$(INTDIR)\TTSTST.OBJ" \
	"$(INTDIR)\TTSTST.res"

"$(OUTDIR)\Ttstst.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel Spanish"

OUTDIR=.\build\sp\release
INTDIR=.\build\sp\release\link
# Begin Custom Macros
OutDir=.\build\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\Ttstest.exe"


CLEAN :
	-@erase "$(INTDIR)\DLGFINDM.OBJ"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\STDAFX.OBJ"
	-@erase "$(INTDIR)\TABISRCE.OBJ"
	-@erase "$(INTDIR)\TTSDLG.OBJ"
	-@erase "$(INTDIR)\TTSFNC.OBJ"
	-@erase "$(INTDIR)\TTSTST.OBJ"
	-@erase "$(INTDIR)\Ttstst.pch"
	-@erase "$(INTDIR)\TTSTST.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Ttstest.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "SPANISH" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /D "SPANISH_SP" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\TTSTST.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Ttstst.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\sapi\build\dtlkttse\sp\release\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /incremental:no /pdb:"$(OUTDIR)\Ttstest.pdb" /machine:I386 /out:"$(OUTDIR)\Ttstest.exe" /SUBSYSTEM:windows,4.0 
LINK32_OBJS= \
	"$(INTDIR)\DLGFINDM.OBJ" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\STDAFX.OBJ" \
	"$(INTDIR)\TABISRCE.OBJ" \
	"$(INTDIR)\TTSDLG.OBJ" \
	"$(INTDIR)\TTSFNC.OBJ" \
	"$(INTDIR)\TTSTST.OBJ" \
	"$(INTDIR)\TTSTST.res"

"$(OUTDIR)\Ttstest.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug Spanish"

OUTDIR=.\build\sp\A2ADebug
INTDIR=.\build\sp\A2ADebug\link
# Begin Custom Macros
OutDir=.\build\sp\A2ADebug
# End Custom Macros

ALL : "$(OUTDIR)\Ttstest.exe"


CLEAN :
	-@erase "$(INTDIR)\DLGFINDM.OBJ"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\STDAFX.OBJ"
	-@erase "$(INTDIR)\TABISRCE.OBJ"
	-@erase "$(INTDIR)\TTSDLG.OBJ"
	-@erase "$(INTDIR)\TTSFNC.OBJ"
	-@erase "$(INTDIR)\TTSTST.OBJ"
	-@erase "$(INTDIR)\Ttstst.pch"
	-@erase "$(INTDIR)\TTSTST.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Ttstest.exe"
	-@erase "$(OUTDIR)\Ttstest.ilk"
	-@erase "$(OUTDIR)\Ttstest.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "SPANISH" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /D "SPANISH_SP" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\TTSTST.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Ttstst.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\sapi\build\dtlkttse\sp\debug\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /incremental:yes /pdb:"$(OUTDIR)\Ttstest.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Ttstest.exe" /SUBSYSTEM:windows,4.0 
LINK32_OBJS= \
	"$(INTDIR)\DLGFINDM.OBJ" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\STDAFX.OBJ" \
	"$(INTDIR)\TABISRCE.OBJ" \
	"$(INTDIR)\TTSDLG.OBJ" \
	"$(INTDIR)\TTSFNC.OBJ" \
	"$(INTDIR)\TTSTST.OBJ" \
	"$(INTDIR)\TTSTST.res"

"$(OUTDIR)\Ttstest.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel German"

OUTDIR=.\build\gr\release
INTDIR=.\build\gr\release\link
# Begin Custom Macros
OutDir=.\build\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\Ttstest.exe"


CLEAN :
	-@erase "$(INTDIR)\DLGFINDM.OBJ"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\STDAFX.OBJ"
	-@erase "$(INTDIR)\TABISRCE.OBJ"
	-@erase "$(INTDIR)\TTSDLG.OBJ"
	-@erase "$(INTDIR)\TTSFNC.OBJ"
	-@erase "$(INTDIR)\TTSTST.OBJ"
	-@erase "$(INTDIR)\Ttstst.pch"
	-@erase "$(INTDIR)\TTSTST.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Ttstest.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\TTSTST.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Ttstst.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\sapi\build\dtlkttse\gr\release\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /incremental:no /pdb:"$(OUTDIR)\Ttstest.pdb" /machine:I386 /out:"$(OUTDIR)\Ttstest.exe" /SUBSYSTEM:windows,4.0 
LINK32_OBJS= \
	"$(INTDIR)\DLGFINDM.OBJ" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\STDAFX.OBJ" \
	"$(INTDIR)\TABISRCE.OBJ" \
	"$(INTDIR)\TTSDLG.OBJ" \
	"$(INTDIR)\TTSFNC.OBJ" \
	"$(INTDIR)\TTSTST.OBJ" \
	"$(INTDIR)\TTSTST.res"

"$(OUTDIR)\Ttstest.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug German"

OUTDIR=.\build\gr\A2ADebug
INTDIR=.\build\gr\A2ADebug\link
# Begin Custom Macros
OutDir=.\build\gr\A2ADebug
# End Custom Macros

ALL : "$(OUTDIR)\Ttstest.exe"


CLEAN :
	-@erase "$(INTDIR)\DLGFINDM.OBJ"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\STDAFX.OBJ"
	-@erase "$(INTDIR)\TABISRCE.OBJ"
	-@erase "$(INTDIR)\TTSDLG.OBJ"
	-@erase "$(INTDIR)\TTSFNC.OBJ"
	-@erase "$(INTDIR)\TTSTST.OBJ"
	-@erase "$(INTDIR)\Ttstst.pch"
	-@erase "$(INTDIR)\TTSTST.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Ttstest.exe"
	-@erase "$(OUTDIR)\Ttstest.ilk"
	-@erase "$(OUTDIR)\Ttstest.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\TTSTST.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Ttstst.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\sapi\build\dtlkttse\gr\debug\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /incremental:yes /pdb:"$(OUTDIR)\Ttstest.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Ttstest.exe" /SUBSYSTEM:windows,4.0 
LINK32_OBJS= \
	"$(INTDIR)\DLGFINDM.OBJ" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\STDAFX.OBJ" \
	"$(INTDIR)\TABISRCE.OBJ" \
	"$(INTDIR)\TTSDLG.OBJ" \
	"$(INTDIR)\TTSFNC.OBJ" \
	"$(INTDIR)\TTSTST.OBJ" \
	"$(INTDIR)\TTSTST.res"

"$(OUTDIR)\Ttstest.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel Latin American"

OUTDIR=.\build\la\release
INTDIR=.\build\la\release\link
# Begin Custom Macros
OutDir=.\build\la\release
# End Custom Macros

ALL : "$(OUTDIR)\Ttstest.exe"


CLEAN :
	-@erase "$(INTDIR)\DLGFINDM.OBJ"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\STDAFX.OBJ"
	-@erase "$(INTDIR)\TABISRCE.OBJ"
	-@erase "$(INTDIR)\TTSDLG.OBJ"
	-@erase "$(INTDIR)\TTSFNC.OBJ"
	-@erase "$(INTDIR)\TTSTST.OBJ"
	-@erase "$(INTDIR)\Ttstst.pch"
	-@erase "$(INTDIR)\TTSTST.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Ttstest.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\TTSTST.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Ttstst.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\sapi\build\dtlkttse\la\release\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /incremental:no /pdb:"$(OUTDIR)\Ttstest.pdb" /machine:I386 /out:"$(OUTDIR)\Ttstest.exe" /SUBSYSTEM:windows,4.0 
LINK32_OBJS= \
	"$(INTDIR)\DLGFINDM.OBJ" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\STDAFX.OBJ" \
	"$(INTDIR)\TABISRCE.OBJ" \
	"$(INTDIR)\TTSDLG.OBJ" \
	"$(INTDIR)\TTSFNC.OBJ" \
	"$(INTDIR)\TTSTST.OBJ" \
	"$(INTDIR)\TTSTST.res"

"$(OUTDIR)\Ttstest.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug Latin American"

OUTDIR=.\build\la\A2ADebug
INTDIR=.\build\la\A2ADebug\link
# Begin Custom Macros
OutDir=.\build\la\A2ADebug
# End Custom Macros

ALL : "$(OUTDIR)\Ttstest.exe"


CLEAN :
	-@erase "$(INTDIR)\DLGFINDM.OBJ"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\STDAFX.OBJ"
	-@erase "$(INTDIR)\TABISRCE.OBJ"
	-@erase "$(INTDIR)\TTSDLG.OBJ"
	-@erase "$(INTDIR)\TTSFNC.OBJ"
	-@erase "$(INTDIR)\TTSTST.OBJ"
	-@erase "$(INTDIR)\Ttstst.pch"
	-@erase "$(INTDIR)\TTSTST.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Ttstest.exe"
	-@erase "$(OUTDIR)\Ttstest.ilk"
	-@erase "$(OUTDIR)\Ttstest.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\TTSTST.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Ttstst.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\sapi\build\dtlkttse\la\debug\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /incremental:yes /pdb:"$(OUTDIR)\Ttstest.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Ttstest.exe" /SUBSYSTEM:windows,4.0 
LINK32_OBJS= \
	"$(INTDIR)\DLGFINDM.OBJ" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\STDAFX.OBJ" \
	"$(INTDIR)\TABISRCE.OBJ" \
	"$(INTDIR)\TTSDLG.OBJ" \
	"$(INTDIR)\TTSFNC.OBJ" \
	"$(INTDIR)\TTSTST.OBJ" \
	"$(INTDIR)\TTSTST.res"

"$(OUTDIR)\Ttstest.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel United Kingdom"

OUTDIR=.\build\uk\release
INTDIR=.\build\uk\release\link
# Begin Custom Macros
OutDir=.\build\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\Ttstest.exe"


CLEAN :
	-@erase "$(INTDIR)\DLGFINDM.OBJ"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\STDAFX.OBJ"
	-@erase "$(INTDIR)\TABISRCE.OBJ"
	-@erase "$(INTDIR)\TTSDLG.OBJ"
	-@erase "$(INTDIR)\TTSFNC.OBJ"
	-@erase "$(INTDIR)\TTSTST.OBJ"
	-@erase "$(INTDIR)\Ttstst.pch"
	-@erase "$(INTDIR)\TTSTST.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Ttstest.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_UK" /D "ENGLISH" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\TTSTST.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Ttstst.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\sapi\build\dtlkttse\uk\release\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /incremental:no /pdb:"$(OUTDIR)\Ttstest.pdb" /machine:I386 /out:"$(OUTDIR)\Ttstest.exe" /SUBSYSTEM:windows,4.0 
LINK32_OBJS= \
	"$(INTDIR)\DLGFINDM.OBJ" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\STDAFX.OBJ" \
	"$(INTDIR)\TABISRCE.OBJ" \
	"$(INTDIR)\TTSDLG.OBJ" \
	"$(INTDIR)\TTSFNC.OBJ" \
	"$(INTDIR)\TTSTST.OBJ" \
	"$(INTDIR)\TTSTST.res"

"$(OUTDIR)\Ttstest.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug United Kingdom"

OUTDIR=.\build\uk\A2ADebug
INTDIR=.\build\uk\A2ADebug\link
# Begin Custom Macros
OutDir=.\build\uk\A2ADebug
# End Custom Macros

ALL : "$(OUTDIR)\Ttstest.exe"


CLEAN :
	-@erase "$(INTDIR)\DLGFINDM.OBJ"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\STDAFX.OBJ"
	-@erase "$(INTDIR)\TABISRCE.OBJ"
	-@erase "$(INTDIR)\TTSDLG.OBJ"
	-@erase "$(INTDIR)\TTSFNC.OBJ"
	-@erase "$(INTDIR)\TTSTST.OBJ"
	-@erase "$(INTDIR)\Ttstst.pch"
	-@erase "$(INTDIR)\TTSTST.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Ttstest.exe"
	-@erase "$(OUTDIR)\Ttstest.ilk"
	-@erase "$(OUTDIR)\Ttstest.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_UK" /D "ENGLISH" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\TTSTST.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Ttstst.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\sapi\build\dtlkttse\uk\debug\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /incremental:yes /pdb:"$(OUTDIR)\Ttstest.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Ttstest.exe" /SUBSYSTEM:windows,4.0 
LINK32_OBJS= \
	"$(INTDIR)\DLGFINDM.OBJ" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\STDAFX.OBJ" \
	"$(INTDIR)\TABISRCE.OBJ" \
	"$(INTDIR)\TTSDLG.OBJ" \
	"$(INTDIR)\TTSFNC.OBJ" \
	"$(INTDIR)\TTSTST.OBJ" \
	"$(INTDIR)\TTSTST.res"

"$(OUTDIR)\Ttstest.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug French"

OUTDIR=.\build\fr\A2ADebug
INTDIR=.\build\fr\A2ADebug\link
# Begin Custom Macros
OutDir=.\build\fr\A2ADebug
# End Custom Macros

ALL : "$(OUTDIR)\Ttstest.exe"


CLEAN :
	-@erase "$(INTDIR)\DLGFINDM.OBJ"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\STDAFX.OBJ"
	-@erase "$(INTDIR)\TABISRCE.OBJ"
	-@erase "$(INTDIR)\TTSDLG.OBJ"
	-@erase "$(INTDIR)\TTSFNC.OBJ"
	-@erase "$(INTDIR)\TTSTST.OBJ"
	-@erase "$(INTDIR)\Ttstst.pch"
	-@erase "$(INTDIR)\TTSTST.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Ttstest.exe"
	-@erase "$(OUTDIR)\Ttstest.ilk"
	-@erase "$(OUTDIR)\Ttstest.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "FRENCH" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\TTSTST.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Ttstst.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\sapi\build\dtlkttse\fr\debug\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /incremental:yes /pdb:"$(OUTDIR)\Ttstest.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Ttstest.exe" /SUBSYSTEM:windows,4.0 
LINK32_OBJS= \
	"$(INTDIR)\DLGFINDM.OBJ" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\STDAFX.OBJ" \
	"$(INTDIR)\TABISRCE.OBJ" \
	"$(INTDIR)\TTSDLG.OBJ" \
	"$(INTDIR)\TTSFNC.OBJ" \
	"$(INTDIR)\TTSTST.OBJ" \
	"$(INTDIR)\TTSTST.res"

"$(OUTDIR)\Ttstest.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel French"

OUTDIR=.\build\fr\release
INTDIR=.\build\fr\release\link
# Begin Custom Macros
OutDir=.\build\fr\release
# End Custom Macros

ALL : "$(OUTDIR)\Ttstest.exe"


CLEAN :
	-@erase "$(INTDIR)\DLGFINDM.OBJ"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\STDAFX.OBJ"
	-@erase "$(INTDIR)\TABISRCE.OBJ"
	-@erase "$(INTDIR)\TTSDLG.OBJ"
	-@erase "$(INTDIR)\TTSFNC.OBJ"
	-@erase "$(INTDIR)\TTSTST.OBJ"
	-@erase "$(INTDIR)\Ttstst.pch"
	-@erase "$(INTDIR)\TTSTST.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Ttstest.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "FRENCH" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\TTSTST.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Ttstst.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\sapi\build\dtlkttse\fr\release\dtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /incremental:no /pdb:"$(OUTDIR)\Ttstest.pdb" /machine:I386 /out:"$(OUTDIR)\Ttstest.exe" /SUBSYSTEM:windows,4.0 
LINK32_OBJS= \
	"$(INTDIR)\DLGFINDM.OBJ" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\STDAFX.OBJ" \
	"$(INTDIR)\TABISRCE.OBJ" \
	"$(INTDIR)\TTSDLG.OBJ" \
	"$(INTDIR)\TTSFNC.OBJ" \
	"$(INTDIR)\TTSTST.OBJ" \
	"$(INTDIR)\TTSTST.res"

"$(OUTDIR)\Ttstest.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Ttstst.dep")
!INCLUDE "Ttstst.dep"
!ELSE 
!MESSAGE Warning: cannot find "Ttstst.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "Ttstst - Win32 A2WRel" || "$(CFG)" == "Ttstst - Win32 A2WDebug" || "$(CFG)" == "Ttstst - Win32 A2ADebug" || "$(CFG)" == "Ttstst - Win32 A2ARel" || "$(CFG)" == "Ttstst - Win32 W2ADebug" || "$(CFG)" == "Ttstst - Win32 W2ARel" || "$(CFG)" == "Ttstst - Win32 W2WDebug" || "$(CFG)" == "Ttstst - Win32 W2WRel" || "$(CFG)" == "Ttstst - Win32 A2ARel Spanish" || "$(CFG)" == "Ttstst - Win32 A2ADebug Spanish" || "$(CFG)" == "Ttstst - Win32 A2ARel German" || "$(CFG)" == "Ttstst - Win32 A2ADebug German" || "$(CFG)" == "Ttstst - Win32 A2ARel Latin American" || "$(CFG)" == "Ttstst - Win32 A2ADebug Latin American" || "$(CFG)" == "Ttstst - Win32 A2ARel United Kingdom" || "$(CFG)" == "Ttstst - Win32 A2ADebug United Kingdom" || "$(CFG)" == "Ttstst - Win32 A2ADebug French" || "$(CFG)" == "Ttstst - Win32 A2ARel French"
SOURCE=.\DLGFINDM.CPP

!IF  "$(CFG)" == "Ttstst - Win32 A2WRel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_S_UNICODE" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\DLGFINDM.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2WDebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_S_UNICODE" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\DLGFINDM.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /D "ENGLISH" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\DLGFINDM.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /D "ENGLISH" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\DLGFINDM.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2ADebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_UNICODE" /D "_S_ANSI" /D "_AFXDLL" /D "ENGLISH_US" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\DLGFINDM.OBJ"	"$(INTDIR)\DLGFINDM.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2ARel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_UNICODE" /D "_S_ANSI" /D "_AFXDLL" /D "ENGLISH_US" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\DLGFINDM.OBJ"	"$(INTDIR)\DLGFINDM.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2WDebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_UNICODE" /D "_AFXDLL" /D "ENGLISH_US" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\DLGFINDM.OBJ"	"$(INTDIR)\DLGFINDM.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2WRel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_UNICODE" /D "_AFXDLL" /D "ENGLISH_US" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\DLGFINDM.OBJ"	"$(INTDIR)\DLGFINDM.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel Spanish"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "SPANISH" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /D "SPANISH_SP" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\DLGFINDM.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug Spanish"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "SPANISH" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /D "SPANISH_SP" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\DLGFINDM.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel German"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\DLGFINDM.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug German"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\DLGFINDM.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel Latin American"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\DLGFINDM.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug Latin American"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\DLGFINDM.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel United Kingdom"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_UK" /D "ENGLISH" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\DLGFINDM.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug United Kingdom"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_UK" /D "ENGLISH" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\DLGFINDM.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug French"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "FRENCH" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\DLGFINDM.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel French"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "FRENCH" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\DLGFINDM.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=..\..\sapi\src\API\guidseg.cpp

!IF  "$(CFG)" == "Ttstst - Win32 A2WRel"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2WDebug"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2ADebug"


"$(INTDIR)\guidseg.obj"	"$(INTDIR)\guidseg.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2ARel"


"$(INTDIR)\guidseg.obj"	"$(INTDIR)\guidseg.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2WDebug"


"$(INTDIR)\guidseg.obj"	"$(INTDIR)\guidseg.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2WRel"


"$(INTDIR)\guidseg.obj"	"$(INTDIR)\guidseg.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel Spanish"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug Spanish"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel German"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug German"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel Latin American"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug Latin American"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel United Kingdom"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug United Kingdom"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug French"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel French"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\STDAFX.CPP

!IF  "$(CFG)" == "Ttstst - Win32 A2WRel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_S_UNICODE" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /Fp"$(INTDIR)\Ttstst.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\STDAFX.OBJ"	"$(INTDIR)\Ttstst.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2WDebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_S_UNICODE" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /Fp"$(INTDIR)\Ttstst.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\STDAFX.OBJ"	"$(INTDIR)\Ttstst.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /D "ENGLISH" /Fp"$(INTDIR)\Ttstst.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\STDAFX.OBJ"	"$(INTDIR)\Ttstst.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /D "ENGLISH" /Fp"$(INTDIR)\Ttstst.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\STDAFX.OBJ"	"$(INTDIR)\Ttstst.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2ADebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_UNICODE" /D "_S_ANSI" /D "_AFXDLL" /D "ENGLISH_US" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Ttstst.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\STDAFX.OBJ"	"$(INTDIR)\STDAFX.SBR"	"$(INTDIR)\Ttstst.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2ARel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_UNICODE" /D "_S_ANSI" /D "_AFXDLL" /D "ENGLISH_US" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Ttstst.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\STDAFX.OBJ"	"$(INTDIR)\STDAFX.SBR"	"$(INTDIR)\Ttstst.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2WDebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_UNICODE" /D "_AFXDLL" /D "ENGLISH_US" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Ttstst.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\STDAFX.OBJ"	"$(INTDIR)\STDAFX.SBR"	"$(INTDIR)\Ttstst.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2WRel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_UNICODE" /D "_AFXDLL" /D "ENGLISH_US" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Ttstst.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\STDAFX.OBJ"	"$(INTDIR)\STDAFX.SBR"	"$(INTDIR)\Ttstst.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel Spanish"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "SPANISH" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /D "SPANISH_SP" /Fp"$(INTDIR)\Ttstst.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\STDAFX.OBJ"	"$(INTDIR)\Ttstst.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug Spanish"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "SPANISH" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /D "SPANISH_SP" /Fp"$(INTDIR)\Ttstst.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\STDAFX.OBJ"	"$(INTDIR)\Ttstst.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel German"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\Ttstst.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\STDAFX.OBJ"	"$(INTDIR)\Ttstst.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug German"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\Ttstst.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\STDAFX.OBJ"	"$(INTDIR)\Ttstst.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel Latin American"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\Ttstst.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\STDAFX.OBJ"	"$(INTDIR)\Ttstst.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug Latin American"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\Ttstst.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\STDAFX.OBJ"	"$(INTDIR)\Ttstst.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel United Kingdom"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_UK" /D "ENGLISH" /Fp"$(INTDIR)\Ttstst.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\STDAFX.OBJ"	"$(INTDIR)\Ttstst.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug United Kingdom"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_UK" /D "ENGLISH" /Fp"$(INTDIR)\Ttstst.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\STDAFX.OBJ"	"$(INTDIR)\Ttstst.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug French"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "FRENCH" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\Ttstst.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\STDAFX.OBJ"	"$(INTDIR)\Ttstst.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel French"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "FRENCH" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\Ttstst.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\STDAFX.OBJ"	"$(INTDIR)\Ttstst.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\TABISRCE.CPP

!IF  "$(CFG)" == "Ttstst - Win32 A2WRel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_S_UNICODE" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TABISRCE.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2WDebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_S_UNICODE" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TABISRCE.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /D "ENGLISH" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TABISRCE.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /D "ENGLISH" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TABISRCE.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2ADebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_UNICODE" /D "_S_ANSI" /D "_AFXDLL" /D "ENGLISH_US" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TABISRCE.OBJ"	"$(INTDIR)\TABISRCE.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2ARel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_UNICODE" /D "_S_ANSI" /D "_AFXDLL" /D "ENGLISH_US" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TABISRCE.OBJ"	"$(INTDIR)\TABISRCE.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2WDebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_UNICODE" /D "_AFXDLL" /D "ENGLISH_US" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TABISRCE.OBJ"	"$(INTDIR)\TABISRCE.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2WRel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_UNICODE" /D "_AFXDLL" /D "ENGLISH_US" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TABISRCE.OBJ"	"$(INTDIR)\TABISRCE.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel Spanish"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "SPANISH" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /D "SPANISH_SP" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TABISRCE.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug Spanish"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "SPANISH" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /D "SPANISH_SP" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TABISRCE.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel German"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TABISRCE.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug German"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TABISRCE.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel Latin American"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TABISRCE.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug Latin American"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TABISRCE.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel United Kingdom"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_UK" /D "ENGLISH" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TABISRCE.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug United Kingdom"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_UK" /D "ENGLISH" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TABISRCE.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug French"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "FRENCH" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TABISRCE.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel French"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "FRENCH" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TABISRCE.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\TTSDLG.CPP

!IF  "$(CFG)" == "Ttstst - Win32 A2WRel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_S_UNICODE" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSDLG.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2WDebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_S_UNICODE" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSDLG.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /D "ENGLISH" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSDLG.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /D "ENGLISH" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSDLG.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2ADebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_UNICODE" /D "_S_ANSI" /D "_AFXDLL" /D "ENGLISH_US" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSDLG.OBJ"	"$(INTDIR)\TTSDLG.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2ARel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_UNICODE" /D "_S_ANSI" /D "_AFXDLL" /D "ENGLISH_US" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSDLG.OBJ"	"$(INTDIR)\TTSDLG.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2WDebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_UNICODE" /D "_AFXDLL" /D "ENGLISH_US" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSDLG.OBJ"	"$(INTDIR)\TTSDLG.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2WRel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_UNICODE" /D "_AFXDLL" /D "ENGLISH_US" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSDLG.OBJ"	"$(INTDIR)\TTSDLG.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel Spanish"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "SPANISH" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /D "SPANISH_SP" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSDLG.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug Spanish"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "SPANISH" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /D "SPANISH_SP" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSDLG.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel German"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSDLG.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug German"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSDLG.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel Latin American"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSDLG.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug Latin American"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSDLG.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel United Kingdom"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_UK" /D "ENGLISH" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSDLG.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug United Kingdom"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_UK" /D "ENGLISH" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSDLG.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug French"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "FRENCH" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSDLG.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel French"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "FRENCH" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSDLG.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\TTSFNC.CPP

!IF  "$(CFG)" == "Ttstst - Win32 A2WRel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_S_UNICODE" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSFNC.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2WDebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_S_UNICODE" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSFNC.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /D "ENGLISH" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSFNC.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /D "ENGLISH" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSFNC.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2ADebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_UNICODE" /D "_S_ANSI" /D "_AFXDLL" /D "ENGLISH_US" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSFNC.OBJ"	"$(INTDIR)\TTSFNC.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2ARel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_UNICODE" /D "_S_ANSI" /D "_AFXDLL" /D "ENGLISH_US" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSFNC.OBJ"	"$(INTDIR)\TTSFNC.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2WDebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_UNICODE" /D "_AFXDLL" /D "ENGLISH_US" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSFNC.OBJ"	"$(INTDIR)\TTSFNC.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2WRel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_UNICODE" /D "_AFXDLL" /D "ENGLISH_US" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSFNC.OBJ"	"$(INTDIR)\TTSFNC.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel Spanish"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "SPANISH" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /D "SPANISH_SP" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSFNC.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug Spanish"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "SPANISH" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /D "SPANISH_SP" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSFNC.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel German"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSFNC.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug German"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSFNC.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel Latin American"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSFNC.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug Latin American"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSFNC.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel United Kingdom"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_UK" /D "ENGLISH" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSFNC.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug United Kingdom"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_UK" /D "ENGLISH" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSFNC.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug French"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "FRENCH" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSFNC.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel French"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "FRENCH" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSFNC.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\TTSTST.CPP

!IF  "$(CFG)" == "Ttstst - Win32 A2WRel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_S_UNICODE" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSTST.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2WDebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_S_UNICODE" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSTST.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /D "ENGLISH" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSTST.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_US" /D "ENGLISH" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSTST.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2ADebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_UNICODE" /D "_S_ANSI" /D "_AFXDLL" /D "ENGLISH_US" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSTST.OBJ"	"$(INTDIR)\TTSTST.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2ARel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_UNICODE" /D "_S_ANSI" /D "_AFXDLL" /D "ENGLISH_US" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSTST.OBJ"	"$(INTDIR)\TTSTST.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2WDebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_UNICODE" /D "_AFXDLL" /D "ENGLISH_US" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSTST.OBJ"	"$(INTDIR)\TTSTST.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 W2WRel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_UNICODE" /D "_AFXDLL" /D "ENGLISH_US" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSTST.OBJ"	"$(INTDIR)\TTSTST.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel Spanish"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "SPANISH" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /D "SPANISH_SP" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSTST.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug Spanish"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "SPANISH" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /D "SPANISH_SP" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSTST.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel German"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSTST.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug German"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSTST.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel Latin American"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSTST.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug Latin American"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSTST.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel United Kingdom"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_UK" /D "ENGLISH" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSTST.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug United Kingdom"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "ENGLISH_UK" /D "ENGLISH" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSTST.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ADebug French"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\microsoft" /D "_DEBUG" /D "FRENCH" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSTST.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Ttstst - Win32 A2ARel French"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\microsoft" /D "NDEBUG" /D "FRENCH" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\Ttstst.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\TTSTST.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Ttstst.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\TTSTST.RC

"$(INTDIR)\TTSTST.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)



!ENDIF 

