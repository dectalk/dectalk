# Microsoft Developer Studio Generated NMAKE File, Based on Wttstest.dsp
!IF "$(CFG)" == ""
CFG=Wttstst - Win32 A2ADebug French
!MESSAGE No configuration specified. Defaulting to Wttstst - Win32 A2ADebug French.
!ENDIF 

!IF "$(CFG)" != "Wttstst - Win32 A2WRel" && "$(CFG)" != "Wttstst - Win32 A2WDebug" && "$(CFG)" != "Wttstst - Win32 A2ADebug" && "$(CFG)" != "Wttstst - Win32 A2ARel" && "$(CFG)" != "Wttstst - Win32 W2ADebug" && "$(CFG)" != "Wttstst - Win32 W2ARel" && "$(CFG)" != "Wttstst - Win32 W2WDebug" && "$(CFG)" != "Wttstst - Win32 W2WRel" && "$(CFG)" != "Wttstst - Win32 A2ARel Spanish" && "$(CFG)" != "Wttstst - Win32 A2ARel German" && "$(CFG)" != "Wttstst - Win32 A2ARel Latin American" && "$(CFG)" != "Wttstst - Win32 A2ADebug Spanish" && "$(CFG)" != "Wttstst - Win32 A2ADebug German" && "$(CFG)" != "Wttstst - Win32 A2ADebug Latin American" && "$(CFG)" != "Wttstst - Win32 A2ARel United Kingdom" && "$(CFG)" != "Wttstst - Win32 A2ADebug United Kingdom" && "$(CFG)" != "Wttstst - Win32 A2ADebug French" && "$(CFG)" != "Wttstst - Win32 A2ARel French"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "Wttstest.mak" CFG="Wttstst - Win32 A2ADebug French"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Wttstst - Win32 A2WRel" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 A2WDebug" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 A2ADebug" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 A2ARel" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 W2ADebug" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 W2ARel" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 W2WDebug" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 W2WRel" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 A2ARel Spanish" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 A2ARel German" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 A2ARel Latin American" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 A2ADebug Spanish" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 A2ADebug German" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 A2ADebug Latin American" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 A2ARel United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 A2ADebug United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 A2ADebug French" (based on "Win32 (x86) Application")
!MESSAGE "Wttstst - Win32 A2ARel French" (based on "Win32 (x86) Application")
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

!IF  "$(CFG)" == "Wttstst - Win32 A2WRel"

OUTDIR=.\build\us\A2WRel
INTDIR=.\build\us\A2WRel\link
# Begin Custom Macros
OutDir=.\build\us\A2WRel
# End Custom Macros

ALL : "$(OUTDIR)\Wttstest.exe"


CLEAN :
	-@erase "$(INTDIR)\DLGFINDM.OBJ"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\STDAFX.OBJ"
	-@erase "$(INTDIR)\TABISRCE.OBJ"
	-@erase "$(INTDIR)\TTSDLG.OBJ"
	-@erase "$(INTDIR)\TTSFNC.OBJ"
	-@erase "$(INTDIR)\TTSTST.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\Wttstest.pch"
	-@erase "$(OUTDIR)\Wttstest.exe"
	-@erase ".\build\us\release\link\WTTSTST.res"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_S_UNICODE" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x409 /fo".\build\us\release\link\WTTSTST.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttstest.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\sapi\build\wtlkttse\us\release\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /incremental:no /pdb:"$(OUTDIR)\Wttstest.pdb" /machine:I386 /out:"$(OUTDIR)\Wttstest.exe" /SUBSYSTEM:windows,4.0 
LINK32_OBJS= \
	"$(INTDIR)\DLGFINDM.OBJ" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\STDAFX.OBJ" \
	"$(INTDIR)\TABISRCE.OBJ" \
	"$(INTDIR)\TTSDLG.OBJ" \
	"$(INTDIR)\TTSFNC.OBJ" \
	"$(INTDIR)\TTSTST.OBJ" \
	".\build\us\release\link\WTTSTST.res"

"$(OUTDIR)\Wttstest.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2WDebug"

OUTDIR=.\build\us\A2WDebug
INTDIR=.\build\us\A2WDebug\link
# Begin Custom Macros
OutDir=.\build\us\A2WDebug
# End Custom Macros

ALL : "$(OUTDIR)\Wttstest.exe"


CLEAN :
	-@erase "$(INTDIR)\DLGFINDM.OBJ"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\STDAFX.OBJ"
	-@erase "$(INTDIR)\TABISRCE.OBJ"
	-@erase "$(INTDIR)\TTSDLG.OBJ"
	-@erase "$(INTDIR)\TTSFNC.OBJ"
	-@erase "$(INTDIR)\TTSTST.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\Wttstest.pch"
	-@erase "$(INTDIR)\WTTSTST.res"
	-@erase "$(OUTDIR)\Wttstest.exe"
	-@erase "$(OUTDIR)\Wttstest.ilk"
	-@erase "$(OUTDIR)\Wttstest.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_S_UNICODE" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\WTTSTST.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttstest.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\sapi\build\wtlkttse\us\debug\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /incremental:yes /pdb:"$(OUTDIR)\Wttstest.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Wttstest.exe" /SUBSYSTEM:windows,4.0 
LINK32_OBJS= \
	"$(INTDIR)\DLGFINDM.OBJ" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\STDAFX.OBJ" \
	"$(INTDIR)\TABISRCE.OBJ" \
	"$(INTDIR)\TTSDLG.OBJ" \
	"$(INTDIR)\TTSFNC.OBJ" \
	"$(INTDIR)\TTSTST.OBJ" \
	"$(INTDIR)\WTTSTST.res"

"$(OUTDIR)\Wttstest.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug"

OUTDIR=.\build\us\A2ADebug
INTDIR=.\build\us\A2ADebug\link
# Begin Custom Macros
OutDir=.\build\us\A2ADebug
# End Custom Macros

ALL : "$(OUTDIR)\Wttstest.exe" "$(OUTDIR)\Wttstest.bsc"


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
	-@erase "$(INTDIR)\TTSTST.SBR"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\Wttstest.pch"
	-@erase "$(INTDIR)\WTTSTST.res"
	-@erase "$(OUTDIR)\Wttstest.bsc"
	-@erase "$(OUTDIR)\Wttstest.exe"
	-@erase "$(OUTDIR)\Wttstest.ilk"
	-@erase "$(OUTDIR)\Wttstest.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "ENGLISH" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\WTTSTST.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttstest.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\DLGFINDM.SBR" \
	"$(INTDIR)\guidseg.sbr" \
	"$(INTDIR)\STDAFX.SBR" \
	"$(INTDIR)\TABISRCE.SBR" \
	"$(INTDIR)\TTSDLG.SBR" \
	"$(INTDIR)\TTSFNC.SBR" \
	"$(INTDIR)\TTSTST.SBR"

