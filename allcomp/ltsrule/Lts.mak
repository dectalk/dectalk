# Microsoft Developer Studio Generated NMAKE File, Based on Lts.dsp
!IF "$(CFG)" == ""
CFG=lts - Win32 Release
!MESSAGE No configuration specified. Defaulting to lts - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "lts - Win32 Release" && "$(CFG)" != "lts - Win32 Debug" && "$(CFG)" != "lts - Win32 Debug German" && "$(CFG)" != "lts - Win32 Win32 nonACNA Debug US" && "$(CFG)" != "lts - Win32 Win32 nonACNA Debug UK"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "Lts.mak" CFG="lts - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "lts - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "lts - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE "lts - Win32 Debug German" (based on "Win32 (x86) Console Application")
!MESSAGE "lts - Win32 Win32 nonACNA Debug US" (based on "Win32 (x86) Console Application")
!MESSAGE "lts - Win32 Win32 nonACNA Debug UK" (based on "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "lts - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release\link

ALL : ".\us\Release\Lts.exe"


CLEAN :
	-@erase "$(INTDIR)\Dbgwins.obj"
	-@erase "$(INTDIR)\Ls_chari.obj"
	-@erase "$(INTDIR)\Ls_dict.obj"
	-@erase "$(INTDIR)\Ls_homo.obj"
	-@erase "$(INTDIR)\Ls_math.obj"
	-@erase "$(INTDIR)\Ls_proc.obj"
	-@erase "$(INTDIR)\Ls_spel.obj"
	-@erase "$(INTDIR)\Ls_speli.obj"
	-@erase "$(INTDIR)\Ls_suff.obj"
	-@erase "$(INTDIR)\Ls_suffi.obj"
	-@erase "$(INTDIR)\Lsa_adju.obj"
	-@erase "$(INTDIR)\lsa_coni.obj"
	-@erase "$(INTDIR)\lsa_fr.obj"
	-@erase "$(INTDIR)\lsa_gr.obj"
	-@erase "$(INTDIR)\lsa_ir.obj"
	-@erase "$(INTDIR)\lsa_it.obj"
	-@erase "$(INTDIR)\lsa_ja.obj"
	-@erase "$(INTDIR)\lsa_rule.obj"
	-@erase "$(INTDIR)\lsa_sl.obj"
	-@erase "$(INTDIR)\lsa_sp.obj"
	-@erase "$(INTDIR)\lsa_us.obj"
	-@erase "$(INTDIR)\lsa_util.obj"
	-@erase "$(INTDIR)\Lsread.obj"
	-@erase "$(INTDIR)\Lts.obj"
	-@erase "$(INTDIR)\Lts_util.obj"
	-@erase "$(INTDIR)\mmalloc.obj"
	-@erase "$(INTDIR)\Pipe.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase ".\us\Release\Lts.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /O2 /I ".\api" /I ".\lts" /I ".\nt" /I ".\include" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /Fp"$(INTDIR)\Lts.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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

RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Lts.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\Lts.pdb" /machine:I386 /out:".\us\Release\Lts.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Dbgwins.obj" \
	"$(INTDIR)\Ls_chari.obj" \
	"$(INTDIR)\Ls_dict.obj" \
	"$(INTDIR)\Ls_homo.obj" \
	"$(INTDIR)\Ls_math.obj" \
	"$(INTDIR)\Ls_proc.obj" \
	"$(INTDIR)\Ls_spel.obj" \
	"$(INTDIR)\Ls_speli.obj" \
	"$(INTDIR)\Ls_suff.obj" \
	"$(INTDIR)\Ls_suffi.obj" \
	"$(INTDIR)\Lsa_adju.obj" \
	"$(INTDIR)\lsa_coni.obj" \
	"$(INTDIR)\lsa_fr.obj" \
	"$(INTDIR)\lsa_gr.obj" \
	"$(INTDIR)\lsa_ir.obj" \
	"$(INTDIR)\lsa_it.obj" \
	"$(INTDIR)\lsa_ja.obj" \
	"$(INTDIR)\lsa_rule.obj" \
	"$(INTDIR)\lsa_sl.obj" \
	"$(INTDIR)\lsa_sp.obj" \
	"$(INTDIR)\lsa_us.obj" \
	"$(INTDIR)\lsa_util.obj" \
	"$(INTDIR)\Lsread.obj" \
	"$(INTDIR)\Lts.obj" \
	"$(INTDIR)\Lts_util.obj" \
	"$(INTDIR)\mmalloc.obj" \
	"$(INTDIR)\Pipe.obj"

".\us\Release\Lts.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "lts - Win32 Debug"

OUTDIR=.\us\Debug
INTDIR=.\us\Debug
# Begin Custom Macros
OutDir=.\us\Debug
# End Custom Macros

ALL : "$(OUTDIR)\Lts.exe" "$(OUTDIR)\Lts.bsc"


CLEAN :
	-@erase "$(INTDIR)\Dbgwins.obj"
	-@erase "$(INTDIR)\Dbgwins.sbr"
	-@erase "$(INTDIR)\Ls_chari.obj"
	-@erase "$(INTDIR)\Ls_chari.sbr"
	-@erase "$(INTDIR)\Ls_dict.obj"
	-@erase "$(INTDIR)\Ls_dict.sbr"
	-@erase "$(INTDIR)\Ls_homo.obj"
	-@erase "$(INTDIR)\Ls_homo.sbr"
	-@erase "$(INTDIR)\Ls_math.obj"
	-@erase "$(INTDIR)\Ls_math.sbr"
	-@erase "$(INTDIR)\Ls_proc.obj"
	-@erase "$(INTDIR)\Ls_proc.sbr"
	-@erase "$(INTDIR)\Ls_spel.obj"
	-@erase "$(INTDIR)\Ls_spel.sbr"
	-@erase "$(INTDIR)\Ls_speli.obj"
	-@erase "$(INTDIR)\Ls_speli.sbr"
	-@erase "$(INTDIR)\Ls_suff.obj"
	-@erase "$(INTDIR)\Ls_suff.sbr"
	-@erase "$(INTDIR)\Ls_suffi.obj"
	-@erase "$(INTDIR)\Ls_suffi.sbr"
	-@erase "$(INTDIR)\Lsa_adju.obj"
	-@erase "$(INTDIR)\Lsa_adju.sbr"
	-@erase "$(INTDIR)\lsa_coni.obj"
	-@erase "$(INTDIR)\lsa_coni.sbr"
	-@erase "$(INTDIR)\lsa_fr.obj"
	-@erase "$(INTDIR)\lsa_fr.sbr"
	-@erase "$(INTDIR)\lsa_gr.obj"
	-@erase "$(INTDIR)\lsa_gr.sbr"
	-@erase "$(INTDIR)\lsa_ir.obj"
	-@erase "$(INTDIR)\lsa_ir.sbr"
	-@erase "$(INTDIR)\lsa_it.obj"
	-@erase "$(INTDIR)\lsa_it.sbr"
	-@erase "$(INTDIR)\lsa_ja.obj"
	-@erase "$(INTDIR)\lsa_ja.sbr"
	-@erase "$(INTDIR)\lsa_rule.obj"
	-@erase "$(INTDIR)\lsa_rule.sbr"
	-@erase "$(INTDIR)\lsa_sl.obj"
	-@erase "$(INTDIR)\lsa_sl.sbr"
	-@erase "$(INTDIR)\lsa_sp.obj"
	-@erase "$(INTDIR)\lsa_sp.sbr"
	-@erase "$(INTDIR)\lsa_us.obj"
	-@erase "$(INTDIR)\lsa_us.sbr"
	-@erase "$(INTDIR)\lsa_util.obj"
	-@erase "$(INTDIR)\lsa_util.sbr"
	-@erase "$(INTDIR)\Lsread.obj"
	-@erase "$(INTDIR)\Lsread.sbr"
	-@erase "$(INTDIR)\Lts.obj"
	-@erase "$(INTDIR)\Lts.sbr"
	-@erase "$(INTDIR)\Lts_util.obj"
	-@erase "$(INTDIR)\Lts_util.sbr"
	-@erase "$(INTDIR)\mmalloc.obj"
	-@erase "$(INTDIR)\mmalloc.sbr"
	-@erase "$(INTDIR)\Pipe.obj"
	-@erase "$(INTDIR)\Pipe.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Lts.bsc"
	-@erase "$(OUTDIR)\Lts.exe"
	-@erase "$(OUTDIR)\Lts.ilk"
	-@erase "$(OUTDIR)\Lts.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /ZI /Od /I ".\apI" /I ".\lts" /I ".\nt" /I ".\include" /I "..\.." /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "ENGLISH_US" /D "LDS_BUILD" /D "ENGLISH" /D "ACNA" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Lts.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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

RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Lts.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\Dbgwins.sbr" \
	"$(INTDIR)\Ls_chari.sbr" \
	"$(INTDIR)\Ls_dict.sbr" \
	"$(INTDIR)\Ls_homo.sbr" \
	"$(INTDIR)\Ls_math.sbr" \
	"$(INTDIR)\Ls_proc.sbr" \
	"$(INTDIR)\Ls_spel.sbr" \
	"$(INTDIR)\Ls_speli.sbr" \
	"$(INTDIR)\Ls_suff.sbr" \
	"$(INTDIR)\Ls_suffi.sbr" \
	"$(INTDIR)\Lsa_adju.sbr" \
	"$(INTDIR)\lsa_coni.sbr" \
	"$(INTDIR)\lsa_fr.sbr" \
	"$(INTDIR)\lsa_gr.sbr" \
	"$(INTDIR)\lsa_ir.sbr" \
	"$(INTDIR)\lsa_it.sbr" \
	"$(INTDIR)\lsa_ja.sbr" \
	"$(INTDIR)\lsa_rule.sbr" \
	"$(INTDIR)\lsa_sl.sbr" \
	"$(INTDIR)\lsa_sp.sbr" \
	"$(INTDIR)\lsa_us.sbr" \
	"$(INTDIR)\lsa_util.sbr" \
	"$(INTDIR)\Lsread.sbr" \
	"$(INTDIR)\Lts.sbr" \
	"$(INTDIR)\Lts_util.sbr" \
	"$(INTDIR)\mmalloc.sbr" \
	"$(INTDIR)\Pipe.sbr"

"$(OUTDIR)\Lts.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\Lts.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Lts.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Dbgwins.obj" \
	"$(INTDIR)\Ls_chari.obj" \
	"$(INTDIR)\Ls_dict.obj" \
	"$(INTDIR)\Ls_homo.obj" \
	"$(INTDIR)\Ls_math.obj" \
	"$(INTDIR)\Ls_proc.obj" \
	"$(INTDIR)\Ls_spel.obj" \
	"$(INTDIR)\Ls_speli.obj" \
	"$(INTDIR)\Ls_suff.obj" \
	"$(INTDIR)\Ls_suffi.obj" \
	"$(INTDIR)\Lsa_adju.obj" \
	"$(INTDIR)\lsa_coni.obj" \
	"$(INTDIR)\lsa_fr.obj" \
	"$(INTDIR)\lsa_gr.obj" \
	"$(INTDIR)\lsa_ir.obj" \
	"$(INTDIR)\lsa_it.obj" \
	"$(INTDIR)\lsa_ja.obj" \
	"$(INTDIR)\lsa_rule.obj" \
	"$(INTDIR)\lsa_sl.obj" \
	"$(INTDIR)\lsa_sp.obj" \
	"$(INTDIR)\lsa_us.obj" \
	"$(INTDIR)\lsa_util.obj" \
	"$(INTDIR)\Lsread.obj" \
	"$(INTDIR)\Lts.obj" \
	"$(INTDIR)\Lts_util.obj" \
	"$(INTDIR)\mmalloc.obj" \
	"$(INTDIR)\Pipe.obj"

"$(OUTDIR)\Lts.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "lts - Win32 Debug German"

OUTDIR=.\gr\debug
INTDIR=.\gr\debug
# Begin Custom Macros
OutDir=.\gr\debug
# End Custom Macros

ALL : "$(OUTDIR)\Lts.exe" "$(OUTDIR)\Lts.bsc"


CLEAN :
	-@erase "$(INTDIR)\Dbgwins.obj"
	-@erase "$(INTDIR)\Dbgwins.sbr"
	-@erase "$(INTDIR)\Ls_chari.obj"
	-@erase "$(INTDIR)\Ls_chari.sbr"
	-@erase "$(INTDIR)\Ls_dict.obj"
	-@erase "$(INTDIR)\Ls_dict.sbr"
	-@erase "$(INTDIR)\Ls_homo.obj"
	-@erase "$(INTDIR)\Ls_homo.sbr"
	-@erase "$(INTDIR)\Ls_math.obj"
	-@erase "$(INTDIR)\Ls_math.sbr"
	-@erase "$(INTDIR)\Ls_proc.obj"
	-@erase "$(INTDIR)\Ls_proc.sbr"
	-@erase "$(INTDIR)\Ls_spel.obj"
	-@erase "$(INTDIR)\Ls_spel.sbr"
	-@erase "$(INTDIR)\Ls_speli.obj"
	-@erase "$(INTDIR)\Ls_speli.sbr"
	-@erase "$(INTDIR)\Ls_suff.obj"
	-@erase "$(INTDIR)\Ls_suff.sbr"
	-@erase "$(INTDIR)\Ls_suffi.obj"
	-@erase "$(INTDIR)\Ls_suffi.sbr"
	-@erase "$(INTDIR)\Lsa_adju.obj"
	-@erase "$(INTDIR)\Lsa_adju.sbr"
	-@erase "$(INTDIR)\lsa_coni.obj"
	-@erase "$(INTDIR)\lsa_coni.sbr"
	-@erase "$(INTDIR)\lsa_fr.obj"
	-@erase "$(INTDIR)\lsa_fr.sbr"
	-@erase "$(INTDIR)\lsa_gr.obj"
	-@erase "$(INTDIR)\lsa_gr.sbr"
	-@erase "$(INTDIR)\lsa_ir.obj"
	-@erase "$(INTDIR)\lsa_ir.sbr"
	-@erase "$(INTDIR)\lsa_it.obj"
	-@erase "$(INTDIR)\lsa_it.sbr"
	-@erase "$(INTDIR)\lsa_ja.obj"
	-@erase "$(INTDIR)\lsa_ja.sbr"
	-@erase "$(INTDIR)\lsa_rule.obj"
	-@erase "$(INTDIR)\lsa_rule.sbr"
	-@erase "$(INTDIR)\lsa_sl.obj"
	-@erase "$(INTDIR)\lsa_sl.sbr"
	-@erase "$(INTDIR)\lsa_sp.obj"
	-@erase "$(INTDIR)\lsa_sp.sbr"
	-@erase "$(INTDIR)\lsa_us.obj"
	-@erase "$(INTDIR)\lsa_us.sbr"
	-@erase "$(INTDIR)\lsa_util.obj"
	-@erase "$(INTDIR)\lsa_util.sbr"
	-@erase "$(INTDIR)\Lsread.obj"
	-@erase "$(INTDIR)\Lsread.sbr"
	-@erase "$(INTDIR)\Lts.obj"
	-@erase "$(INTDIR)\Lts.sbr"
	-@erase "$(INTDIR)\Lts_util.obj"
	-@erase "$(INTDIR)\Lts_util.sbr"
	-@erase "$(INTDIR)\mmalloc.obj"
	-@erase "$(INTDIR)\mmalloc.sbr"
	-@erase "$(INTDIR)\Pipe.obj"
	-@erase "$(INTDIR)\Pipe.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Lts.bsc"
	-@erase "$(OUTDIR)\Lts.exe"
	-@erase "$(OUTDIR)\Lts.ilk"
	-@erase "$(OUTDIR)\Lts.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /ZI /Od /I ".\apI" /I ".\lts" /I ".\nt" /I ".\include" /I "..\.." /I "d:\work\ad\dapi\src\ph" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "GERMAN" /D "LDS_BUILD" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Lts.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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

RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Lts.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\Dbgwins.sbr" \
	"$(INTDIR)\Ls_chari.sbr" \
	"$(INTDIR)\Ls_dict.sbr" \
	"$(INTDIR)\Ls_homo.sbr" \
	"$(INTDIR)\Ls_math.sbr" \
	"$(INTDIR)\Ls_proc.sbr" \
	"$(INTDIR)\Ls_spel.sbr" \
	"$(INTDIR)\Ls_speli.sbr" \
	"$(INTDIR)\Ls_suff.sbr" \
	"$(INTDIR)\Ls_suffi.sbr" \
	"$(INTDIR)\Lsa_adju.sbr" \
	"$(INTDIR)\lsa_coni.sbr" \
	"$(INTDIR)\lsa_fr.sbr" \
	"$(INTDIR)\lsa_gr.sbr" \
	"$(INTDIR)\lsa_ir.sbr" \
	"$(INTDIR)\lsa_it.sbr" \
	"$(INTDIR)\lsa_ja.sbr" \
	"$(INTDIR)\lsa_rule.sbr" \
	"$(INTDIR)\lsa_sl.sbr" \
	"$(INTDIR)\lsa_sp.sbr" \
	"$(INTDIR)\lsa_us.sbr" \
	"$(INTDIR)\lsa_util.sbr" \
	"$(INTDIR)\Lsread.sbr" \
	"$(INTDIR)\Lts.sbr" \
	"$(INTDIR)\Lts_util.sbr" \
	"$(INTDIR)\mmalloc.sbr" \
	"$(INTDIR)\Pipe.sbr"

"$(OUTDIR)\Lts.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\Lts.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Lts.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Dbgwins.obj" \
	"$(INTDIR)\Ls_chari.obj" \
	"$(INTDIR)\Ls_dict.obj" \
	"$(INTDIR)\Ls_homo.obj" \
	"$(INTDIR)\Ls_math.obj" \
	"$(INTDIR)\Ls_proc.obj" \
	"$(INTDIR)\Ls_spel.obj" \
	"$(INTDIR)\Ls_speli.obj" \
	"$(INTDIR)\Ls_suff.obj" \
	"$(INTDIR)\Ls_suffi.obj" \
	"$(INTDIR)\Lsa_adju.obj" \
	"$(INTDIR)\lsa_coni.obj" \
	"$(INTDIR)\lsa_fr.obj" \
	"$(INTDIR)\lsa_gr.obj" \
	"$(INTDIR)\lsa_ir.obj" \
	"$(INTDIR)\lsa_it.obj" \
	"$(INTDIR)\lsa_ja.obj" \
	"$(INTDIR)\lsa_rule.obj" \
	"$(INTDIR)\lsa_sl.obj" \
	"$(INTDIR)\lsa_sp.obj" \
	"$(INTDIR)\lsa_us.obj" \
	"$(INTDIR)\lsa_util.obj" \
	"$(INTDIR)\Lsread.obj" \
	"$(INTDIR)\Lts.obj" \
	"$(INTDIR)\Lts_util.obj" \
	"$(INTDIR)\mmalloc.obj" \
	"$(INTDIR)\Pipe.obj"

"$(OUTDIR)\Lts.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug US"

OUTDIR=.\us_noac\Debug
INTDIR=.\us_noac\Debug
# Begin Custom Macros
OutDir=.\us_noac\Debug
# End Custom Macros

ALL : "$(OUTDIR)\Lts.exe" "$(OUTDIR)\Lts.bsc"


CLEAN :
	-@erase "$(INTDIR)\Dbgwins.obj"
	-@erase "$(INTDIR)\Dbgwins.sbr"
	-@erase "$(INTDIR)\Ls_chari.obj"
	-@erase "$(INTDIR)\Ls_chari.sbr"
	-@erase "$(INTDIR)\Ls_dict.obj"
	-@erase "$(INTDIR)\Ls_dict.sbr"
	-@erase "$(INTDIR)\Ls_homo.obj"
	-@erase "$(INTDIR)\Ls_homo.sbr"
	-@erase "$(INTDIR)\Ls_math.obj"
	-@erase "$(INTDIR)\Ls_math.sbr"
	-@erase "$(INTDIR)\Ls_proc.obj"
	-@erase "$(INTDIR)\Ls_proc.sbr"
	-@erase "$(INTDIR)\Ls_spel.obj"
	-@erase "$(INTDIR)\Ls_spel.sbr"
	-@erase "$(INTDIR)\Ls_speli.obj"
	-@erase "$(INTDIR)\Ls_speli.sbr"
	-@erase "$(INTDIR)\Ls_suff.obj"
	-@erase "$(INTDIR)\Ls_suff.sbr"
	-@erase "$(INTDIR)\Ls_suffi.obj"
	-@erase "$(INTDIR)\Ls_suffi.sbr"
	-@erase "$(INTDIR)\Lsa_adju.obj"
	-@erase "$(INTDIR)\Lsa_adju.sbr"
	-@erase "$(INTDIR)\lsa_coni.obj"
	-@erase "$(INTDIR)\lsa_coni.sbr"
	-@erase "$(INTDIR)\lsa_fr.obj"
	-@erase "$(INTDIR)\lsa_fr.sbr"
	-@erase "$(INTDIR)\lsa_gr.obj"
	-@erase "$(INTDIR)\lsa_gr.sbr"
	-@erase "$(INTDIR)\lsa_ir.obj"
	-@erase "$(INTDIR)\lsa_ir.sbr"
	-@erase "$(INTDIR)\lsa_it.obj"
	-@erase "$(INTDIR)\lsa_it.sbr"
	-@erase "$(INTDIR)\lsa_ja.obj"
	-@erase "$(INTDIR)\lsa_ja.sbr"
	-@erase "$(INTDIR)\lsa_rule.obj"
	-@erase "$(INTDIR)\lsa_rule.sbr"
	-@erase "$(INTDIR)\lsa_sl.obj"
	-@erase "$(INTDIR)\lsa_sl.sbr"
	-@erase "$(INTDIR)\lsa_sp.obj"
	-@erase "$(INTDIR)\lsa_sp.sbr"
	-@erase "$(INTDIR)\lsa_us.obj"
	-@erase "$(INTDIR)\lsa_us.sbr"
	-@erase "$(INTDIR)\lsa_util.obj"
	-@erase "$(INTDIR)\lsa_util.sbr"
	-@erase "$(INTDIR)\Lsread.obj"
	-@erase "$(INTDIR)\Lsread.sbr"
	-@erase "$(INTDIR)\Lts.obj"
	-@erase "$(INTDIR)\Lts.sbr"
	-@erase "$(INTDIR)\Lts_util.obj"
	-@erase "$(INTDIR)\Lts_util.sbr"
	-@erase "$(INTDIR)\mmalloc.obj"
	-@erase "$(INTDIR)\mmalloc.sbr"
	-@erase "$(INTDIR)\Pipe.obj"
	-@erase "$(INTDIR)\Pipe.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Lts.bsc"
	-@erase "$(OUTDIR)\Lts.exe"
	-@erase "$(OUTDIR)\Lts.ilk"
	-@erase "$(OUTDIR)\Lts.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /ZI /Od /I ".\apI" /I ".\lts" /I ".\nt" /I ".\include" /I ".\kernel" /I ".\protos" /I "..\.." /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "i386" /D "ENGLISH_US" /D "ENGLISH" /D "LDS_BUILD" /D "NO_NOUN" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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

RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Lts.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\Dbgwins.sbr" \
	"$(INTDIR)\Ls_chari.sbr" \
	"$(INTDIR)\Ls_dict.sbr" \
	"$(INTDIR)\Ls_homo.sbr" \
	"$(INTDIR)\Ls_math.sbr" \
	"$(INTDIR)\Ls_proc.sbr" \
	"$(INTDIR)\Ls_spel.sbr" \
	"$(INTDIR)\Ls_speli.sbr" \
	"$(INTDIR)\Ls_suff.sbr" \
	"$(INTDIR)\Ls_suffi.sbr" \
	"$(INTDIR)\Lsa_adju.sbr" \
	"$(INTDIR)\lsa_coni.sbr" \
	"$(INTDIR)\lsa_fr.sbr" \
	"$(INTDIR)\lsa_gr.sbr" \
	"$(INTDIR)\lsa_ir.sbr" \
	"$(INTDIR)\lsa_it.sbr" \
	"$(INTDIR)\lsa_ja.sbr" \
	"$(INTDIR)\lsa_rule.sbr" \
	"$(INTDIR)\lsa_sl.sbr" \
	"$(INTDIR)\lsa_sp.sbr" \
	"$(INTDIR)\lsa_us.sbr" \
	"$(INTDIR)\lsa_util.sbr" \
	"$(INTDIR)\Lsread.sbr" \
	"$(INTDIR)\Lts.sbr" \
	"$(INTDIR)\Lts_util.sbr" \
	"$(INTDIR)\mmalloc.sbr" \
	"$(INTDIR)\Pipe.sbr"

"$(OUTDIR)\Lts.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\Lts.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Lts.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Dbgwins.obj" \
	"$(INTDIR)\Ls_chari.obj" \
	"$(INTDIR)\Ls_dict.obj" \
	"$(INTDIR)\Ls_homo.obj" \
	"$(INTDIR)\Ls_math.obj" \
	"$(INTDIR)\Ls_proc.obj" \
	"$(INTDIR)\Ls_spel.obj" \
	"$(INTDIR)\Ls_speli.obj" \
	"$(INTDIR)\Ls_suff.obj" \
	"$(INTDIR)\Ls_suffi.obj" \
	"$(INTDIR)\Lsa_adju.obj" \
	"$(INTDIR)\lsa_coni.obj" \
	"$(INTDIR)\lsa_fr.obj" \
	"$(INTDIR)\lsa_gr.obj" \
	"$(INTDIR)\lsa_ir.obj" \
	"$(INTDIR)\lsa_it.obj" \
	"$(INTDIR)\lsa_ja.obj" \
	"$(INTDIR)\lsa_rule.obj" \
	"$(INTDIR)\lsa_sl.obj" \
	"$(INTDIR)\lsa_sp.obj" \
	"$(INTDIR)\lsa_us.obj" \
	"$(INTDIR)\lsa_util.obj" \
	"$(INTDIR)\Lsread.obj" \
	"$(INTDIR)\Lts.obj" \
	"$(INTDIR)\Lts_util.obj" \
	"$(INTDIR)\mmalloc.obj" \
	"$(INTDIR)\Pipe.obj"

"$(OUTDIR)\Lts.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug UK"

OUTDIR=.\uk_noac\Debug
INTDIR=.\uk_noac\Debug
# Begin Custom Macros
OutDir=.\uk_noac\Debug
# End Custom Macros

ALL : "$(OUTDIR)\Lts.exe" "$(OUTDIR)\Lts.bsc"


CLEAN :
	-@erase "$(INTDIR)\Dbgwins.obj"
	-@erase "$(INTDIR)\Dbgwins.sbr"
	-@erase "$(INTDIR)\Ls_chari.obj"
	-@erase "$(INTDIR)\Ls_chari.sbr"
	-@erase "$(INTDIR)\Ls_dict.obj"
	-@erase "$(INTDIR)\Ls_dict.sbr"
	-@erase "$(INTDIR)\Ls_homo.obj"
	-@erase "$(INTDIR)\Ls_homo.sbr"
	-@erase "$(INTDIR)\Ls_math.obj"
	-@erase "$(INTDIR)\Ls_math.sbr"
	-@erase "$(INTDIR)\Ls_proc.obj"
	-@erase "$(INTDIR)\Ls_proc.sbr"
	-@erase "$(INTDIR)\Ls_spel.obj"
	-@erase "$(INTDIR)\Ls_spel.sbr"
	-@erase "$(INTDIR)\Ls_speli.obj"
	-@erase "$(INTDIR)\Ls_speli.sbr"
	-@erase "$(INTDIR)\Ls_suff.obj"
	-@erase "$(INTDIR)\Ls_suff.sbr"
	-@erase "$(INTDIR)\Ls_suffi.obj"
	-@erase "$(INTDIR)\Ls_suffi.sbr"
	-@erase "$(INTDIR)\Lsa_adju.obj"
	-@erase "$(INTDIR)\Lsa_adju.sbr"
	-@erase "$(INTDIR)\lsa_coni.obj"
	-@erase "$(INTDIR)\lsa_coni.sbr"
	-@erase "$(INTDIR)\lsa_fr.obj"
	-@erase "$(INTDIR)\lsa_fr.sbr"
	-@erase "$(INTDIR)\lsa_gr.obj"
	-@erase "$(INTDIR)\lsa_gr.sbr"
	-@erase "$(INTDIR)\lsa_ir.obj"
	-@erase "$(INTDIR)\lsa_ir.sbr"
	-@erase "$(INTDIR)\lsa_it.obj"
	-@erase "$(INTDIR)\lsa_it.sbr"
	-@erase "$(INTDIR)\lsa_ja.obj"
	-@erase "$(INTDIR)\lsa_ja.sbr"
	-@erase "$(INTDIR)\lsa_rule.obj"
	-@erase "$(INTDIR)\lsa_rule.sbr"
	-@erase "$(INTDIR)\lsa_sl.obj"
	-@erase "$(INTDIR)\lsa_sl.sbr"
	-@erase "$(INTDIR)\lsa_sp.obj"
	-@erase "$(INTDIR)\lsa_sp.sbr"
	-@erase "$(INTDIR)\lsa_us.obj"
	-@erase "$(INTDIR)\lsa_us.sbr"
	-@erase "$(INTDIR)\lsa_util.obj"
	-@erase "$(INTDIR)\lsa_util.sbr"
	-@erase "$(INTDIR)\Lsread.obj"
	-@erase "$(INTDIR)\Lsread.sbr"
	-@erase "$(INTDIR)\Lts.obj"
	-@erase "$(INTDIR)\Lts.sbr"
	-@erase "$(INTDIR)\Lts_util.obj"
	-@erase "$(INTDIR)\Lts_util.sbr"
	-@erase "$(INTDIR)\mmalloc.obj"
	-@erase "$(INTDIR)\mmalloc.sbr"
	-@erase "$(INTDIR)\Pipe.obj"
	-@erase "$(INTDIR)\Pipe.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Lts.bsc"
	-@erase "$(OUTDIR)\Lts.exe"
	-@erase "$(OUTDIR)\Lts.ilk"
	-@erase "$(OUTDIR)\Lts.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /ZI /Od /I ".\apI" /I ".\lts" /I ".\nt" /I ".\include" /I ".\kernel" /I ".\protos" /I "..\.." /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "i386" /D "ENGLISH_UK" /D "ENGLISH" /D "LDS_BUILD" /D "NO_NOUN" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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

RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Lts.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\Dbgwins.sbr" \
	"$(INTDIR)\Ls_chari.sbr" \
	"$(INTDIR)\Ls_dict.sbr" \
	"$(INTDIR)\Ls_homo.sbr" \
	"$(INTDIR)\Ls_math.sbr" \
	"$(INTDIR)\Ls_proc.sbr" \
	"$(INTDIR)\Ls_spel.sbr" \
	"$(INTDIR)\Ls_speli.sbr" \
	"$(INTDIR)\Ls_suff.sbr" \
	"$(INTDIR)\Ls_suffi.sbr" \
	"$(INTDIR)\Lsa_adju.sbr" \
	"$(INTDIR)\lsa_coni.sbr" \
	"$(INTDIR)\lsa_fr.sbr" \
	"$(INTDIR)\lsa_gr.sbr" \
	"$(INTDIR)\lsa_ir.sbr" \
	"$(INTDIR)\lsa_it.sbr" \
	"$(INTDIR)\lsa_ja.sbr" \
	"$(INTDIR)\lsa_rule.sbr" \
	"$(INTDIR)\lsa_sl.sbr" \
	"$(INTDIR)\lsa_sp.sbr" \
	"$(INTDIR)\lsa_us.sbr" \
	"$(INTDIR)\lsa_util.sbr" \
	"$(INTDIR)\Lsread.sbr" \
	"$(INTDIR)\Lts.sbr" \
	"$(INTDIR)\Lts_util.sbr" \
	"$(INTDIR)\mmalloc.sbr" \
	"$(INTDIR)\Pipe.sbr"

"$(OUTDIR)\Lts.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\Lts.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Lts.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Dbgwins.obj" \
	"$(INTDIR)\Ls_chari.obj" \
	"$(INTDIR)\Ls_dict.obj" \
	"$(INTDIR)\Ls_homo.obj" \
	"$(INTDIR)\Ls_math.obj" \
	"$(INTDIR)\Ls_proc.obj" \
	"$(INTDIR)\Ls_spel.obj" \
	"$(INTDIR)\Ls_speli.obj" \
	"$(INTDIR)\Ls_suff.obj" \
	"$(INTDIR)\Ls_suffi.obj" \
	"$(INTDIR)\Lsa_adju.obj" \
	"$(INTDIR)\lsa_coni.obj" \
	"$(INTDIR)\lsa_fr.obj" \
	"$(INTDIR)\lsa_gr.obj" \
	"$(INTDIR)\lsa_ir.obj" \
	"$(INTDIR)\lsa_it.obj" \
	"$(INTDIR)\lsa_ja.obj" \
	"$(INTDIR)\lsa_rule.obj" \
	"$(INTDIR)\lsa_sl.obj" \
	"$(INTDIR)\lsa_sp.obj" \
	"$(INTDIR)\lsa_us.obj" \
	"$(INTDIR)\lsa_util.obj" \
	"$(INTDIR)\Lsread.obj" \
	"$(INTDIR)\Lts.obj" \
	"$(INTDIR)\Lts_util.obj" \
	"$(INTDIR)\mmalloc.obj" \
	"$(INTDIR)\Pipe.obj"

"$(OUTDIR)\Lts.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Lts.dep")
!INCLUDE "Lts.dep"
!ELSE 
!MESSAGE Warning: cannot find "Lts.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "lts - Win32 Release" || "$(CFG)" == "lts - Win32 Debug" || "$(CFG)" == "lts - Win32 Debug German" || "$(CFG)" == "lts - Win32 Win32 nonACNA Debug US" || "$(CFG)" == "lts - Win32 Win32 nonACNA Debug UK"
SOURCE=.\Nt\Dbgwins.c

