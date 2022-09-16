# Microsoft Developer Studio Generated NMAKE File, Based on dtmemory.dsp
!IF "$(CFG)" == ""
CFG=dtmemory - Win32 Debug
!MESSAGE No configuration specified. Defaulting to dtmemory - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "dtmemory - Win32 Release" && "$(CFG)" !=\
 "dtmemory - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "dtmemory.mak" CFG="dtmemory - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "dtmemory - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "dtmemory - Win32 Debug" (based on "Win32 (x86) Application")
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

!IF  "$(CFG)" == "dtmemory - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\dtmemory.exe"

!ELSE 

ALL : "$(OUTDIR)\dtmemory.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\dtmemory.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(OUTDIR)\dtmemory.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /ML /W3 /GX /O2 /I "..\..\..\..\dectalk\include" /D "WIN32" /D\
 "NDEBUG" /D "_WINDOWS" /Fp"$(INTDIR)\dtmemory.pch" /YX /Fo"$(INTDIR)\\"\
 /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\Release/
CPP_SBRS=.
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o NUL /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dtmemory.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib ..\..\..\..\dectalk\lib\dectalk.lib /nologo /subsystem:windows\
 /incremental:no /pdb:"$(OUTDIR)\dtmemory.pdb" /machine:I386\
 /out:"$(OUTDIR)\dtmemory.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtmemory.obj"

"$(OUTDIR)\dtmemory.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dtmemory - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\dtmemory.exe"

!ELSE 

ALL : "$(OUTDIR)\dtmemory.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\dtmemory.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\vc50.pdb"
	-@erase "$(OUTDIR)\dtmemory.exe"
	-@erase "$(OUTDIR)\dtmemory.ilk"
	-@erase "$(OUTDIR)\dtmemory.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /I "..\..\..\..\dectalk\include" /D\
 "WIN32" /D "_DEBUG" /D "_WINDOWS" /Fp"$(INTDIR)\dtmemory.pch" /YX\
 /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\Debug/
CPP_SBRS=.
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o NUL /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dtmemory.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib ..\..\..\..\dectalk\lib\dectalk.lib /nologo /subsystem:windows\
 /incremental:yes /pdb:"$(OUTDIR)\dtmemory.pdb" /debug /machine:I386\
 /out:"$(OUTDIR)\dtmemory.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\dtmemory.obj"

"$(OUTDIR)\dtmemory.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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


!IF "$(CFG)" == "dtmemory - Win32 Release" || "$(CFG)" ==\
 "dtmemory - Win32 Debug"
SOURCE="..\..\..\..\..\Program Files\DECtalk\samples\dtmemory\dtmemory.c"

!IF  "$(CFG)" == "dtmemory - Win32 Release"

DEP_CPP_DTMEM=\
	"..\..\..\..\..\Program Files\DECtalk\samples\dtmemory\dtmemory.h"\
	"..\..\..\include\ttsapi.h"\
	

"$(INTDIR)\dtmemory.obj" : $(SOURCE) $(DEP_CPP_DTMEM) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "dtmemory - Win32 Debug"

DEP_CPP_DTMEM=\
	"..\..\..\..\..\program files\dectalk\include\ttsapi.h"\
	"..\..\..\..\..\Program Files\DECtalk\samples\dtmemory\dtmemory.h"\
	

"$(INTDIR)\dtmemory.obj" : $(SOURCE) $(DEP_CPP_DTMEM) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 


!ENDIF 

