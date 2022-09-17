# Microsoft Developer Studio Generated NMAKE File, Based on dttest32.dsp
!IF "$(CFG)" == ""
CFG=dttest32 - Win32 Debug
!MESSAGE No configuration specified. Defaulting to dttest32 - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "dttest32 - Win32 Release" && "$(CFG)" !=\
 "dttest32 - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "dttest32.mak" CFG="dttest32 - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "dttest32 - Win32 Release" (based on\
 "Win32 (x86) Console Application")
!MESSAGE "dttest32 - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "dttest32 - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release

!IF "$(RECURSE)" == "0" 

ALL : ".\dttest32.exe"

!ELSE 

ALL : ".\dttest32.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\dtt_in.obj"
	-@erase "$(INTDIR)\dtt_int.obj"
	-@erase "$(INTDIR)\dtt_main.obj"
	-@erase "$(INTDIR)\dtt_out.obj"
	-@erase "$(INTDIR)\dtt_pro.obj"
	-@erase "$(INTDIR)\dtt_util.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(OUTDIR)\dttest32.pdb"
	-@erase ".\dttest32.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D\
 "_MBCS" /D "MSVC4" /Fp"$(INTDIR)\dttest32.pch" /YX /Fo"$(INTDIR)\\"\
 /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\Release/
CPP_SBRS=.

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

RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dttest32.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=d:\work\ad\dapi\build\dectalk\us\release\dectalk.lib kernel32.lib\
 user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib\
 ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo\
 /subsystem:console /incremental:no /pdb:"$(OUTDIR)\dttest32.pdb" /debug\
 /machine:I386 /out:"dttest32.exe" 
LINK32_OBJS= \
	"$(INTDIR)\dtt_in.obj" \
	"$(INTDIR)\dtt_int.obj" \
	"$(INTDIR)\dtt_main.obj" \
	"$(INTDIR)\dtt_out.obj" \
	"$(INTDIR)\dtt_pro.obj" \
	"$(INTDIR)\dtt_util.obj"

".\dttest32.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "dttest32 - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug

!IF "$(RECURSE)" == "0" 

ALL : ".\dttest32.exe"

!ELSE 

ALL : ".\dttest32.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\dtt_in.obj"
	-@erase "$(INTDIR)\dtt_int.obj"
	-@erase "$(INTDIR)\dtt_main.obj"
	-@erase "$(INTDIR)\dtt_out.obj"
	-@erase "$(INTDIR)\dtt_pro.obj"
	-@erase "$(INTDIR)\dtt_util.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\vc50.pdb"
	-@erase "$(OUTDIR)\dttest32.pdb"
	-@erase ".\dttest32.exe"
	-@erase ".\dttest32.ilk"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE"\
 /D "_MBCS" /D "MSVC4" /Fp"$(INTDIR)\dttest32.pch" /YX /Fo"$(INTDIR)\\"\
 /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\Debug/
CPP_SBRS=.

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

RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/o"$(OUTDIR)\dttest32.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=d:\work\ad\dapi\build\dectalk\us\debug\dectalk.lib kernel32.lib\
 user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib\
 ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo\
 /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\dttest32.pdb" /debug\
 /machine:I386 /out:"dttest32.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\dtt_in.obj" \
	"$(INTDIR)\dtt_int.obj" \
	"$(INTDIR)\dtt_main.obj" \
	"$(INTDIR)\dtt_out.obj" \
	"$(INTDIR)\dtt_pro.obj" \
	"$(INTDIR)\dtt_util.obj"

".\dttest32.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(CFG)" == "dttest32 - Win32 Release" || "$(CFG)" ==\
 "dttest32 - Win32 Debug"
SOURCE=.\dtt_in.c

!IF  "$(CFG)" == "dttest32 - Win32 Release"

DEP_CPP_DTT_I=\
	".\dtt_data.h"\
	".\dtt_defs.h"\
	".\dtt_prot.h"\
	

"$(INTDIR)\dtt_in.obj" : $(SOURCE) $(DEP_CPP_DTT_I) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "dttest32 - Win32 Debug"

DEP_CPP_DTT_I=\
	".\dtstarp.h"\
	".\dtstart.h"\
	".\dtt_data.h"\
	".\dtt_defs.h"\
	".\dtt_prot.h"\
	".\dttsr.h"\
	