"$(OUTDIR)\Wttstest.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=..\..\sapi\build\wtlkttse\us\debug\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /incremental:yes /pdb:"$(OUTDIR)\Wttstest.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Wttstest.exe" /SUBSYSTEM:windows,4.0 
LINK32_OBJS= \
	"$(INTDIR)\DLGFINDM.OBJ" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\STDAFX.OBJ" \
	"$(INTDIR)\TABISRCE.OBJ" \
	"$(INTDIR)\TTSDLG.OBJ" \
	"$(INTDIR)\TTSFNC.OBJ" \
	"$(INTDIR)\TTSTST.OBJ" \
	"$(INTDIR)\WTTSTST.res"

"$(OUTDIR)\Wttstest.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel"

OUTDIR=.\build\us\release
INTDIR=.\build\us\release\link
# Begin Custom Macros
OutDir=.\build\us\release
# End Custom Macros

ALL : "$(OUTDIR)\Wttstest.exe"


CLEAN :
	-@erase "$(INTDIR)\DLGFINDM.OBJ"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\STDAFX.OBJ"
	-@erase "$(INTDIR)\TABISRCE.OBJ"
	-@erase "$(INTDIR)\TTSDLG.OBJ"
	-@erase "$(INTDIR)\TTSFNC.OBJ"
	-@erase "$(INTDIR)\TTSTST.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\Wttstest.pch"
	-@erase "$(INTDIR)\WTTSTST.res"
	-@erase "$(OUTDIR)\Wttstest.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "ENGLISH" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\WTTSTST.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttstest.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\sapi\build\wtlkttse\us\release\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /incremental:no /pdb:"$(OUTDIR)\Wttstest.pdb" /machine:I386 /out:"$(OUTDIR)\Wttstest.exe" /SUBSYSTEM:windows,4.0 
LINK32_OBJS= \
	"$(INTDIR)\DLGFINDM.OBJ" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\STDAFX.OBJ" \
	"$(INTDIR)\TABISRCE.OBJ" \
	"$(INTDIR)\TTSDLG.OBJ" \
	"$(INTDIR)\TTSFNC.OBJ" \
	"$(INTDIR)\TTSTST.OBJ" \
	"$(INTDIR)\WTTSTST.res"

"$(OUTDIR)\Wttstest.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2ADebug"

OUTDIR=.\build\us\W2ADebug
INTDIR=.\build\us\W2ADebug\link
# Begin Custom Macros
OutDir=.\build\us\W2ADebug
# End Custom Macros

ALL : "$(OUTDIR)\Wttstest.exe" "$(OUTDIR)\Wttstest.bsc"


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
	-@erase "$(INTDIR)\TTSTST.SBR"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\Wttstest.pch"
	-@erase "$(INTDIR)\WTTSTST.res"
	-@erase "$(OUTDIR)\Wttstest.bsc"
	-@erase "$(OUTDIR)\Wttstest.exe"
	-@erase "$(OUTDIR)\Wttstest.ilk"
	-@erase "$(OUTDIR)\Wttstest.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_UNICODE" /D "_S_ANSI" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\WTTSTST.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttstest.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\DLGFINDM.SBR" \
	"$(INTDIR)\guidseg.sbr" \
	"$(INTDIR)\STDAFX.SBR" \
	"$(INTDIR)\TABISRCE.SBR" \
	"$(INTDIR)\TTSDLG.SBR" \
	"$(INTDIR)\TTSFNC.SBR" \
	"$(INTDIR)\TTSTST.SBR"

"$(OUTDIR)\Wttstest.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=..\..\sapi\build\wtlkttse\us\debug\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /entry:"wWinMainCRTStartup" /incremental:yes /pdb:"$(OUTDIR)\Wttstest.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Wttstest.exe" /SUBSYSTEM:windows,4.0 
LINK32_OBJS= \
	"$(INTDIR)\DLGFINDM.OBJ" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\STDAFX.OBJ" \
	"$(INTDIR)\TABISRCE.OBJ" \
	"$(INTDIR)\TTSDLG.OBJ" \
	"$(INTDIR)\TTSFNC.OBJ" \
	"$(INTDIR)\TTSTST.OBJ" \
	"$(INTDIR)\WTTSTST.res"

"$(OUTDIR)\Wttstest.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2ARel"

OUTDIR=.\build\us\W2ARel
INTDIR=.\build\us\W2ARel\link
# Begin Custom Macros
OutDir=.\build\us\W2ARel
# End Custom Macros

ALL : "$(OUTDIR)\Wttstest.exe"


CLEAN :
	-@erase "$(INTDIR)\DLGFINDM.OBJ"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\STDAFX.OBJ"
	-@erase "$(INTDIR)\TABISRCE.OBJ"
	-@erase "$(INTDIR)\TTSDLG.OBJ"
	-@erase "$(INTDIR)\TTSFNC.OBJ"
	-@erase "$(INTDIR)\TTSTST.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\Wttstest.pch"
	-@erase "$(INTDIR)\WTTSTST.res"
	-@erase "$(OUTDIR)\Wttstest.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_UNICODE" /D "_S_ANSI" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\WTTSTST.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttstest.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\sapi\build\wtlkttse\us\release\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /entry:"wWinMainCRTStartup" /incremental:no /pdb:"$(OUTDIR)\Wttstest.pdb" /machine:I386 /out:"$(OUTDIR)\Wttstest.exe" /SUBSYSTEM:windows,4.0 
LINK32_OBJS= \
	"$(INTDIR)\DLGFINDM.OBJ" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\STDAFX.OBJ" \
	"$(INTDIR)\TABISRCE.OBJ" \
	"$(INTDIR)\TTSDLG.OBJ" \
	"$(INTDIR)\TTSFNC.OBJ" \
	"$(INTDIR)\TTSTST.OBJ" \
	"$(INTDIR)\WTTSTST.res"

"$(OUTDIR)\Wttstest.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2WDebug"

OUTDIR=.\build\us\W2WDebug
INTDIR=.\build\us\W2WDebug\link
# Begin Custom Macros
OutDir=.\build\us\W2WDebug
# End Custom Macros

