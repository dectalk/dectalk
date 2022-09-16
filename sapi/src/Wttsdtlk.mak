# Microsoft Developer Studio Generated NMAKE File, Based on Wttsdtlk.dsp
!IF "$(CFG)" == ""
CFG=wttsdtlk - Win32 ALPHA Debug United Kingdom
!MESSAGE No configuration specified. Defaulting to wttsdtlk - Win32 ALPHA Debug United Kingdom.
!ENDIF 

!IF "$(CFG)" != "wttsdtlk - Win32 Release" && "$(CFG)" != "wttsdtlk - Win32 Debug" && "$(CFG)" != "wttsdtlk - Win32 Release Spanish" && "$(CFG)" != "wttsdtlk - Win32 Release German" && "$(CFG)" != "wttsdtlk - Win32 Release Latin American" && "$(CFG)" != "wttsdtlk - Win32 Debug Spanish" && "$(CFG)" != "wttsdtlk - Win32 Debug German" && "$(CFG)" != "wttsdtlk - Win32 Debug Latin American" && "$(CFG)" != "wttsdtlk - Win32 ALPHA Release" && "$(CFG)" != "wttsdtlk - Win32 ALPHA Debug" && "$(CFG)" != "wttsdtlk - Win32 ALPHA Release Spanish" && "$(CFG)" != "wttsdtlk - Win32 ALPHA Release German" && "$(CFG)" != "wttsdtlk - Win32 ALPHA Release Latin American" && "$(CFG)" != "wttsdtlk - Win32 ALPHA Debug Spanish" && "$(CFG)" != "wttsdtlk - Win32 ALPHA Debug German" && "$(CFG)" != "wttsdtlk - Win32 ALPHA Debug Latin American" && "$(CFG)" != "wttsdtlk - Win32 Release United Kingdom" && "$(CFG)" != "wttsdtlk - Win32 Debug United Kingdom" && "$(CFG)" != "wttsdtlk - Win32 ALPHA Release United Kingdom" && "$(CFG)" != "wttsdtlk - Win32 ALPHA Debug United Kingdom"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "Wttsdtlk.mak" CFG="wttsdtlk - Win32 ALPHA Debug United Kingdom"
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
!MESSAGE "wttsdtlk - Win32 ALPHA Release" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 ALPHA Debug" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 ALPHA Release Spanish" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 ALPHA Release German" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 ALPHA Release Latin American" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 ALPHA Debug Spanish" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 ALPHA Debug German" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 ALPHA Debug Latin American" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 Release United Kingdom" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 Debug United Kingdom" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 ALPHA Release United Kingdom" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "wttsdtlk - Win32 ALPHA Debug United Kingdom" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

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

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

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

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "ENGLISH_US" /D "ENGLISH" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

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

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

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

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

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

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

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

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "SPANISH" /D "SPANISH_SP" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

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

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

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

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

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

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

OUTDIR=.\..\alpha\wtlkttse\us\release
INTDIR=.\..\alpha\wtlkttse\us\release\link
# Begin Custom Macros
OutDir=.\..\alpha\wtlkttse\us\release
# End Custom Macros

ALL : "$(OUTDIR)\wtlkttse.dll"


CLEAN :
	-@erase "$(INTDIR)\wtlktts.res"
	-@erase "$(OUTDIR)\link\wtlkttse.map"
	-@erase "$(OUTDIR)\wtlkttse.dll"
	-@erase "$(OUTDIR)\wtlkttse.exp"
	-@erase "$(OUTDIR)\wtlkttse.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\wtlktts.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttsdtlk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\wtlkstat\us\release\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\wtlkttse.pdb" /map:"$(INTDIR)\wtlkttse.map" /machine:ALPHA /nodefaultlib:"LIBCMT.LIB" /def:".\Api\Wtlkttse.def" /out:"$(OUTDIR)\wtlkttse.dll" /implib:"$(OUTDIR)\wtlkttse.lib" 
DEF_FILE= \
	".\Api\Wtlkttse.def"
LINK32_OBJS= \
	"$(INTDIR)\wtlktts.res"

"$(OUTDIR)\wtlkttse.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

OUTDIR=.\..\alpha\wtlkttse\us\debug
INTDIR=.\..\alpha\wtlkttse\us\debug\link
# Begin Custom Macros
OutDir=.\..\alpha\wtlkttse\us\debug
# End Custom Macros

