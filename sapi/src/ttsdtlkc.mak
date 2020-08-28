# Microsoft Developer Studio Generated NMAKE File, Based on ttsdtlkc.dsp
!IF "$(CFG)" == ""
CFG=ttsdtlk - Win32 Release
!MESSAGE No configuration specified. Defaulting to ttsdtlk - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "ttsdtlk - Win32 Release" && "$(CFG)" != "ttsdtlk - Win32 Debug" && "$(CFG)" != "ttsdtlk - Win32 Release Spanish" && "$(CFG)" != "ttsdtlk - Win32 Release German" && "$(CFG)" != "ttsdtlk - Win32 Release Latin American" && "$(CFG)" != "ttsdtlk - Win32 Debug Spanish" && "$(CFG)" != "ttsdtlk - Win32 Debug German" && "$(CFG)" != "ttsdtlk - Win32 Debug Latin American" && "$(CFG)" != "ttsdtlk - Win32 Release United Kingdom" && "$(CFG)" != "ttsdtlk - Win32 Debug United Kingdom"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "ttsdtlkc.mak" CFG="ttsdtlk - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "ttsdtlk - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 Release Spanish" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 Release German" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 Release Latin American" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 Debug Spanish" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 Debug German" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 Debug Latin American" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 Release United Kingdom" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "ttsdtlk - Win32 Debug United Kingdom" (based on "Win32 (x86) Dynamic-Link Library")
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

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"

OUTDIR=.\..\build\dtlkttse\us\release
INTDIR=.\..\build\dtlkttse\us\release\link
# Begin Custom Macros
OutDir=.\..\build\dtlkttse\us\release
# End Custom Macros

ALL : "$(OUTDIR)\dtlkttse.dll"


CLEAN :
	-@erase "$(INTDIR)\AboutDialog.obj"
	-@erase "$(INTDIR)\auddest.obj"
	-@erase "$(INTDIR)\audioact.obj"
	-@erase "$(INTDIR)\audqueue.obj"
	-@erase "$(INTDIR)\BufNotify.obj"
	-@erase "$(INTDIR)\ctools.obj"
	-@erase "$(INTDIR)\Decstd97.obj"
	-@erase "$(INTDIR)\DECtalkDialogs.obj"
	-@erase "$(INTDIR)\DialogSpeak.obj"
	-@erase "$(INTDIR)\dtlktts.obj"
	-@erase "$(INTDIR)\dtlktts.res"
	-@erase "$(INTDIR)\dtlkttsc.obj"
	-@erase "$(INTDIR)\dtlkttse.obj"
	-@erase "$(INTDIR)\GeneralDialog.obj"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\LexiconDialog.obj"
	-@erase "$(INTDIR)\mmalloc.obj"
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\par_char.obj"
	-@erase "$(INTDIR)\pipe.obj"
	-@erase "$(INTDIR)\playtone.obj"
	-@erase "$(INTDIR)\services.obj"
	-@erase "$(INTDIR)\spc.obj"
	-@erase "$(INTDIR)\sync.obj"
	-@erase "$(INTDIR)\TranslateDialog.obj"
	-@erase "$(INTDIR)\Usa_init.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\VoiceDef.obj"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\vtmiont.obj"
	-@erase "$(OUTDIR)\dtlkttse.dll"
	-@erase "$(OUTDIR)\dtlkttse.exp"
	-@erase "$(OUTDIR)\dtlkttse.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "ENGLISH" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtlktts.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ttsdtlkc.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtlkstat\us\release\dtlkstat.lib winmm.lib /nologo /version:5.0 /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dtlkttse.pdb" /machine:I386 /nodefaultlib:"LIBCMT.LIB" /def:".\Api\ttsdtlk.def" /out:"$(OUTDIR)\dtlkttse.dll" /implib:"$(OUTDIR)\dtlkttse.lib" 
DEF_FILE= \
	".\Api\ttsdtlk.def"
LINK32_OBJS= \
	"$(INTDIR)\AboutDialog.obj" \
	"$(INTDIR)\auddest.obj" \
	"$(INTDIR)\audioact.obj" \
	"$(INTDIR)\audqueue.obj" \
	"$(INTDIR)\BufNotify.obj" \
	"$(INTDIR)\ctools.obj" \
	"$(INTDIR)\Decstd97.obj" \
	"$(INTDIR)\DECtalkDialogs.obj" \
	"$(INTDIR)\DialogSpeak.obj" \
	"$(INTDIR)\dtlktts.obj" \
	"$(INTDIR)\dtlkttsc.obj" \
	"$(INTDIR)\dtlkttse.obj" \
	"$(INTDIR)\GeneralDialog.obj" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\LexiconDialog.obj" \
	"$(INTDIR)\mmalloc.obj" \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\par_char.obj" \
	"$(INTDIR)\pipe.obj" \
	"$(INTDIR)\playtone.obj" \
	"$(INTDIR)\services.obj" \
	"$(INTDIR)\spc.obj" \
	"$(INTDIR)\sync.obj" \
	"$(INTDIR)\TranslateDialog.obj" \
	"$(INTDIR)\Usa_init.obj" \
	"$(INTDIR)\VoiceDef.obj" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\vtmiont.obj" \
	"$(INTDIR)\dtlktts.res"

"$(OUTDIR)\dtlkttse.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"

OUTDIR=.\..\build\dtlkttse\us\debug
INTDIR=.\..\build\dtlkttse\us\debug\link
# Begin Custom Macros
OutDir=.\..\build\dtlkttse\us\debug
# End Custom Macros

ALL : "$(OUTDIR)\dtlkttse.dll"


CLEAN :
	-@erase "$(INTDIR)\AboutDialog.obj"
	-@erase "$(INTDIR)\auddest.obj"
	-@erase "$(INTDIR)\audioact.obj"
	-@erase "$(INTDIR)\audqueue.obj"
	-@erase "$(INTDIR)\BufNotify.obj"
	-@erase "$(INTDIR)\ctools.obj"
	-@erase "$(INTDIR)\Decstd97.obj"
	-@erase "$(INTDIR)\DECtalkDialogs.obj"
	-@erase "$(INTDIR)\DialogSpeak.obj"
	-@erase "$(INTDIR)\dtlktts.obj"
	-@erase "$(INTDIR)\dtlktts.res"
	-@erase "$(INTDIR)\dtlkttsc.obj"
	-@erase "$(INTDIR)\dtlkttse.obj"
	-@erase "$(INTDIR)\GeneralDialog.obj"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\LexiconDialog.obj"
	-@erase "$(INTDIR)\mmalloc.obj"
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\par_char.obj"
	-@erase "$(INTDIR)\pipe.obj"
	-@erase "$(INTDIR)\playtone.obj"
	-@erase "$(INTDIR)\services.obj"
	-@erase "$(INTDIR)\spc.obj"
	-@erase "$(INTDIR)\sync.obj"
	-@erase "$(INTDIR)\TranslateDialog.obj"
	-@erase "$(INTDIR)\Usa_init.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\VoiceDef.obj"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\vtmiont.obj"
	-@erase "$(OUTDIR)\dtlkttse.dll"
	-@erase "$(OUTDIR)\dtlkttse.exp"
	-@erase "$(OUTDIR)\dtlkttse.lib"
	-@erase "$(OUTDIR)\dtlkttse.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "ENGLISH_US" /D "ENGLISH" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtlktts.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ttsdtlkc.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtlkstat\us\debug\dtlkstat.lib winmm.lib /nologo /version:5.0 /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dtlkttse.pdb" /debug /debugtype:both /machine:I386 /def:".\Api\ttsdtlk.def" /out:"$(OUTDIR)\dtlkttse.dll" /implib:"$(OUTDIR)\dtlkttse.lib" 
