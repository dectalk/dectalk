# Microsoft Developer Studio Generated NMAKE File, Based on CEtalk.dsp
!IF "$(CFG)" == ""
CFG=CEtalk - Win32 (WCE MIPS) Release dll
!MESSAGE No configuration specified. Defaulting to CEtalk - Win32 (WCE MIPS)\
 Release dll.
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

!IF "$(CFG)" != "CEtalk - Win32 (WCE MIPS) Release dll" && "$(CFG)" !=\
 "CEtalk - Win32 (WCE SH) Release dll" && "$(CFG)" !=\
 "CEtalk - Win32 (WCE x86em) Release dll"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE MIPS) Release dll"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "CEtalk - Win32 (WCE MIPS) Release dll" (based on\
 "Win32 (WCE MIPS) Application")
!MESSAGE "CEtalk - Win32 (WCE SH) Release dll" (based on\
 "Win32 (WCE SH) Application")
!MESSAGE "CEtalk - Win32 (WCE x86em) Release dll" (based on\
 "Win32 (WCE x86em) Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release dll"

OUTDIR=.\build\us\mips\release
INTDIR=.\build\us\mips\release\link
# Begin Custom Macros
OutDir=.\.\build\us\mips\release
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\CEtalk_us.exe"

!ELSE 

ALL : "$(OUTDIR)\CEtalk_us.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\CEtalk_us.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=clmips.exe
CPP_PROJ=/nologo /MT /W3 /O2 /I ".\..\..\..\include" /D "NDEBUG" /D "MIPS" /D\
 "_MIPS_" /D "UNDER_CE" /D "UNICODE" /D _WIN32_WCE=200 /Fp"$(INTDIR)\CEtalk.pch"\
 /Yu"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 
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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\CEtalk.res" /d "MIPS" /d "_MIPS_" /d\
 "UNDER_CE" /d "UNICODE" /d "NDEBUG" /d _WIN32_WCE=200 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o NUL /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\us\mips\dectalk.lib /nologo /entry:"wWinMainCRTStartup"\
 /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\CEtalk_us.pdb" /machine:MIPS\
 /out:"$(OUTDIR)\CEtalk_us.exe"\
 /libpath:"c:\devstudio\wce\mfc\lib\wce200\wcemips"\
 /libpath:"c:\devstudio\wce\lib\wce200\wcemips" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalk.res" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj"

"$(OUTDIR)\CEtalk_us.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH) Release dll"

OUTDIR=.\build\us\sh\release
INTDIR=.\build\us\sh\release\link
# Begin Custom Macros
OutDir=.\.\build\us\sh\release
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\CEtalk_us.exe"

!ELSE 

ALL : "$(OUTDIR)\CEtalk_us.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\CEtalk_us.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=shcl.exe
CPP_PROJ=/nologo /MT /W3 /O2 /I ".\..\..\..\include" /D "NDEBUG" /D "SHx" /D\
 "SH3" /D "_SH3_" /D "UNDER_CE" /D "UNICODE" /D _WIN32_WCE=200\
 /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 
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
RSC_PROJ=/l 0x409 /r /fo"$(INTDIR)\CEtalk.res" /i\
 "c:\devstudio\wce\mfc\include\wce200" /d "SHx" /d "SH3" /d "_SH3_" /d\
 "UNDER_CE" /d "UNICODE" /d "NDEBUG" /d _WIN32_WCE=200 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o NUL /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\us\sh\dectalk.lib /nologo /entry:"wWinMainCRTStartup"\
 /base:"0x00010000" /incremental:no /pdb:"$(OUTDIR)\CEtalk_us.pdb" /machine:SH3\
 /out:"$(OUTDIR)\CEtalk_us.exe" /libpath:"c:\devstudio\wce\mfc\lib\wce200\wcesh"\
 /libpath:"c:\devstudio\wce\lib\wce200\wcesh" /subsystem:windowsce,2.0 
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalk.res" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj"

"$(OUTDIR)\CEtalk_us.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release dll"

OUTDIR=.\build\us\x86em\release
INTDIR=.\build\us\x86em\release\link
# Begin Custom Macros
OutDir=.\.\build\us\x86em\release
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\CEtalk_us.exe"

!ELSE 

ALL : "$(OUTDIR)\CEtalk_us.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\CEtalk.obj"
	-@erase "$(INTDIR)\CEtalk.pch"
	-@erase "$(INTDIR)\CEtalk.res"
	-@erase "$(INTDIR)\CEtalkDlg.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\CEtalk_us.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /O2 /I ".\..\..\..\include" /D UNDER_CE=$(CEVersion)\
 /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=$(CEVersion) /D\
 "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D\
 "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /D "_AFXDLL"\
 /Fp"$(INTDIR)\CEtalk.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /c 
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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\CEtalk.res" /d UNDER_CE=$(CEVersion) /d\
 "UNICODE" /d "_UNICODE" /d "WIN32" /d "STRICT" /d _WIN32_WCE=$(CEVersion) /d\
 "$(CEConfigName)" /d "_WIN32_WCE_EMULATION" /d "INTERNATIONAL" /d "USA" /d\
 "INTLMSG_CODEPAGE" /d "NDEBUG" /d "_AFXDLL" 
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o NUL /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CEtalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=.\..\..\us\x86em\dectalk.lib /nologo /entry:"wWinMainCRTStartup"\
 /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\CEtalk_us.pdb" /machine:I386\
 /out:"$(OUTDIR)\CEtalk_us.exe" /windowsce:emulation 
LINK32_OBJS= \
	"$(INTDIR)\CEtalk.obj" \
	"$(INTDIR)\CEtalk.res" \
	"$(INTDIR)\CEtalkDlg.obj" \
	"$(INTDIR)\StdAfx.obj"

"$(OUTDIR)\CEtalk_us.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release dll" || "$(CFG)" ==\
 "CEtalk - Win32 (WCE SH) Release dll" || "$(CFG)" ==\
 "CEtalk - Win32 (WCE x86em) Release dll"
SOURCE=.\CEtalk.cpp

!IF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release dll"

DEP_CPP_CETAL=\
	".\CEtalk.h"\
	".\CEtalkDlg.h"\
	".\StdAfx.h"\
	

"$(INTDIR)\CEtalk.obj" : $(SOURCE) $(DEP_CPP_CETAL) "$(INTDIR)"\
 "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH) Release dll"

DEP_CPP_CETAL=\
	".\CEtalk.h"\
	".\CEtalkDlg.h"\
	".\StdAfx.h"\
	

"$(INTDIR)\CEtalk.obj" : $(SOURCE) $(DEP_CPP_CETAL) "$(INTDIR)"\
 "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release dll"

DEP_CPP_CETAL=\
	".\CEtalk.h"\
	".\CEtalkDlg.h"\
	".\StdAfx.h"\
	

"$(INTDIR)\CEtalk.obj" : $(SOURCE) $(DEP_CPP_CETAL) "$(INTDIR)"\
 "$(INTDIR)\CEtalk.pch"


!ENDIF 

SOURCE=.\CEtalk.rc

!IF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release dll"

DEP_RSC_CETALK=\
	".\res\CEtalk.ico"\
	".\res\CEtalk.rc2"\
	{$(INCLUDE)}"wceres.rc"\
	

"$(INTDIR)\CEtalk.res" : $(SOURCE) $(DEP_RSC_CETALK) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH) Release dll"

