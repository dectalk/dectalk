# Microsoft Developer Studio Generated NMAKE File, Based on Wttsdtlk.dsp
!IF "$(CFG)" == ""
CFG=wttsdtlk - Win32 Debug French
!MESSAGE No configuration specified. Defaulting to wttsdtlk - Win32 Debug French.
!ENDIF 

!IF "$(CFG)" != "wttsdtlk - Win32 Release" && "$(CFG)" != "wttsdtlk - Win32 Debug" && "$(CFG)" != "wttsdtlk - Win32 Release Spanish" && "$(CFG)" != "wttsdtlk - Win32 Release German" && "$(CFG)" != "wttsdtlk - Win32 Release Latin American" && "$(CFG)" != "wttsdtlk - Win32 Debug Spanish" && "$(CFG)" != "wttsdtlk - Win32 Debug German" && "$(CFG)" != "wttsdtlk - Win32 Debug Latin American" && "$(CFG)" != "wttsdtlk - Win32 Release United Kingdom" && "$(CFG)" != "wttsdtlk - Win32 Debug United Kingdom" && "$(CFG)" != "wttsdtlk - Win32 Release French" && "$(CFG)" != "wttsdtlk - Win32 Debug French"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "Wttsdtlk.mak" CFG="wttsdtlk - Win32 Debug French"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "wttsdtlk - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 Release Spanish" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 Release German" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 Release Latin American" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 Debug Spanish" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 Debug German" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 Debug Latin American" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 Release United Kingdom" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 Debug United Kingdom" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 Release French" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 Debug French" (based on "Win32 (x86) Dynamic-Link Library")
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

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"

OUTDIR=.\..\build\wtlkttse\us\release
INTDIR=.\..\build\wtlkttse\us\release\link
# Begin Custom Macros
OutDir=.\..\build\wtlkttse\us\release
# End Custom Macros

ALL : "$(OUTDIR)\wtlkttse.dll"


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
	-@erase "$(INTDIR)\vtmiont.obj"
	-@erase "$(INTDIR)\wtlktts.res"
	-@erase "$(OUTDIR)\link\wtlkttse.map"
	-@erase "$(OUTDIR)\wtlkttse.dll"
	-@erase "$(OUTDIR)\wtlkttse.exp"
	-@erase "$(OUTDIR)\wtlkttse.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\wtlktts.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttsdtlk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\wtlkstat\us\release\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\wtlkttse.pdb" /map:"$(INTDIR)\wtlkttse.map" /machine:I386 /nodefaultlib:"LIBCMT.LIB" /def:".\Api\Wtlkttse.def" /out:"$(OUTDIR)\wtlkttse.dll" /implib:"$(OUTDIR)\wtlkttse.lib" 
DEF_FILE= \
	".\Api\Wtlkttse.def"
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
	"$(INTDIR)\vtmiont.obj" \
	"$(INTDIR)\wtlktts.res"

"$(OUTDIR)\wtlkttse.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"

OUTDIR=.\..\build\wtlkttse\us\debug
INTDIR=.\..\build\wtlkttse\us\debug\link
# Begin Custom Macros
OutDir=.\..\build\wtlkttse\us\debug
# End Custom Macros

ALL : "$(OUTDIR)\wtlkttse.dll"


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
	-@erase "$(INTDIR)\vtmiont.obj"
	-@erase "$(INTDIR)\wtlktts.res"
	-@erase "$(OUTDIR)\link\wtlkttse.map"
	-@erase "$(OUTDIR)\wtlkttse.dll"
	-@erase "$(OUTDIR)\wtlkttse.exp"
	-@erase "$(OUTDIR)\wtlkttse.lib"
	-@erase "$(OUTDIR)\wtlkttse.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "ENGLISH_US" /D "ENGLISH" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\wtlktts.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttsdtlk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\wtlkstat\us\debug\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\wtlkttse.pdb" /map:"$(INTDIR)\wtlkttse.map" /debug /debugtype:both /machine:I386 /def:".\Api\Wtlkttse.def" /out:"$(OUTDIR)\wtlkttse.dll" /implib:"$(OUTDIR)\wtlkttse.lib" 
DEF_FILE= \
	".\Api\Wtlkttse.def"
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
	"$(INTDIR)\vtmiont.obj" \
	"$(INTDIR)\wtlktts.res"

"$(OUTDIR)\wtlkttse.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"