DEF_FILE= \
	".\Api\ttsdtlk.def"
LINK32_OBJS= \
	"$(INTDIR)\AboutDialog.obj" \
	"$(INTDIR)\auddest.obj" \
	"$(INTDIR)\audioact.obj" \
	"$(INTDIR)\audqueue.obj" \
	"$(INTDIR)\BufNotify.obj" \
	"$(INTDIR)\ctools.obj" \
	"$(INTDIR)\Decstd97.obj" \
	"$(INTDIR)\DECtalkDialogs.obj" \
	"$(INTDIR)\DialogSpeak.obj" \
	"$(INTDIR)\dtlktts.obj" \
	"$(INTDIR)\dtlkttsc.obj" \
	"$(INTDIR)\dtlkttse.obj" \
	"$(INTDIR)\GeneralDialog.obj" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\LexiconDialog.obj" \
	"$(INTDIR)\mmalloc.obj" \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\par_char.obj" \
	"$(INTDIR)\pipe.obj" \
	"$(INTDIR)\playtone.obj" \
	"$(INTDIR)\services.obj" \
	"$(INTDIR)\spc.obj" \
	"$(INTDIR)\sync.obj" \
	"$(INTDIR)\TranslateDialog.obj" \
	"$(INTDIR)\Usa_init.obj" \
	"$(INTDIR)\VoiceDef.obj" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\vtmiont.obj" \
	"$(INTDIR)\dtlktts.res"

"$(OUTDIR)\dtlkttse.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"

OUTDIR=.\..\build\dtlkttse\sp\release
INTDIR=.\..\build\dtlkttse\sp\release\link
# Begin Custom Macros
OutDir=.\..\build\dtlkttse\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\dtlkttse.dll"


CLEAN :
	-@erase "$(INTDIR)\AboutDialog.obj"
	-@erase "$(INTDIR)\auddest.obj"
	-@erase "$(INTDIR)\audioact.obj"
	-@erase "$(INTDIR)\audqueue.obj"
	-@erase "$(INTDIR)\BufNotify.obj"
	-@erase "$(INTDIR)\ctools.obj"
	-@erase "$(INTDIR)\Decstd97.obj"
	-@erase "$(INTDIR)\DECtalkDialogs.obj"
	-@erase "$(INTDIR)\DialogSpeak.obj"
	-@erase "$(INTDIR)\dtlktts.obj"
	-@erase "$(INTDIR)\dtlktts.res"
	-@erase "$(INTDIR)\dtlkttsc.obj"
	-@erase "$(INTDIR)\dtlkttse.obj"
	-@erase "$(INTDIR)\GeneralDialog.obj"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\LexiconDialog.obj"
	-@erase "$(INTDIR)\mmalloc.obj"
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\par_char.obj"
	-@erase "$(INTDIR)\pipe.obj"
	-@erase "$(INTDIR)\playtone.obj"
	-@erase "$(INTDIR)\services.obj"
	-@erase "$(INTDIR)\spc.obj"
	-@erase "$(INTDIR)\sync.obj"
	-@erase "$(INTDIR)\TranslateDialog.obj"
	-@erase "$(INTDIR)\Usa_init.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\VoiceDef.obj"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\vtmiont.obj"
	-@erase "$(OUTDIR)\dtlkttse.dll"
	-@erase "$(OUTDIR)\dtlkttse.exp"
	-@erase "$(OUTDIR)\dtlkttse.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\dtlktts.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ttsdtlkc.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtlkstat\sp\release\dtlkstat.lib winmm.lib /nologo /version:5.0 /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dtlkttse.pdb" /machine:I386 /nodefaultlib:"LIBCMT.LIB" /def:".\Api\ttsdtlk.def" /out:"$(OUTDIR)\dtlkttse.dll" /implib:"$(OUTDIR)\dtlkttse.lib" 
DEF_FILE= \
	".\Api\ttsdtlk.def"
LINK32_OBJS= \
	"$(INTDIR)\AboutDialog.obj" \
	"$(INTDIR)\auddest.obj" \
	"$(INTDIR)\audioact.obj" \
	"$(INTDIR)\audqueue.obj" \
	"$(INTDIR)\BufNotify.obj" \
	"$(INTDIR)\ctools.obj" \
	"$(INTDIR)\Decstd97.obj" \
	"$(INTDIR)\DECtalkDialogs.obj" \
	"$(INTDIR)\DialogSpeak.obj" \
	"$(INTDIR)\dtlktts.obj" \
	"$(INTDIR)\dtlkttsc.obj" \
	"$(INTDIR)\dtlkttse.obj" \
	"$(INTDIR)\GeneralDialog.obj" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\LexiconDialog.obj" \
	"$(INTDIR)\mmalloc.obj" \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\par_char.obj" \
	"$(INTDIR)\pipe.obj" \
	"$(INTDIR)\playtone.obj" \
	"$(INTDIR)\services.obj" \
	"$(INTDIR)\spc.obj" \
	"$(INTDIR)\sync.obj" \
	"$(INTDIR)\TranslateDialog.obj" \
	"$(INTDIR)\Usa_init.obj" \
	"$(INTDIR)\VoiceDef.obj" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\vtmiont.obj" \
	"$(INTDIR)\dtlktts.res"

"$(OUTDIR)\dtlkttse.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"

OUTDIR=.\..\build\dtlkttse\gr\release
INTDIR=.\..\build\dtlkttse\gr\release\link
# Begin Custom Macros
OutDir=.\..\build\dtlkttse\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\dtlkttse.dll"