ALL : "$(OUTDIR)\Wttstest.exe" "$(OUTDIR)\Wttstest.bsc"


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
	-@erase "$(INTDIR)\TTSTST.SBR"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\Wttstest.pch"
	-@erase "$(INTDIR)\WTTSTST.res"
	-@erase "$(OUTDIR)\Wttstest.bsc"
	-@erase "$(OUTDIR)\Wttstest.exe"
	-@erase "$(OUTDIR)\Wttstest.ilk"
	-@erase "$(OUTDIR)\Wttstest.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_UNICODE" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\WTTSTST.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttstest.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\DLGFINDM.SBR" \
	"$(INTDIR)\guidseg.sbr" \
	"$(INTDIR)\STDAFX.SBR" \
	"$(INTDIR)\TABISRCE.SBR" \
	"$(INTDIR)\TTSDLG.SBR" \
	"$(INTDIR)\TTSFNC.SBR" \
	"$(INTDIR)\TTSTST.SBR"

"$(OUTDIR)\Wttstest.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=..\..\sapi\build\wtlkttse\us\debug\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /entry:"wWinMainCRTStartup" /incremental:yes /pdb:"$(OUTDIR)\Wttstest.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Wttstest.exe" /SUBSYSTEM:windows,4.0 
LINK32_OBJS= \
	"$(INTDIR)\DLGFINDM.OBJ" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\STDAFX.OBJ" \
	"$(INTDIR)\TABISRCE.OBJ" \
	"$(INTDIR)\TTSDLG.OBJ" \
	"$(INTDIR)\TTSFNC.OBJ" \
	"$(INTDIR)\TTSTST.OBJ" \
	"$(INTDIR)\WTTSTST.res"

"$(OUTDIR)\Wttstest.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2WRel"

OUTDIR=.\build\us\W2WRel
INTDIR=.\build\us\W2WRel\link
# Begin Custom Macros
OutDir=.\build\us\W2WRel
# End Custom Macros

ALL : "$(OUTDIR)\Wttstest.exe"


CLEAN :
	-@erase "$(INTDIR)\DLGFINDM.OBJ"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\STDAFX.OBJ"
	-@erase "$(INTDIR)\TABISRCE.OBJ"
	-@erase "$(INTDIR)\TTSDLG.OBJ"
	-@erase "$(INTDIR)\TTSFNC.OBJ"
	-@erase "$(INTDIR)\TTSTST.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\Wttstest.pch"
	-@erase "$(INTDIR)\WTTSTST.res"
	-@erase "$(OUTDIR)\Wttstest.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_UNICODE" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\WTTSTST.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttstest.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\sapi\build\wtlkttse\us\release\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /entry:"wWinMainCRTStartup" /incremental:no /pdb:"$(OUTDIR)\Wttstest.pdb" /machine:I386 /out:"$(OUTDIR)\Wttstest.exe" /SUBSYSTEM:windows,4.0 
LINK32_OBJS= \
	"$(INTDIR)\DLGFINDM.OBJ" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\STDAFX.OBJ" \
	"$(INTDIR)\TABISRCE.OBJ" \
	"$(INTDIR)\TTSDLG.OBJ" \
	"$(INTDIR)\TTSFNC.OBJ" \
	"$(INTDIR)\TTSTST.OBJ" \
	"$(INTDIR)\WTTSTST.res"

"$(OUTDIR)\Wttstest.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel Spanish"

OUTDIR=.\build\sp\release
INTDIR=.\build\sp\release\link
# Begin Custom Macros
OutDir=.\build\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\Wttstest.exe"


CLEAN :
	-@erase "$(INTDIR)\DLGFINDM.OBJ"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\STDAFX.OBJ"
	-@erase "$(INTDIR)\TABISRCE.OBJ"
	-@erase "$(INTDIR)\TTSDLG.OBJ"
	-@erase "$(INTDIR)\TTSFNC.OBJ"
	-@erase "$(INTDIR)\TTSTST.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\Wttstest.pch"
	-@erase "$(INTDIR)\WTTSTST.res"
	-@erase "$(OUTDIR)\Wttstest.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_SP" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\WTTSTST.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttstest.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\sapi\build\wtlkttse\sp\release\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /incremental:no /pdb:"$(OUTDIR)\Wttstest.pdb" /machine:I386 /out:"$(OUTDIR)\Wttstest.exe" /SUBSYSTEM:windows,4.0 
LINK32_OBJS= \
	"$(INTDIR)\DLGFINDM.OBJ" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\STDAFX.OBJ" \
	"$(INTDIR)\TABISRCE.OBJ" \
	"$(INTDIR)\TTSDLG.OBJ" \
	"$(INTDIR)\TTSFNC.OBJ" \
	"$(INTDIR)\TTSTST.OBJ" \
	"$(INTDIR)\WTTSTST.res"

"$(OUTDIR)\Wttstest.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel German"

OUTDIR=.\build\gr\release
INTDIR=.\build\gr\release\link
# Begin Custom Macros
OutDir=.\build\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\Wttstest.exe"


CLEAN :
	-@erase "$(INTDIR)\DLGFINDM.OBJ"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\STDAFX.OBJ"
	-@erase "$(INTDIR)\TABISRCE.OBJ"
	-@erase "$(INTDIR)\TTSDLG.OBJ"
	-@erase "$(INTDIR)\TTSFNC.OBJ"
	-@erase "$(INTDIR)\TTSTST.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\Wttstest.pch"
	-@erase "$(INTDIR)\WTTSTST.res"
	-@erase "$(OUTDIR)\Wttstest.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "GERMAN" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\WTTSTST.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttstest.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\sapi\build\wtlkttse\gr\release\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /incremental:no /pdb:"$(OUTDIR)\Wttstest.pdb" /machine:I386 /out:"$(OUTDIR)\Wttstest.exe" /SUBSYSTEM:windows,4.0 
LINK32_OBJS= \
	"$(INTDIR)\DLGFINDM.OBJ" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\STDAFX.OBJ" \
	"$(INTDIR)\TABISRCE.OBJ" \
	"$(INTDIR)\TTSDLG.OBJ" \
	"$(INTDIR)\TTSFNC.OBJ" \
	"$(INTDIR)\TTSTST.OBJ" \
	"$(INTDIR)\WTTSTST.res"

"$(OUTDIR)\Wttstest.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel Latin American"

OUTDIR=.\build\la\release
INTDIR=.\build\la\release\link
# Begin Custom Macros
OutDir=.\build\la\release
# End Custom Macros

ALL : "$(OUTDIR)\Wttstest.exe"


