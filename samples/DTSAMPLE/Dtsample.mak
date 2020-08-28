# Microsoft Developer Studio Generated NMAKE File, Based on Dtsample.dsp
!IF "$(CFG)" == ""
CFG=Dtsample - Win32 Debug Access32 Static French
!MESSAGE No configuration specified. Defaulting to Dtsample - Win32 Debug Access32 Static French.
!ENDIF 

!IF "$(CFG)" != "Dtsample - Win32 Release" && "$(CFG)" != "Dtsample - Win32 Debug" && "$(CFG)" != "Dtsample - Win32 Release Access32 Static" && "$(CFG)" != "Dtsample - Win32 Release Access32 Static Spanish" && "$(CFG)" != "Dtsample - Win32 Release Access32 Static German" && "$(CFG)" != "Dtsample - Win32 Release Access32 Static Latin American" && "$(CFG)" != "Dtsample - Win32 Debug Access32 Static" && "$(CFG)" != "Dtsample - Win32 Debug Access32 Static Spanish" && "$(CFG)" != "Dtsample - Win32 Debug Access32 Static German" && "$(CFG)" != "Dtsample - Win32 Debug Access32 Static Latin American" && "$(CFG)" != "Dtsample - Win32 Release Access32 Static United Kingdom" && "$(CFG)" != "Dtsample - Win32 Debug Access32 Static United Kingdom" && "$(CFG)" != "Dtsample - Win32 Release Access32 Static French" && "$(CFG)" != "Dtsample - Win32 Debug Access32 Static French"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "Dtsample.mak" CFG="Dtsample - Win32 Debug Access32 Static French"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Dtsample - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 Release Access32 Static" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 Release Access32 Static Spanish" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 Release Access32 Static German" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 Release Access32 Static Latin American" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 Debug Access32 Static" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 Debug Access32 Static Spanish" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 Debug Access32 Static German" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 Debug Access32 Static Latin American" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 Release Access32 Static United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 Debug Access32 Static United Kingdom" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 Release Access32 Static French" (based on "Win32 (x86) Application")
!MESSAGE "Dtsample - Win32 Debug Access32 Static French" (based on "Win32 (x86) Application")
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

!IF  "$(CFG)" == "Dtsample - Win32 Release"

OUTDIR=.\build\ml\release
INTDIR=.\build\ml\release\link
# Begin Custom Macros
OutDir=.\build\ml\release
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtsample.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dtalkml\build\release\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:I386 /out:"$(OUTDIR)\Dtsample.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug"

OUTDIR=.\build\ml\debug
INTDIR=.\build\ml\debug\link
# Begin Custom Macros
OutDir=.\build\ml\debug
# End Custom Macros

ALL : "$(OUTDIR)\Dtsample.exe" "$(OUTDIR)\Dtsample.bsc"


CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(INTDIR)\dtsample.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Dtsample.bsc"
	-@erase "$(OUTDIR)\Dtsample.exe"
	-@erase "$(OUTDIR)\Dtsample.ilk"
	-@erase "$(OUTDIR)\Dtsample.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtsample.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\dtsample.sbr"

"$(OUTDIR)\Dtsample.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=..\..\dtalkml\build\debug\dectalk.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtsample.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Dtsample.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static"

OUTDIR=.\build\us\a32stat
INTDIR=.\build\us\a32stat\link
# Begin Custom Macros
OutDir=.\build\us\a32stat
# End Custom Macros

ALL : "$(OUTDIR)\Dtaccess.exe"


CLEAN :
	-@erase "$(INTDIR)\dtaccess.res"
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtaccess.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtaccess.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o".\build\us\access32/Dtaccess.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\us\release\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /pdb:none /machine:I386 /out:"$(OUTDIR)\Dtaccess.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtaccess.res"

"$(OUTDIR)\Dtaccess.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static Spanish"

OUTDIR=.\build\sp\a32stat
INTDIR=.\build\sp\a32stat\link
# Begin Custom Macros
OutDir=.\build\sp\a32stat
# End Custom Macros

ALL : "$(OUTDIR)\Dtaccess.exe"


CLEAN :
	-@erase "$(INTDIR)\dtaccess.res"
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtaccess.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\dtaccess.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o".\build\sp\access32/Dtaccess.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\sp\release\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /pdb:none /machine:I386 /out:"$(OUTDIR)\Dtaccess.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtaccess.res"

"$(OUTDIR)\Dtaccess.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static German"

OUTDIR=.\build\gr\a32stat
INTDIR=.\build\gr\a32stat\link
# Begin Custom Macros
OutDir=.\build\gr\a32stat
# End Custom Macros

ALL : "$(OUTDIR)\Dtaccess.exe"