CLEAN :
	-@erase "$(INTDIR)\AboutDialog.obj"
	-@erase "$(INTDIR)\auddest.obj"
	-@erase "$(INTDIR)\audioact.obj"
	-@erase "$(INTDIR)\audqueue.obj"
	-@erase "$(INTDIR)\BufNotify.obj"
	-@erase "$(INTDIR)\ctools.obj"
	-@erase "$(INTDIR)\Decstd97.obj"
	-@erase "$(INTDIR)\DECtalkDialogs.obj"
	-@erase "$(INTDIR)\DialogSpeak.obj"
	-@erase "$(INTDIR)\dtlktts.obj"
	-@erase "$(INTDIR)\dtlktts.res"
	-@erase "$(INTDIR)\dtlkttsc.obj"
	-@erase "$(INTDIR)\dtlkttse.obj"
	-@erase "$(INTDIR)\GeneralDialog.obj"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\LexiconDialog.obj"
	-@erase "$(INTDIR)\mmalloc.obj"
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\par_char.obj"
	-@erase "$(INTDIR)\pipe.obj"
	-@erase "$(INTDIR)\playtone.obj"
	-@erase "$(INTDIR)\services.obj"
	-@erase "$(INTDIR)\spc.obj"
	-@erase "$(INTDIR)\sync.obj"
	-@erase "$(INTDIR)\TranslateDialog.obj"
	-@erase "$(INTDIR)\Usa_init.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\VoiceDef.obj"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\vtmiont.obj"
	-@erase "$(OUTDIR)\dtlkttse.dll"
	-@erase "$(OUTDIR)\dtlkttse.exp"
	-@erase "$(OUTDIR)\dtlkttse.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\dtlktts.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ttsdtlkc.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtlkstat\gr\release\dtlkstat.lib winmm.lib /nologo /version:5.0 /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dtlkttse.pdb" /machine:I386 /nodefaultlib:"LIBCMT.LIB" /def:".\Api\ttsdtlk.def" /out:"$(OUTDIR)\dtlkttse.dll" /implib:"$(OUTDIR)\dtlkttse.lib" 
DEF_FILE= \
	".\Api\ttsdtlk.def"
LINK32_OBJS= \
	"$(INTDIR)\AboutDialog.obj" \
	"$(INTDIR)\auddest.obj" \
	"$(INTDIR)\audioact.obj" \
	"$(INTDIR)\audqueue.obj" \
	"$(INTDIR)\BufNotify.obj" \
	"$(INTDIR)\ctools.obj" \
	"$(INTDIR)\Decstd97.obj" \
	"$(INTDIR)\DECtalkDialogs.obj" \
	"$(INTDIR)\DialogSpeak.obj" \
	"$(INTDIR)\dtlktts.obj" \
	"$(INTDIR)\dtlkttsc.obj" \
	"$(INTDIR)\dtlkttse.obj" \
	"$(INTDIR)\GeneralDialog.obj" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\LexiconDialog.obj" \
	"$(INTDIR)\mmalloc.obj" \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\par_char.obj" \
	"$(INTDIR)\pipe.obj" \
	"$(INTDIR)\playtone.obj" \
	"$(INTDIR)\services.obj" \
	"$(INTDIR)\spc.obj" \
	"$(INTDIR)\sync.obj" \
	"$(INTDIR)\TranslateDialog.obj" \
	"$(INTDIR)\Usa_init.obj" \
	"$(INTDIR)\VoiceDef.obj" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\vtmiont.obj" \
	"$(INTDIR)\dtlktts.res"

"$(OUTDIR)\dtlkttse.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"

OUTDIR=.\..\build\dtlkttse\la\release
INTDIR=.\..\build\dtlkttse\la\release\link
# Begin Custom Macros
OutDir=.\..\build\dtlkttse\la\release
# End Custom Macros

ALL : "$(OUTDIR)\dtlkttse.dll"


CLEAN :
	-@erase "$(INTDIR)\AboutDialog.obj"
	-@erase "$(INTDIR)\auddest.obj"
	-@erase "$(INTDIR)\audioact.obj"
	-@erase "$(INTDIR)\audqueue.obj"
	-@erase "$(INTDIR)\BufNotify.obj"
	-@erase "$(INTDIR)\ctools.obj"
	-@erase "$(INTDIR)\Decstd97.obj"
	-@erase "$(INTDIR)\DECtalkDialogs.obj"
	-@erase "$(INTDIR)\DialogSpeak.obj"
	-@erase "$(INTDIR)\dtlktts.obj"
	-@erase "$(INTDIR)\dtlktts.res"
	-@erase "$(INTDIR)\dtlkttsc.obj"
	-@erase "$(INTDIR)\dtlkttse.obj"
	-@erase "$(INTDIR)\GeneralDialog.obj"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\LexiconDialog.obj"
	-@erase "$(INTDIR)\mmalloc.obj"
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\par_char.obj"
	-@erase "$(INTDIR)\pipe.obj"
	-@erase "$(INTDIR)\playtone.obj"
	-@erase "$(INTDIR)\services.obj"
	-@erase "$(INTDIR)\spc.obj"
	-@erase "$(INTDIR)\sync.obj"
	-@erase "$(INTDIR)\TranslateDialog.obj"
	-@erase "$(INTDIR)\Usa_init.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\VoiceDef.obj"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\vtmiont.obj"
	-@erase "$(OUTDIR)\dtlkttse.dll"
	-@erase "$(OUTDIR)\dtlkttse.exp"
	-@erase "$(OUTDIR)\dtlkttse.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\dtlktts.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ttsdtlkc.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtlkstat\la\release\dtlkstat.lib winmm.lib /nologo /version:5.0 /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dtlkttse.pdb" /machine:I386 /nodefaultlib:"LIBCMT.LIB" /def:".\Api\ttsdtlk.def" /out:"$(OUTDIR)\dtlkttse.dll" /implib:"$(OUTDIR)\dtlkttse.lib" 
DEF_FILE= \
	".\Api\ttsdtlk.def"
LINK32_OBJS= \
	"$(INTDIR)\AboutDialog.obj" \
	"$(INTDIR)\auddest.obj" \
	"$(INTDIR)\audioact.obj" \
	"$(INTDIR)\audqueue.obj" \
	"$(INTDIR)\BufNotify.obj" \
	"$(INTDIR)\ctools.obj" \
	"$(INTDIR)\Decstd97.obj" \
	"$(INTDIR)\DECtalkDialogs.obj" \
	"$(INTDIR)\DialogSpeak.obj" \
	"$(INTDIR)\dtlktts.obj" \
	"$(INTDIR)\dtlkttsc.obj" \
	"$(INTDIR)\dtlkttse.obj" \
	"$(INTDIR)\GeneralDialog.obj" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\LexiconDialog.obj" \
	"$(INTDIR)\mmalloc.obj" \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\par_char.obj" \
	"$(INTDIR)\pipe.obj" \
	"$(INTDIR)\playtone.obj" \
	"$(INTDIR)\services.obj" \
	"$(INTDIR)\spc.obj" \
	"$(INTDIR)\sync.obj" \
	"$(INTDIR)\TranslateDialog.obj" \
	"$(INTDIR)\Usa_init.obj" \
	"$(INTDIR)\VoiceDef.obj" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\vtmiont.obj" \
	"$(INTDIR)\dtlktts.res"

"$(OUTDIR)\dtlkttse.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"

OUTDIR=.\..\build\dtlkttse\sp\debug
INTDIR=.\..\build\dtlkttse\sp\debug\link
# Begin Custom Macros
OutDir=.\..\build\dtlkttse\sp\debug
# End Custom Macros

ALL : "$(OUTDIR)\dtlkttse.dll"


