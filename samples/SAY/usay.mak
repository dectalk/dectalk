# Microsoft Developer Studio Generated NMAKE File, Based on say.dsp
!IF "$(CFG)" == ""
CFG=say - Win32 Debug
!MESSAGE No configuration specified. Defaulting to say - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "say - Win32 Release" && "$(CFG)" != "say - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "say.mak" CFG="say - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "say - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "say - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "say - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\say.exe"

!ELSE 

ALL : "$(OUTDIR)\say.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\say.obj"
	-@erase "$(OUTDIR)\say.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /ML /W3 /GX /O2 /I "..\..\..\dectalk\include" /D "WIN32" /D\
 "NDEBUG" /D "_CONSOLE" /D "_MBCS" /Fp"$(INTDIR)\say.pch" /YX /Fo"$(INTDIR)\\"\
 /c 
CPP_OBJS=.\Release/
CPP_SBRS=.
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\say.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib  ..\..\..\dectalk\lib\dectalk.lib /nologo /subsystem:console\
 /incremental:no /pdb:"$(OUTDIR)\say.pdb" /machine:I386 /out:"$(OUTDIR)\say.exe"\
 
LINK32_OBJS= \
	"$(INTDIR)\say.obj"

"$(OUTDIR)\say.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "say - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\say.exe"

!ELSE 

ALL : "$(OUTDIR)\say.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\say.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\vc50.pdb"
	-@erase "$(OUTDIR)\say.exe"
	-@erase "$(OUTDIR)\say.ilk"
	-@erase "$(OUTDIR)\say.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /I "..\..\..\dectalk\include" /D\
 "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /Fp"$(INTDIR)\say.pch" /YX\
 /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /c 
CPP_OBJS=.\Debug/
CPP_SBRS=.
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\say.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib ..\..\..\dectalk\lib\dectalk.lib /nologo /subsystem:console\
 /incremental:yes /pdb:"$(OUTDIR)\say.pdb" /debug /machine:I386\
 /out:"$(OUTDIR)\say.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\say.obj"

"$(OUTDIR)\say.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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


!IF "$(CFG)" == "say - Win32 Release" || "$(CFG)" == "say - Win32 Debug"
SOURCE=.\say.c
DEP_CPP_SAY_C=\
	"..\..\..\dectalk\include\ttsapi.h"\
	

"$(INTDIR)\say.obj" : $(SOURCE) $(DEP_CPP_SAY_C) "$(INTDIR)"



!ENDIF 

