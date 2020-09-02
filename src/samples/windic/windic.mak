# Microsoft Developer Studio Generated NMAKE File, Based on windic.dsp
!IF "$(CFG)" == ""
CFG=windic - Win32 Debug Static French
!MESSAGE No configuration specified. Defaulting to windic - Win32 Debug Static French.
!ENDIF 

!IF "$(CFG)" != "windic - Win32 Release" && "$(CFG)" != "windic - Win32 Debug" && "$(CFG)" != "windic - Win32 Release Static" && "$(CFG)" != "windic - Win32 Debug Static" && "$(CFG)" != "windic - Win32 Release Static Spanish" && "$(CFG)" != "windic - Win32 Release Static German" && "$(CFG)" != "windic - Win32 Release Static Latin American" && "$(CFG)" != "windic - Win32 Debug Static Spanish" && "$(CFG)" != "windic - Win32 Debug Static German" && "$(CFG)" != "windic - Win32 Debug Static Latin American" && "$(CFG)" != "windic - Win32 Release Static United Kingdom" && "$(CFG)" != "windic - Win32 Debug Static United Kingdom" && "$(CFG)" != "windic - Win32 Release Static French" && "$(CFG)" != "windic - Win32 Debug Static French"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "windic.mak" CFG="windic - Win32 Debug Static French"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "windic - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Release Static" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Debug Static" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Release Static Spanish" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Release Static German" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Release Static Latin American" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Debug Static Spanish" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Debug Static German" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Debug Static Latin American" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Release Static United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Debug Static United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Release Static French" (based on "Win32 (x86) Application")
!MESSAGE "windic - Win32 Debug Static French" (based on "Win32 (x86) Application")
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

!IF  "$(CFG)" == "windic - Win32 Release"

OUTDIR=.\build\ml\release
INTDIR=.\build\ml\release\link
# Begin Custom Macros
OutDir=.\build\ml\release
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\\" /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /D "NDEBUG" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "ENGLISH" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\windic.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dtalkml\build\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:I386 /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 Debug"

OUTDIR=.\build\ml\debug
INTDIR=.\build\ml\debug\link
# Begin Custom Macros
OutDir=.\build\ml\debug
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"
	-@erase "$(OUTDIR)\windic.ilk"
	-@erase "$(OUTDIR)\windic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MT /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "_DEBUG" /D "ENGLISH_US" /D "WIN32" /D "_WINDOWS" /D "ENGLISH" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\windic.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dtalkml\build\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\windic.pdb" /debug /machine:I386 /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 Release Static"

OUTDIR=.\build\us\wdicstat
INTDIR=.\build\us\wdicstat\link
# Begin Custom Macros
OutDir=.\build\us\wdicstat
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "NDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "WINDIC_C_STATIC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\windic.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\us\release\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:I386 /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 Debug Static"

OUTDIR=.\build\us\dbgstat
INTDIR=.\build\us\dbgstat\link
# Begin Custom Macros
OutDir=.\build\us\dbgstat
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"
	-@erase "$(OUTDIR)\windic.ilk"
	-@erase "$(OUTDIR)\windic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "_DEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "WINDIC_C_STATIC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\windic.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\us\debug\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\windic.pdb" /debug /machine:I386 /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 Release Static Spanish"

OUTDIR=.\build\sp\wdicstat
INTDIR=.\build\sp\wdicstat\link
# Begin Custom Macros
OutDir=.\build\sp\wdicstat
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "NDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "WINDIC_C_STATIC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\windic.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\sp\release\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:I386 /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 Release Static German"

OUTDIR=.\build\gr\wdicstat
INTDIR=.\build\gr\wdicstat\link
# Begin Custom Macros
OutDir=.\build\gr\wdicstat
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "NDEBUG" /D "GERMAN" /D "WINDIC_C_STATIC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\windic.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\gr\release\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:I386 /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 Release Static Latin American"

OUTDIR=.\build\la\wdicstat
INTDIR=.\build\la\wdicstat\link
# Begin Custom Macros
OutDir=.\build\la\wdicstat
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WINDIC_C_STATIC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\windic.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\la\release\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:I386 /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 Debug Static Spanish"

OUTDIR=.\build\sp\dbgstat
INTDIR=.\build\sp\dbgstat\link
# Begin Custom Macros
OutDir=.\build\sp\dbgstat
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"
	-@erase "$(OUTDIR)\windic.ilk"
	-@erase "$(OUTDIR)\windic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "_DEBUG" /D "SPANISH" /D "SPANISH_SP" /D "WINDIC_C_STATIC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\windic.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\sp\debug\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\windic.pdb" /debug /machine:I386 /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 Debug Static German"