CLEAN :
	-@erase "$(INTDIR)\AboutDialog.obj"
	-@erase "$(INTDIR)\auddest.obj"
	-@erase "$(INTDIR)\audioact.obj"
	-@erase "$(INTDIR)\audqueue.obj"
	-@erase "$(INTDIR)\BufNotify.obj"
	-@erase "$(INTDIR)\ctools.obj"
	-@erase "$(INTDIR)\Decstd97.obj"
	-@erase "$(INTDIR)\DECtalkDialogs.obj"
	-@erase "$(INTDIR)\DialogSpeak.obj"
	-@erase "$(INTDIR)\dtlktts.obj"
	-@erase "$(INTDIR)\dtlktts.res"
	-@erase "$(INTDIR)\dtlkttsc.obj"
	-@erase "$(INTDIR)\dtlkttse.obj"
	-@erase "$(INTDIR)\GeneralDialog.obj"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\LexiconDialog.obj"
	-@erase "$(INTDIR)\mmalloc.obj"
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\par_char.obj"
	-@erase "$(INTDIR)\pipe.obj"
	-@erase "$(INTDIR)\playtone.obj"
	-@erase "$(INTDIR)\services.obj"
	-@erase "$(INTDIR)\spc.obj"
	-@erase "$(INTDIR)\sync.obj"
	-@erase "$(INTDIR)\TranslateDialog.obj"
	-@erase "$(INTDIR)\Usa_init.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\VoiceDef.obj"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\vtmiont.obj"
	-@erase "$(OUTDIR)\dtlkttse.dll"
	-@erase "$(OUTDIR)\dtlkttse.exp"
	-@erase "$(OUTDIR)\dtlkttse.lib"
	-@erase "$(OUTDIR)\dtlkttse.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "SPANISH" /D "SPANISH_SP" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\dtlktts.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ttsdtlkc.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtlkstat\sp\debug\dtlkstat.lib winmm.lib /nologo /version:5.0 /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dtlkttse.pdb" /debug /debugtype:both /machine:I386 /def:".\Api\ttsdtlk.def" /out:"$(OUTDIR)\dtlkttse.dll" /implib:"$(OUTDIR)\dtlkttse.lib" 
DEF_FILE= \
	".\Api\ttsdtlk.def"
LINK32_OBJS= \
	"$(INTDIR)\AboutDialog.obj" \
	"$(INTDIR)\auddest.obj" \
	"$(INTDIR)\audioact.obj" \
	"$(INTDIR)\audqueue.obj" \
	"$(INTDIR)\BufNotify.obj" \
	"$(INTDIR)\ctools.obj" \
	"$(INTDIR)\Decstd97.obj" \
	"$(INTDIR)\DECtalkDialogs.obj" \
	"$(INTDIR)\DialogSpeak.obj" \
	"$(INTDIR)\dtlktts.obj" \
	"$(INTDIR)\dtlkttsc.obj" \
	"$(INTDIR)\dtlkttse.obj" \
	"$(INTDIR)\GeneralDialog.obj" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\LexiconDialog.obj" \
	"$(INTDIR)\mmalloc.obj" \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\par_char.obj" \
	"$(INTDIR)\pipe.obj" \
	"$(INTDIR)\playtone.obj" \
	"$(INTDIR)\services.obj" \
	"$(INTDIR)\spc.obj" \
	"$(INTDIR)\sync.obj" \
	"$(INTDIR)\TranslateDialog.obj" \
	"$(INTDIR)\Usa_init.obj" \
	"$(INTDIR)\VoiceDef.obj" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\vtmiont.obj" \
	"$(INTDIR)\dtlktts.res"

"$(OUTDIR)\dtlkttse.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"

OUTDIR=.\..\build\dtlkttse\gr\debug
INTDIR=.\..\build\dtlkttse\gr\debug\link
# Begin Custom Macros
OutDir=.\..\build\dtlkttse\gr\debug
# End Custom Macros

ALL : "$(OUTDIR)\dtlkttse.dll"


CLEAN :
	-@erase "$(INTDIR)\AboutDialog.obj"
	-@erase "$(INTDIR)\auddest.obj"
	-@erase "$(INTDIR)\audioact.obj"
	-@erase "$(INTDIR)\audqueue.obj"
	-@erase "$(INTDIR)\BufNotify.obj"
	-@erase "$(INTDIR)\ctools.obj"
	-@erase "$(INTDIR)\Decstd97.obj"
	-@erase "$(INTDIR)\DECtalkDialogs.obj"
	-@erase "$(INTDIR)\DialogSpeak.obj"
	-@erase "$(INTDIR)\dtlktts.obj"
	-@erase "$(INTDIR)\dtlktts.res"
	-@erase "$(INTDIR)\dtlkttsc.obj"
	-@erase "$(INTDIR)\dtlkttse.obj"
	-@erase "$(INTDIR)\GeneralDialog.obj"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\LexiconDialog.obj"
	-@erase "$(INTDIR)\mmalloc.obj"
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\par_char.obj"
	-@erase "$(INTDIR)\pipe.obj"
	-@erase "$(INTDIR)\playtone.obj"
	-@erase "$(INTDIR)\services.obj"
	-@erase "$(INTDIR)\spc.obj"
	-@erase "$(INTDIR)\sync.obj"
	-@erase "$(INTDIR)\TranslateDialog.obj"
	-@erase "$(INTDIR)\Usa_init.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\VoiceDef.obj"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\vtmiont.obj"
	-@erase "$(OUTDIR)\dtlkttse.dll"
	-@erase "$(OUTDIR)\dtlkttse.exp"
	-@erase "$(OUTDIR)\dtlkttse.lib"
	-@erase "$(OUTDIR)\dtlkttse.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\dtlktts.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ttsdtlkc.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtlkstat\gr\debug\dtlkstat.lib winmm.lib /nologo /version:5.0 /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dtlkttse.pdb" /debug /debugtype:both /machine:I386 /def:".\Api\ttsdtlk.def" /out:"$(OUTDIR)\dtlkttse.dll" /implib:"$(OUTDIR)\dtlkttse.lib" 
DEF_FILE= \
	".\Api\ttsdtlk.def"
LINK32_OBJS= \
	"$(INTDIR)\AboutDialog.obj" \
	"$(INTDIR)\auddest.obj" \
	"$(INTDIR)\audioact.obj" \
	"$(INTDIR)\audqueue.obj" \
	"$(INTDIR)\BufNotify.obj" \
	"$(INTDIR)\ctools.obj" \
	"$(INTDIR)\Decstd97.obj" \
	"$(INTDIR)\DECtalkDialogs.obj" \
	"$(INTDIR)\DialogSpeak.obj" \
	"$(INTDIR)\dtlktts.obj" \
	"$(INTDIR)\dtlkttsc.obj" \
	"$(INTDIR)\dtlkttse.obj" \
	"$(INTDIR)\GeneralDialog.obj" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\LexiconDialog.obj" \
	"$(INTDIR)\mmalloc.obj" \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\par_char.obj" \
	"$(INTDIR)\pipe.obj" \
	"$(INTDIR)\playtone.obj" \
	"$(INTDIR)\services.obj" \
	"$(INTDIR)\spc.obj" \
	"$(INTDIR)\sync.obj" \
	"$(INTDIR)\TranslateDialog.obj" \
	"$(INTDIR)\Usa_init.obj" \
	"$(INTDIR)\VoiceDef.obj" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\vtmiont.obj" \
	"$(INTDIR)\dtlktts.res"