OUTDIR=.\..\build\wtlkttse\sp\release
INTDIR=.\..\build\wtlkttse\sp\release\link
# Begin Custom Macros
OutDir=.\..\build\wtlkttse\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\wtlkttse.dll"


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
	-@erase "$(INTDIR)\vtmiont.obj"
	-@erase "$(INTDIR)\wtlktts.res"
	-@erase "$(OUTDIR)\link\wtlkttse.map"
	-@erase "$(OUTDIR)\wtlkttse.dll"
	-@erase "$(OUTDIR)\wtlkttse.exp"
	-@erase "$(OUTDIR)\wtlkttse.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\wtlktts.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttsdtlk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\wtlkstat\sp\release\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\wtlkttse.pdb" /map:"$(INTDIR)\wtlkttse.map" /machine:I386 /nodefaultlib:"LIBCMT.LIB" /def:".\Api\Wtlkttse.def" /out:"$(OUTDIR)\wtlkttse.dll" /implib:"$(OUTDIR)\wtlkttse.lib" 
DEF_FILE= \
	".\Api\Wtlkttse.def"
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
	"$(INTDIR)\vtmiont.obj" \
	"$(INTDIR)\wtlktts.res"

"$(OUTDIR)\wtlkttse.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"

OUTDIR=.\..\build\wtlkttse\gr\release
INTDIR=.\..\build\wtlkttse\gr\release\link
# Begin Custom Macros
OutDir=.\..\build\wtlkttse\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\wtlkttse.dll"


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
	-@erase "$(INTDIR)\vtmiont.obj"
	-@erase "$(INTDIR)\wtlktts.res"
	-@erase "$(OUTDIR)\link\wtlkttse.map"
	-@erase "$(OUTDIR)\wtlkttse.dll"
	-@erase "$(OUTDIR)\wtlkttse.exp"
	-@erase "$(OUTDIR)\wtlkttse.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\wtlktts.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttsdtlk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\wtlkstat\gr\release\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\wtlkttse.pdb" /map:"$(INTDIR)\wtlkttse.map" /machine:I386 /nodefaultlib:"LIBCMT.LIB" /def:".\Api\Wtlkttse.def" /out:"$(OUTDIR)\wtlkttse.dll" /implib:"$(OUTDIR)\wtlkttse.lib" 
DEF_FILE= \
	".\Api\Wtlkttse.def"
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
	"$(INTDIR)\vtmiont.obj" \
	"$(INTDIR)\wtlktts.res"

"$(OUTDIR)\wtlkttse.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"

OUTDIR=.\..\build\wtlkttse\la\release
INTDIR=.\..\build\wtlkttse\la\release\link
# Begin Custom Macros
OutDir=.\..\build\wtlkttse\la\release
# End Custom Macros

ALL : "$(OUTDIR)\wtlkttse.dll"


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
	-@erase "$(INTDIR)\vtmiont.obj"
	-@erase "$(INTDIR)\wtlktts.res"
	-@erase "$(OUTDIR)\link\wtlkttse.map"
	-@erase "$(OUTDIR)\wtlkttse.dll"
	-@erase "$(OUTDIR)\wtlkttse.exp"
	-@erase "$(OUTDIR)\wtlkttse.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\wtlktts.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttsdtlk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\wtlkstat\la\release\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\wtlkttse.pdb" /map:"$(INTDIR)\wtlkttse.map" /machine:I386 /nodefaultlib:"LIBCMT.LIB" /def:".\Api\Wtlkttse.def" /out:"$(OUTDIR)\wtlkttse.dll" /implib:"$(OUTDIR)\wtlkttse.lib" 
DEF_FILE= \
	".\Api\Wtlkttse.def"
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
	"$(INTDIR)\vtmiont.obj" \
	"$(INTDIR)\wtlktts.res"

"$(OUTDIR)\wtlkttse.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"

OUTDIR=.\..\build\wtlkttse\sp\debug
INTDIR=.\..\build\wtlkttse\sp\debug\link
# Begin Custom Macros
OutDir=.\..\build\wtlkttse\sp\debug
# End Custom Macros

ALL : "$(OUTDIR)\wtlkttse.dll"


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
	-@erase "$(INTDIR)\vtmiont.obj"
	-@erase "$(INTDIR)\wtlktts.res"
	-@erase "$(OUTDIR)\link\wtlkttse.map"
	-@erase "$(OUTDIR)\wtlkttse.dll"
	-@erase "$(OUTDIR)\wtlkttse.exp"
	-@erase "$(OUTDIR)\wtlkttse.lib"
	-@erase "$(OUTDIR)\wtlkttse.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "SPANISH" /D "SPANISH_SP" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\wtlktts.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttsdtlk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\wtlkstat\sp\debug\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\wtlkttse.pdb" /map:"$(INTDIR)\wtlkttse.map" /debug /debugtype:both /machine:I386 /def:".\Api\Wtlkttse.def" /out:"$(OUTDIR)\wtlkttse.dll" /implib:"$(OUTDIR)\wtlkttse.lib" 