!IF  "$(CFG)" == "lts - Win32 Release"


"$(INTDIR)\Dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug"


"$(INTDIR)\Dbgwins.obj"	"$(INTDIR)\Dbgwins.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug German"


"$(INTDIR)\Dbgwins.obj"	"$(INTDIR)\Dbgwins.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug US"


"$(INTDIR)\Dbgwins.obj"	"$(INTDIR)\Dbgwins.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug UK"


"$(INTDIR)\Dbgwins.obj"	"$(INTDIR)\Dbgwins.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\Ls_chari.c

!IF  "$(CFG)" == "lts - Win32 Release"


"$(INTDIR)\Ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug"


"$(INTDIR)\Ls_chari.obj"	"$(INTDIR)\Ls_chari.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug German"


"$(INTDIR)\Ls_chari.obj"	"$(INTDIR)\Ls_chari.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug US"


"$(INTDIR)\Ls_chari.obj"	"$(INTDIR)\Ls_chari.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug UK"


"$(INTDIR)\Ls_chari.obj"	"$(INTDIR)\Ls_chari.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\Ls_dict.c

!IF  "$(CFG)" == "lts - Win32 Release"


"$(INTDIR)\Ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug"


"$(INTDIR)\Ls_dict.obj"	"$(INTDIR)\Ls_dict.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug German"