"$(OUTDIR)\dtlkttse.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"

OUTDIR=.\..\build\dtlkttse\la\debug
INTDIR=.\..\build\dtlkttse\la\debug\link
# Begin Custom Macros
OutDir=.\..\build\dtlkttse\la\debug
# End Custom Macros

ALL : "$(OUTDIR)\dtlkttse.dll"


CLEAN :
	-@erase "$(INTDIR)\AboutDialog.obj"
	-@erase "$(INTDIR)\auddest.obj"
	-@erase "$(INTDIR)\audioact.obj"
	-@erase "$(INTDIR)\audqueue.obj"
	-@erase "$(INTDIR)\BufNotify.obj"
	-@erase "$(INTDIR)\ctools.obj"
	-@erase "$(INTDIR)\Decstd97.obj"
	-@erase "$(INTDIR)\DECtalkDialogs.obj"
	-@erase "$(INTDIR)\DialogSpeak.obj"
	-@erase "$(INTDIR)\dtlktts.obj"
	-@erase "$(INTDIR)\dtlktts.res"
	-@erase "$(INTDIR)\dtlkttsc.obj"
	-@erase "$(INTDIR)\dtlkttse.obj"
	-@erase "$(INTDIR)\GeneralDialog.obj"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\LexiconDialog.obj"
	-@erase "$(INTDIR)\mmalloc.obj"
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\par_char.obj"
	-@erase "$(INTDIR)\pipe.obj"
	-@erase "$(INTDIR)\playtone.obj"
	-@erase "$(INTDIR)\services.obj"
	-@erase "$(INTDIR)\spc.obj"
	-@erase "$(INTDIR)\sync.obj"
	-@erase "$(INTDIR)\TranslateDialog.obj"
	-@erase "$(INTDIR)\Usa_init.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\VoiceDef.obj"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\vtmiont.obj"
	-@erase "$(OUTDIR)\dtlkttse.dll"
	-@erase "$(OUTDIR)\dtlkttse.exp"
	-@erase "$(OUTDIR)\dtlkttse.lib"
	-@erase "$(OUTDIR)\dtlkttse.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\dtlktts.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ttsdtlkc.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtlkstat\la\debug\dtlkstat.lib winmm.lib /nologo /version:5.0 /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dtlkttse.pdb" /debug /debugtype:both /machine:I386 /def:".\Api\ttsdtlk.def" /out:"$(OUTDIR)\dtlkttse.dll" /implib:"$(OUTDIR)\dtlkttse.lib" 
DEF_FILE= \
	".\Api\ttsdtlk.def"
LINK32_OBJS= \
	"$(INTDIR)\AboutDialog.obj" \
	"$(INTDIR)\auddest.obj" \
	"$(INTDIR)\audioact.obj" \
	"$(INTDIR)\audqueue.obj" \
	"$(INTDIR)\BufNotify.obj" \
	"$(INTDIR)\ctools.obj" \
	"$(INTDIR)\Decstd97.obj" \
	"$(INTDIR)\DECtalkDialogs.obj" \
	"$(INTDIR)\DialogSpeak.obj" \
	"$(INTDIR)\dtlktts.obj" \
	"$(INTDIR)\dtlkttsc.obj" \
	"$(INTDIR)\dtlkttse.obj" \
	"$(INTDIR)\GeneralDialog.obj" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\LexiconDialog.obj" \
	"$(INTDIR)\mmalloc.obj" \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\par_char.obj" \
	"$(INTDIR)\pipe.obj" \
	"$(INTDIR)\playtone.obj" \
	"$(INTDIR)\services.obj" \
	"$(INTDIR)\spc.obj" \
	"$(INTDIR)\sync.obj" \
	"$(INTDIR)\TranslateDialog.obj" \
	"$(INTDIR)\Usa_init.obj" \
	"$(INTDIR)\VoiceDef.obj" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\vtmiont.obj" \
	"$(INTDIR)\dtlktts.res"

"$(OUTDIR)\dtlkttse.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"

OUTDIR=.\..\build\dtlkttse\uk\release
INTDIR=.\..\build\dtlkttse\uk\release\link
# Begin Custom Macros
OutDir=.\..\build\dtlkttse\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\dtlkttse.dll"


CLEAN :
	-@erase "$(INTDIR)\AboutDialog.obj"
	-@erase "$(INTDIR)\auddest.obj"
	-@erase "$(INTDIR)\audioact.obj"
	-@erase "$(INTDIR)\audqueue.obj"
	-@erase "$(INTDIR)\BufNotify.obj"
	-@erase "$(INTDIR)\ctools.obj"
	-@erase "$(INTDIR)\Decstd97.obj"
	-@erase "$(INTDIR)\DECtalkDialogs.obj"
	-@erase "$(INTDIR)\DialogSpeak.obj"
	-@erase "$(INTDIR)\dtlktts.obj"
	-@erase "$(INTDIR)\dtlktts.res"
	-@erase "$(INTDIR)\dtlkttsc.obj"
	-@erase "$(INTDIR)\dtlkttse.obj"
	-@erase "$(INTDIR)\GeneralDialog.obj"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\LexiconDialog.obj"
	-@erase "$(INTDIR)\mmalloc.obj"
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\par_char.obj"
	-@erase "$(INTDIR)\pipe.obj"
	-@erase "$(INTDIR)\playtone.obj"
	-@erase "$(INTDIR)\services.obj"
	-@erase "$(INTDIR)\spc.obj"
	-@erase "$(INTDIR)\sync.obj"
	-@erase "$(INTDIR)\TranslateDialog.obj"
	-@erase "$(INTDIR)\Usa_init.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\VoiceDef.obj"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\vtmiont.obj"
	-@erase "$(OUTDIR)\dtlkttse.dll"
	-@erase "$(OUTDIR)\dtlkttse.exp"
	-@erase "$(OUTDIR)\dtlkttse.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "ENGLISH_UK" /D "ENGLISH" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\dtlktts.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ttsdtlkc.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtlkstat\uk\release\dtlkstat.lib winmm.lib /nologo /version:5.0 /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dtlkttse.pdb" /machine:I386 /nodefaultlib:"LIBCMT.LIB" /def:".\Api\ttsdtlk.def" /out:"$(OUTDIR)\dtlkttse.dll" /implib:"$(OUTDIR)\dtlkttse.lib" 
DEF_FILE= \
	".\Api\ttsdtlk.def"
