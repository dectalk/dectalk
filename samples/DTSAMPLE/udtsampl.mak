# Microsoft Developer Studio Generated NMAKE File, Based on dtsample.dsp
!IF "$(CFG)" == ""
CFG=dtsample - Win32 Debug
!MESSAGE No configuration specified. Defaulting to dtsample - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "dtsample - Win32 Release" && "$(CFG)" !=\
 "dtsample - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "dtsample.mak" CFG="dtsample - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "dtsample - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "dtsample - Win32 Debug" (based on "Win32 (x86) Application")
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

!IF  "$(CFG)" == "dtsample - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\dtsample.exe"

!ELSE 

ALL : "$(OUTDIR)\dtsample.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(OUTDIR)\dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /ML /W3 /GX /O2 /I "..\..\..\dectalk\include" /D "WIN32" /D\
 "NDEBUG" /D "_WINDOWS" /Fp"$(INTDIR)\dtsample.pch" /YX /Fo"$(INTDIR)\\"\
 /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\Release/
CPP_SBRS=.
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o NUL /win32 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtsample.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib ..\..\..\dectalk\lib\dectalk.lib /nologo /subsystem:windows\
 /incremental:no /pdb:"$(OUTDIR)\dtsample.pdb" /machine:I386\
 /out:"$(OUTDIR)\dtsample.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dtsample - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\dtsample.exe"

!ELSE 

ALL : "$(OUTDIR)\dtsample.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\vc50.pdb"
	-@erase "$(OUTDIR)\dtsample.exe"
	-@erase "$(OUTDIR)\dtsample.ilk"
	-@erase "$(OUTDIR)\dtsample.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /I "..\..\..\dectalk\include" /D\
 "WIN32" /D "_DEBUG" /D "_WINDOWS" /Fp"$(INTDIR)\dtsample.pch" /YX\
 /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\Debug/
CPP_SBRS=.
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o NUL /win32 
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtsample.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib ..\..\..\dectalk\lib\dectalk.lib /nologo /subsystem:windows\
 /incremental:yes /pdb:"$(OUTDIR)\dtsample.pdb" /debug /machine:I386\
 /out:"$(OUTDIR)\dtsample.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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


!IF "$(CFG)" == "dtsample - Win32 Release" || "$(CFG)" ==\
 "dtsample - Win32 Debug"
SOURCE=.\dtsample.c
DEP_CPP_DTSAM=\
	"..\..\include\ttsapi.h"\
	".\dtsample.h"\
	

"$(INTDIR)\dtsample.obj" : $(SOURCE) $(DEP_CPP_DTSAM) "$(INTDIR)"


SOURCE=.\dtsample.rc
DEP_RSC_DTSAMP=\
	".\dtsample.h"\
	".\dtsample.ico"\
	

"$(INTDIR)\dtsample.res" : $(SOURCE) $(DEP_RSC_DTSAMP) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)



!ENDIF 