CLEAN :
	-@erase "$(INTDIR)\DLGFINDM.OBJ"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\STDAFX.OBJ"
	-@erase "$(INTDIR)\TABISRCE.OBJ"
	-@erase "$(INTDIR)\TTSDLG.OBJ"
	-@erase "$(INTDIR)\TTSFNC.OBJ"
	-@erase "$(INTDIR)\TTSTST.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\Wttstest.pch"
	-@erase "$(INTDIR)\WTTSTST.res"
	-@erase "$(OUTDIR)\Wttstest.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_LA" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\WTTSTST.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttstest.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\sapi\build\wtlkttse\la\release\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /incremental:no /pdb:"$(OUTDIR)\Wttstest.pdb" /machine:I386 /out:"$(OUTDIR)\Wttstest.exe" /SUBSYSTEM:windows,4.0 
LINK32_OBJS= \
	"$(INTDIR)\DLGFINDM.OBJ" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\STDAFX.OBJ" \
	"$(INTDIR)\TABISRCE.OBJ" \
	"$(INTDIR)\TTSDLG.OBJ" \
	"$(INTDIR)\TTSFNC.OBJ" \
	"$(INTDIR)\TTSTST.OBJ" \
	"$(INTDIR)\WTTSTST.res"

"$(OUTDIR)\Wttstest.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug Spanish"

OUTDIR=.\build\sp\A2Adebug
INTDIR=.\build\sp\A2Adebug\link
# Begin Custom Macros
OutDir=.\build\sp\A2Adebug
# End Custom Macros

ALL : "$(OUTDIR)\Wttstest.exe" "$(OUTDIR)\Wttstest.bsc"


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
	-@erase "$(INTDIR)\TTSTST.SBR"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\Wttstest.pch"
	-@erase "$(INTDIR)\WTTSTST.res"
	-@erase "$(OUTDIR)\Wttstest.bsc"
	-@erase "$(OUTDIR)\Wttstest.exe"
	-@erase "$(OUTDIR)\Wttstest.ilk"
	-@erase "$(OUTDIR)\Wttstest.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_SP" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\WTTSTST.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttstest.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\DLGFINDM.SBR" \
	"$(INTDIR)\guidseg.sbr" \
	"$(INTDIR)\STDAFX.SBR" \
	"$(INTDIR)\TABISRCE.SBR" \
	"$(INTDIR)\TTSDLG.SBR" \
	"$(INTDIR)\TTSFNC.SBR" \
	"$(INTDIR)\TTSTST.SBR"

"$(OUTDIR)\Wttstest.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=..\..\sapi\build\wtlkttse\sp\debug\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /incremental:yes /pdb:"$(OUTDIR)\Wttstest.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Wttstest.exe" /SUBSYSTEM:windows,4.0 
LINK32_OBJS= \
	"$(INTDIR)\DLGFINDM.OBJ" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\STDAFX.OBJ" \
	"$(INTDIR)\TABISRCE.OBJ" \
	"$(INTDIR)\TTSDLG.OBJ" \
	"$(INTDIR)\TTSFNC.OBJ" \
	"$(INTDIR)\TTSTST.OBJ" \
	"$(INTDIR)\WTTSTST.res"

"$(OUTDIR)\Wttstest.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug German"

OUTDIR=.\build\gr\A2Adebug
INTDIR=.\build\gr\A2Adebug\link
# Begin Custom Macros
OutDir=.\build\gr\A2Adebug
# End Custom Macros

ALL : "$(OUTDIR)\Wttstest.exe" "$(OUTDIR)\Wttstest.bsc"


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
	-@erase "$(INTDIR)\TTSTST.SBR"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\Wttstest.pch"
	-@erase "$(INTDIR)\WTTSTST.res"
	-@erase "$(OUTDIR)\Wttstest.bsc"
	-@erase "$(OUTDIR)\Wttstest.exe"
	-@erase "$(OUTDIR)\Wttstest.ilk"
	-@erase "$(OUTDIR)\Wttstest.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "GERMAN" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\WTTSTST.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttstest.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\DLGFINDM.SBR" \
	"$(INTDIR)\guidseg.sbr" \
	"$(INTDIR)\STDAFX.SBR" \
	"$(INTDIR)\TABISRCE.SBR" \
	"$(INTDIR)\TTSDLG.SBR" \
	"$(INTDIR)\TTSFNC.SBR" \
	"$(INTDIR)\TTSTST.SBR"

"$(OUTDIR)\Wttstest.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=..\..\sapi\build\wtlkttse\gr\debug\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /incremental:yes /pdb:"$(OUTDIR)\Wttstest.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Wttstest.exe" /SUBSYSTEM:windows,4.0 
LINK32_OBJS= \
	"$(INTDIR)\DLGFINDM.OBJ" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\STDAFX.OBJ" \
	"$(INTDIR)\TABISRCE.OBJ" \
	"$(INTDIR)\TTSDLG.OBJ" \
	"$(INTDIR)\TTSFNC.OBJ" \
	"$(INTDIR)\TTSTST.OBJ" \
	"$(INTDIR)\WTTSTST.res"

"$(OUTDIR)\Wttstest.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug Latin American"

OUTDIR=.\build\la\A2Adebug
INTDIR=.\build\la\A2Adebug\link
# Begin Custom Macros
OutDir=.\build\la\A2Adebug
# End Custom Macros

ALL : "$(OUTDIR)\Wttstest.exe" "$(OUTDIR)\Wttstest.bsc"


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
	-@erase "$(INTDIR)\TTSTST.SBR"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\Wttstest.pch"
	-@erase "$(INTDIR)\WTTSTST.res"
	-@erase "$(OUTDIR)\Wttstest.bsc"
	-@erase "$(OUTDIR)\Wttstest.exe"
	-@erase "$(OUTDIR)\Wttstest.ilk"
	-@erase "$(OUTDIR)\Wttstest.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_LA" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\WTTSTST.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttstest.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\DLGFINDM.SBR" \
	"$(INTDIR)\guidseg.sbr" \
	"$(INTDIR)\STDAFX.SBR" \
	"$(INTDIR)\TABISRCE.SBR" \
	"$(INTDIR)\TTSDLG.SBR" \
	"$(INTDIR)\TTSFNC.SBR" \
	"$(INTDIR)\TTSTST.SBR"