DEF_FILE= \
	".\Api\Wtlkttse.def"
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
	"$(INTDIR)\vtmiont.obj" \
	"$(INTDIR)\wtlktts.res"

"$(OUTDIR)\wtlkttse.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"

OUTDIR=.\..\build\wtlkttse\gr\debug
INTDIR=.\..\build\wtlkttse\gr\debug\link
# Begin Custom Macros
OutDir=.\..\build\wtlkttse\gr\debug
# End Custom Macros

ALL : "$(OUTDIR)\wtlkttse.dll"


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
	-@erase "$(INTDIR)\vtmiont.obj"
	-@erase "$(INTDIR)\wtlktts.res"
	-@erase "$(OUTDIR)\link\wtlkttse.map"
	-@erase "$(OUTDIR)\wtlkttse.dll"
	-@erase "$(OUTDIR)\wtlkttse.exp"
	-@erase "$(OUTDIR)\wtlkttse.lib"
	-@erase "$(OUTDIR)\wtlkttse.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\wtlktts.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttsdtlk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\wtlkstat\gr\debug\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\wtlkttse.pdb" /map:"$(INTDIR)\wtlkttse.map" /debug /debugtype:both /machine:I386 /def:".\Api\Wtlkttse.def" /out:"$(OUTDIR)\wtlkttse.dll" /implib:"$(OUTDIR)\wtlkttse.lib" 
DEF_FILE= \
	".\Api\Wtlkttse.def"
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
	"$(INTDIR)\vtmiont.obj" \
	"$(INTDIR)\wtlktts.res"

"$(OUTDIR)\wtlkttse.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"

OUTDIR=.\..\build\wtlkttse\la\debug
INTDIR=.\..\build\wtlkttse\la\debug\link
# Begin Custom Macros
OutDir=.\..\build\wtlkttse\la\debug
# End Custom Macros

ALL : "$(OUTDIR)\wtlkttse.dll"


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
	-@erase "$(INTDIR)\vtmiont.obj"
	-@erase "$(INTDIR)\wtlktts.res"
	-@erase "$(OUTDIR)\link\wtlkttse.map"
	-@erase "$(OUTDIR)\wtlkttse.dll"
	-@erase "$(OUTDIR)\wtlkttse.exp"
	-@erase "$(OUTDIR)\wtlkttse.lib"
	-@erase "$(OUTDIR)\wtlkttse.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\wtlktts.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttsdtlk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\wtlkstat\la\debug\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\wtlkttse.pdb" /map:"$(INTDIR)\wtlkttse.map" /debug /debugtype:both /machine:I386 /def:".\Api\Wtlkttse.def" /out:"$(OUTDIR)\wtlkttse.dll" /implib:"$(OUTDIR)\wtlkttse.lib" 
DEF_FILE= \
	".\Api\Wtlkttse.def"
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
	"$(INTDIR)\vtmiont.obj" \
	"$(INTDIR)\wtlktts.res"

"$(OUTDIR)\wtlkttse.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"

OUTDIR=.\..\build\wtlkttse\uk\release
INTDIR=.\..\build\wtlkttse\uk\release\link
# Begin Custom Macros
OutDir=.\..\build\wtlkttse\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\wtlkttse.dll"


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
	-@erase "$(INTDIR)\vtmiont.obj"
	-@erase "$(INTDIR)\wtlktts.res"
	-@erase "$(OUTDIR)\link\wtlkttse.map"
	-@erase "$(OUTDIR)\wtlkttse.dll"
	-@erase "$(OUTDIR)\wtlkttse.exp"
	-@erase "$(OUTDIR)\wtlkttse.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "ENGLISH_UK" /D "ENGLISH" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\wtlktts.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttsdtlk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\wtlkstat\uk\release\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\wtlkttse.pdb" /map:"$(INTDIR)\wtlkttse.map" /machine:I386 /nodefaultlib:"LIBCMT.LIB" /def:".\Api\Wtlkttse.def" /out:"$(OUTDIR)\wtlkttse.dll" /implib:"$(OUTDIR)\wtlkttse.lib" 