CLEAN :
	-@erase "$(INTDIR)\dtaccess.res"
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtaccess.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\dtaccess.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o".\build\gr\access32/Dtaccess.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\gr\release\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /pdb:none /machine:I386 /out:"$(OUTDIR)\Dtaccess.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtaccess.res"

"$(OUTDIR)\Dtaccess.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static Latin American"

OUTDIR=.\build\la\a32stat
INTDIR=.\build\la\a32stat\link
# Begin Custom Macros
OutDir=.\build\la\a32stat
# End Custom Macros

ALL : "$(OUTDIR)\Dtaccess.exe"


CLEAN :
	-@erase "$(INTDIR)\dtaccess.res"
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtaccess.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\dtaccess.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o".\build\la\access32/Dtaccess.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\la\release\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /pdb:none /machine:I386 /out:"$(OUTDIR)\Dtaccess.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtaccess.res"

"$(OUTDIR)\Dtaccess.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static"

OUTDIR=.\build\us\da32stat
INTDIR=.\build\us\da32stat\link
# Begin Custom Macros
OutDir=.\build\us\da32stat
# End Custom Macros

ALL : "$(OUTDIR)\Dtaccess.exe"


CLEAN :
	-@erase "$(INTDIR)\dtaccess.res"
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Dtaccess.exe"
	-@erase "$(OUTDIR)\Dtaccess.ilk"
	-@erase "$(OUTDIR)\Dtaccess.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtaccess.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o".\build\us\a32debug/Dtaccess.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\us\debug\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtaccess.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Dtaccess.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtaccess.res"

"$(OUTDIR)\Dtaccess.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static Spanish"

OUTDIR=.\build\sp\da32stat
INTDIR=.\build\sp\da32stat\link
# Begin Custom Macros
OutDir=.\build\sp\da32stat
# End Custom Macros

ALL : "$(OUTDIR)\Dtaccess.exe"


CLEAN :
	-@erase "$(INTDIR)\dtaccess.res"
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Dtaccess.exe"
	-@erase "$(OUTDIR)\Dtaccess.ilk"
	-@erase "$(OUTDIR)\Dtaccess.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "SPANISH" /D "SPANISH_SP" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\dtaccess.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o".\build\sp\a32debug/Dtaccess.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\sp\debug\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtaccess.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Dtaccess.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtaccess.res"

"$(OUTDIR)\Dtaccess.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static German"

OUTDIR=.\build\gr\da32stat
INTDIR=.\build\gr\da32stat\link
# Begin Custom Macros
OutDir=.\build\gr\da32stat
# End Custom Macros

ALL : "$(OUTDIR)\Dtaccess.exe"


CLEAN :
	-@erase "$(INTDIR)\dtaccess.res"
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Dtaccess.exe"
	-@erase "$(OUTDIR)\Dtaccess.ilk"
	-@erase "$(OUTDIR)\Dtaccess.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "GERMAN" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\dtaccess.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o".\build\gr\a32debug/Dtaccess.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\gr\debug\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtaccess.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Dtaccess.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtaccess.res"

"$(OUTDIR)\Dtaccess.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static Latin American"

OUTDIR=.\build\la\da32stat
INTDIR=.\build\la\da32stat\link
# Begin Custom Macros
OutDir=.\build\la\da32stat
# End Custom Macros

ALL : "$(OUTDIR)\Dtaccess.exe"


CLEAN :
	-@erase "$(INTDIR)\dtaccess.res"
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Dtaccess.exe"
	-@erase "$(OUTDIR)\Dtaccess.ilk"
	-@erase "$(OUTDIR)\Dtaccess.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "SPANISH" /D "SPANISH_LA" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\dtaccess.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o".\build\la\a32debug/Dtaccess.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\la\debug\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtaccess.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Dtaccess.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtaccess.res"

"$(OUTDIR)\Dtaccess.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static United Kingdom"

OUTDIR=.\build\uk\a32stat
INTDIR=.\build\uk\a32stat\link
# Begin Custom Macros
OutDir=.\build\uk\a32stat
# End Custom Macros

ALL : "$(OUTDIR)\Dtaccess.exe"


CLEAN :
	-@erase "$(INTDIR)\dtaccess.res"
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtaccess.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "ENGLISH_UK" /D "ENGLISH" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\dtaccess.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o".\build\uk\access32/Dtaccess.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\uk\release\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /pdb:none /machine:I386 /out:"$(OUTDIR)\Dtaccess.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtaccess.res"

"$(OUTDIR)\Dtaccess.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static United Kingdom"

OUTDIR=.\build\us\da32stat
INTDIR=.\build\uk\da32stat\link

ALL : ".\build\uk\da32stat\Dtaccess.exe"


