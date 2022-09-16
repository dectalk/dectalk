# Microsoft Developer Studio Generated NMAKE File, Based on speak.dsp
!IF "$(CFG)" == ""
CFG=speak - Win32 Debug NWS_LA
!MESSAGE No configuration specified. Defaulting to speak - Win32 Debug NWS_LA.
!ENDIF 

!IF "$(CFG)" != "speak - Win32 Release" && "$(CFG)" != "speak - Win32 Debug" && "$(CFG)" != "speak - Win32 Release Spanish" && "$(CFG)" != "speak - Win32 Release German" && "$(CFG)" != "speak - Win32 Debug Spanish" && "$(CFG)" != "speak - Win32 Debug German" && "$(CFG)" != "speak - Win32 Debug Latin American" && "$(CFG)" != "speak - Win32 Release Latin American" && "$(CFG)" != "speak - Win32 ALPHA Release" && "$(CFG)" != "speak - Win32 ALPHA Debug" && "$(CFG)" != "speak - Win32 ALPHA Release Spanish" && "$(CFG)" != "speak - Win32 ALPHA Release German" && "$(CFG)" != "speak - Win32 ALPHA Release Latin American" && "$(CFG)" != "speak - Win32 ALPHA Debug Spanish" && "$(CFG)" != "speak - Win32 ALPHA Debug German" && "$(CFG)" != "speak - Win32 ALPHA Debug Latin American" && "$(CFG)" != "speak - Win32 Release United Kingdom" && "$(CFG)" != "speak - Win32 Debug United Kingdom" && "$(CFG)" != "speak - Win32 ALPHA Release United Kingdom" && "$(CFG)" != "speak - Win32 ALPHA Debug United Kingdom" && "$(CFG)" != "speak - Win32 Debug NWS_US" && "$(CFG)" != "speak - Win32 Debug NWS_LA"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "speak.mak" CFG="speak - Win32 Debug NWS_LA"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "speak - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "speak - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE "speak - Win32 Release Spanish" (based on "Win32 (x86) Application")
!MESSAGE "speak - Win32 Release German" (based on "Win32 (x86) Application")
!MESSAGE "speak - Win32 Debug Spanish" (based on "Win32 (x86) Application")
!MESSAGE "speak - Win32 Debug German" (based on "Win32 (x86) Application")
!MESSAGE "speak - Win32 Debug Latin American" (based on "Win32 (x86) Application")
!MESSAGE "speak - Win32 Release Latin American" (based on "Win32 (x86) Application")
!MESSAGE "speak - Win32 ALPHA Release" (based on "Win32 (ALPHA) Application")
!MESSAGE "speak - Win32 ALPHA Debug" (based on "Win32 (ALPHA) Application")
!MESSAGE "speak - Win32 ALPHA Release Spanish" (based on "Win32 (ALPHA) Application")
!MESSAGE "speak - Win32 ALPHA Release German" (based on "Win32 (ALPHA) Application")
!MESSAGE "speak - Win32 ALPHA Release Latin American" (based on "Win32 (ALPHA) Application")
!MESSAGE "speak - Win32 ALPHA Debug Spanish" (based on "Win32 (ALPHA) Application")
!MESSAGE "speak - Win32 ALPHA Debug German" (based on "Win32 (ALPHA) Application")
!MESSAGE "speak - Win32 ALPHA Debug Latin American" (based on "Win32 (ALPHA) Application")
!MESSAGE "speak - Win32 Release United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "speak - Win32 Debug United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "speak - Win32 ALPHA Release United Kingdom" (based on "Win32 (ALPHA) Application")
!MESSAGE "speak - Win32 ALPHA Debug United Kingdom" (based on "Win32 (ALPHA) Application")
!MESSAGE "speak - Win32 Debug NWS_US" (based on "Win32 (x86) Application")
!MESSAGE "speak - Win32 Debug NWS_LA" (based on "Win32 (x86) Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "speak - Win32 Release"

OUTDIR=.\build\us\release
INTDIR=.\build\us\release\link
# Begin Custom Macros
OutDir=.\build\us\release
# End Custom Macros

ALL : "$(OUTDIR)\speak.exe"


CLEAN :
	-@erase "$(INTDIR)\SPEAK.OBJ"
	-@erase "$(INTDIR)\SPEAK.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\speak.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I "D:\MSDEV\MFC\include" /I "..\..\dapi\src\api" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "ENGLISH_US" /D "ENGLISH" /Fp"$(INTDIR)\speak.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\SPEAK.res" /d "NDEBUG" /d "ML" /d "ENGLISH_US" /d "ENGLISH" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\speak.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\us\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\speak.pdb" /machine:I386 /def:".\SPEAK.DEF" /out:"$(OUTDIR)\speak.exe" 
DEF_FILE= \
	".\SPEAK.DEF"
LINK32_OBJS= \
	"$(INTDIR)\SPEAK.OBJ" \
	"$(INTDIR)\SPEAK.res"

"$(OUTDIR)\speak.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "speak - Win32 Debug"

OUTDIR=.\build\us\debug
INTDIR=.\build\us\debug\link
# Begin Custom Macros
OutDir=.\build\us\debug
# End Custom Macros

ALL : "$(OUTDIR)\speak.exe" "$(OUTDIR)\speak.bsc"


CLEAN :
	-@erase "$(INTDIR)\SPEAK.OBJ"
	-@erase "$(INTDIR)\SPEAK.res"
	-@erase "$(INTDIR)\SPEAK.SBR"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\speak.bsc"
	-@erase "$(OUTDIR)\speak.exe"
	-@erase "$(OUTDIR)\speak.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I "D:\MSDEV\MFC\include" /I "..\..\dapi\src\api" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "ENGLISH_US" /D "ENGLISH" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\speak.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\SPEAK.res" /d "_DEBUG" /d "ML" /d "ENGLISH_US" /d "ENGLISH" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\speak.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\SPEAK.SBR"

"$(OUTDIR)\speak.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\speak.pdb" /debug /debugtype:both /machine:I386 /def:".\SPEAK.DEF" /out:"$(OUTDIR)\speak.exe" 
DEF_FILE= \
	".\SPEAK.DEF"
LINK32_OBJS= \
	"$(INTDIR)\SPEAK.OBJ" \
	"$(INTDIR)\SPEAK.res"

"$(OUTDIR)\speak.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "speak - Win32 Release Spanish"

OUTDIR=.\build\sp\release
INTDIR=.\build\sp\release\link
# Begin Custom Macros
OutDir=.\build\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\speak.exe"


CLEAN :
	-@erase "$(INTDIR)\SPEAK.OBJ"
	-@erase "$(INTDIR)\SPEAK.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\speak.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I "D:\MSDEV\MFC\include" /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SPANISH" /D "SPANISH_SP" /Fp"$(INTDIR)\speak.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\SPEAK.res" /d "NDEBUG" /d "SPANISH" /d "SPANISH_SP" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\speak.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\sp\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\speak.pdb" /machine:I386 /def:".\SPEAK.DEF" /out:"$(OUTDIR)\speak.exe" 
DEF_FILE= \
	".\SPEAK.DEF"
LINK32_OBJS= \
	"$(INTDIR)\SPEAK.OBJ" \
	"$(INTDIR)\SPEAK.res"

"$(OUTDIR)\speak.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "speak - Win32 Release German"

OUTDIR=.\build\gr\release
INTDIR=.\build\gr\release\link
# Begin Custom Macros
OutDir=.\build\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\speak.exe"


CLEAN :
	-@erase "$(INTDIR)\SPEAK.OBJ"
	-@erase "$(INTDIR)\SPEAK.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\speak.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I "D:\MSDEV\MFC\include" /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "GERMAN" /Fp"$(INTDIR)\speak.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\SPEAK.res" /d "NDEBUG" /d "GERMAN" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\speak.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\gr\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\speak.pdb" /machine:I386 /def:".\SPEAK.DEF" /out:"$(OUTDIR)\speak.exe" 
DEF_FILE= \
	".\SPEAK.DEF"
LINK32_OBJS= \
	"$(INTDIR)\SPEAK.OBJ" \
	"$(INTDIR)\SPEAK.res"

"$(OUTDIR)\speak.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "speak - Win32 Debug Spanish"

OUTDIR=.\build\sp\debug
INTDIR=.\build\sp\debug\link
# Begin Custom Macros
OutDir=.\build\sp\debug
# End Custom Macros

ALL : "$(OUTDIR)\speak.exe" "$(OUTDIR)\speak.bsc"


CLEAN :
	-@erase "$(INTDIR)\SPEAK.OBJ"
	-@erase "$(INTDIR)\SPEAK.res"
	-@erase "$(INTDIR)\SPEAK.SBR"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\speak.bsc"
	-@erase "$(OUTDIR)\speak.exe"
	-@erase "$(OUTDIR)\speak.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I "D:\MSDEV\MFC\include" /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SPANISH" /D "SPANISH_SP" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\speak.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\SPEAK.res" /d "_DEBUG" /d "SPANISH" /d "SPANISH_SP" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\speak.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\SPEAK.SBR"

"$(OUTDIR)\speak.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\sp\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\speak.pdb" /debug /debugtype:both /machine:I386 /def:".\SPEAK.DEF" /out:"$(OUTDIR)\speak.exe" 
DEF_FILE= \
	".\SPEAK.DEF"
LINK32_OBJS= \
	"$(INTDIR)\SPEAK.OBJ" \
	"$(INTDIR)\SPEAK.res"

"$(OUTDIR)\speak.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "speak - Win32 Debug German"

OUTDIR=.\build\gr\debug
INTDIR=.\build\gr\debug\link
# Begin Custom Macros
OutDir=.\build\gr\debug
# End Custom Macros

ALL : "$(OUTDIR)\speak.exe" "$(OUTDIR)\speak.bsc"


CLEAN :
	-@erase "$(INTDIR)\SPEAK.OBJ"
	-@erase "$(INTDIR)\SPEAK.res"
	-@erase "$(INTDIR)\SPEAK.SBR"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\speak.bsc"
	-@erase "$(OUTDIR)\speak.exe"
	-@erase "$(OUTDIR)\speak.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I "D:\MSDEV\MFC\include" /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "GERMAN" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\speak.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\SPEAK.res" /d "_DEBUG" /d "GERMAN" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\speak.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\SPEAK.SBR"

"$(OUTDIR)\speak.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\gr\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\speak.pdb" /debug /debugtype:both /machine:I386 /def:".\SPEAK.DEF" /out:"$(OUTDIR)\speak.exe" 
DEF_FILE= \
	".\SPEAK.DEF"
LINK32_OBJS= \
	"$(INTDIR)\SPEAK.OBJ" \
	"$(INTDIR)\SPEAK.res"

"$(OUTDIR)\speak.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "speak - Win32 Debug Latin American"

OUTDIR=.\build\la\debug
INTDIR=.\build\la\debug\link
# Begin Custom Macros
OutDir=.\build\la\debug
# End Custom Macros

ALL : "$(OUTDIR)\speak.exe" "$(OUTDIR)\speak.bsc"


CLEAN :
	-@erase "$(INTDIR)\SPEAK.OBJ"
	-@erase "$(INTDIR)\SPEAK.res"
	-@erase "$(INTDIR)\SPEAK.SBR"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\speak.bsc"
	-@erase "$(OUTDIR)\speak.exe"
	-@erase "$(OUTDIR)\speak.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I "D:\MSDEV\MFC\include" /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SPANISH" /D "SPANISH_LA" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\speak.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\SPEAK.res" /d "_DEBUG" /d "SPANISH" /d "SPANISH_LA" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\speak.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\SPEAK.SBR"

"$(OUTDIR)\speak.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\la\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\speak.pdb" /debug /debugtype:both /machine:I386 /def:".\SPEAK.DEF" /out:"$(OUTDIR)\speak.exe" 
DEF_FILE= \
	".\SPEAK.DEF"
LINK32_OBJS= \
	"$(INTDIR)\SPEAK.OBJ" \
	"$(INTDIR)\SPEAK.res"

"$(OUTDIR)\speak.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "speak - Win32 Release Latin American"

OUTDIR=.\build\la\release
INTDIR=.\build\la\release\link
# Begin Custom Macros
OutDir=.\build\la\release
# End Custom Macros

ALL : "$(OUTDIR)\speak.exe"


CLEAN :
	-@erase "$(INTDIR)\SPEAK.OBJ"
	-@erase "$(INTDIR)\SPEAK.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\speak.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I "D:\MSDEV\MFC\include" /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SPANISH" /D "SPANISH_LA" /Fp"$(INTDIR)\speak.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\SPEAK.res" /d "NDEBUG" /d "SPANISH" /d "SPANISH_LA" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\speak.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\la\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\speak.pdb" /machine:I386 /def:".\SPEAK.DEF" /out:"$(OUTDIR)\speak.exe" 
DEF_FILE= \
	".\SPEAK.DEF"
LINK32_OBJS= \
	"$(INTDIR)\SPEAK.OBJ" \
	"$(INTDIR)\SPEAK.res"

"$(OUTDIR)\speak.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "speak - Win32 ALPHA Release"

OUTDIR=.\alpha\us\release
INTDIR=.\alpha\us\release\link
# Begin Custom Macros
OutDir=.\alpha\us\release
# End Custom Macros

ALL : "$(OUTDIR)\speak.exe"


CLEAN :
	-@erase "$(INTDIR)\SPEAK.res"
	-@erase "$(OUTDIR)\speak.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\SPEAK.res" /d "NDEBUG" /d "ENGLISH_US" /d "ENGLISH" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\speak.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\us\release\dectalk.lib version.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\speak.pdb" /machine:ALPHA /def:".\SPEAK.DEF" /out:"$(OUTDIR)\speak.exe" 
DEF_FILE= \
	".\SPEAK.DEF"
LINK32_OBJS= \
	"$(INTDIR)\SPEAK.res"

"$(OUTDIR)\speak.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "speak - Win32 ALPHA Debug"

OUTDIR=.\alpha\us\debug
INTDIR=.\alpha\us\debug\link
# Begin Custom Macros
OutDir=.\alpha\us\debug
# End Custom Macros

ALL : "$(OUTDIR)\speak.exe"


CLEAN :
	-@erase "$(INTDIR)\SPEAK.res"
	-@erase "$(OUTDIR)\speak.exe"
	-@erase "$(OUTDIR)\speak.ilk"
	-@erase "$(OUTDIR)\speak.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\SPEAK.res" /d "_DEBUG" /d "ENGLISH_US" /d "ENGLISH" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\speak.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\us\debug\dectalk.lib version.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\speak.pdb" /debug /debugtype:both /machine:ALPHA /def:".\SPEAK.DEF" /out:"$(OUTDIR)\speak.exe" 
DEF_FILE= \
	".\SPEAK.DEF"
LINK32_OBJS= \
	"$(INTDIR)\SPEAK.res"

"$(OUTDIR)\speak.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "speak - Win32 ALPHA Release Spanish"

OUTDIR=.\alpha\sp\release
INTDIR=.\alpha\sp\release\link
# Begin Custom Macros
OutDir=.\alpha\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\speak.exe"


CLEAN :
	-@erase "$(INTDIR)\SPEAK.res"
	-@erase "$(OUTDIR)\speak.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\SPEAK.res" /d "NDEBUG" /d "SPANISH" /d "SPANISH_SP" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\speak.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\sp\release\dectalk.lib version.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\speak.pdb" /machine:ALPHA /def:".\SPEAK.DEF" /out:"$(OUTDIR)\speak.exe" 
DEF_FILE= \
	".\SPEAK.DEF"
LINK32_OBJS= \
	"$(INTDIR)\SPEAK.res"

"$(OUTDIR)\speak.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "speak - Win32 ALPHA Release German"

OUTDIR=.\alpha\gr\release
INTDIR=.\alpha\gr\release\link
# Begin Custom Macros
OutDir=.\alpha\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\speak.exe"


CLEAN :
	-@erase "$(INTDIR)\SPEAK.res"
	-@erase "$(OUTDIR)\speak.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\SPEAK.res" /d "NDEBUG" /d "GERMAN" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\speak.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\gr\release\dectalk.lib version.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\speak.pdb" /machine:ALPHA /def:".\SPEAK.DEF" /out:"$(OUTDIR)\speak.exe" 
DEF_FILE= \
	".\SPEAK.DEF"
LINK32_OBJS= \
	"$(INTDIR)\SPEAK.res"

"$(OUTDIR)\speak.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "speak - Win32 ALPHA Release Latin American"

OUTDIR=.\alpha\la\release
INTDIR=.\alpha\la\release\link
# Begin Custom Macros
OutDir=.\alpha\la\release
# End Custom Macros

ALL : "$(OUTDIR)\speak.exe"


CLEAN :
	-@erase "$(INTDIR)\SPEAK.res"
	-@erase "$(OUTDIR)\speak.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\SPEAK.res" /d "NDEBUG" /d "SPANISH_LA" /d "SPANISH" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\speak.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\la\release\dectalk.lib version.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\speak.pdb" /machine:ALPHA /def:".\SPEAK.DEF" /out:"$(OUTDIR)\speak.exe" 
DEF_FILE= \
	".\SPEAK.DEF"
LINK32_OBJS= \
	"$(INTDIR)\SPEAK.res"

"$(OUTDIR)\speak.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "speak - Win32 ALPHA Debug Spanish"

OUTDIR=.\alpha\sp\debug
INTDIR=.\alpha\sp\debug\link
# Begin Custom Macros
OutDir=.\alpha\sp\debug
# End Custom Macros

ALL : "$(OUTDIR)\speak.exe"


CLEAN :
	-@erase "$(INTDIR)\SPEAK.res"
	-@erase "$(OUTDIR)\speak.exe"
	-@erase "$(OUTDIR)\speak.ilk"
	-@erase "$(OUTDIR)\speak.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\SPEAK.res" /d "_DEBUG" /d "SPANISH" /d "SPANISH_SP" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\speak.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\sp\debug\dectalk.lib version.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\speak.pdb" /debug /debugtype:both /machine:ALPHA /def:".\SPEAK.DEF" /out:"$(OUTDIR)\speak.exe" 
DEF_FILE= \
	".\SPEAK.DEF"
LINK32_OBJS= \
	"$(INTDIR)\SPEAK.res"

"$(OUTDIR)\speak.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "speak - Win32 ALPHA Debug German"

OUTDIR=.\alpha\gr\debug
INTDIR=.\alpha\gr\debug\link
# Begin Custom Macros
OutDir=.\alpha\gr\debug
# End Custom Macros

ALL : "$(OUTDIR)\speak.exe"


CLEAN :
	-@erase "$(INTDIR)\SPEAK.res"
	-@erase "$(OUTDIR)\speak.exe"
	-@erase "$(OUTDIR)\speak.ilk"
	-@erase "$(OUTDIR)\speak.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\SPEAK.res" /d "_DEBUG" /d "GERMAN" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\speak.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\gr\debug\dectalk.lib version.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\speak.pdb" /debug /debugtype:both /machine:ALPHA /def:".\SPEAK.DEF" /out:"$(OUTDIR)\speak.exe" 
DEF_FILE= \
	".\SPEAK.DEF"
LINK32_OBJS= \
	"$(INTDIR)\SPEAK.res"

"$(OUTDIR)\speak.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "speak - Win32 ALPHA Debug Latin American"

OUTDIR=.\alpha\la\debug
INTDIR=.\alpha\la\debug\link
# Begin Custom Macros
OutDir=.\alpha\la\debug
# End Custom Macros

ALL : "$(OUTDIR)\speak.exe"


CLEAN :
	-@erase "$(INTDIR)\SPEAK.res"
	-@erase "$(OUTDIR)\speak.exe"
	-@erase "$(OUTDIR)\speak.ilk"
	-@erase "$(OUTDIR)\speak.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\SPEAK.res" /d "_DEBUG" /d "SPANISH" /d "SPANISH_LA" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\speak.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\la\debug\dectalk.lib version.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\speak.pdb" /debug /debugtype:both /machine:ALPHA /def:".\SPEAK.DEF" /out:"$(OUTDIR)\speak.exe" 
DEF_FILE= \
	".\SPEAK.DEF"
LINK32_OBJS= \
	"$(INTDIR)\SPEAK.res"

"$(OUTDIR)\speak.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "speak - Win32 Release United Kingdom"

OUTDIR=.\build\uk\release
INTDIR=.\build\uk\release\link
# Begin Custom Macros
OutDir=.\build\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\speak.exe"


CLEAN :
	-@erase "$(INTDIR)\SPEAK.OBJ"
	-@erase "$(INTDIR)\SPEAK.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\speak.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I "D:\MSDEV\MFC\include" /I "..\..\dapi\src\api" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "ENGLISH_UK" /D "ENGLISH" /Fp"$(INTDIR)\speak.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\SPEAK.res" /d "NDEBUG" /d "ML" /d "ENGLISH_UK" /d "ENGLISH" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\speak.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\uk\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\speak.pdb" /machine:I386 /def:".\SPEAK.DEF" /out:"$(OUTDIR)\speak.exe" 
DEF_FILE= \
	".\SPEAK.DEF"
LINK32_OBJS= \
	"$(INTDIR)\SPEAK.OBJ" \
	"$(INTDIR)\SPEAK.res"

"$(OUTDIR)\speak.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "speak - Win32 Debug United Kingdom"

OUTDIR=.\build\uk\debug
INTDIR=.\build\uk\debug\link
# Begin Custom Macros
OutDir=.\build\uk\debug
# End Custom Macros

ALL : "$(OUTDIR)\speak.exe" "$(OUTDIR)\speak.bsc"


CLEAN :
	-@erase "$(INTDIR)\SPEAK.res"
	-@erase "$(OUTDIR)\speak.bsc"
	-@erase "$(OUTDIR)\speak.exe"
	-@erase ".\build\us\debug\link\SPEAK.OBJ"
	-@erase ".\build\us\debug\link\SPEAK.SBR"
	-@erase ".\build\us\debug\link\vc60.idb"
	-@erase ".\build\us\debug\link\vc60.pdb"
	-@erase ".\build\us\debug\speak.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I "D:\MSDEV\MFC\include" /I "..\..\dapi\src\api" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "ENGLISH_UK" /D "ENGLISH" /FR".\build\us\debug\link/" /Fp".\build\us\debug\link/speak.pch" /YX /Fo".\build\us\debug\link/" /Fd".\build\us\debug\link/" /FD /c 

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
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\SPEAK.res" /d "_DEBUG" /d "ML" /d "ENGLISH_UK" /d "ENGLISH" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\speak.bsc" 
BSC32_SBRS= \
	".\build\us\debug\link\SPEAK.SBR"

"$(OUTDIR)\speak.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\uk\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /incremental:no /pdb:".\build\us\debug/speak.pdb" /debug /debugtype:both /machine:I386 /def:".\SPEAK.DEF" /out:"$(OUTDIR)\speak.exe" 
DEF_FILE= \
	".\SPEAK.DEF"
LINK32_OBJS= \
	".\build\us\debug\link\SPEAK.OBJ" \
	"$(INTDIR)\SPEAK.res"

"$(OUTDIR)\speak.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "speak - Win32 ALPHA Release United Kingdom"

OUTDIR=.\alpha\uk\release
INTDIR=.\alpha\uk\release\link
# Begin Custom Macros
OutDir=.\alpha\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\speak.exe"


CLEAN :
	-@erase "$(INTDIR)\SPEAK.res"
	-@erase "$(OUTDIR)\speak.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\SPEAK.res" /d "NDEBUG" /d "ENGLISH_UK" /d "ENGLISH" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\speak.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\uk\release\dectalk.lib version.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\speak.pdb" /machine:ALPHA /def:".\SPEAK.DEF" /out:"$(OUTDIR)\speak.exe" 
DEF_FILE= \
	".\SPEAK.DEF"
LINK32_OBJS= \
	"$(INTDIR)\SPEAK.res"

"$(OUTDIR)\speak.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "speak - Win32 ALPHA Debug United Kingdom"

OUTDIR=.\alpha\uk\debug
INTDIR=.\alpha\uk\debug\link
# Begin Custom Macros
OutDir=.\alpha\uk\debug
# End Custom Macros

ALL : "$(OUTDIR)\speak.exe"


CLEAN :
	-@erase "$(INTDIR)\SPEAK.res"
	-@erase "$(OUTDIR)\speak.exe"
	-@erase "$(OUTDIR)\speak.ilk"
	-@erase ".\build\us\debug\speak.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\SPEAK.res" /d "_DEBUG" /d "ENGLISH_UK" /d "ENGLISH" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\speak.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\alpha\dectalk\uk\debug\dectalk.lib version.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /incremental:yes /pdb:".\build\us\debug/speak.pdb" /debug /debugtype:both /machine:ALPHA /def:".\SPEAK.DEF" /out:"$(OUTDIR)\speak.exe" 
DEF_FILE= \
	".\SPEAK.DEF"
LINK32_OBJS= \
	"$(INTDIR)\SPEAK.res"

"$(OUTDIR)\speak.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "speak - Win32 Debug NWS_US"

OUTDIR=.\build\nws_us\debug
INTDIR=.\build\nws_us\debug\link
# Begin Custom Macros
OutDir=.\build\nws_us\debug
# End Custom Macros

ALL : "$(OUTDIR)\speak.exe" "$(OUTDIR)\speak.bsc"


CLEAN :
	-@erase "$(INTDIR)\SPEAK.OBJ"
	-@erase "$(INTDIR)\SPEAK.res"
	-@erase "$(INTDIR)\SPEAK.SBR"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\speak.bsc"
	-@erase "$(OUTDIR)\speak.exe"
	-@erase "$(OUTDIR)\speak.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I "D:\MSDEV\MFC\include" /I "..\..\dapi\src\api" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "ENGLISH_US" /D "ENGLISH" /D "NWSNOAA" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\speak.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\SPEAK.res" /d "_DEBUG" /d "ML" /d "ENGLISH_US" /d "ENGLISH" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\speak.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\SPEAK.SBR"

"$(OUTDIR)\speak.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\nws_us\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\speak.pdb" /debug /debugtype:both /machine:I386 /def:".\SPEAK.DEF" /out:"$(OUTDIR)\speak.exe" 
DEF_FILE= \
	".\SPEAK.DEF"
LINK32_OBJS= \
	"$(INTDIR)\SPEAK.OBJ" \
	"$(INTDIR)\SPEAK.res"

"$(OUTDIR)\speak.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "speak - Win32 Debug NWS_LA"

OUTDIR=.\build\nws_la\debug
INTDIR=.\build\nws_la\debug\link
# Begin Custom Macros
OutDir=.\build\nws_la\debug
# End Custom Macros

ALL : "$(OUTDIR)\speak.exe" "$(OUTDIR)\speak.bsc"


CLEAN :
	-@erase "$(INTDIR)\SPEAK.OBJ"
	-@erase "$(INTDIR)\SPEAK.res"
	-@erase "$(INTDIR)\SPEAK.SBR"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\speak.bsc"
	-@erase "$(OUTDIR)\speak.exe"
	-@erase "$(OUTDIR)\speak.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I "D:\MSDEV\MFC\include" /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SPANISH" /D "SPANISH_LA" /D "NWSNOAA" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\speak.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\SPEAK.res" /d "_DEBUG" /d "SPANISH" /d "LATIN_AMERICAN" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\speak.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\SPEAK.SBR"

"$(OUTDIR)\speak.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dectalk\nws_la\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib version.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\speak.pdb" /debug /debugtype:both /machine:I386 /def:".\SPEAK.DEF" /out:"$(OUTDIR)\speak.exe" 
DEF_FILE= \
	".\SPEAK.DEF"
LINK32_OBJS= \
	"$(INTDIR)\SPEAK.OBJ" \
	"$(INTDIR)\SPEAK.res"

"$(OUTDIR)\speak.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("speak.dep")
!INCLUDE "speak.dep"
!ELSE 
!MESSAGE Warning: cannot find "speak.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "speak - Win32 Release" || "$(CFG)" == "speak - Win32 Debug" || "$(CFG)" == "speak - Win32 Release Spanish" || "$(CFG)" == "speak - Win32 Release German" || "$(CFG)" == "speak - Win32 Debug Spanish" || "$(CFG)" == "speak - Win32 Debug German" || "$(CFG)" == "speak - Win32 Debug Latin American" || "$(CFG)" == "speak - Win32 Release Latin American" || "$(CFG)" == "speak - Win32 ALPHA Release" || "$(CFG)" == "speak - Win32 ALPHA Debug" || "$(CFG)" == "speak - Win32 ALPHA Release Spanish" || "$(CFG)" == "speak - Win32 ALPHA Release German" || "$(CFG)" == "speak - Win32 ALPHA Release Latin American" || "$(CFG)" == "speak - Win32 ALPHA Debug Spanish" || "$(CFG)" == "speak - Win32 ALPHA Debug German" || "$(CFG)" == "speak - Win32 ALPHA Debug Latin American" || "$(CFG)" == "speak - Win32 Release United Kingdom" || "$(CFG)" == "speak - Win32 Debug United Kingdom" || "$(CFG)" == "speak - Win32 ALPHA Release United Kingdom" || "$(CFG)" == "speak - Win32 ALPHA Debug United Kingdom" || "$(CFG)" == "speak - Win32 Debug NWS_US" || "$(CFG)" == "speak - Win32 Debug NWS_LA"
SOURCE=.\SPEAK.C

!IF  "$(CFG)" == "speak - Win32 Release"


"$(INTDIR)\SPEAK.OBJ" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "speak - Win32 Debug"


"$(INTDIR)\SPEAK.OBJ"	"$(INTDIR)\SPEAK.SBR" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "speak - Win32 Release Spanish"


"$(INTDIR)\SPEAK.OBJ" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "speak - Win32 Release German"


"$(INTDIR)\SPEAK.OBJ" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "speak - Win32 Debug Spanish"


"$(INTDIR)\SPEAK.OBJ"	"$(INTDIR)\SPEAK.SBR" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "speak - Win32 Debug German"


"$(INTDIR)\SPEAK.OBJ"	"$(INTDIR)\SPEAK.SBR" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "speak - Win32 Debug Latin American"


"$(INTDIR)\SPEAK.OBJ"	"$(INTDIR)\SPEAK.SBR" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "speak - Win32 Release Latin American"


"$(INTDIR)\SPEAK.OBJ" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "speak - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "speak - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "speak - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "speak - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "speak - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "speak - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "speak - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "speak - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "speak - Win32 Release United Kingdom"


"$(INTDIR)\SPEAK.OBJ" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "speak - Win32 Debug United Kingdom"


".\build\us\debug\link\SPEAK.OBJ"	".\build\us\debug\link\SPEAK.SBR" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "speak - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "speak - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "speak - Win32 Debug NWS_US"


"$(INTDIR)\SPEAK.OBJ"	"$(INTDIR)\SPEAK.SBR" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "speak - Win32 Debug NWS_LA"


"$(INTDIR)\SPEAK.OBJ"	"$(INTDIR)\SPEAK.SBR" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\SPEAK.RC

"$(INTDIR)\SPEAK.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)



!ENDIF 