"$(INTDIR)\Ls_dict.obj"	"$(INTDIR)\Ls_dict.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug US"


"$(INTDIR)\Ls_dict.obj"	"$(INTDIR)\Ls_dict.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug UK"


"$(INTDIR)\Ls_dict.obj"	"$(INTDIR)\Ls_dict.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\Ls_homo.c

!IF  "$(CFG)" == "lts - Win32 Release"


"$(INTDIR)\Ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug"


"$(INTDIR)\Ls_homo.obj"	"$(INTDIR)\Ls_homo.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug German"


"$(INTDIR)\Ls_homo.obj"	"$(INTDIR)\Ls_homo.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug US"


"$(INTDIR)\Ls_homo.obj"	"$(INTDIR)\Ls_homo.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug UK"


"$(INTDIR)\Ls_homo.obj"	"$(INTDIR)\Ls_homo.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\Ls_math.c

!IF  "$(CFG)" == "lts - Win32 Release"


"$(INTDIR)\Ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug"


"$(INTDIR)\Ls_math.obj"	"$(INTDIR)\Ls_math.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug German"


"$(INTDIR)\Ls_math.obj"	"$(INTDIR)\Ls_math.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug US"


"$(INTDIR)\Ls_math.obj"	"$(INTDIR)\Ls_math.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug UK"