"$(OUTDIR)\Wttstest.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=..\..\sapi\build\wtlkttse\la\debug\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /incremental:yes /pdb:"$(OUTDIR)\Wttstest.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Wttstest.exe" /SUBSYSTEM:windows,4.0 
LINK32_OBJS= \
	"$(INTDIR)\DLGFINDM.OBJ" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\STDAFX.OBJ" \
	"$(INTDIR)\TABISRCE.OBJ" \
	"$(INTDIR)\TTSDLG.OBJ" \
	"$(INTDIR)\TTSFNC.OBJ" \
	"$(INTDIR)\TTSTST.OBJ" \
	"$(INTDIR)\WTTSTST.res"

"$(OUTDIR)\Wttstest.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel United Kingdom"

OUTDIR=.\build\uk\release
INTDIR=.\build\uk\release\link
# Begin Custom Macros
OutDir=.\build\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\Wttstest.exe"


CLEAN :
	-@erase "$(INTDIR)\DLGFINDM.OBJ"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\STDAFX.OBJ"
	-@erase "$(INTDIR)\TABISRCE.OBJ"
	-@erase "$(INTDIR)\TTSDLG.OBJ"
	-@erase "$(INTDIR)\TTSFNC.OBJ"
	-@erase "$(INTDIR)\TTSTST.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\Wttstest.pch"
	-@erase "$(INTDIR)\WTTSTST.res"
	-@erase "$(OUTDIR)\Wttstest.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "ENGLISH_UK" /D "ENGLISH" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\WTTSTST.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttstest.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\sapi\build\wtlkttse\uk\release\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /incremental:no /pdb:"$(OUTDIR)\Wttstest.pdb" /machine:I386 /out:"$(OUTDIR)\Wttstest.exe" /SUBSYSTEM:windows,4.0 
LINK32_OBJS= \
	"$(INTDIR)\DLGFINDM.OBJ" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\STDAFX.OBJ" \
	"$(INTDIR)\TABISRCE.OBJ" \
	"$(INTDIR)\TTSDLG.OBJ" \
	"$(INTDIR)\TTSFNC.OBJ" \
	"$(INTDIR)\TTSTST.OBJ" \
	"$(INTDIR)\WTTSTST.res"

"$(OUTDIR)\Wttstest.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug United Kingdom"

OUTDIR=.\build\uk\A2Adebug
INTDIR=.\build\uk\A2Adebug\link
# Begin Custom Macros
OutDir=.\build\uk\A2Adebug
# End Custom Macros

ALL : "$(OUTDIR)\Wttstest.exe" "$(OUTDIR)\Wttstest.bsc"


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
	-@erase "$(INTDIR)\TTSTST.SBR"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\Wttstest.pch"
	-@erase "$(INTDIR)\WTTSTST.res"
	-@erase "$(OUTDIR)\Wttstest.bsc"
	-@erase "$(OUTDIR)\Wttstest.exe"
	-@erase "$(OUTDIR)\Wttstest.ilk"
	-@erase "$(OUTDIR)\Wttstest.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "ENGLISH_UK" /D "ENGLISH" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\WTTSTST.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttstest.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\DLGFINDM.SBR" \
	"$(INTDIR)\guidseg.sbr" \
	"$(INTDIR)\STDAFX.SBR" \
	"$(INTDIR)\TABISRCE.SBR" \
	"$(INTDIR)\TTSDLG.SBR" \
	"$(INTDIR)\TTSFNC.SBR" \
	"$(INTDIR)\TTSTST.SBR"

"$(OUTDIR)\Wttstest.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=..\..\sapi\build\wtlkttse\uk\debug\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /incremental:yes /pdb:"$(OUTDIR)\Wttstest.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Wttstest.exe" /SUBSYSTEM:windows,4.0 
LINK32_OBJS= \
	"$(INTDIR)\DLGFINDM.OBJ" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\STDAFX.OBJ" \
	"$(INTDIR)\TABISRCE.OBJ" \
	"$(INTDIR)\TTSDLG.OBJ" \
	"$(INTDIR)\TTSFNC.OBJ" \
	"$(INTDIR)\TTSTST.OBJ" \
	"$(INTDIR)\WTTSTST.res"

"$(OUTDIR)\Wttstest.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug French"

OUTDIR=.\build\fr\A2Adebug
INTDIR=.\build\fr\A2Adebug\link
# Begin Custom Macros
OutDir=.\build\fr\A2Adebug
# End Custom Macros

ALL : "$(OUTDIR)\Wttstest.exe" "$(OUTDIR)\Wttstest.bsc"


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
	-@erase "$(INTDIR)\TTSTST.SBR"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\Wttstest.pch"
	-@erase "$(INTDIR)\WTTSTST.res"
	-@erase "$(OUTDIR)\Wttstest.bsc"
	-@erase "$(OUTDIR)\Wttstest.exe"
	-@erase "$(OUTDIR)\Wttstest.ilk"
	-@erase "$(OUTDIR)\Wttstest.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "FRENCH" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\WTTSTST.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttstest.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\DLGFINDM.SBR" \
	"$(INTDIR)\guidseg.sbr" \
	"$(INTDIR)\STDAFX.SBR" \
	"$(INTDIR)\TABISRCE.SBR" \
	"$(INTDIR)\TTSDLG.SBR" \
	"$(INTDIR)\TTSFNC.SBR" \
	"$(INTDIR)\TTSTST.SBR"

"$(OUTDIR)\Wttstest.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=..\..\sapi\build\wtlkttse\fr\debug\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /incremental:yes /pdb:"$(OUTDIR)\Wttstest.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Wttstest.exe" /SUBSYSTEM:windows,4.0 
LINK32_OBJS= \
	"$(INTDIR)\DLGFINDM.OBJ" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\STDAFX.OBJ" \
	"$(INTDIR)\TABISRCE.OBJ" \
	"$(INTDIR)\TTSDLG.OBJ" \
	"$(INTDIR)\TTSFNC.OBJ" \
	"$(INTDIR)\TTSTST.OBJ" \
	"$(INTDIR)\WTTSTST.res"

"$(OUTDIR)\Wttstest.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel French"

OUTDIR=.\build\fr\release
INTDIR=.\build\fr\release\link
# Begin Custom Macros
OutDir=.\build\fr\release
# End Custom Macros

ALL : "$(OUTDIR)\Wttstest.exe"