DEF_FILE= \
	".\Api\Wtlkttse.def"
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
	"$(INTDIR)\vtmiont.obj" \
	"$(INTDIR)\wtlktts.res"

"$(OUTDIR)\wtlkttse.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"

OUTDIR=.\..\build\wtlkttse\uk\debug
INTDIR=.\..\build\wtlkttse\uk\debug\link
# Begin Custom Macros
OutDir=.\..\build\wtlkttse\uk\debug
# End Custom Macros

ALL : "$(OUTDIR)\wtlkttse.dll"


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
	-@erase "$(INTDIR)\vtmiont.obj"
	-@erase "$(INTDIR)\wtlktts.res"
	-@erase "$(OUTDIR)\link\wtlkttse.map"
	-@erase "$(OUTDIR)\wtlkttse.dll"
	-@erase "$(OUTDIR)\wtlkttse.exp"
	-@erase "$(OUTDIR)\wtlkttse.lib"
	-@erase "$(OUTDIR)\wtlkttse.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "ENGLISH_UK" /D "ENGLISH" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\wtlktts.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttsdtlk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\wtlkstat\uk\debug\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\wtlkttse.pdb" /map:"$(INTDIR)\wtlkttse.map" /debug /debugtype:both /machine:I386 /def:".\Api\Wtlkttse.def" /out:"$(OUTDIR)\wtlkttse.dll" /implib:"$(OUTDIR)\wtlkttse.lib" 
DEF_FILE= \
	".\Api\Wtlkttse.def"
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
	"$(INTDIR)\vtmiont.obj" \
	"$(INTDIR)\wtlktts.res"

"$(OUTDIR)\wtlkttse.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release French"

OUTDIR=.\..\build\wtlkttse\fr\release
INTDIR=.\..\build\wtlkttse\fr\release\link
# Begin Custom Macros
OutDir=.\..\build\wtlkttse\fr\release
# End Custom Macros

ALL : "$(OUTDIR)\wtlkttse.dll"


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
	-@erase "$(INTDIR)\vtmiont.obj"
	-@erase "$(INTDIR)\wtlktts.res"
	-@erase "$(OUTDIR)\link\wtlkttse.map"
	-@erase "$(OUTDIR)\wtlkttse.dll"
	-@erase "$(OUTDIR)\wtlkttse.exp"
	-@erase "$(OUTDIR)\wtlkttse.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "FRENCH" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x40c /fo"$(INTDIR)\wtlktts.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttsdtlk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\wtlkstat\fr\release\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\wtlkttse.pdb" /map:"$(INTDIR)\wtlkttse.map" /machine:I386 /nodefaultlib:"LIBCMT.LIB" /def:".\Api\Wtlkttse.def" /out:"$(OUTDIR)\wtlkttse.dll" /implib:"$(OUTDIR)\wtlkttse.lib" 
DEF_FILE= \
	".\Api\Wtlkttse.def"
LINK32_OBJS= \
	"$(INTDIR)\wtlktts.res" \
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
	"$(INTDIR)\vtmiont.obj"

"$(OUTDIR)\wtlkttse.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug French"

OUTDIR=.\..\build\wtlkttse\fr\debug
INTDIR=.\..\build\wtlkttse\fr\debug\link
# Begin Custom Macros
OutDir=.\..\build\wtlkttse\fr\debug
# End Custom Macros

ALL : "$(OUTDIR)\wtlkttse.dll"


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
	-@erase "$(INTDIR)\vtmiont.obj"
	-@erase "$(INTDIR)\wtlktts.res"
	-@erase "$(OUTDIR)\link\wtlkttse.map"
	-@erase "$(OUTDIR)\wtlkttse.dll"
	-@erase "$(OUTDIR)\wtlkttse.exp"
	-@erase "$(OUTDIR)\wtlkttse.lib"
	-@erase "$(OUTDIR)\wtlkttse.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "FRENCH" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\wtlktts.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttsdtlk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\wtlkstat\fr\debug\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\wtlkttse.pdb" /map:"$(INTDIR)\wtlkttse.map" /debug /debugtype:both /machine:I386 /def:".\Api\Wtlkttse.def" /out:"$(OUTDIR)\wtlkttse.dll" /implib:"$(OUTDIR)\wtlkttse.lib" 
DEF_FILE= \
	".\Api\Wtlkttse.def"
LINK32_OBJS= \
	"$(INTDIR)\wtlktts.res" \
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
	"$(INTDIR)\vtmiont.obj"

