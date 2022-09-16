# Microsoft Developer Studio Generated NMAKE File, Based on licenseu.dsp
!IF "$(CFG)" == ""
CFG=LicenseU - Win32 ALPHA WP Debug
!MESSAGE No configuration specified. Defaulting to LicenseU - Win32 ALPHA WP Debug.
!ENDIF 

!IF "$(CFG)" != "LicenseU - Win32 Debug" && "$(CFG)" != "LicenseU - Win32 Release" && "$(CFG)" != "LicenseU - Win32 ALPHA Release" && "$(CFG)" != "LicenseU - Win32 ALPHA Debug" && "$(CFG)" != "LicenseU - Win32 WP Release" && "$(CFG)" != "LicenseU - Win32 WP Debug" && "$(CFG)" != "LicenseU - Win32 ALPHA WP Release" && "$(CFG)" != "LicenseU - Win32 ALPHA WP Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "licenseu.mak" CFG="LicenseU - Win32 ALPHA WP Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "LicenseU - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE "LicenseU - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "LicenseU - Win32 ALPHA Release" (based on "Win32 (ALPHA) Application")
!MESSAGE "LicenseU - Win32 ALPHA Debug" (based on "Win32 (ALPHA) Application")
!MESSAGE "LicenseU - Win32 WP Release" (based on "Win32 (x86) Application")
!MESSAGE "LicenseU - Win32 WP Debug" (based on "Win32 (x86) Application")
!MESSAGE "LicenseU - Win32 ALPHA WP Release" (based on "Win32 (ALPHA) Application")
!MESSAGE "LicenseU - Win32 ALPHA WP Debug" (based on "Win32 (ALPHA) Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "LicenseU - Win32 Debug"

OUTDIR=.\build\debug
INTDIR=.\build\debug\link
# Begin Custom Macros
OutDir=.\build\debug
# End Custom Macros

ALL : "$(OUTDIR)\licenseu.exe"


CLEAN :
	-@erase "$(INTDIR)\Crypt2.obj"
	-@erase "$(INTDIR)\LicChPwd.obj"
	-@erase "$(INTDIR)\LicenseU.obj"
	-@erase "$(INTDIR)\LicenseU.res"
	-@erase "$(INTDIR)\liceudlg.obj"
	-@erase "$(INTDIR)\LicReqd.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\UpdateRg.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\licenseu.exe"
	-@erase "$(OUTDIR)\licenseu.ilk"
	-@erase "$(OUTDIR)\licenseu.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\.." /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /Fp"$(INTDIR)\licenseu.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\LicenseU.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\licenseu.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=/nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\licenseu.pdb" /debug /machine:IX86 /out:"$(OUTDIR)\licenseu.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Crypt2.obj" \
	"$(INTDIR)\LicChPwd.obj" \
	"$(INTDIR)\LicenseU.obj" \
	"$(INTDIR)\liceudlg.obj" \
	"$(INTDIR)\LicReqd.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\UpdateRg.obj" \
	"$(INTDIR)\LicenseU.res"

"$(OUTDIR)\licenseu.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "LicenseU - Win32 Release"

OUTDIR=.\build\release
INTDIR=.\build\release\link
# Begin Custom Macros
OutDir=.\build\release
# End Custom Macros

ALL : "$(OUTDIR)\licenseu.exe"


CLEAN :
	-@erase "$(INTDIR)\Crypt2.obj"
	-@erase "$(INTDIR)\LicChPwd.obj"
	-@erase "$(INTDIR)\LicenseU.obj"
	-@erase "$(INTDIR)\LicenseU.res"
	-@erase "$(INTDIR)\liceudlg.obj"
	-@erase "$(INTDIR)\LicReqd.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\UpdateRg.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\licenseu.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\.." /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /Fp"$(INTDIR)\licenseu.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\LicenseU.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\licenseu.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=/nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\licenseu.pdb" /machine:IX86 /out:"$(OUTDIR)\licenseu.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Crypt2.obj" \
	"$(INTDIR)\LicChPwd.obj" \
	"$(INTDIR)\LicenseU.obj" \
	"$(INTDIR)\liceudlg.obj" \
	"$(INTDIR)\LicReqd.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\UpdateRg.obj" \
	"$(INTDIR)\LicenseU.res"

"$(OUTDIR)\licenseu.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA Release"

OUTDIR=.\alpha\release
INTDIR=.\alpha\release\link
# Begin Custom Macros
OutDir=.\alpha\release
# End Custom Macros

ALL : "$(OUTDIR)\licenseu.exe"


CLEAN :
	-@erase "$(INTDIR)\LicenseU.res"
	-@erase "$(OUTDIR)\licenseu.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\LicenseU.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\licenseu.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=/nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\licenseu.pdb" /machine:ALPHA /out:"$(OUTDIR)\licenseu.exe" 
LINK32_OBJS= \
	"$(INTDIR)\LicenseU.res"

"$(OUTDIR)\licenseu.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA Debug"

OUTDIR=.\alpha\debug
INTDIR=.\alpha\debug\link
# Begin Custom Macros
OutDir=.\alpha\debug
# End Custom Macros

ALL : "$(OUTDIR)\licenseu.exe"


CLEAN :
	-@erase "$(INTDIR)\LicenseU.res"
	-@erase "$(OUTDIR)\licenseu.exe"
	-@erase "$(OUTDIR)\licenseu.ilk"
	-@erase "$(OUTDIR)\licenseu.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\LicenseU.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\licenseu.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=/nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\licenseu.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\licenseu.exe" 
LINK32_OBJS= \
	"$(INTDIR)\LicenseU.res"

"$(OUTDIR)\licenseu.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "LicenseU - Win32 WP Release"

OUTDIR=.\wbuild\release
INTDIR=.\wbuild\release\link
# Begin Custom Macros
OutDir=.\wbuild\release
# End Custom Macros

ALL : "$(OUTDIR)\licenseu.exe"


CLEAN :
	-@erase "$(INTDIR)\Crypt2.obj"
	-@erase "$(INTDIR)\LicChPwd.obj"
	-@erase "$(INTDIR)\LicenseU.obj"
	-@erase "$(INTDIR)\LicenseU.res"
	-@erase "$(INTDIR)\liceudlg.obj"
	-@erase "$(INTDIR)\LicReqd.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\UpdateRg.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\licenseu.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\.." /I "..\..\dapi\src\api" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "WILLOWPOND" /Fp"$(INTDIR)\licenseu.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\LicenseU.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\licenseu.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=/nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\licenseu.pdb" /machine:IX86 /out:"$(OUTDIR)\licenseu.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Crypt2.obj" \
	"$(INTDIR)\LicChPwd.obj" \
	"$(INTDIR)\LicenseU.obj" \
	"$(INTDIR)\liceudlg.obj" \
	"$(INTDIR)\LicReqd.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\UpdateRg.obj" \
	"$(INTDIR)\LicenseU.res"

"$(OUTDIR)\licenseu.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "LicenseU - Win32 WP Debug"

OUTDIR=.\wbuild\debug
INTDIR=.\wbuild\debug\link
# Begin Custom Macros
OutDir=.\wbuild\debug
# End Custom Macros

ALL : "$(OUTDIR)\licenseu.exe"


CLEAN :
	-@erase "$(INTDIR)\Crypt2.obj"
	-@erase "$(INTDIR)\LicChPwd.obj"
	-@erase "$(INTDIR)\LicenseU.obj"
	-@erase "$(INTDIR)\LicenseU.res"
	-@erase "$(INTDIR)\liceudlg.obj"
	-@erase "$(INTDIR)\LicReqd.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\UpdateRg.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\licenseu.exe"
	-@erase "$(OUTDIR)\licenseu.ilk"
	-@erase "$(OUTDIR)\licenseu.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\.." /I "..\..\dapi\src\api" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /D "WILLOWPOND" /Fp"$(INTDIR)\licenseu.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\LicenseU.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\licenseu.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=/nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\licenseu.pdb" /debug /machine:IX86 /out:"$(OUTDIR)\licenseu.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Crypt2.obj" \
	"$(INTDIR)\LicChPwd.obj" \
	"$(INTDIR)\LicenseU.obj" \
	"$(INTDIR)\liceudlg.obj" \
	"$(INTDIR)\LicReqd.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\UpdateRg.obj" \
	"$(INTDIR)\LicenseU.res"

"$(OUTDIR)\licenseu.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA WP Release"

OUTDIR=.\walpha\release
INTDIR=.\walpha\release\link
# Begin Custom Macros
OutDir=.\walpha\release
# End Custom Macros

ALL : "$(OUTDIR)\licenseu.exe"


CLEAN :
	-@erase "$(INTDIR)\LicenseU.res"
	-@erase "$(OUTDIR)\licenseu.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\LicenseU.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\licenseu.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=/nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\licenseu.pdb" /machine:ALPHA /out:"$(OUTDIR)\licenseu.exe" 
LINK32_OBJS= \
	"$(INTDIR)\LicenseU.res"

"$(OUTDIR)\licenseu.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA WP Debug"

OUTDIR=.\walpha\debug
INTDIR=.\walpha\debug\link
# Begin Custom Macros
OutDir=.\walpha\debug
# End Custom Macros

ALL : "$(OUTDIR)\licenseu.exe"


CLEAN :
	-@erase "$(INTDIR)\LicenseU.res"
	-@erase "$(OUTDIR)\licenseu.exe"
	-@erase "$(OUTDIR)\licenseu.ilk"
	-@erase "$(OUTDIR)\licenseu.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\LicenseU.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\licenseu.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=/nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\licenseu.pdb" /debug /machine:ALPHA /out:"$(OUTDIR)\licenseu.exe" 
LINK32_OBJS= \
	"$(INTDIR)\LicenseU.res"

"$(OUTDIR)\licenseu.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("licenseu.dep")
!INCLUDE "licenseu.dep"
!ELSE 
!MESSAGE Warning: cannot find "licenseu.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "LicenseU - Win32 Debug" || "$(CFG)" == "LicenseU - Win32 Release" || "$(CFG)" == "LicenseU - Win32 ALPHA Release" || "$(CFG)" == "LicenseU - Win32 ALPHA Debug" || "$(CFG)" == "LicenseU - Win32 WP Release" || "$(CFG)" == "LicenseU - Win32 WP Debug" || "$(CFG)" == "LicenseU - Win32 ALPHA WP Release" || "$(CFG)" == "LicenseU - Win32 ALPHA WP Debug"
SOURCE=..\..\dapi\src\Api\Crypt2.c

!IF  "$(CFG)" == "LicenseU - Win32 Debug"


"$(INTDIR)\Crypt2.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "LicenseU - Win32 Release"


"$(INTDIR)\Crypt2.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 WP Release"


"$(INTDIR)\Crypt2.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "LicenseU - Win32 WP Debug"


"$(INTDIR)\Crypt2.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA WP Release"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA WP Debug"

!ENDIF 

SOURCE=.\LicChPwd.cpp

!IF  "$(CFG)" == "LicenseU - Win32 Debug"


"$(INTDIR)\LicChPwd.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "LicenseU - Win32 Release"


"$(INTDIR)\LicChPwd.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 WP Release"


"$(INTDIR)\LicChPwd.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "LicenseU - Win32 WP Debug"


"$(INTDIR)\LicChPwd.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA WP Release"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA WP Debug"

!ENDIF 

SOURCE=.\LicenseU.cpp

!IF  "$(CFG)" == "LicenseU - Win32 Debug"


"$(INTDIR)\LicenseU.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "LicenseU - Win32 Release"


"$(INTDIR)\LicenseU.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 WP Release"


"$(INTDIR)\LicenseU.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "LicenseU - Win32 WP Debug"


"$(INTDIR)\LicenseU.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA WP Release"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA WP Debug"

!ENDIF 

SOURCE=.\LicenseU.rc

"$(INTDIR)\LicenseU.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


SOURCE=.\liceudlg.cpp

!IF  "$(CFG)" == "LicenseU - Win32 Debug"


"$(INTDIR)\liceudlg.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "LicenseU - Win32 Release"


"$(INTDIR)\liceudlg.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 WP Release"


"$(INTDIR)\liceudlg.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "LicenseU - Win32 WP Debug"


"$(INTDIR)\liceudlg.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA WP Release"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA WP Debug"

!ENDIF 

SOURCE=.\LicReqd.cpp

!IF  "$(CFG)" == "LicenseU - Win32 Debug"


"$(INTDIR)\LicReqd.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "LicenseU - Win32 Release"


"$(INTDIR)\LicReqd.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 WP Release"


"$(INTDIR)\LicReqd.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "LicenseU - Win32 WP Debug"


"$(INTDIR)\LicReqd.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA WP Release"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA WP Debug"

!ENDIF 

SOURCE=.\StdAfx.cpp

!IF  "$(CFG)" == "LicenseU - Win32 Debug"


"$(INTDIR)\StdAfx.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "LicenseU - Win32 Release"


"$(INTDIR)\StdAfx.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 WP Release"


"$(INTDIR)\StdAfx.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "LicenseU - Win32 WP Debug"


"$(INTDIR)\StdAfx.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA WP Release"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA WP Debug"

!ENDIF 

SOURCE=.\UpdateRg.c

!IF  "$(CFG)" == "LicenseU - Win32 Debug"


"$(INTDIR)\UpdateRg.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "LicenseU - Win32 Release"


"$(INTDIR)\UpdateRg.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 WP Release"


"$(INTDIR)\UpdateRg.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "LicenseU - Win32 WP Debug"


"$(INTDIR)\UpdateRg.obj" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA WP Release"

!ELSEIF  "$(CFG)" == "LicenseU - Win32 ALPHA WP Debug"

!ENDIF 


!ENDIF 