ALL : "$(OUTDIR)\wtlkttse.dll"


CLEAN :
	-@erase "$(INTDIR)\wtlktts.res"
	-@erase "$(OUTDIR)\link\wtlkttse.map"
	-@erase "$(OUTDIR)\wtlkttse.dll"
	-@erase "$(OUTDIR)\wtlkttse.exp"
	-@erase "$(OUTDIR)\wtlkttse.ilk"
	-@erase "$(OUTDIR)\wtlkttse.lib"
	-@erase "$(OUTDIR)\wtlkttse.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\wtlktts.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttsdtlk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\wtlkstat\us\debug\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\wtlkttse.pdb" /map:"$(INTDIR)\wtlkttse.map" /debug /debugtype:both /machine:ALPHA /def:".\Api\Wtlkttse.def" /out:"$(OUTDIR)\wtlkttse.dll" /implib:"$(OUTDIR)\wtlkttse.lib" 
DEF_FILE= \
	".\Api\Wtlkttse.def"
LINK32_OBJS= \
	"$(INTDIR)\wtlktts.res"

"$(OUTDIR)\wtlkttse.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

OUTDIR=.\..\alpha\wtlkttse\sp\release
INTDIR=.\..\alpha\wtlkttse\sp\release\link
# Begin Custom Macros
OutDir=.\..\alpha\wtlkttse\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\wtlkttse.dll"


CLEAN :
	-@erase "$(INTDIR)\wtlktts.res"
	-@erase "$(OUTDIR)\link\wtlkttse.map"
	-@erase "$(OUTDIR)\wtlkttse.dll"
	-@erase "$(OUTDIR)\wtlkttse.exp"
	-@erase "$(OUTDIR)\wtlkttse.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\wtlktts.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttsdtlk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\wtlkstat\sp\release\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\wtlkttse.pdb" /map:"$(INTDIR)\wtlkttse.map" /machine:ALPHA /nodefaultlib:"LIBCMT.LIB" /def:".\Api\Wtlkttse.def" /out:"$(OUTDIR)\wtlkttse.dll" /implib:"$(OUTDIR)\wtlkttse.lib" 
DEF_FILE= \
	".\Api\Wtlkttse.def"
LINK32_OBJS= \
	"$(INTDIR)\wtlktts.res"

"$(OUTDIR)\wtlkttse.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

OUTDIR=.\..\alpha\wtlkttse\gr\release
INTDIR=.\..\alpha\wtlkttse\gr\release\link
# Begin Custom Macros
OutDir=.\..\alpha\wtlkttse\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\wtlkttse.dll"


CLEAN :
	-@erase "$(INTDIR)\wtlktts.res"
	-@erase "$(OUTDIR)\link\wtlkttse.map"
	-@erase "$(OUTDIR)\wtlkttse.dll"
	-@erase "$(OUTDIR)\wtlkttse.exp"
	-@erase "$(OUTDIR)\wtlkttse.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\wtlktts.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttsdtlk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\wtlkstat\gr\release\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\wtlkttse.pdb" /map:"$(INTDIR)\wtlkttse.map" /machine:ALPHA /nodefaultlib:"LIBCMT.LIB" /def:".\Api\Wtlkttse.def" /out:"$(OUTDIR)\wtlkttse.dll" /implib:"$(OUTDIR)\wtlkttse.lib" 
DEF_FILE= \
	".\Api\Wtlkttse.def"
LINK32_OBJS= \
	"$(INTDIR)\wtlktts.res"

"$(OUTDIR)\wtlkttse.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

OUTDIR=.\..\alpha\wtlkttse\la\release
INTDIR=.\..\alpha\wtlkttse\la\release\link
# Begin Custom Macros
OutDir=.\..\alpha\wtlkttse\la\release
# End Custom Macros

ALL : "$(OUTDIR)\wtlkttse.dll"