"$(INTDIR)\Ls_math.obj"	"$(INTDIR)\Ls_math.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\Ls_proc.c

!IF  "$(CFG)" == "lts - Win32 Release"


"$(INTDIR)\Ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug"


"$(INTDIR)\Ls_proc.obj"	"$(INTDIR)\Ls_proc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug German"


"$(INTDIR)\Ls_proc.obj"	"$(INTDIR)\Ls_proc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug US"


"$(INTDIR)\Ls_proc.obj"	"$(INTDIR)\Ls_proc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug UK"


"$(INTDIR)\Ls_proc.obj"	"$(INTDIR)\Ls_proc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\Ls_spel.c

!IF  "$(CFG)" == "lts - Win32 Release"


"$(INTDIR)\Ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug"


"$(INTDIR)\Ls_spel.obj"	"$(INTDIR)\Ls_spel.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug German"


"$(INTDIR)\Ls_spel.obj"	"$(INTDIR)\Ls_spel.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug US"


"$(INTDIR)\Ls_spel.obj"	"$(INTDIR)\Ls_spel.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug UK"


"$(INTDIR)\Ls_spel.obj"	"$(INTDIR)\Ls_spel.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\Ls_speli.c

!IF  "$(CFG)" == "lts - Win32 Release"