LINK32_OBJS= \
	"$(INTDIR)\AboutDialog.obj" \
	"$(INTDIR)\auddest.obj" \
	"$(INTDIR)\audioact.obj" \
	"$(INTDIR)\audqueue.obj" \
	"$(INTDIR)\BufNotify.obj" \
	"$(INTDIR)\ctools.obj" \
	"$(INTDIR)\Decstd97.obj" \
	"$(INTDIR)\DECtalkDialogs.obj" \
	"$(INTDIR)\DialogSpeak.obj" \
	"$(INTDIR)\dtlktts.obj" \
	"$(INTDIR)\dtlkttsc.obj" \
	"$(INTDIR)\dtlkttse.obj" \
	"$(INTDIR)\GeneralDialog.obj" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\LexiconDialog.obj" \
	"$(INTDIR)\mmalloc.obj" \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\par_char.obj" \
	"$(INTDIR)\pipe.obj" \
	"$(INTDIR)\playtone.obj" \
	"$(INTDIR)\services.obj" \
	"$(INTDIR)\spc.obj" \
	"$(INTDIR)\sync.obj" \
	"$(INTDIR)\TranslateDialog.obj" \
	"$(INTDIR)\Usa_init.obj" \
	"$(INTDIR)\VoiceDef.obj" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\vtmiont.obj" \
	"$(INTDIR)\dtlktts.res"

"$(OUTDIR)\dtlkttse.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"

OUTDIR=.\..\build\dtlkttse\uk\debug
INTDIR=.\..\build\dtlkttse\uk\debug\link
# Begin Custom Macros
OutDir=.\..\build\dtlkttse\uk\debug
# End Custom Macros

ALL : "$(OUTDIR)\dtlkttse.dll" "$(OUTDIR)\ttsdtlkc.bsc"


CLEAN :
	-@erase "$(INTDIR)\AboutDialog.obj"
	-@erase "$(INTDIR)\AboutDialog.sbr"
	-@erase "$(INTDIR)\auddest.obj"
	-@erase "$(INTDIR)\auddest.sbr"
	-@erase "$(INTDIR)\audioact.obj"
	-@erase "$(INTDIR)\audioact.sbr"
	-@erase "$(INTDIR)\audqueue.obj"
	-@erase "$(INTDIR)\audqueue.sbr"
	-@erase "$(INTDIR)\BufNotify.obj"
	-@erase "$(INTDIR)\BufNotify.sbr"
	-@erase "$(INTDIR)\ctools.obj"
	-@erase "$(INTDIR)\ctools.sbr"
	-@erase "$(INTDIR)\Decstd97.obj"
	-@erase "$(INTDIR)\Decstd97.sbr"
	-@erase "$(INTDIR)\DECtalkDialogs.obj"
	-@erase "$(INTDIR)\DECtalkDialogs.sbr"
	-@erase "$(INTDIR)\DialogSpeak.obj"
	-@erase "$(INTDIR)\DialogSpeak.sbr"
	-@erase "$(INTDIR)\dtlktts.obj"
	-@erase "$(INTDIR)\dtlktts.res"
	-@erase "$(INTDIR)\dtlktts.sbr"
	-@erase "$(INTDIR)\dtlkttsc.obj"
	-@erase "$(INTDIR)\dtlkttsc.sbr"
	-@erase "$(INTDIR)\dtlkttse.obj"
	-@erase "$(INTDIR)\dtlkttse.sbr"
	-@erase "$(INTDIR)\GeneralDialog.obj"
	-@erase "$(INTDIR)\GeneralDialog.sbr"
	-@erase "$(INTDIR)\guidseg.obj"
	-@erase "$(INTDIR)\guidseg.sbr"
	-@erase "$(INTDIR)\LexiconDialog.obj"
	-@erase "$(INTDIR)\LexiconDialog.sbr"
	-@erase "$(INTDIR)\mmalloc.obj"
	-@erase "$(INTDIR)\mmalloc.sbr"
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\opthread.sbr"
	-@erase "$(INTDIR)\par_char.obj"
	-@erase "$(INTDIR)\par_char.sbr"
	-@erase "$(INTDIR)\pipe.obj"
	-@erase "$(INTDIR)\pipe.sbr"
	-@erase "$(INTDIR)\playtone.obj"
	-@erase "$(INTDIR)\playtone.sbr"
	-@erase "$(INTDIR)\services.obj"
	-@erase "$(INTDIR)\services.sbr"
	-@erase "$(INTDIR)\spc.obj"
	-@erase "$(INTDIR)\spc.sbr"
	-@erase "$(INTDIR)\sync.obj"
	-@erase "$(INTDIR)\sync.sbr"
	-@erase "$(INTDIR)\TranslateDialog.obj"
	-@erase "$(INTDIR)\TranslateDialog.sbr"
	-@erase "$(INTDIR)\Usa_init.obj"
	-@erase "$(INTDIR)\Usa_init.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\VoiceDef.obj"
	-@erase "$(INTDIR)\VoiceDef.sbr"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\vtm.sbr"
	-@erase "$(INTDIR)\vtmiont.obj"
	-@erase "$(INTDIR)\vtmiont.sbr"
	-@erase "$(OUTDIR)\dtlkttse.dll"
	-@erase "$(OUTDIR)\dtlkttse.exp"
	-@erase "$(OUTDIR)\dtlkttse.lib"
	-@erase "$(OUTDIR)\dtlkttse.pdb"
	-@erase "$(OUTDIR)\ttsdtlkc.bsc"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "ENGLISH_UK" /D "ENGLISH" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\dtlktts.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ttsdtlkc.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\AboutDialog.sbr" \
	"$(INTDIR)\auddest.sbr" \
	"$(INTDIR)\audioact.sbr" \
	"$(INTDIR)\audqueue.sbr" \
	"$(INTDIR)\BufNotify.sbr" \
	"$(INTDIR)\ctools.sbr" \
	"$(INTDIR)\Decstd97.sbr" \
	"$(INTDIR)\DECtalkDialogs.sbr" \
	"$(INTDIR)\DialogSpeak.sbr" \
	"$(INTDIR)\dtlktts.sbr" \
	"$(INTDIR)\dtlkttsc.sbr" \
	"$(INTDIR)\dtlkttse.sbr" \
	"$(INTDIR)\GeneralDialog.sbr" \
	"$(INTDIR)\guidseg.sbr" \
	"$(INTDIR)\LexiconDialog.sbr" \
	"$(INTDIR)\mmalloc.sbr" \
	"$(INTDIR)\opthread.sbr" \
	"$(INTDIR)\par_char.sbr" \
	"$(INTDIR)\pipe.sbr" \
	"$(INTDIR)\playtone.sbr" \
	"$(INTDIR)\services.sbr" \
	"$(INTDIR)\spc.sbr" \
	"$(INTDIR)\sync.sbr" \
	"$(INTDIR)\TranslateDialog.sbr" \
	"$(INTDIR)\Usa_init.sbr" \
	"$(INTDIR)\VoiceDef.sbr" \
	"$(INTDIR)\vtm.sbr" \
	"$(INTDIR)\vtmiont.sbr"

"$(OUTDIR)\ttsdtlkc.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtlkstat\uk\debug\dtlkstat.lib winmm.lib /nologo /version:5.0 /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dtlkttse.pdb" /debug /debugtype:both /machine:I386 /def:".\Api\ttsdtlk.def" /out:"$(OUTDIR)\dtlkttse.dll" /implib:"$(OUTDIR)\dtlkttse.lib" 
DEF_FILE= \
	".\Api\ttsdtlk.def"