CLEAN :
	-@erase "$(INTDIR)\wtlktts.res"
	-@erase "$(OUTDIR)\link\wtlkttse.map"
	-@erase "$(OUTDIR)\wtlkttse.dll"
	-@erase "$(OUTDIR)\wtlkttse.exp"
	-@erase "$(OUTDIR)\wtlkttse.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\wtlktts.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttsdtlk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\wtlkstat\la\release\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\wtlkttse.pdb" /map:"$(INTDIR)\wtlkttse.map" /machine:ALPHA /nodefaultlib:"LIBCMT.LIB" /def:".\Api\Wtlkttse.def" /out:"$(OUTDIR)\wtlkttse.dll" /implib:"$(OUTDIR)\wtlkttse.lib" 
DEF_FILE= \
	".\Api\Wtlkttse.def"
LINK32_OBJS= \
	"$(INTDIR)\wtlktts.res"

"$(OUTDIR)\wtlkttse.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

OUTDIR=.\..\alpha\wtlkttse\sp\debug
INTDIR=.\..\alpha\wtlkttse\sp\debug\link
# Begin Custom Macros
OutDir=.\..\alpha\wtlkttse\sp\debug
# End Custom Macros

ALL : "$(OUTDIR)\wtlkttse.dll"


CLEAN :
	-@erase "$(INTDIR)\wtlktts.res"
	-@erase "$(OUTDIR)\link\wtlkttse.map"
	-@erase "$(OUTDIR)\wtlkttse.dll"
	-@erase "$(OUTDIR)\wtlkttse.exp"
	-@erase "$(OUTDIR)\wtlkttse.ilk"
	-@erase "$(OUTDIR)\wtlkttse.lib"
	-@erase "$(OUTDIR)\wtlkttse.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\wtlktts.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttsdtlk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\wtlkstat\sp\debug\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\wtlkttse.pdb" /map:"$(INTDIR)\wtlkttse.map" /debug /debugtype:both /machine:ALPHA /def:".\Api\Wtlkttse.def" /out:"$(OUTDIR)\wtlkttse.dll" /implib:"$(OUTDIR)\wtlkttse.lib" 
DEF_FILE= \
	".\Api\Wtlkttse.def"
LINK32_OBJS= \
	"$(INTDIR)\wtlktts.res"

"$(OUTDIR)\wtlkttse.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

OUTDIR=.\..\alpha\wtlkttse\gr\debug
INTDIR=.\..\alpha\wtlkttse\gr\debug\link
# Begin Custom Macros
OutDir=.\..\alpha\wtlkttse\gr\debug
# End Custom Macros

ALL : "$(OUTDIR)\wtlkttse.dll"


CLEAN :
	-@erase "$(INTDIR)\wtlktts.res"
	-@erase "$(OUTDIR)\link\wtlkttse.map"
	-@erase "$(OUTDIR)\wtlkttse.dll"
	-@erase "$(OUTDIR)\wtlkttse.exp"
	-@erase "$(OUTDIR)\wtlkttse.ilk"
	-@erase "$(OUTDIR)\wtlkttse.lib"
	-@erase "$(OUTDIR)\wtlkttse.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\wtlktts.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttsdtlk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\wtlkstat\gr\debug\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\wtlkttse.pdb" /map:"$(INTDIR)\wtlkttse.map" /debug /debugtype:both /machine:ALPHA /def:".\Api\Wtlkttse.def" /out:"$(OUTDIR)\wtlkttse.dll" /implib:"$(OUTDIR)\wtlkttse.lib" 
DEF_FILE= \
	".\Api\Wtlkttse.def"
LINK32_OBJS= \
	"$(INTDIR)\wtlktts.res"

"$(OUTDIR)\wtlkttse.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

OUTDIR=.\..\alpha\wtlkttse\la\debug
INTDIR=.\..\alpha\wtlkttse\la\debug\link
# Begin Custom Macros
OutDir=.\..\alpha\wtlkttse\la\debug
# End Custom Macros

ALL : "$(OUTDIR)\wtlkttse.dll"


CLEAN :
	-@erase "$(INTDIR)\wtlktts.res"
	-@erase "$(OUTDIR)\link\wtlkttse.map"
	-@erase "$(OUTDIR)\wtlkttse.dll"
	-@erase "$(OUTDIR)\wtlkttse.exp"
	-@erase "$(OUTDIR)\wtlkttse.ilk"
	-@erase "$(OUTDIR)\wtlkttse.lib"
	-@erase "$(OUTDIR)\wtlkttse.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\wtlktts.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttsdtlk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\wtlkstat\la\debug\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\wtlkttse.pdb" /map:"$(INTDIR)\wtlkttse.map" /debug /debugtype:both /machine:ALPHA /def:".\Api\Wtlkttse.def" /out:"$(OUTDIR)\wtlkttse.dll" /implib:"$(OUTDIR)\wtlkttse.lib" 