"$(INTDIR)\Ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug"


"$(INTDIR)\Ls_speli.obj"	"$(INTDIR)\Ls_speli.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug German"


"$(INTDIR)\Ls_speli.obj"	"$(INTDIR)\Ls_speli.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug US"


"$(INTDIR)\Ls_speli.obj"	"$(INTDIR)\Ls_speli.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug UK"


"$(INTDIR)\Ls_speli.obj"	"$(INTDIR)\Ls_speli.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\Ls_suff.c

!IF  "$(CFG)" == "lts - Win32 Release"


"$(INTDIR)\Ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug"


"$(INTDIR)\Ls_suff.obj"	"$(INTDIR)\Ls_suff.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug German"


"$(INTDIR)\Ls_suff.obj"	"$(INTDIR)\Ls_suff.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug US"


"$(INTDIR)\Ls_suff.obj"	"$(INTDIR)\Ls_suff.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug UK"


"$(INTDIR)\Ls_suff.obj"	"$(INTDIR)\Ls_suff.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\Ls_suffi.c

!IF  "$(CFG)" == "lts - Win32 Release"


"$(INTDIR)\Ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug"


"$(INTDIR)\Ls_suffi.obj"	"$(INTDIR)\Ls_suffi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug German"


"$(INTDIR)\Ls_suffi.obj"	"$(INTDIR)\Ls_suffi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug US"