DEP_RSC_CETALK=\
	".\res\CEtalk.ico"\
	".\res\CEtalk.rc2"\
	{$(INCLUDE)}"wceres.rc"\
	

"$(INTDIR)\CEtalk.res" : $(SOURCE) $(DEP_RSC_CETALK) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release dll"

DEP_RSC_CETALK=\
	".\res\CEtalk.ico"\
	".\res\CEtalk.rc2"\
	{$(INCLUDE)}"wceres.rc"\
	

"$(INTDIR)\CEtalk.res" : $(SOURCE) $(DEP_RSC_CETALK) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\CEtalkDlg.cpp

!IF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release dll"

DEP_CPP_CETALKD=\
	".\CEtalk.h"\
	".\CEtalkDlg.h"\
	".\StdAfx.h"\
	
NODEP_CPP_CETALKD=\
	".\ttsapi.h"\
	

"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) $(DEP_CPP_CETALKD) "$(INTDIR)"\
 "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH) Release dll"

DEP_CPP_CETALKD=\
	".\CEtalk.h"\
	".\CEtalkDlg.h"\
	".\StdAfx.h"\
	
NODEP_CPP_CETALKD=\
	".\ttsapi.h"\
	

"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) $(DEP_CPP_CETALKD) "$(INTDIR)"\
 "$(INTDIR)\CEtalk.pch"


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release dll"

DEP_CPP_CETALKD=\
	".\CEtalk.h"\
	".\CEtalkDlg.h"\
	".\StdAfx.h"\
	
NODEP_CPP_CETALKD=\
	".\ttsapi.h"\
	

"$(INTDIR)\CEtalkDlg.obj" : $(SOURCE) $(DEP_CPP_CETALKD) "$(INTDIR)"\
 "$(INTDIR)\CEtalk.pch"


!ENDIF 

SOURCE=.\StdAfx.cpp

!IF  "$(CFG)" == "CEtalk - Win32 (WCE MIPS) Release dll"

DEP_CPP_STDAF=\
	".\StdAfx.h"\
	
CPP_SWITCHES=/nologo /MT /W3 /O2 /I ".\..\..\..\include" /D "NDEBUG" /D "MIPS"\
 /D "_MIPS_" /D "UNDER_CE" /D "UNICODE" /D _WIN32_WCE=200\
 /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /QMRWCE /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) $(DEP_CPP_STDAF)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE SH) Release dll"

DEP_CPP_STDAF=\
	".\StdAfx.h"\
	
CPP_SWITCHES=/nologo /MT /W3 /O2 /I ".\..\..\..\include" /D "NDEBUG" /D "SHx"\
 /D "SH3" /D "_SH3_" /D "UNDER_CE" /D "UNICODE" /D _WIN32_WCE=200\
 /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) $(DEP_CPP_STDAF)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CEtalk - Win32 (WCE x86em) Release dll"

DEP_CPP_STDAF=\
	".\StdAfx.h"\
	
CPP_SWITCHES=/nologo /MT /W3 /O2 /I ".\..\..\..\include" /D\
 UNDER_CE=$(CEVersion) /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D\
 _WIN32_WCE=$(CEVersion) /D "$(CEConfigName)" /D "_WIN32_WCE_EMULATION" /D\
 "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486"\
 /D "_x86_" /D "_AFXDLL" /Fp"$(INTDIR)\CEtalk.pch" /Yc"stdafx.h"\
 /Fo"$(INTDIR)\\" /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CEtalk.pch" : $(SOURCE) $(DEP_CPP_STDAF)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 


!ENDIF 