DEF_FILE= \
	".\Api\Wtlkttse.def"
LINK32_OBJS= \
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

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "NDEBUG" /D "ENGLISH_UK" /D "ENGLISH" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

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

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I "..\..\samples\ttstest" /I "..\..\samples\wttstest" /I "..\..\dapi\src\include" /I "..\..\dapi\src\api" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\ph" /I "..\..\dapi\src\protos" /I "..\..\dapi\src\cmd" /I "..\..\cpanel\src" /I "..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "_CRTDBG_MAP_ALLOC" /D "ENGLISH_UK" /D "ENGLISH" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "_USRDLL" /D "_WINDLL" /D "_AFXDLL" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /D RTLICENSEKEY="\"WpDec@n1G\"" /c 

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

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

OUTDIR=.\..\alpha\wtlkttse\uk\release
INTDIR=.\..\alpha\wtlkttse\uk\release\link
# Begin Custom Macros
OutDir=.\..\alpha\wtlkttse\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\wtlkttse.dll"


CLEAN :
	-@erase "$(INTDIR)\wtlktts.res"
	-@erase "$(OUTDIR)\link\wtlkttse.map"
	-@erase "$(OUTDIR)\wtlkttse.dll"
	-@erase "$(OUTDIR)\wtlkttse.exp"
	-@erase "$(OUTDIR)\wtlkttse.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\wtlktts.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttsdtlk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\wtlkstat\uk\release\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\wtlkttse.pdb" /map:"$(INTDIR)\wtlkttse.map" /machine:ALPHA /nodefaultlib:"LIBCMT.LIB" /def:".\Api\Wtlkttse.def" /out:"$(OUTDIR)\wtlkttse.dll" /implib:"$(OUTDIR)\wtlkttse.lib" 
DEF_FILE= \
	".\Api\Wtlkttse.def"
LINK32_OBJS= \
	"$(INTDIR)\wtlktts.res"

"$(OUTDIR)\wtlkttse.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

OUTDIR=.\..\alpha\wtlkttse\uk\debug
INTDIR=.\..\alpha\wtlkttse\uk\debug\link
# Begin Custom Macros
OutDir=.\..\alpha\wtlkttse\uk\debug
# End Custom Macros

ALL : "$(OUTDIR)\wtlkttse.dll"


CLEAN :
	-@erase "$(INTDIR)\wtlktts.res"
	-@erase "$(OUTDIR)\link\wtlkttse.map"
	-@erase "$(OUTDIR)\wtlkttse.dll"
	-@erase "$(OUTDIR)\wtlkttse.exp"
	-@erase "$(OUTDIR)\wtlkttse.ilk"
	-@erase "$(OUTDIR)\wtlkttse.lib"
	-@erase "$(OUTDIR)\wtlkttse.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\wtlktts.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wttsdtlk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\wtlkstat\uk\debug\wtlkstat.lib winmm.lib /nologo /version:4.30 /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\wtlkttse.pdb" /map:"$(INTDIR)\wtlkttse.map" /debug /debugtype:both /machine:ALPHA /def:".\Api\Wtlkttse.def" /out:"$(OUTDIR)\wtlkttse.dll" /implib:"$(OUTDIR)\wtlkttse.lib" 
DEF_FILE= \
	".\Api\Wtlkttse.def"
LINK32_OBJS= \
	"$(INTDIR)\wtlktts.res"

"$(OUTDIR)\wtlkttse.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Wttsdtlk.dep")
!INCLUDE "Wttsdtlk.dep"
!ELSE 
!MESSAGE Warning: cannot find "Wttsdtlk.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "wttsdtlk - Win32 Release" || "$(CFG)" == "wttsdtlk - Win32 Debug" || "$(CFG)" == "wttsdtlk - Win32 Release Spanish" || "$(CFG)" == "wttsdtlk - Win32 Release German" || "$(CFG)" == "wttsdtlk - Win32 Release Latin American" || "$(CFG)" == "wttsdtlk - Win32 Debug Spanish" || "$(CFG)" == "wttsdtlk - Win32 Debug German" || "$(CFG)" == "wttsdtlk - Win32 Debug Latin American" || "$(CFG)" == "wttsdtlk - Win32 ALPHA Release" || "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug" || "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish" || "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German" || "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American" || "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish" || "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German" || "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American" || "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom" || "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom" || "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom" || "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"
SOURCE=.\API\AboutDialog.cpp

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"