"$(INTDIR)\Ls_suffi.obj"	"$(INTDIR)\Ls_suffi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug UK"


"$(INTDIR)\Ls_suffi.obj"	"$(INTDIR)\Ls_suffi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\Lsa_adju.c

!IF  "$(CFG)" == "lts - Win32 Release"


"$(INTDIR)\Lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug"


"$(INTDIR)\Lsa_adju.obj"	"$(INTDIR)\Lsa_adju.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug German"


"$(INTDIR)\Lsa_adju.obj"	"$(INTDIR)\Lsa_adju.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug US"


"$(INTDIR)\Lsa_adju.obj"	"$(INTDIR)\Lsa_adju.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug UK"


"$(INTDIR)\Lsa_adju.obj"	"$(INTDIR)\Lsa_adju.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_coni.c

!IF  "$(CFG)" == "lts - Win32 Release"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug"


"$(INTDIR)\lsa_coni.obj"	"$(INTDIR)\lsa_coni.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug German"


"$(INTDIR)\lsa_coni.obj"	"$(INTDIR)\lsa_coni.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug US"


"$(INTDIR)\lsa_coni.obj"	"$(INTDIR)\lsa_coni.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug UK"


"$(INTDIR)\lsa_coni.obj"	"$(INTDIR)\lsa_coni.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_fr.c