"$(INTDIR)\dtt_in.obj" : $(SOURCE) $(DEP_CPP_DTT_I) "$(INTDIR)"


!ENDIF 

SOURCE=.\dtt_int.c

!IF  "$(CFG)" == "dttest32 - Win32 Release"

DEP_CPP_DTT_IN=\
	".\dtt_data.h"\
	".\dtt_defs.h"\
	".\dtt_prot.h"\
	".\ttsapi.h"\
	

"$(INTDIR)\dtt_int.obj" : $(SOURCE) $(DEP_CPP_DTT_IN) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "dttest32 - Win32 Debug"

DEP_CPP_DTT_IN=\
	".\dtstarp.h"\
	".\dtstart.h"\
	".\dtt_data.h"\
	".\dtt_defs.h"\
	".\dtt_prot.h"\
	".\dttsr.h"\
	".\ttsapi.h"\
	

"$(INTDIR)\dtt_int.obj" : $(SOURCE) $(DEP_CPP_DTT_IN) "$(INTDIR)"


!ENDIF 

SOURCE=.\dtt_main.c

!IF  "$(CFG)" == "dttest32 - Win32 Release"

DEP_CPP_DTT_M=\
	".\dtt_data.h"\
	".\dtt_defs.h"\
	".\dtt_prot.h"\
	

"$(INTDIR)\dtt_main.obj" : $(SOURCE) $(DEP_CPP_DTT_M) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "dttest32 - Win32 Debug"

DEP_CPP_DTT_M=\
	".\dtstarp.h"\
	".\dtstart.h"\
	".\dtt_data.h"\
	".\dtt_defs.h"\
	".\dtt_prot.h"\
	".\dttsr.h"\
	

"$(INTDIR)\dtt_main.obj" : $(SOURCE) $(DEP_CPP_DTT_M) "$(INTDIR)"


!ENDIF 

SOURCE=.\dtt_out.c

!IF  "$(CFG)" == "dttest32 - Win32 Release"

DEP_CPP_DTT_O=\
	".\dtt_data.h"\
	".\dtt_defs.h"\
	".\dtt_prot.h"\
	

"$(INTDIR)\dtt_out.obj" : $(SOURCE) $(DEP_CPP_DTT_O) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "dttest32 - Win32 Debug"

DEP_CPP_DTT_O=\
	".\dtstarp.h"\
	".\dtstart.h"\
	".\dtt_data.h"\
	".\dtt_defs.h"\
	".\dtt_prot.h"\
	".\dttsr.h"\
	

"$(INTDIR)\dtt_out.obj" : $(SOURCE) $(DEP_CPP_DTT_O) "$(INTDIR)"


!ENDIF 

SOURCE=.\dtt_pro.c

!IF  "$(CFG)" == "dttest32 - Win32 Release"

DEP_CPP_DTT_P=\
	".\dtt_data.h"\
	".\dtt_defs.h"\
	".\dtt_prot.h"\
	

"$(INTDIR)\dtt_pro.obj" : $(SOURCE) $(DEP_CPP_DTT_P) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "dttest32 - Win32 Debug"

DEP_CPP_DTT_P=\
	".\dtstarp.h"\
	".\dtstart.h"\
	".\dtt_data.h"\
	".\dtt_defs.h"\
	".\dtt_prot.h"\
	".\dttsr.h"\
	

"$(INTDIR)\dtt_pro.obj" : $(SOURCE) $(DEP_CPP_DTT_P) "$(INTDIR)"


!ENDIF 

SOURCE=.\dtt_util.c

!IF  "$(CFG)" == "dttest32 - Win32 Release"

DEP_CPP_DTT_U=\
	".\dtt_data.h"\
	".\dtt_defs.h"\
	".\dtt_prot.h"\
	

"$(INTDIR)\dtt_util.obj" : $(SOURCE) $(DEP_CPP_DTT_U) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "dttest32 - Win32 Debug"

DEP_CPP_DTT_U=\
	".\dtstarp.h"\
	".\dtstart.h"\
	".\dtt_data.h"\
	".\dtt_defs.h"\
	".\dtt_prot.h"\
	".\dttsr.h"\
	

"$(INTDIR)\dtt_util.obj" : $(SOURCE) $(DEP_CPP_DTT_U) "$(INTDIR)"


!ENDIF 


!ENDIF 