"$(INTDIR)\AboutDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"


"$(INTDIR)\AboutDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"


"$(INTDIR)\AboutDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"


"$(INTDIR)\AboutDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"


"$(INTDIR)\AboutDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\AboutDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"


"$(INTDIR)\AboutDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\AboutDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\AboutDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\AboutDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

!ENDIF 

SOURCE=.\Api\auddest.cpp

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"


"$(INTDIR)\auddest.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"


"$(INTDIR)\auddest.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"


"$(INTDIR)\auddest.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"


"$(INTDIR)\auddest.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"


"$(INTDIR)\auddest.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\auddest.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"


"$(INTDIR)\auddest.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\auddest.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\auddest.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\auddest.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

!ENDIF 

SOURCE=.\Api\audioact.cpp

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"


"$(INTDIR)\audioact.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"


"$(INTDIR)\audioact.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"


"$(INTDIR)\audioact.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"


"$(INTDIR)\audioact.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"


"$(INTDIR)\audioact.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\audioact.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"


"$(INTDIR)\audioact.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\audioact.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\audioact.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\audioact.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

!ENDIF 

SOURCE=..\..\dapi\src\Nt\audqueue.c

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"


"$(INTDIR)\audqueue.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"


"$(INTDIR)\audqueue.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"


"$(INTDIR)\audqueue.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"


"$(INTDIR)\audqueue.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"


"$(INTDIR)\audqueue.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\audqueue.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"


"$(INTDIR)\audqueue.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\audqueue.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\audqueue.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\audqueue.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

!ENDIF 

SOURCE=.\API\BufNotify.cpp

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"


"$(INTDIR)\BufNotify.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"


"$(INTDIR)\BufNotify.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"


"$(INTDIR)\BufNotify.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"


"$(INTDIR)\BufNotify.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"


"$(INTDIR)\BufNotify.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\BufNotify.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"


"$(INTDIR)\BufNotify.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\BufNotify.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\BufNotify.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\BufNotify.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

!ENDIF 

SOURCE=.\Api\ctools.cpp

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"


"$(INTDIR)\ctools.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"


"$(INTDIR)\ctools.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"


"$(INTDIR)\ctools.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"


"$(INTDIR)\ctools.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"


"$(INTDIR)\ctools.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\ctools.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"


"$(INTDIR)\ctools.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\ctools.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\ctools.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\ctools.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

!ENDIF 

SOURCE=..\..\dapi\src\Api\Decstd97.c

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"


"$(INTDIR)\Decstd97.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"


"$(INTDIR)\Decstd97.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"


"$(INTDIR)\Decstd97.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"


"$(INTDIR)\Decstd97.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"


"$(INTDIR)\Decstd97.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\Decstd97.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"


"$(INTDIR)\Decstd97.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\Decstd97.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\Decstd97.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\Decstd97.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

!ENDIF 

SOURCE=.\API\DECtalkDialogs.cpp

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"


"$(INTDIR)\DECtalkDialogs.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"


"$(INTDIR)\DECtalkDialogs.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"


"$(INTDIR)\DECtalkDialogs.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"


"$(INTDIR)\DECtalkDialogs.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"


"$(INTDIR)\DECtalkDialogs.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\DECtalkDialogs.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"


"$(INTDIR)\DECtalkDialogs.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\DECtalkDialogs.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\DECtalkDialogs.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\DECtalkDialogs.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

!ENDIF 

SOURCE=.\Api\DialogSpeak.cpp

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"


"$(INTDIR)\DialogSpeak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"


"$(INTDIR)\DialogSpeak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"


"$(INTDIR)\DialogSpeak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"


"$(INTDIR)\DialogSpeak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"


"$(INTDIR)\DialogSpeak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\DialogSpeak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"