CLEAN :
	-@erase "$(INTDIR)\DLGFINDM.OBJ"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\STDAFX.OBJ"
	-@erase "$(INTDIR)\TABISRCE.OBJ"
	-@erase "$(INTDIR)\TTSDLG.OBJ"
	-@erase "$(INTDIR)\TTSFNC.OBJ"
	-@erase "$(INTDIR)\TTSTST.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\Wttstest.pch"
	-@erase "$(INTDIR)\WTTSTST.res"
	-@erase "$(OUTDIR)\Wttstest.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "FRENCH" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\WTTSTST.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttstest.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\sapi\build\wtlkttse\fr\release\wtlkttse.lib winmm.lib uuid.lib ole32.lib /nologo /incremental:no /pdb:"$(OUTDIR)\Wttstest.pdb" /machine:I386 /out:"$(OUTDIR)\Wttstest.exe" /SUBSYSTEM:windows,4.0 
LINK32_OBJS= \
	"$(INTDIR)\DLGFINDM.OBJ" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\STDAFX.OBJ" \
	"$(INTDIR)\TABISRCE.OBJ" \
	"$(INTDIR)\TTSDLG.OBJ" \
	"$(INTDIR)\TTSFNC.OBJ" \
	"$(INTDIR)\TTSTST.OBJ" \
	"$(INTDIR)\WTTSTST.res"

"$(OUTDIR)\Wttstest.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
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
!IF EXISTS("Wttstest.dep")
!INCLUDE "Wttstest.dep"
!ELSE 
!MESSAGE Warning: cannot find "Wttstest.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "Wttstst - Win32 A2WRel" || "$(CFG)" == "Wttstst - Win32 A2WDebug" || "$(CFG)" == "Wttstst - Win32 A2ADebug" || "$(CFG)" == "Wttstst - Win32 A2ARel" || "$(CFG)" == "Wttstst - Win32 W2ADebug" || "$(CFG)" == "Wttstst - Win32 W2ARel" || "$(CFG)" == "Wttstst - Win32 W2WDebug" || "$(CFG)" == "Wttstst - Win32 W2WRel" || "$(CFG)" == "Wttstst - Win32 A2ARel Spanish" || "$(CFG)" == "Wttstst - Win32 A2ARel German" || "$(CFG)" == "Wttstst - Win32 A2ARel Latin American" || "$(CFG)" == "Wttstst - Win32 A2ADebug Spanish" || "$(CFG)" == "Wttstst - Win32 A2ADebug German" || "$(CFG)" == "Wttstst - Win32 A2ADebug Latin American" || "$(CFG)" == "Wttstst - Win32 A2ARel United Kingdom" || "$(CFG)" == "Wttstst - Win32 A2ADebug United Kingdom" || "$(CFG)" == "Wttstst - Win32 A2ADebug French" || "$(CFG)" == "Wttstst - Win32 A2ARel French"
SOURCE=..\ttstest\DLGFINDM.CPP

!IF  "$(CFG)" == "Wttstst - Win32 A2WRel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_S_UNICODE" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\DLGFINDM.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2WDebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_S_UNICODE" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\DLGFINDM.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "ENGLISH" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\DLGFINDM.OBJ"	"$(INTDIR)\DLGFINDM.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "ENGLISH" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\DLGFINDM.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2ADebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_UNICODE" /D "_S_ANSI" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\DLGFINDM.OBJ"	"$(INTDIR)\DLGFINDM.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2ARel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_UNICODE" /D "_S_ANSI" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\DLGFINDM.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2WDebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_UNICODE" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\DLGFINDM.OBJ"	"$(INTDIR)\DLGFINDM.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2WRel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_UNICODE" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\DLGFINDM.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel Spanish"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_SP" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\DLGFINDM.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel German"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "GERMAN" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\DLGFINDM.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel Latin American"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_LA" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\DLGFINDM.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug Spanish"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_SP" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\DLGFINDM.OBJ"	"$(INTDIR)\DLGFINDM.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug German"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "GERMAN" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\DLGFINDM.OBJ"	"$(INTDIR)\DLGFINDM.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug Latin American"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_LA" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\DLGFINDM.OBJ"	"$(INTDIR)\DLGFINDM.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel United Kingdom"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "ENGLISH_UK" /D "ENGLISH" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\DLGFINDM.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug United Kingdom"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "ENGLISH_UK" /D "ENGLISH" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\DLGFINDM.OBJ"	"$(INTDIR)\DLGFINDM.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug French"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "FRENCH" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\DLGFINDM.OBJ"	"$(INTDIR)\DLGFINDM.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel French"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "FRENCH" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\DLGFINDM.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=..\..\sapi\src\Api\guidseg.cpp

!IF  "$(CFG)" == "Wttstst - Win32 A2WRel"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2WDebug"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug"


"$(INTDIR)\guidseg.obj"	"$(INTDIR)\guidseg.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2ADebug"


"$(INTDIR)\guidseg.obj"	"$(INTDIR)\guidseg.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2ARel"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2WDebug"


"$(INTDIR)\guidseg.obj"	"$(INTDIR)\guidseg.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2WRel"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel Spanish"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel German"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel Latin American"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug Spanish"


"$(INTDIR)\guidseg.obj"	"$(INTDIR)\guidseg.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug German"


"$(INTDIR)\guidseg.obj"	"$(INTDIR)\guidseg.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug Latin American"


"$(INTDIR)\guidseg.obj"	"$(INTDIR)\guidseg.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel United Kingdom"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug United Kingdom"


"$(INTDIR)\guidseg.obj"	"$(INTDIR)\guidseg.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug French"


"$(INTDIR)\guidseg.obj"	"$(INTDIR)\guidseg.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel French"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\ttstest\STDAFX.CPP

