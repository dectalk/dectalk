# Microsoft Developer Studio Generated NMAKE File, Based on Dtsample.dsp
!IF "$(CFG)" == ""
CFG=Dtsample - Win32 (WCE MIPS) Release Dll
!MESSAGE No configuration specified. Defaulting to Dtsample - Win32 (WCE MIPS)\
 Release Dll.
!ENDIF 

!IF "$(CESubsystem)" == ""
CESubsystem=windowsce,2.0
!MESSAGE Variable CESubsystem not specified. Defaulting to windowsce,2.0
!ENDIF 

!IF "$(CEVersion)" == ""
CEVersion=200
!MESSAGE Variable CEVersion not specified. Defaulting to 200
!ENDIF 

!IF "$(CEConfigName)" == ""
CEConfigName=H/PC Ver. 2.00
!MESSAGE Variable CEConfigName not specified.  Defaulting to H/PC Ver. 2.00
!ENDIF 

!IF "$(CFG)" != "Dtsample - Win32 (WCE MIPS) Release Dll" && "$(CFG)" !=\
 "Dtsample - Win32 (WCE SH) Release Dll" && "$(CFG)" !=\
 "Dtsample - Win32 (WCE x86em) Release Dll"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE MIPS) Release Dll"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Dtsample - Win32 (WCE MIPS) Release Dll" (based on\
 "Win32 (WCE MIPS) Application")
!MESSAGE "Dtsample - Win32 (WCE SH) Release Dll" (based on\
 "Win32 (WCE SH) Application")
!MESSAGE "Dtsample - Win32 (WCE x86em) Release Dll" (based on\
 "Win32 (WCE x86em) Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release Dll"

OUTDIR=.\build\us\mips\release
INTDIR=.\build\us\mips\release\link
# Begin Custom Macros
OutDir=.\.\build\us\mips\release
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\Dtsample.exe"

!ELSE 

ALL : "$(OUTDIR)\Dtsample.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clmips.exe
CPP_PROJ=/nologo /MT /W3 /O2 /I ".\..\..\..\include" /D _WIN32_WCE=$(CEVersion)\
 /D "$(CEConfigName)" /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D UNDER_CE=$(CEVersion)\
 /D "UNICODE" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\build\us\mips\release\link/
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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "MIPS" /d "_MIPS_" /d\
 UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d\
 "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o NUL /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\us\mips\dectalk.lib  commctrl.lib coredll.lib /nologo\
 /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no\
 /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:MIPS /nodefaultlib:"libc.lib"\
 /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH) Release Dll"

OUTDIR=.\build\us\sh\release
INTDIR=.\build\us\sh\release\link
# Begin Custom Macros
OutDir=.\.\build\us\sh\release
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\Dtsample.exe"

!ELSE 

ALL : "$(OUTDIR)\Dtsample.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /MT /W3 /O2 /I ".\..\..\..\include" /D _WIN32_WCE=$(CEVersion)\
 /D "$(CEConfigName)" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D\
 UNDER_CE=$(CEVersion) /D "UNICODE" /Fo"$(INTDIR)\\" /c 
CPP_OBJS=.\build\us\sh\release\link/
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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\dtsample.res" /d "SHx" /d "SH3" /d "_SH3_"\
 /d UNDER_CE=$(CEVersion) /d _WIN32_WCE=$(CEVersion) /d "$(CEConfigName)" /d\
 "UNICODE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o NUL /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\us\sh\dectalk.lib  commctrl.lib coredll.lib /nologo\
 /entry:"WinMainCRTStartup" /base:"0x00010000" /incremental:no\
 /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:SH3 /nodefaultlib:"libc.lib"\
 /out:"$(OUTDIR)\Dtsample.exe" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release Dll"

OUTDIR=.\build\us\x86em\release
INTDIR=.\build\us\x86em\release\link
# Begin Custom Macros
OutDir=.\.\build\us\x86em\release
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\Dtsample.exe"

!ELSE 

ALL : "$(OUTDIR)\Dtsample.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\dtsample.obj"
	-@erase "$(INTDIR)\dtsample.res"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(OUTDIR)\Dtsample.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /O2 /I ".\..\..\..\include" /D UNDER_CE=$(CEVersion)\
 /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D\
 "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D\
 "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /Fo"$(INTDIR)\\"\
 /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\build\us\x86em\release\link/
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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\dtsample.res" /d UNDER_CE=$(CEVersion) /d\
 "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d\
 "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d\
 "INTLMSG_CODEPAGE" /d "NDEBUG" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o NUL /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Dtsample.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\us\x86em\dectalk.lib  commctrl.lib coredll.lib /nologo\
 /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Dtsample.pdb" /machine:I386\
 /out:"$(OUTDIR)\Dtsample.exe" /windowsce:emulation 
LINK32_OBJS= \
	"$(INTDIR)\dtsample.obj" \
	"$(INTDIR)\dtsample.res"

"$(OUTDIR)\Dtsample.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release Dll" || "$(CFG)" ==\
 "Dtsample - Win32 (WCE SH) Release Dll" || "$(CFG)" ==\
 "Dtsample - Win32 (WCE x86em) Release Dll"
SOURCE=.\dtsample.c

!IF  "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release Dll"

DEP_CPP_DTSAM=\
	".\dlgs.h"\
	".\dtsample.h"\
	
NODEP_CPP_DTSAM=\
	".\ttsapi.h"\
	

"$(INTDIR)\dtsample.obj" : $(SOURCE) $(DEP_CPP_DTSAM) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH) Release Dll"

DEP_CPP_DTSAM=\
	".\dlgs.h"\
	".\dtsample.h"\
	
NODEP_CPP_DTSAM=\
	".\ttsapi.h"\
	

"$(INTDIR)\dtsample.obj" : $(SOURCE) $(DEP_CPP_DTSAM) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release Dll"

DEP_CPP_DTSAM=\
	".\dlgs.h"\
	".\dtsample.h"\
	
NODEP_CPP_DTSAM=\
	".\ttsapi.h"\
	

"$(INTDIR)\dtsample.obj" : $(SOURCE) $(DEP_CPP_DTSAM) "$(INTDIR)"


!ENDIF 

SOURCE=.\dtsample.rc

!IF  "$(CFG)" == "Dtsample - Win32 (WCE MIPS) Release Dll"

DEP_RSC_DTSAMP=\
	".\Buttons.bmp"\
	".\cursor1.cur"\
	".\dlgs.h"\
	".\dtsample.h"\
	".\dtsample.ico"\
	

"$(INTDIR)\dtsample.res" : $(SOURCE) $(DEP_RSC_DTSAMP) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE SH) Release Dll"

DEP_RSC_DTSAMP=\
	".\Buttons.bmp"\
	".\cursor1.cur"\
	".\dlgs.h"\
	".\dtsample.h"\
	".\dtsample.ico"\
	

"$(INTDIR)\dtsample.res" : $(SOURCE) $(DEP_RSC_DTSAMP) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Dtsample - Win32 (WCE x86em) Release Dll"

DEP_RSC_DTSAMP=\
	".\Buttons.bmp"\
	".\cursor1.cur"\
	".\dlgs.h"\
	".\dtsample.h"\
	".\dtsample.ico"\
	

"$(INTDIR)\dtsample.res" : $(SOURCE) $(DEP_RSC_DTSAMP) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ENDIF 


!ENDIF 