!IF  "$(CFG)" == "lts - Win32 Release"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug"


"$(INTDIR)\lsa_fr.obj"	"$(INTDIR)\lsa_fr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug German"


"$(INTDIR)\lsa_fr.obj"	"$(INTDIR)\lsa_fr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug US"


"$(INTDIR)\lsa_fr.obj"	"$(INTDIR)\lsa_fr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug UK"


"$(INTDIR)\lsa_fr.obj"	"$(INTDIR)\lsa_fr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_gr.c

!IF  "$(CFG)" == "lts - Win32 Release"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug"


"$(INTDIR)\lsa_gr.obj"	"$(INTDIR)\lsa_gr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug German"


"$(INTDIR)\lsa_gr.obj"	"$(INTDIR)\lsa_gr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug US"


"$(INTDIR)\lsa_gr.obj"	"$(INTDIR)\lsa_gr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug UK"


"$(INTDIR)\lsa_gr.obj"	"$(INTDIR)\lsa_gr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_ir.c

!IF  "$(CFG)" == "lts - Win32 Release"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug"


"$(INTDIR)\lsa_ir.obj"	"$(INTDIR)\lsa_ir.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug German"


"$(INTDIR)\lsa_ir.obj"	"$(INTDIR)\lsa_ir.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug US"


"$(INTDIR)\lsa_ir.obj"	"$(INTDIR)\lsa_ir.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug UK"


"$(INTDIR)\lsa_ir.obj"	"$(INTDIR)\lsa_ir.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_it.c