LINK32_OBJS= \
	"$(INTDIR)\AboutDialog.obj" \
	"$(INTDIR)\auddest.obj" \
	"$(INTDIR)\audioact.obj" \
	"$(INTDIR)\audqueue.obj" \
	"$(INTDIR)\BufNotify.obj" \
	"$(INTDIR)\ctools.obj" \
	"$(INTDIR)\Decstd97.obj" \
	"$(INTDIR)\DECtalkDialogs.obj" \
	"$(INTDIR)\DialogSpeak.obj" \
	"$(INTDIR)\dtlktts.obj" \
	"$(INTDIR)\dtlkttsc.obj" \
	"$(INTDIR)\dtlkttse.obj" \
	"$(INTDIR)\GeneralDialog.obj" \
	"$(INTDIR)\guidseg.obj" \
	"$(INTDIR)\LexiconDialog.obj" \
	"$(INTDIR)\mmalloc.obj" \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\par_char.obj" \
	"$(INTDIR)\pipe.obj" \
	"$(INTDIR)\playtone.obj" \
	"$(INTDIR)\services.obj" \
	"$(INTDIR)\spc.obj" \
	"$(INTDIR)\sync.obj" \
	"$(INTDIR)\TranslateDialog.obj" \
	"$(INTDIR)\Usa_init.obj" \
	"$(INTDIR)\VoiceDef.obj" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\vtmiont.obj" \
	"$(INTDIR)\dtlktts.res"

"$(OUTDIR)\dtlkttse.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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
!IF EXISTS("ttsdtlkc.dep")
!INCLUDE "ttsdtlkc.dep"
!ELSE 
!MESSAGE Warning: cannot find "ttsdtlkc.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "ttsdtlk - Win32 Release" || "$(CFG)" == "ttsdtlk - Win32 Debug" || "$(CFG)" == "ttsdtlk - Win32 Release Spanish" || "$(CFG)" == "ttsdtlk - Win32 Release German" || "$(CFG)" == "ttsdtlk - Win32 Release Latin American" || "$(CFG)" == "ttsdtlk - Win32 Debug Spanish" || "$(CFG)" == "ttsdtlk - Win32 Debug German" || "$(CFG)" == "ttsdtlk - Win32 Debug Latin American" || "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom" || "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"
SOURCE=.\Api\AboutDialog.cpp

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"


"$(INTDIR)\AboutDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"


"$(INTDIR)\AboutDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"


"$(INTDIR)\AboutDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"


"$(INTDIR)\AboutDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"


"$(INTDIR)\AboutDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\AboutDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"


"$(INTDIR)\AboutDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\AboutDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\AboutDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\AboutDialog.obj"	"$(INTDIR)\AboutDialog.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Api\auddest.cpp

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"


"$(INTDIR)\auddest.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"


"$(INTDIR)\auddest.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"


"$(INTDIR)\auddest.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"


"$(INTDIR)\auddest.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"


"$(INTDIR)\auddest.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\auddest.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"


"$(INTDIR)\auddest.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\auddest.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\auddest.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\auddest.obj"	"$(INTDIR)\auddest.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Api\audioact.cpp

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"


"$(INTDIR)\audioact.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"


"$(INTDIR)\audioact.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"


"$(INTDIR)\audioact.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"


"$(INTDIR)\audioact.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"


"$(INTDIR)\audioact.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\audioact.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"


"$(INTDIR)\audioact.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\audioact.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\audioact.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\audioact.obj"	"$(INTDIR)\audioact.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\dapi\src\Nt\audqueue.c

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"


"$(INTDIR)\audqueue.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"


"$(INTDIR)\audqueue.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"


"$(INTDIR)\audqueue.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"


"$(INTDIR)\audqueue.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"


"$(INTDIR)\audqueue.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\audqueue.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"


"$(INTDIR)\audqueue.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\audqueue.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\audqueue.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\audqueue.obj"	"$(INTDIR)\audqueue.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Api\BufNotify.cpp

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"


"$(INTDIR)\BufNotify.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"


"$(INTDIR)\BufNotify.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"


"$(INTDIR)\BufNotify.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"


"$(INTDIR)\BufNotify.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"


"$(INTDIR)\BufNotify.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\BufNotify.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"


"$(INTDIR)\BufNotify.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\BufNotify.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\BufNotify.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\BufNotify.obj"	"$(INTDIR)\BufNotify.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Api\ctools.cpp

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"


"$(INTDIR)\ctools.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"


"$(INTDIR)\ctools.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"


"$(INTDIR)\ctools.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"


"$(INTDIR)\ctools.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"


"$(INTDIR)\ctools.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\ctools.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"


"$(INTDIR)\ctools.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\ctools.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\ctools.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\ctools.obj"	"$(INTDIR)\ctools.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\dapi\src\Api\Decstd97.c

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"


"$(INTDIR)\Decstd97.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"


"$(INTDIR)\Decstd97.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"


"$(INTDIR)\Decstd97.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"


"$(INTDIR)\Decstd97.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"


"$(INTDIR)\Decstd97.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\Decstd97.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"


"$(INTDIR)\Decstd97.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\Decstd97.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\Decstd97.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\Decstd97.obj"	"$(INTDIR)\Decstd97.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Api\DECtalkDialogs.cpp

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"


"$(INTDIR)\DECtalkDialogs.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"


"$(INTDIR)\DECtalkDialogs.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"


"$(INTDIR)\DECtalkDialogs.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"


"$(INTDIR)\DECtalkDialogs.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"


"$(INTDIR)\DECtalkDialogs.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\DECtalkDialogs.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"


"$(INTDIR)\DECtalkDialogs.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\DECtalkDialogs.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\DECtalkDialogs.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\DECtalkDialogs.obj"	"$(INTDIR)\DECtalkDialogs.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Api\DialogSpeak.cpp

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"


"$(INTDIR)\DialogSpeak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"


"$(INTDIR)\DialogSpeak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"


"$(INTDIR)\DialogSpeak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"


"$(INTDIR)\DialogSpeak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"


"$(INTDIR)\DialogSpeak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\DialogSpeak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"


"$(INTDIR)\DialogSpeak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\DialogSpeak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\DialogSpeak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\DialogSpeak.obj"	"$(INTDIR)\DialogSpeak.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Api\dtlktts.cpp

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"


"$(INTDIR)\dtlktts.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"


"$(INTDIR)\dtlktts.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"


"$(INTDIR)\dtlktts.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"


"$(INTDIR)\dtlktts.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"


"$(INTDIR)\dtlktts.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\dtlktts.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"


"$(INTDIR)\dtlktts.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\dtlktts.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\dtlktts.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\dtlktts.obj"	"$(INTDIR)\dtlktts.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Api\dtlktts.rc

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"


"$(INTDIR)\dtlktts.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\dtlktts.res" /i "Api" /i ".\Api" /d "NDEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"


"$(INTDIR)\dtlktts.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\dtlktts.res" /i "Api" /i ".\Api" /d "_DEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"


"$(INTDIR)\dtlktts.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\dtlktts.res" /i "Api" /i ".\Api" /d "NDEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"


"$(INTDIR)\dtlktts.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\dtlktts.res" /i "Api" /i ".\Api" /d "NDEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"