!IF  "$(CFG)" == "Wttstst - Win32 A2WRel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_S_UNICODE" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /Fp"$(INTDIR)\Wttstest.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\STDAFX.OBJ"	"$(INTDIR)\Wttstest.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2WDebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_S_UNICODE" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /Fp"$(INTDIR)\Wttstest.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\STDAFX.OBJ"	"$(INTDIR)\Wttstest.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "ENGLISH" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\STDAFX.OBJ"	"$(INTDIR)\STDAFX.SBR"	"$(INTDIR)\Wttstest.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "ENGLISH" /Fp"$(INTDIR)\Wttstest.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\STDAFX.OBJ"	"$(INTDIR)\Wttstest.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2ADebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_UNICODE" /D "_S_ANSI" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\STDAFX.OBJ"	"$(INTDIR)\STDAFX.SBR"	"$(INTDIR)\Wttstest.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2ARel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_UNICODE" /D "_S_ANSI" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /Fp"$(INTDIR)\Wttstest.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\STDAFX.OBJ"	"$(INTDIR)\Wttstest.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2WDebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_UNICODE" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\STDAFX.OBJ"	"$(INTDIR)\STDAFX.SBR"	"$(INTDIR)\Wttstest.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2WRel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_UNICODE" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /Fp"$(INTDIR)\Wttstest.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\STDAFX.OBJ"	"$(INTDIR)\Wttstest.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel Spanish"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_SP" /Fp"$(INTDIR)\Wttstest.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\STDAFX.OBJ"	"$(INTDIR)\Wttstest.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel German"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "GERMAN" /Fp"$(INTDIR)\Wttstest.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\STDAFX.OBJ"	"$(INTDIR)\Wttstest.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel Latin American"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_LA" /Fp"$(INTDIR)\Wttstest.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\STDAFX.OBJ"	"$(INTDIR)\Wttstest.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug Spanish"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_SP" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\STDAFX.OBJ"	"$(INTDIR)\STDAFX.SBR"	"$(INTDIR)\Wttstest.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug German"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "GERMAN" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\STDAFX.OBJ"	"$(INTDIR)\STDAFX.SBR"	"$(INTDIR)\Wttstest.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug Latin American"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_LA" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\STDAFX.OBJ"	"$(INTDIR)\STDAFX.SBR"	"$(INTDIR)\Wttstest.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel United Kingdom"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "ENGLISH_UK" /D "ENGLISH" /Fp"$(INTDIR)\Wttstest.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\STDAFX.OBJ"	"$(INTDIR)\Wttstest.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug United Kingdom"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "ENGLISH_UK" /D "ENGLISH" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\STDAFX.OBJ"	"$(INTDIR)\STDAFX.SBR"	"$(INTDIR)\Wttstest.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug French"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "FRENCH" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\STDAFX.OBJ"	"$(INTDIR)\STDAFX.SBR"	"$(INTDIR)\Wttstest.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel French"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "FRENCH" /Fp"$(INTDIR)\Wttstest.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\STDAFX.OBJ"	"$(INTDIR)\Wttstest.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=..\ttstest\TABISRCE.CPP

!IF  "$(CFG)" == "Wttstst - Win32 A2WRel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_S_UNICODE" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TABISRCE.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2WDebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_S_UNICODE" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TABISRCE.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "ENGLISH" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TABISRCE.OBJ"	"$(INTDIR)\TABISRCE.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "ENGLISH" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TABISRCE.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2ADebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_UNICODE" /D "_S_ANSI" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TABISRCE.OBJ"	"$(INTDIR)\TABISRCE.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2ARel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_UNICODE" /D "_S_ANSI" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TABISRCE.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2WDebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_UNICODE" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TABISRCE.OBJ"	"$(INTDIR)\TABISRCE.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2WRel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_UNICODE" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TABISRCE.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel Spanish"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_SP" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TABISRCE.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel German"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "GERMAN" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TABISRCE.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel Latin American"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_LA" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TABISRCE.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug Spanish"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_SP" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TABISRCE.OBJ"	"$(INTDIR)\TABISRCE.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug German"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "GERMAN" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TABISRCE.OBJ"	"$(INTDIR)\TABISRCE.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug Latin American"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_LA" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TABISRCE.OBJ"	"$(INTDIR)\TABISRCE.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel United Kingdom"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "ENGLISH_UK" /D "ENGLISH" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TABISRCE.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug United Kingdom"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "ENGLISH_UK" /D "ENGLISH" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TABISRCE.OBJ"	"$(INTDIR)\TABISRCE.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug French"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "FRENCH" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TABISRCE.OBJ"	"$(INTDIR)\TABISRCE.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel French"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "FRENCH" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TABISRCE.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=..\ttstest\TTSDLG.CPP

!IF  "$(CFG)" == "Wttstst - Win32 A2WRel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_S_UNICODE" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSDLG.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2WDebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_S_UNICODE" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSDLG.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "ENGLISH" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSDLG.OBJ"	"$(INTDIR)\TTSDLG.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "ENGLISH" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSDLG.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2ADebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_UNICODE" /D "_S_ANSI" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSDLG.OBJ"	"$(INTDIR)\TTSDLG.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2ARel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_UNICODE" /D "_S_ANSI" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSDLG.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2WDebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_UNICODE" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSDLG.OBJ"	"$(INTDIR)\TTSDLG.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2WRel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_UNICODE" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSDLG.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel Spanish"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_SP" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSDLG.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel German"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "GERMAN" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSDLG.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel Latin American"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_LA" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSDLG.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug Spanish"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_SP" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSDLG.OBJ"	"$(INTDIR)\TTSDLG.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug German"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "GERMAN" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSDLG.OBJ"	"$(INTDIR)\TTSDLG.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug Latin American"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_LA" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSDLG.OBJ"	"$(INTDIR)\TTSDLG.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel United Kingdom"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "ENGLISH_UK" /D "ENGLISH" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSDLG.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug United Kingdom"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "ENGLISH_UK" /D "ENGLISH" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSDLG.OBJ"	"$(INTDIR)\TTSDLG.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug French"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "FRENCH" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSDLG.OBJ"	"$(INTDIR)\TTSDLG.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel French"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "FRENCH" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSDLG.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=..\ttstest\TTSFNC.CPP

!IF  "$(CFG)" == "Wttstst - Win32 A2WRel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_S_UNICODE" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSFNC.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2WDebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_S_UNICODE" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSFNC.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "ENGLISH" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSFNC.OBJ"	"$(INTDIR)\TTSFNC.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "ENGLISH" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSFNC.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2ADebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_UNICODE" /D "_S_ANSI" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSFNC.OBJ"	"$(INTDIR)\TTSFNC.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2ARel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_UNICODE" /D "_S_ANSI" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSFNC.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2WDebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_UNICODE" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSFNC.OBJ"	"$(INTDIR)\TTSFNC.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2WRel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_UNICODE" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSFNC.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel Spanish"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_SP" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSFNC.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel German"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "GERMAN" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSFNC.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel Latin American"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_LA" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSFNC.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug Spanish"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_SP" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSFNC.OBJ"	"$(INTDIR)\TTSFNC.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug German"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "GERMAN" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSFNC.OBJ"	"$(INTDIR)\TTSFNC.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug Latin American"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_LA" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSFNC.OBJ"	"$(INTDIR)\TTSFNC.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel United Kingdom"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "ENGLISH_UK" /D "ENGLISH" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSFNC.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug United Kingdom"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "ENGLISH_UK" /D "ENGLISH" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSFNC.OBJ"	"$(INTDIR)\TTSFNC.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug French"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "FRENCH" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSFNC.OBJ"	"$(INTDIR)\TTSFNC.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel French"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "FRENCH" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSFNC.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=..\ttstest\TTSTST.CPP