CLEAN :
	-@erase "$(INTDIR)\dtaccess.res"
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Dtaccess.pdb"
	-@erase ".\build\uk\da32stat\Dtaccess.exe"
	-@erase ".\build\uk\da32stat\Dtaccess.ilk"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "ENGLISH_UK" /D "ENGLISH" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\dtaccess.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o".\build\uk\a32debug/Dtaccess.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\uk\debug\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtaccess.pdb" /debug /machine:I386 /out:".\build\uk\da32stat/Dtaccess.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtaccess.res"

".\build\uk\da32stat\Dtaccess.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static French"

OUTDIR=.\build\fr\a32stat
INTDIR=.\build\fr\a32stat\link
# Begin Custom Macros
OutDir=.\build\fr\a32stat
# End Custom Macros

ALL : "$(OUTDIR)\Dtaccess.exe"


CLEAN :
	-@erase "$(INTDIR)\dtaccess.res"
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Dtaccess.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\..\dapi\src\api" /D "NDEBUG" /D "FRENCH" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtaccess.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o".\build\fr\access32/Dtaccess.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\fr\release\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /pdb:none /machine:I386 /out:"$(OUTDIR)\Dtaccess.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtaccess.res"

"$(OUTDIR)\Dtaccess.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static French"

OUTDIR=.\build\fr\da32stat
INTDIR=.\build\fr\da32stat\link
# Begin Custom Macros
OutDir=.\build\fr\da32stat
# End Custom Macros

ALL : "$(OUTDIR)\Dtaccess.exe"


CLEAN :
	-@erase "$(INTDIR)\dtaccess.res"
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Dtaccess.exe"
	-@erase "$(OUTDIR)\Dtaccess.ilk"
	-@erase "$(OUTDIR)\Dtaccess.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\..\dapi\src\api" /D "_DEBUG" /D "FRENCH" /D "WIN32" /D "_WINDOWS" /Fp"$(INTDIR)\Dtsample.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtaccess.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o".\build\fr\a32debug/Dtaccess.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\..\dapi\build\dtstatic\fr\debug\dtstatic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib winmm.lib msvcrt.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Dtaccess.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Dtaccess.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtaccess.res"

"$(OUTDIR)\Dtaccess.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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
!IF EXISTS("Dtsample.dep")
!INCLUDE "Dtsample.dep"
!ELSE 
!MESSAGE Warning: cannot find "Dtsample.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "Dtsample - Win32 Release" || "$(CFG)" == "Dtsample - Win32 Debug" || "$(CFG)" == "Dtsample - Win32 Release Access32 Static" || "$(CFG)" == "Dtsample - Win32 Release Access32 Static Spanish" || "$(CFG)" == "Dtsample - Win32 Release Access32 Static German" || "$(CFG)" == "Dtsample - Win32 Release Access32 Static Latin American" || "$(CFG)" == "Dtsample - Win32 Debug Access32 Static" || "$(CFG)" == "Dtsample - Win32 Debug Access32 Static Spanish" || "$(CFG)" == "Dtsample - Win32 Debug Access32 Static German" || "$(CFG)" == "Dtsample - Win32 Debug Access32 Static Latin American" || "$(CFG)" == "Dtsample - Win32 Release Access32 Static United Kingdom" || "$(CFG)" == "Dtsample - Win32 Debug Access32 Static United Kingdom" || "$(CFG)" == "Dtsample - Win32 Release Access32 Static French" || "$(CFG)" == "Dtsample - Win32 Debug Access32 Static French"
SOURCE=.\dtsample.c

!IF  "$(CFG)" == "Dtsample - Win32 Release"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug"


"$(INTDIR)\dtsample.obj"	"$(INTDIR)\dtsample.sbr" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static Spanish"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static German"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static Latin American"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static Spanish"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static German"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static Latin American"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static United Kingdom"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static United Kingdom"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static French"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static French"


"$(INTDIR)\dtsample.obj" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\dtsample.rc

!IF  "$(CFG)" == "Dtsample - Win32 Release"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug"


"$(INTDIR)\dtsample.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static"


"$(INTDIR)\dtaccess.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static Spanish"


"$(INTDIR)\dtaccess.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static German"


"$(INTDIR)\dtaccess.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static Latin American"


"$(INTDIR)\dtaccess.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static"


"$(INTDIR)\dtaccess.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static Spanish"


"$(INTDIR)\dtaccess.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static German"


"$(INTDIR)\dtaccess.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static Latin American"


"$(INTDIR)\dtaccess.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static United Kingdom"


"$(INTDIR)\dtaccess.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static United Kingdom"


"$(INTDIR)\dtaccess.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Release Access32 Static French"


"$(INTDIR)\dtaccess.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 Debug Access32 Static French"


"$(INTDIR)\dtaccess.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ENDIF 


!ENDIF 