"$(OUTDIR)\wtlkttse.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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
!IF EXISTS("Wttsdtlk.dep")
!INCLUDE "Wttsdtlk.dep"
!ELSE 
!MESSAGE Warning: cannot find "Wttsdtlk.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "wttsdtlk - Win32 Release" || "$(CFG)" == "wttsdtlk - Win32 Debug" || "$(CFG)" == "wttsdtlk - Win32 Release Spanish" || "$(CFG)" == "wttsdtlk - Win32 Release German" || "$(CFG)" == "wttsdtlk - Win32 Release Latin American" || "$(CFG)" == "wttsdtlk - Win32 Debug Spanish" || "$(CFG)" == "wttsdtlk - Win32 Debug German" || "$(CFG)" == "wttsdtlk - Win32 Debug Latin American" || "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom" || "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom" || "$(CFG)" == "wttsdtlk - Win32 Release French" || "$(CFG)" == "wttsdtlk - Win32 Debug French"
SOURCE=.\API\AboutDialog.cpp

"$(INTDIR)\AboutDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Api\auddest.cpp

"$(INTDIR)\auddest.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Api\audioact.cpp

"$(INTDIR)\audioact.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\dapi\src\Nt\audqueue.c

"$(INTDIR)\audqueue.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\API\BufNotify.cpp

"$(INTDIR)\BufNotify.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Api\ctools.cpp

"$(INTDIR)\ctools.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\dapi\src\Api\Decstd97.c

"$(INTDIR)\Decstd97.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\API\DECtalkDialogs.cpp

"$(INTDIR)\DECtalkDialogs.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Api\DialogSpeak.cpp

"$(INTDIR)\DialogSpeak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Api\dtlktts.cpp

"$(INTDIR)\dtlktts.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Api\dtlktts.rc

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"


"$(INTDIR)\wtlktts.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\wtlktts.res" /i "Api" /i ".\Api" /d "NDEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"


"$(INTDIR)\wtlktts.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\wtlktts.res" /i "Api" /i ".\Api" /d "_DEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"


"$(INTDIR)\wtlktts.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\wtlktts.res" /i "Api" /i ".\Api" /d "NDEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"


"$(INTDIR)\wtlktts.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\wtlktts.res" /i "Api" /i ".\Api" /d "NDEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"


"$(INTDIR)\wtlktts.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\wtlktts.res" /i "Api" /i ".\Api" /d "NDEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\wtlktts.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\wtlktts.res" /i "Api" /i ".\Api" /d "_DEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"


"$(INTDIR)\wtlktts.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\wtlktts.res" /i "Api" /i ".\Api" /d "_DEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\wtlktts.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\wtlktts.res" /i "Api" /i ".\Api" /d "_DEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\wtlktts.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\wtlktts.res" /i "Api" /i ".\Api" /d "NDEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\wtlktts.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\wtlktts.res" /i "Api" /i ".\Api" /d "_DEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release French"


"$(INTDIR)\wtlktts.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\wtlktts.res" /i "Api" /i ".\Api" /d "NDEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug French"


"$(INTDIR)\wtlktts.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\wtlktts.res" /i "Api" /i ".\Api" /d "_DEBUG" /d "_AFXDLL" $(SOURCE)


!ENDIF 

SOURCE=.\Api\dtlkttsc.cpp

"$(INTDIR)\dtlkttsc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Api\dtlkttse.cpp

"$(INTDIR)\dtlkttse.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\API\GeneralDialog.cpp

"$(INTDIR)\GeneralDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Api\guidseg.cpp

"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\API\LexiconDialog.cpp

"$(INTDIR)\LexiconDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\dapi\src\Nt\mmalloc.c

"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\dapi\src\Nt\opthread.c

"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\dapi\src\Cmd\par_char.c

"$(INTDIR)\par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\dapi\src\Nt\pipe.c

"$(INTDIR)\pipe.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\dapi\src\Vtm\playtone.c

"$(INTDIR)\playtone.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\dapi\src\Kernel\services.c

"$(INTDIR)\services.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\dapi\src\Nt\spc.c

"$(INTDIR)\spc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\dapi\src\Vtm\sync.c

"$(INTDIR)\sync.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\API\TranslateDialog.cpp

"$(INTDIR)\TranslateDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\dapi\Src\Kernel\Usa_init.c

"$(INTDIR)\Usa_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Api\VoiceDef.cpp

"$(INTDIR)\VoiceDef.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\dapi\src\Vtm\vtmiont.c

"$(INTDIR)\vtmiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)



!ENDIF 