!IF  "$(CFG)" == "lts - Win32 Release"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug"


"$(INTDIR)\lsa_it.obj"	"$(INTDIR)\lsa_it.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug German"


"$(INTDIR)\lsa_it.obj"	"$(INTDIR)\lsa_it.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug US"


"$(INTDIR)\lsa_it.obj"	"$(INTDIR)\lsa_it.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug UK"


"$(INTDIR)\lsa_it.obj"	"$(INTDIR)\lsa_it.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_ja.c

!IF  "$(CFG)" == "lts - Win32 Release"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug"


"$(INTDIR)\lsa_ja.obj"	"$(INTDIR)\lsa_ja.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug German"


"$(INTDIR)\lsa_ja.obj"	"$(INTDIR)\lsa_ja.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug US"


"$(INTDIR)\lsa_ja.obj"	"$(INTDIR)\lsa_ja.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug UK"


"$(INTDIR)\lsa_ja.obj"	"$(INTDIR)\lsa_ja.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_rule.c

!IF  "$(CFG)" == "lts - Win32 Release"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug"


"$(INTDIR)\lsa_rule.obj"	"$(INTDIR)\lsa_rule.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug German"


"$(INTDIR)\lsa_rule.obj"	"$(INTDIR)\lsa_rule.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug US"


"$(INTDIR)\lsa_rule.obj"	"$(INTDIR)\lsa_rule.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug UK"


"$(INTDIR)\lsa_rule.obj"	"$(INTDIR)\lsa_rule.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_sl.c

!IF  "$(CFG)" == "lts - Win32 Release"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug"


"$(INTDIR)\lsa_sl.obj"	"$(INTDIR)\lsa_sl.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug German"


"$(INTDIR)\lsa_sl.obj"	"$(INTDIR)\lsa_sl.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug US"


"$(INTDIR)\lsa_sl.obj"	"$(INTDIR)\lsa_sl.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug UK"


"$(INTDIR)\lsa_sl.obj"	"$(INTDIR)\lsa_sl.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_sp.c

!IF  "$(CFG)" == "lts - Win32 Release"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug"


"$(INTDIR)\lsa_sp.obj"	"$(INTDIR)\lsa_sp.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug German"


"$(INTDIR)\lsa_sp.obj"	"$(INTDIR)\lsa_sp.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug US"


"$(INTDIR)\lsa_sp.obj"	"$(INTDIR)\lsa_sp.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug UK"


"$(INTDIR)\lsa_sp.obj"	"$(INTDIR)\lsa_sp.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_us.c

!IF  "$(CFG)" == "lts - Win32 Release"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug"


"$(INTDIR)\lsa_us.obj"	"$(INTDIR)\lsa_us.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug German"


"$(INTDIR)\lsa_us.obj"	"$(INTDIR)\lsa_us.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug US"


"$(INTDIR)\lsa_us.obj"	"$(INTDIR)\lsa_us.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug UK"


"$(INTDIR)\lsa_us.obj"	"$(INTDIR)\lsa_us.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_util.c

!IF  "$(CFG)" == "lts - Win32 Release"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug"


"$(INTDIR)\lsa_util.obj"	"$(INTDIR)\lsa_util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug German"


"$(INTDIR)\lsa_util.obj"	"$(INTDIR)\lsa_util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug US"


"$(INTDIR)\lsa_util.obj"	"$(INTDIR)\lsa_util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug UK"


"$(INTDIR)\lsa_util.obj"	"$(INTDIR)\lsa_util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\Lsread.c

!IF  "$(CFG)" == "lts - Win32 Release"


"$(INTDIR)\Lsread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug"


"$(INTDIR)\Lsread.obj"	"$(INTDIR)\Lsread.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug German"


"$(INTDIR)\Lsread.obj"	"$(INTDIR)\Lsread.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug US"


"$(INTDIR)\Lsread.obj"	"$(INTDIR)\Lsread.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug UK"


"$(INTDIR)\Lsread.obj"	"$(INTDIR)\Lsread.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\Lts.c

!IF  "$(CFG)" == "lts - Win32 Release"


"$(INTDIR)\Lts.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug"


"$(INTDIR)\Lts.obj"	"$(INTDIR)\Lts.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug German"


"$(INTDIR)\Lts.obj"	"$(INTDIR)\Lts.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug US"


"$(INTDIR)\Lts.obj"	"$(INTDIR)\Lts.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug UK"


"$(INTDIR)\Lts.obj"	"$(INTDIR)\Lts.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\Lts_util.c

!IF  "$(CFG)" == "lts - Win32 Release"


"$(INTDIR)\Lts_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug"


"$(INTDIR)\Lts_util.obj"	"$(INTDIR)\Lts_util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug German"


"$(INTDIR)\Lts_util.obj"	"$(INTDIR)\Lts_util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug US"


"$(INTDIR)\Lts_util.obj"	"$(INTDIR)\Lts_util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug UK"


"$(INTDIR)\Lts_util.obj"	"$(INTDIR)\Lts_util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\nt\mmalloc.c

!IF  "$(CFG)" == "lts - Win32 Release"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug"


"$(INTDIR)\mmalloc.obj"	"$(INTDIR)\mmalloc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug German"


"$(INTDIR)\mmalloc.obj"	"$(INTDIR)\mmalloc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug US"


"$(INTDIR)\mmalloc.obj"	"$(INTDIR)\mmalloc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug UK"


"$(INTDIR)\mmalloc.obj"	"$(INTDIR)\mmalloc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Nt\Pipe.c

!IF  "$(CFG)" == "lts - Win32 Release"


"$(INTDIR)\Pipe.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug"


"$(INTDIR)\Pipe.obj"	"$(INTDIR)\Pipe.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Debug German"


"$(INTDIR)\Pipe.obj"	"$(INTDIR)\Pipe.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug US"


"$(INTDIR)\Pipe.obj"	"$(INTDIR)\Pipe.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug UK"


"$(INTDIR)\Pipe.obj"	"$(INTDIR)\Pipe.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 


!ENDIF 