!IF  "$(CFG)" == "Wttstst - Win32 A2WRel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_S_UNICODE" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSTST.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2WDebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_S_UNICODE" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSTST.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "ENGLISH" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSTST.OBJ"	"$(INTDIR)\TTSTST.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "ENGLISH" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSTST.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2ADebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_UNICODE" /D "_S_ANSI" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSTST.OBJ"	"$(INTDIR)\TTSTST.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2ARel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_UNICODE" /D "_S_ANSI" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSTST.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2WDebug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_UNICODE" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSTST.OBJ"	"$(INTDIR)\TTSTST.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2WRel"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_UNICODE" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSTST.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel Spanish"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_SP" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSTST.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel German"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "GERMAN" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSTST.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel Latin American"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_LA" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSTST.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug Spanish"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_SP" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSTST.OBJ"	"$(INTDIR)\TTSTST.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug German"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "GERMAN" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSTST.OBJ"	"$(INTDIR)\TTSTST.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug Latin American"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_LA" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSTST.OBJ"	"$(INTDIR)\TTSTST.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel United Kingdom"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "ENGLISH_UK" /D "ENGLISH" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSTST.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug United Kingdom"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "ENGLISH_UK" /D "ENGLISH" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSTST.OBJ"	"$(INTDIR)\TTSTST.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug French"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "FRENCH" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSTST.OBJ"	"$(INTDIR)\TTSTST.SBR" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel French"

CPP_SWITCHES=/nologo /MD /W3 /GX /O2 /I "..\..\sapi\src\api" /I "." /I "..\..\microsoft" /D "NDEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_AFXDLL" /D "WILLOWPOND" /D "FRENCH" /Fp"$(INTDIR)\Wttstest.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

"$(INTDIR)\TTSTST.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Wttstest.pch"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=..\ttstest\TTSTST.RC

!IF  "$(CFG)" == "Wttstst - Win32 A2WRel"


".\build\us\release\link\WTTSTST.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo".\build\us\release\link\WTTSTST.res" /i "\work\ad\samples\ttstest" /i "\work\rnd\samples\ttstest" /i "D:\work\ad\samples\ttstest" /d "NDEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2WDebug"


"$(INTDIR)\WTTSTST.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\WTTSTST.res" /i "\work\ad\samples\ttstest" /i "\work\rnd\samples\ttstest" /i "D:\work\ad\samples\ttstest" /d "_DEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug"


"$(INTDIR)\WTTSTST.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\WTTSTST.res" /i "\work\ad\samples\ttstest" /i "\work\rnd\samples\ttstest" /i "D:\work\ad\samples\ttstest" /d "_DEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel"


"$(INTDIR)\WTTSTST.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\WTTSTST.res" /i "\work\ad\samples\ttstest" /i "\work\rnd\samples\ttstest" /i "D:\work\ad\samples\ttstest" /d "NDEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2ADebug"


"$(INTDIR)\WTTSTST.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\WTTSTST.res" /i "\work\ad\samples\ttstest" /i "\work\rnd\samples\ttstest" /i "D:\work\ad\samples\ttstest" /d "_DEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2ARel"


"$(INTDIR)\WTTSTST.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\WTTSTST.res" /i "\work\ad\samples\ttstest" /i "\work\rnd\samples\ttstest" /i "D:\work\ad\samples\ttstest" /d "NDEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2WDebug"


"$(INTDIR)\WTTSTST.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\WTTSTST.res" /i "\work\ad\samples\ttstest" /i "\work\rnd\samples\ttstest" /i "D:\work\ad\samples\ttstest" /d "_DEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "Wttstst - Win32 W2WRel"


"$(INTDIR)\WTTSTST.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\WTTSTST.res" /i "\work\ad\samples\ttstest" /i "\work\rnd\samples\ttstest" /i "D:\work\ad\samples\ttstest" /d "NDEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel Spanish"


"$(INTDIR)\WTTSTST.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\WTTSTST.res" /i "\work\ad\samples\ttstest" /i "\work\rnd\samples\ttstest" /i "D:\work\ad\samples\ttstest" /d "NDEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel German"


"$(INTDIR)\WTTSTST.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\WTTSTST.res" /i "\work\ad\samples\ttstest" /i "\work\rnd\samples\ttstest" /i "D:\work\ad\samples\ttstest" /d "NDEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel Latin American"


"$(INTDIR)\WTTSTST.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\WTTSTST.res" /i "\work\ad\samples\ttstest" /i "\work\rnd\samples\ttstest" /i "D:\work\ad\samples\ttstest" /d "NDEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug Spanish"


"$(INTDIR)\WTTSTST.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\WTTSTST.res" /i "\work\ad\samples\ttstest" /i "\work\rnd\samples\ttstest" /i "D:\work\ad\samples\ttstest" /d "_DEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug German"


"$(INTDIR)\WTTSTST.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\WTTSTST.res" /i "\work\ad\samples\ttstest" /i "\work\rnd\samples\ttstest" /i "D:\work\ad\samples\ttstest" /d "_DEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug Latin American"


"$(INTDIR)\WTTSTST.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\WTTSTST.res" /i "\work\ad\samples\ttstest" /i "\work\rnd\samples\ttstest" /i "D:\work\ad\samples\ttstest" /d "_DEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel United Kingdom"


"$(INTDIR)\WTTSTST.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\WTTSTST.res" /i "\work\ad\samples\ttstest" /i "\work\rnd\samples\ttstest" /i "D:\work\ad\samples\ttstest" /d "NDEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug United Kingdom"


"$(INTDIR)\WTTSTST.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\WTTSTST.res" /i "\work\ad\samples\ttstest" /i "\work\rnd\samples\ttstest" /i "D:\work\ad\samples\ttstest" /d "_DEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ADebug French"


"$(INTDIR)\WTTSTST.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\WTTSTST.res" /i "\work\ad\samples\ttstest" /i "\work\rnd\samples\ttstest" /i "D:\work\ad\samples\ttstest" /d "_DEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "Wttstst - Win32 A2ARel French"


"$(INTDIR)\WTTSTST.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\WTTSTST.res" /i "\work\ad\samples\ttstest" /i "\work\rnd\samples\ttstest" /i "D:\work\ad\samples\ttstest" /d "NDEBUG" /d "_AFXDLL" $(SOURCE)


!ENDIF 


!ENDIF 