"$(INTDIR)\DialogSpeak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\DialogSpeak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\DialogSpeak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\DialogSpeak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

!ENDIF 

SOURCE=.\Api\dtlktts.cpp

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"


"$(INTDIR)\dtlktts.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"


"$(INTDIR)\dtlktts.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"


"$(INTDIR)\dtlktts.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"


"$(INTDIR)\dtlktts.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"


"$(INTDIR)\dtlktts.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\dtlktts.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"


"$(INTDIR)\dtlktts.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\dtlktts.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\dtlktts.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\dtlktts.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

!ENDIF 

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


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"


"$(INTDIR)\wtlktts.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\wtlktts.res" /i "Api" /i ".\Api" /d "NDEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"


"$(INTDIR)\wtlktts.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\wtlktts.res" /i "Api" /i ".\Api" /d "_DEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"


"$(INTDIR)\wtlktts.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\wtlktts.res" /i "Api" /i ".\Api" /d "NDEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"


"$(INTDIR)\wtlktts.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\wtlktts.res" /i "Api" /i ".\Api" /d "NDEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"


"$(INTDIR)\wtlktts.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\wtlktts.res" /i "Api" /i ".\Api" /d "NDEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"


"$(INTDIR)\wtlktts.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\wtlktts.res" /i "Api" /i ".\Api" /d "_DEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"


"$(INTDIR)\wtlktts.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\wtlktts.res" /i "Api" /i ".\Api" /d "_DEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"


"$(INTDIR)\wtlktts.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\wtlktts.res" /i "Api" /i ".\Api" /d "_DEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\wtlktts.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\wtlktts.res" /i "Api" /i ".\Api" /d "NDEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\wtlktts.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\wtlktts.res" /i "Api" /i ".\Api" /d "_DEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"


"$(INTDIR)\wtlktts.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\wtlktts.res" /i "Api" /i ".\Api" /d "NDEBUG" /d "_AFXDLL" $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"


"$(INTDIR)\wtlktts.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\wtlktts.res" /i "Api" /i ".\Api" /d "_DEBUG" /d "_AFXDLL" $(SOURCE)


!ENDIF 

SOURCE=.\Api\dtlkttsc.cpp

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"


"$(INTDIR)\dtlkttsc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"


"$(INTDIR)\dtlkttsc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"


"$(INTDIR)\dtlkttsc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"


"$(INTDIR)\dtlkttsc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"


"$(INTDIR)\dtlkttsc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\dtlkttsc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"


"$(INTDIR)\dtlkttsc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\dtlkttsc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\dtlkttsc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\dtlkttsc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

!ENDIF 

SOURCE=.\Api\dtlkttse.cpp

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"


"$(INTDIR)\dtlkttse.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"


"$(INTDIR)\dtlkttse.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"


"$(INTDIR)\dtlkttse.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"


"$(INTDIR)\dtlkttse.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"


"$(INTDIR)\dtlkttse.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\dtlkttse.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"


"$(INTDIR)\dtlkttse.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\dtlkttse.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\dtlkttse.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\dtlkttse.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

!ENDIF 

SOURCE=.\API\GeneralDialog.cpp

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"


"$(INTDIR)\GeneralDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"


"$(INTDIR)\GeneralDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"


"$(INTDIR)\GeneralDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"


"$(INTDIR)\GeneralDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"


"$(INTDIR)\GeneralDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\GeneralDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"


"$(INTDIR)\GeneralDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\GeneralDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\GeneralDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\GeneralDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

!ENDIF 

SOURCE=.\Api\guidseg.cpp

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\guidseg.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

!ENDIF 

SOURCE=.\API\LexiconDialog.cpp

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"


"$(INTDIR)\LexiconDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"


"$(INTDIR)\LexiconDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"


"$(INTDIR)\LexiconDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"


"$(INTDIR)\LexiconDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"


"$(INTDIR)\LexiconDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\LexiconDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"


"$(INTDIR)\LexiconDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\LexiconDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\LexiconDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\LexiconDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

!ENDIF 

SOURCE=..\..\dapi\src\Nt\mmalloc.c

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

!ENDIF 

SOURCE=..\..\dapi\src\Nt\opthread.c

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

!ENDIF 

SOURCE=..\..\dapi\src\Cmd\par_char.c

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"