OUTDIR=.\build\gr\dbgstat
INTDIR=.\build\gr\dbgstat\link
# Begin Custom Macros
OutDir=.\build\gr\dbgstat
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"
	-@erase "$(OUTDIR)\windic.ilk"
	-@erase "$(OUTDIR)\windic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "_DEBUG" /D "GERMAN" /D "WINDIC_C_STATIC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\windic.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\gr\debug\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\windic.pdb" /debug /machine:I386 /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 Debug Static Latin American"

OUTDIR=.\build\la\dbgstat
INTDIR=.\build\la\dbgstat\link
# Begin Custom Macros
OutDir=.\build\la\dbgstat
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"
	-@erase "$(OUTDIR)\windic.ilk"
	-@erase "$(OUTDIR)\windic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "_DEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WINDIC_C_STATIC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\windic.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\la\debug\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\windic.pdb" /debug /machine:I386 /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 Release Static United Kingdom"

OUTDIR=.\build\uk\wdicstat
INTDIR=.\build\uk\wdicstat\link
# Begin Custom Macros
OutDir=.\build\uk\wdicstat
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "NDEBUG" /D "ENGLISH_UK" /D "ENGLISH" /D "WINDIC_C_STATIC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\windic.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\uk\release\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:I386 /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 Debug Static United Kingdom"

OUTDIR=.\build\uk\dbgstat
INTDIR=.\build\uk\dbgstat\link
# Begin Custom Macros
OutDir=.\build\uk\dbgstat
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"
	-@erase "$(OUTDIR)\windic.ilk"
	-@erase "$(OUTDIR)\windic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "_DEBUG" /D "ENGLISH_UK" /D "ENGLISH" /D "WINDIC_C_STATIC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\windic.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\uk\debug\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\windic.pdb" /debug /machine:I386 /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 Release Static French"

OUTDIR=.\build\fr\wdicstat
INTDIR=.\build\fr\wdicstat\link
# Begin Custom Macros
OutDir=.\build\fr\wdicstat
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "NDEBUG" /D "FRENCH" /D "WINDIC_C_STATIC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\windic.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\fr\release\dtstatic.lib winmm.lib msvcrt.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\windic.pdb" /machine:I386 /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "windic - Win32 Debug Static French"

OUTDIR=.\build\fr\dbgstat
INTDIR=.\build\fr\dbgstat\link
# Begin Custom Macros
OutDir=.\build\fr\dbgstat
# End Custom Macros

ALL : "$(OUTDIR)\windic.exe"


CLEAN :
	-@erase "$(INTDIR)\usedic.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\windic.obj"
	-@erase "$(INTDIR)\windic.res"
	-@erase "$(OUTDIR)\windic.exe"
	-@erase "$(OUTDIR)\windic.ilk"
	-@erase "$(OUTDIR)\windic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /I "..\..\dapi\src\include" /I "..\..\dapi\src\NT" /I "..\..\dapi\src\PH" /I "..\..\\" /D "_DEBUG" /D "FRENCH" /D "WINDIC_C_STATIC" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\windic.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\windic.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\windic.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\fr\debug\dtstatic.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\windic.pdb" /debug /machine:I386 /out:"$(OUTDIR)\windic.exe" 
LINK32_OBJS= \
	"$(INTDIR)\usedic.obj" \
	"$(INTDIR)\windic.obj" \
	"$(INTDIR)\windic.res"

"$(OUTDIR)\windic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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
!IF EXISTS("windic.dep")
!INCLUDE "windic.dep"
!ELSE 
!MESSAGE Warning: cannot find "windic.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "windic - Win32 Release" || "$(CFG)" == "windic - Win32 Debug" || "$(CFG)" == "windic - Win32 Release Static" || "$(CFG)" == "windic - Win32 Debug Static" || "$(CFG)" == "windic - Win32 Release Static Spanish" || "$(CFG)" == "windic - Win32 Release Static German" || "$(CFG)" == "windic - Win32 Release Static Latin American" || "$(CFG)" == "windic - Win32 Debug Static Spanish" || "$(CFG)" == "windic - Win32 Debug Static German" || "$(CFG)" == "windic - Win32 Debug Static Latin American" || "$(CFG)" == "windic - Win32 Release Static United Kingdom" || "$(CFG)" == "windic - Win32 Debug Static United Kingdom" || "$(CFG)" == "windic - Win32 Release Static French" || "$(CFG)" == "windic - Win32 Debug Static French"
SOURCE=.\usedic.c

"$(INTDIR)\usedic.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\windic.c

"$(INTDIR)\windic.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\windic.rc

"$(INTDIR)\windic.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)



!ENDIF 