"$(INTDIR)\dtlktts.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\dtlktts.res" /i "Api" /i ".\Api" /d "NDEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\dtlktts.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\dtlktts.res" /i "Api" /i ".\Api" /d "_DEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"


"$(INTDIR)\dtlktts.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\dtlktts.res" /i "Api" /i ".\Api" /d "_DEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\dtlktts.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\dtlktts.res" /i "Api" /i ".\Api" /d "_DEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\dtlktts.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\dtlktts.res" /i "Api" /i ".\Api" /d "NDEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\dtlktts.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\dtlktts.res" /i "Api" /i ".\Api" /d "_DEBUG" /d "_AFXDLL" $(SOURCE)


!ENDIF 

SOURCE=.\Api\dtlkttsc.cpp

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"


"$(INTDIR)\dtlkttsc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"


"$(INTDIR)\dtlkttsc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"


"$(INTDIR)\dtlkttsc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"


"$(INTDIR)\dtlkttsc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"


"$(INTDIR)\dtlkttsc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\dtlkttsc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"


"$(INTDIR)\dtlkttsc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\dtlkttsc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\dtlkttsc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\dtlkttsc.obj"	"$(INTDIR)\dtlkttsc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Api\dtlkttse.cpp

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"


"$(INTDIR)\dtlkttse.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"


"$(INTDIR)\dtlkttse.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"


"$(INTDIR)\dtlkttse.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"


"$(INTDIR)\dtlkttse.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"


"$(INTDIR)\dtlkttse.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\dtlkttse.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"


"$(INTDIR)\dtlkttse.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\dtlkttse.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\dtlkttse.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\dtlkttse.obj"	"$(INTDIR)\dtlkttse.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Api\GeneralDialog.cpp

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"


"$(INTDIR)\GeneralDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"


"$(INTDIR)\GeneralDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"


"$(INTDIR)\GeneralDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"


"$(INTDIR)\GeneralDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"


"$(INTDIR)\GeneralDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\GeneralDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"


"$(INTDIR)\GeneralDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\GeneralDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\GeneralDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\GeneralDialog.obj"	"$(INTDIR)\GeneralDialog.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Api\guidseg.cpp

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\guidseg.obj"	"$(INTDIR)\guidseg.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Api\LexiconDialog.cpp

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"


"$(INTDIR)\LexiconDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"


"$(INTDIR)\LexiconDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"


"$(INTDIR)\LexiconDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"


"$(INTDIR)\LexiconDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"


"$(INTDIR)\LexiconDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\LexiconDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"


"$(INTDIR)\LexiconDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\LexiconDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\LexiconDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\LexiconDialog.obj"	"$(INTDIR)\LexiconDialog.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\dapi\src\Nt\mmalloc.c

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\mmalloc.obj"	"$(INTDIR)\mmalloc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\dapi\src\Nt\opthread.c

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\opthread.obj"	"$(INTDIR)\opthread.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\dapi\src\Cmd\par_char.c

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"


"$(INTDIR)\par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"


"$(INTDIR)\par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"


"$(INTDIR)\par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"


"$(INTDIR)\par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"


"$(INTDIR)\par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"


"$(INTDIR)\par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\par_char.obj"	"$(INTDIR)\par_char.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\dapi\src\Nt\pipe.c

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"


"$(INTDIR)\pipe.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"


"$(INTDIR)\pipe.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"


"$(INTDIR)\pipe.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"


"$(INTDIR)\pipe.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"


"$(INTDIR)\pipe.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\pipe.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"


"$(INTDIR)\pipe.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\pipe.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\pipe.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\pipe.obj"	"$(INTDIR)\pipe.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\dapi\src\Vtm\playtone.c

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"


"$(INTDIR)\playtone.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"


"$(INTDIR)\playtone.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"


"$(INTDIR)\playtone.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"


"$(INTDIR)\playtone.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"


"$(INTDIR)\playtone.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\playtone.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"


"$(INTDIR)\playtone.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\playtone.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\playtone.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\playtone.obj"	"$(INTDIR)\playtone.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\dapi\src\Kernel\services.c

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"


"$(INTDIR)\services.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"


"$(INTDIR)\services.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"


"$(INTDIR)\services.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"


"$(INTDIR)\services.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"


"$(INTDIR)\services.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\services.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"


"$(INTDIR)\services.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\services.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\services.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\services.obj"	"$(INTDIR)\services.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\dapi\src\Nt\spc.c

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"


"$(INTDIR)\spc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"


"$(INTDIR)\spc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"


"$(INTDIR)\spc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"


"$(INTDIR)\spc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"


"$(INTDIR)\spc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\spc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"


"$(INTDIR)\spc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\spc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\spc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\spc.obj"	"$(INTDIR)\spc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\dapi\src\Vtm\sync.c

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"


"$(INTDIR)\sync.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"


"$(INTDIR)\sync.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"


"$(INTDIR)\sync.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"


"$(INTDIR)\sync.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"


"$(INTDIR)\sync.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\sync.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"


"$(INTDIR)\sync.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\sync.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\sync.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\sync.obj"	"$(INTDIR)\sync.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Api\TranslateDialog.cpp

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"


"$(INTDIR)\TranslateDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"


"$(INTDIR)\TranslateDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"


"$(INTDIR)\TranslateDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"


"$(INTDIR)\TranslateDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"


"$(INTDIR)\TranslateDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\TranslateDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"


"$(INTDIR)\TranslateDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\TranslateDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\TranslateDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\TranslateDialog.obj"	"$(INTDIR)\TranslateDialog.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\Dapi\Src\Kernel\Usa_init.c

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"


"$(INTDIR)\Usa_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"


"$(INTDIR)\Usa_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"


"$(INTDIR)\Usa_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"


"$(INTDIR)\Usa_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"


"$(INTDIR)\Usa_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\Usa_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"


"$(INTDIR)\Usa_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\Usa_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\Usa_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\Usa_init.obj"	"$(INTDIR)\Usa_init.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Api\VoiceDef.cpp

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"


"$(INTDIR)\VoiceDef.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"


"$(INTDIR)\VoiceDef.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"


"$(INTDIR)\VoiceDef.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"


"$(INTDIR)\VoiceDef.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"


"$(INTDIR)\VoiceDef.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\VoiceDef.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"


"$(INTDIR)\VoiceDef.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\VoiceDef.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\VoiceDef.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\VoiceDef.obj"	"$(INTDIR)\VoiceDef.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\dapi\src\Vtm\vtm.c

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\vtm.obj"	"$(INTDIR)\vtm.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\dapi\src\Vtm\vtmiont.c

!IF  "$(CFG)" == "ttsdtlk - Win32 Release"


"$(INTDIR)\vtmiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug"


"$(INTDIR)\vtmiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Spanish"


"$(INTDIR)\vtmiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release German"


"$(INTDIR)\vtmiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release Latin American"


"$(INTDIR)\vtmiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\vtmiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug German"


"$(INTDIR)\vtmiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\vtmiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\vtmiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "ttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\vtmiont.obj"	"$(INTDIR)\vtmiont.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 


!ENDIF 