"$(INTDIR)\par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"


"$(INTDIR)\par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"


"$(INTDIR)\par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"


"$(INTDIR)\par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"


"$(INTDIR)\par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"


"$(INTDIR)\par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

!ENDIF 

SOURCE=..\..\dapi\src\Nt\pipe.c

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"


"$(INTDIR)\pipe.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"


"$(INTDIR)\pipe.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"


"$(INTDIR)\pipe.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"


"$(INTDIR)\pipe.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"


"$(INTDIR)\pipe.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\pipe.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"


"$(INTDIR)\pipe.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\pipe.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\pipe.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\pipe.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

!ENDIF 

SOURCE=..\..\dapi\src\Vtm\playtone.c

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"


"$(INTDIR)\playtone.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"


"$(INTDIR)\playtone.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"


"$(INTDIR)\playtone.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"


"$(INTDIR)\playtone.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"


"$(INTDIR)\playtone.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\playtone.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"


"$(INTDIR)\playtone.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\playtone.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\playtone.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\playtone.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

!ENDIF 

SOURCE=..\..\dapi\src\Kernel\services.c

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"


"$(INTDIR)\services.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"


"$(INTDIR)\services.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"


"$(INTDIR)\services.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"


"$(INTDIR)\services.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"


"$(INTDIR)\services.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\services.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"


"$(INTDIR)\services.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\services.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\services.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\services.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

!ENDIF 

SOURCE=..\..\dapi\src\Nt\spc.c

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"


"$(INTDIR)\spc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"


"$(INTDIR)\spc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"


"$(INTDIR)\spc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"


"$(INTDIR)\spc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"


"$(INTDIR)\spc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\spc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"


"$(INTDIR)\spc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\spc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\spc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\spc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

!ENDIF 

SOURCE=..\..\dapi\src\Vtm\sync.c

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"


"$(INTDIR)\sync.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"


"$(INTDIR)\sync.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"


"$(INTDIR)\sync.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"


"$(INTDIR)\sync.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"


"$(INTDIR)\sync.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\sync.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"


"$(INTDIR)\sync.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\sync.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\sync.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\sync.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

!ENDIF 

SOURCE=.\API\TranslateDialog.cpp

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"


"$(INTDIR)\TranslateDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"


"$(INTDIR)\TranslateDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"


"$(INTDIR)\TranslateDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"


"$(INTDIR)\TranslateDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"


"$(INTDIR)\TranslateDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\TranslateDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"


"$(INTDIR)\TranslateDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\TranslateDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\TranslateDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\TranslateDialog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

!ENDIF 

SOURCE=..\..\dapi\Src\Kernel\Usa_init.c

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"


"$(INTDIR)\Usa_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"


"$(INTDIR)\Usa_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"


"$(INTDIR)\Usa_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"


"$(INTDIR)\Usa_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"


"$(INTDIR)\Usa_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\Usa_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"


"$(INTDIR)\Usa_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\Usa_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\Usa_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\Usa_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

!ENDIF 

SOURCE=.\Api\VoiceDef.cpp

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"


"$(INTDIR)\VoiceDef.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"


"$(INTDIR)\VoiceDef.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"


"$(INTDIR)\VoiceDef.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"


"$(INTDIR)\VoiceDef.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"


"$(INTDIR)\VoiceDef.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\VoiceDef.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"


"$(INTDIR)\VoiceDef.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\VoiceDef.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\VoiceDef.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\VoiceDef.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

!ENDIF 

SOURCE=..\..\dapi\src\Vtm\vtmiont.c

!IF  "$(CFG)" == "wttsdtlk - Win32 Release"


"$(INTDIR)\vtmiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug"


"$(INTDIR)\vtmiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Spanish"


"$(INTDIR)\vtmiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release German"


"$(INTDIR)\vtmiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release Latin American"


"$(INTDIR)\vtmiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Spanish"


"$(INTDIR)\vtmiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug German"


"$(INTDIR)\vtmiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug Latin American"


"$(INTDIR)\vtmiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Release United Kingdom"


"$(INTDIR)\vtmiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 Debug United Kingdom"


"$(INTDIR)\vtmiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "wttsdtlk - Win32 ALPHA Debug United Kingdom"

!ENDIF 


!ENDIF 

