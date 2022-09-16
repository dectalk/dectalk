# Microsoft Developer Studio Generated NMAKE File, Based on demostat.dsp
!IF "$(CFG)" == ""
CFG=demostat - Win32 Debug
!MESSAGE No configuration specified. Defaulting to demostat - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "demostat - Win32 Release" && "$(CFG)" != "demostat - Win32 Debug" && "$(CFG)" != "demostat - Win32 Release Spanish" && "$(CFG)" != "demostat - Win32 Release German" && "$(CFG)" != "demostat - Win32 Release Latin American" && "$(CFG)" != "demostat - Win32 Debug Spanish" && "$(CFG)" != "demostat - Win32 Debug German" && "$(CFG)" != "demostat - Win32 Debug Latin American" && "$(CFG)" != "demostat - Win32 ALPHA Release" && "$(CFG)" != "demostat - Win32 ALPHA Debug" && "$(CFG)" != "demostat - Win32 ALPHA Release Spanish" && "$(CFG)" != "demostat - Win32 ALPHA Release German" && "$(CFG)" != "demostat - Win32 ALPHA Release Latin American" && "$(CFG)" != "demostat - Win32 ALPHA Debug Spanish" && "$(CFG)" != "demostat - Win32 ALPHA Debug German" && "$(CFG)" != "demostat - Win32 ALPHA Debug Latin American"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "demostat.mak" CFG="demostat - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "demostat - Win32 Release" (based on "Win32 (x86) Static Library")
!MESSAGE "demostat - Win32 Debug" (based on "Win32 (x86) Static Library")
!MESSAGE "demostat - Win32 Release Spanish" (based on "Win32 (x86) Static Library")
!MESSAGE "demostat - Win32 Release German" (based on "Win32 (x86) Static Library")
!MESSAGE "demostat - Win32 Release Latin American" (based on "Win32 (x86) Static Library")
!MESSAGE "demostat - Win32 Debug Spanish" (based on "Win32 (x86) Static Library")
!MESSAGE "demostat - Win32 Debug German" (based on "Win32 (x86) Static Library")
!MESSAGE "demostat - Win32 Debug Latin American" (based on "Win32 (x86) Static Library")
!MESSAGE "demostat - Win32 ALPHA Release" (based on "Win32 (ALPHA) Static Library")
!MESSAGE "demostat - Win32 ALPHA Debug" (based on "Win32 (ALPHA) Static Library")
!MESSAGE "demostat - Win32 ALPHA Release Spanish" (based on "Win32 (ALPHA) Static Library")
!MESSAGE "demostat - Win32 ALPHA Release German" (based on "Win32 (ALPHA) Static Library")
!MESSAGE "demostat - Win32 ALPHA Release Latin American" (based on "Win32 (ALPHA) Static Library")
!MESSAGE "demostat - Win32 ALPHA Debug Spanish" (based on "Win32 (ALPHA) Static Library")
!MESSAGE "demostat - Win32 ALPHA Debug German" (based on "Win32 (ALPHA) Static Library")
!MESSAGE "demostat - Win32 ALPHA Debug Latin American" (based on "Win32 (ALPHA) Static Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "demostat - Win32 Release"

OUTDIR=.\..\build\demostat\us\release
INTDIR=.\..\build\demostat\us\release\link
# Begin Custom Macros
OutDir=.\..\build\demostat\us\release
# End Custom Macros

ALL : "$(OUTDIR)\demostat.lib"


CLEAN :
	-@erase "$(INTDIR)\cm_char.obj"
	-@erase "$(INTDIR)\cm_cmd.obj"
	-@erase "$(INTDIR)\cm_copt.obj"
	-@erase "$(INTDIR)\cm_main.obj"
	-@erase "$(INTDIR)\cm_pars.obj"
	-@erase "$(INTDIR)\cm_phon.obj"
	-@erase "$(INTDIR)\cm_text.obj"
	-@erase "$(INTDIR)\cm_util.obj"
	-@erase "$(INTDIR)\Cmd_init.obj"
	-@erase "$(INTDIR)\cmd_wav.obj"
	-@erase "$(INTDIR)\Decstd97.obj"
	-@erase "$(INTDIR)\loaddict.obj"
	-@erase "$(INTDIR)\ls_chari.obj"
	-@erase "$(INTDIR)\ls_dict.obj"
	-@erase "$(INTDIR)\ls_homo.obj"
	-@erase "$(INTDIR)\ls_math.obj"
	-@erase "$(INTDIR)\ls_proc.obj"
	-@erase "$(INTDIR)\ls_spel.obj"
	-@erase "$(INTDIR)\ls_speli.obj"
	-@erase "$(INTDIR)\ls_suff.obj"
	-@erase "$(INTDIR)\ls_suffi.obj"
	-@erase "$(INTDIR)\Lsa_adju.obj"
	-@erase "$(INTDIR)\lsa_coni.obj"
	-@erase "$(INTDIR)\lsa_fr.obj"
	-@erase "$(INTDIR)\lsa_gr.obj"
	-@erase "$(INTDIR)\lsa_ir.obj"
	-@erase "$(INTDIR)\lsa_it.obj"
	-@erase "$(INTDIR)\lsa_ja.obj"
	-@erase "$(INTDIR)\lsa_main.obj"
	-@erase "$(INTDIR)\lsa_rtbi.obj"
	-@erase "$(INTDIR)\lsa_rule.obj"
	-@erase "$(INTDIR)\lsa_sl.obj"
	-@erase "$(INTDIR)\lsa_sp.obj"
	-@erase "$(INTDIR)\lsa_task.obj"
	-@erase "$(INTDIR)\lsa_us.obj"
	-@erase "$(INTDIR)\lsa_util.obj"
	-@erase "$(INTDIR)\lsw_main.obj"
	-@erase "$(INTDIR)\par_ambi.obj"
	-@erase "$(INTDIR)\par_char.obj"
	-@erase "$(INTDIR)\par_dict.obj"
	-@erase "$(INTDIR)\par_pars.obj"
	-@erase "$(INTDIR)\par_rule.obj"
	-@erase "$(INTDIR)\ph_aloph.obj"
	-@erase "$(INTDIR)\ph_claus.obj"
	-@erase "$(INTDIR)\ph_draw.obj"
	-@erase "$(INTDIR)\ph_drwt0.obj"
	-@erase "$(INTDIR)\ph_inton.obj"
	-@erase "$(INTDIR)\ph_main.obj"
	-@erase "$(INTDIR)\ph_romi.obj"
	-@erase "$(INTDIR)\ph_setar.obj"
	-@erase "$(INTDIR)\ph_sort.obj"
	-@erase "$(INTDIR)\ph_syl.obj"
	-@erase "$(INTDIR)\ph_syntx.obj"
	-@erase "$(INTDIR)\ph_task.obj"
	-@erase "$(INTDIR)\ph_timng.obj"
	-@erase "$(INTDIR)\ph_vdefi.obj"
	-@erase "$(INTDIR)\ph_vset.obj"
	-@erase "$(INTDIR)\phinit.obj"
	-@erase "$(INTDIR)\phlog.obj"
	-@erase "$(INTDIR)\services.obj"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\Usa_init.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\vtmiont.obj"
	-@erase "$(OUTDIR)\demostat.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /Fp"$(INTDIR)\demostat.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\demostat.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\demostat.lib" 
LIB32_OBJS= \
	"$(INTDIR)\cm_char.obj" \
	"$(INTDIR)\cm_cmd.obj" \
	"$(INTDIR)\cm_copt.obj" \
	"$(INTDIR)\cm_main.obj" \
	"$(INTDIR)\cm_pars.obj" \
	"$(INTDIR)\cm_phon.obj" \
	"$(INTDIR)\cm_text.obj" \
	"$(INTDIR)\cm_util.obj" \
	"$(INTDIR)\Cmd_init.obj" \
	"$(INTDIR)\cmd_wav.obj" \
	"$(INTDIR)\Decstd97.obj" \
	"$(INTDIR)\loaddict.obj" \
	"$(INTDIR)\ls_chari.obj" \
	"$(INTDIR)\ls_dict.obj" \
	"$(INTDIR)\ls_homo.obj" \
	"$(INTDIR)\ls_math.obj" \
	"$(INTDIR)\ls_proc.obj" \
	"$(INTDIR)\ls_spel.obj" \
	"$(INTDIR)\ls_speli.obj" \
	"$(INTDIR)\ls_suff.obj" \
	"$(INTDIR)\ls_suffi.obj" \
	"$(INTDIR)\Lsa_adju.obj" \
	"$(INTDIR)\lsa_coni.obj" \
	"$(INTDIR)\lsa_fr.obj" \
	"$(INTDIR)\lsa_gr.obj" \
	"$(INTDIR)\lsa_ir.obj" \
	"$(INTDIR)\lsa_it.obj" \
	"$(INTDIR)\lsa_ja.obj" \
	"$(INTDIR)\lsa_main.obj" \
	"$(INTDIR)\lsa_rtbi.obj" \
	"$(INTDIR)\lsa_rule.obj" \
	"$(INTDIR)\lsa_sl.obj" \
	"$(INTDIR)\lsa_sp.obj" \
	"$(INTDIR)\lsa_task.obj" \
	"$(INTDIR)\lsa_us.obj" \
	"$(INTDIR)\lsa_util.obj" \
	"$(INTDIR)\lsw_main.obj" \
	"$(INTDIR)\par_ambi.obj" \
	"$(INTDIR)\par_char.obj" \
	"$(INTDIR)\par_dict.obj" \
	"$(INTDIR)\par_pars.obj" \
	"$(INTDIR)\par_rule.obj" \
	"$(INTDIR)\ph_aloph.obj" \
	"$(INTDIR)\ph_claus.obj" \
	"$(INTDIR)\ph_draw.obj" \
	"$(INTDIR)\ph_drwt0.obj" \
	"$(INTDIR)\ph_inton.obj" \
	"$(INTDIR)\ph_main.obj" \
	"$(INTDIR)\ph_romi.obj" \
	"$(INTDIR)\ph_setar.obj" \
	"$(INTDIR)\ph_sort.obj" \
	"$(INTDIR)\ph_syl.obj" \
	"$(INTDIR)\ph_syntx.obj" \
	"$(INTDIR)\ph_task.obj" \
	"$(INTDIR)\ph_timng.obj" \
	"$(INTDIR)\ph_vdefi.obj" \
	"$(INTDIR)\ph_vset.obj" \
	"$(INTDIR)\phinit.obj" \
	"$(INTDIR)\phlog.obj" \
	"$(INTDIR)\services.obj" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\Usa_init.obj" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\vtmiont.obj"

"$(OUTDIR)\demostat.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

OUTDIR=.\..\build\demostat\us\debug
INTDIR=.\..\build\demostat\us\debug\link
# Begin Custom Macros
OutDir=.\..\build\demostat\us\debug
# End Custom Macros

ALL : "$(OUTDIR)\demostat.lib"


CLEAN :
	-@erase "$(INTDIR)\cm_char.obj"
	-@erase "$(INTDIR)\cm_cmd.obj"
	-@erase "$(INTDIR)\cm_copt.obj"
	-@erase "$(INTDIR)\cm_main.obj"
	-@erase "$(INTDIR)\cm_pars.obj"
	-@erase "$(INTDIR)\cm_phon.obj"
	-@erase "$(INTDIR)\cm_text.obj"
	-@erase "$(INTDIR)\cm_util.obj"
	-@erase "$(INTDIR)\Cmd_init.obj"
	-@erase "$(INTDIR)\cmd_wav.obj"
	-@erase "$(INTDIR)\Decstd97.obj"
	-@erase "$(INTDIR)\loaddict.obj"
	-@erase "$(INTDIR)\ls_chari.obj"
	-@erase "$(INTDIR)\ls_dict.obj"
	-@erase "$(INTDIR)\ls_homo.obj"
	-@erase "$(INTDIR)\ls_math.obj"
	-@erase "$(INTDIR)\ls_proc.obj"
	-@erase "$(INTDIR)\ls_spel.obj"
	-@erase "$(INTDIR)\ls_speli.obj"
	-@erase "$(INTDIR)\ls_suff.obj"
	-@erase "$(INTDIR)\ls_suffi.obj"
	-@erase "$(INTDIR)\Lsa_adju.obj"
	-@erase "$(INTDIR)\lsa_coni.obj"
	-@erase "$(INTDIR)\lsa_fr.obj"
	-@erase "$(INTDIR)\lsa_gr.obj"
	-@erase "$(INTDIR)\lsa_ir.obj"
	-@erase "$(INTDIR)\lsa_it.obj"
	-@erase "$(INTDIR)\lsa_ja.obj"
	-@erase "$(INTDIR)\lsa_main.obj"
	-@erase "$(INTDIR)\lsa_rtbi.obj"
	-@erase "$(INTDIR)\lsa_rule.obj"
	-@erase "$(INTDIR)\lsa_sl.obj"
	-@erase "$(INTDIR)\lsa_sp.obj"
	-@erase "$(INTDIR)\lsa_task.obj"
	-@erase "$(INTDIR)\lsa_us.obj"
	-@erase "$(INTDIR)\lsa_util.obj"
	-@erase "$(INTDIR)\lsw_main.obj"
	-@erase "$(INTDIR)\par_ambi.obj"
	-@erase "$(INTDIR)\par_char.obj"
	-@erase "$(INTDIR)\par_dict.obj"
	-@erase "$(INTDIR)\par_pars.obj"
	-@erase "$(INTDIR)\par_rule.obj"
	-@erase "$(INTDIR)\ph_aloph.obj"
	-@erase "$(INTDIR)\ph_claus.obj"
	-@erase "$(INTDIR)\ph_draw.obj"
	-@erase "$(INTDIR)\ph_drwt0.obj"
	-@erase "$(INTDIR)\ph_inton.obj"
	-@erase "$(INTDIR)\ph_main.obj"
	-@erase "$(INTDIR)\ph_romi.obj"
	-@erase "$(INTDIR)\ph_setar.obj"
	-@erase "$(INTDIR)\ph_sort.obj"
	-@erase "$(INTDIR)\ph_syl.obj"
	-@erase "$(INTDIR)\ph_syntx.obj"
	-@erase "$(INTDIR)\ph_task.obj"
	-@erase "$(INTDIR)\ph_timng.obj"
	-@erase "$(INTDIR)\ph_vdefi.obj"
	-@erase "$(INTDIR)\ph_vset.obj"
	-@erase "$(INTDIR)\phinit.obj"
	-@erase "$(INTDIR)\phlog.obj"
	-@erase "$(INTDIR)\services.obj"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\Usa_init.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\vtmiont.obj"
	-@erase "$(OUTDIR)\demostat.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /GX /Z7 /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /Fp"$(INTDIR)\demostat.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\demostat.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\demostat.lib" 
LIB32_OBJS= \
	"$(INTDIR)\cm_char.obj" \
	"$(INTDIR)\cm_cmd.obj" \
	"$(INTDIR)\cm_copt.obj" \
	"$(INTDIR)\cm_main.obj" \
	"$(INTDIR)\cm_pars.obj" \
	"$(INTDIR)\cm_phon.obj" \
	"$(INTDIR)\cm_text.obj" \
	"$(INTDIR)\cm_util.obj" \
	"$(INTDIR)\Cmd_init.obj" \
	"$(INTDIR)\cmd_wav.obj" \
	"$(INTDIR)\Decstd97.obj" \
	"$(INTDIR)\loaddict.obj" \
	"$(INTDIR)\ls_chari.obj" \
	"$(INTDIR)\ls_dict.obj" \
	"$(INTDIR)\ls_homo.obj" \
	"$(INTDIR)\ls_math.obj" \
	"$(INTDIR)\ls_proc.obj" \
	"$(INTDIR)\ls_spel.obj" \
	"$(INTDIR)\ls_speli.obj" \
	"$(INTDIR)\ls_suff.obj" \
	"$(INTDIR)\ls_suffi.obj" \
	"$(INTDIR)\Lsa_adju.obj" \
	"$(INTDIR)\lsa_coni.obj" \
	"$(INTDIR)\lsa_fr.obj" \
	"$(INTDIR)\lsa_gr.obj" \
	"$(INTDIR)\lsa_ir.obj" \
	"$(INTDIR)\lsa_it.obj" \
	"$(INTDIR)\lsa_ja.obj" \
	"$(INTDIR)\lsa_main.obj" \
	"$(INTDIR)\lsa_rtbi.obj" \
	"$(INTDIR)\lsa_rule.obj" \
	"$(INTDIR)\lsa_sl.obj" \
	"$(INTDIR)\lsa_sp.obj" \
	"$(INTDIR)\lsa_task.obj" \
	"$(INTDIR)\lsa_us.obj" \
	"$(INTDIR)\lsa_util.obj" \
	"$(INTDIR)\lsw_main.obj" \
	"$(INTDIR)\par_ambi.obj" \
	"$(INTDIR)\par_char.obj" \
	"$(INTDIR)\par_dict.obj" \
	"$(INTDIR)\par_pars.obj" \
	"$(INTDIR)\par_rule.obj" \
	"$(INTDIR)\ph_aloph.obj" \
	"$(INTDIR)\ph_claus.obj" \
	"$(INTDIR)\ph_draw.obj" \
	"$(INTDIR)\ph_drwt0.obj" \
	"$(INTDIR)\ph_inton.obj" \
	"$(INTDIR)\ph_main.obj" \
	"$(INTDIR)\ph_romi.obj" \
	"$(INTDIR)\ph_setar.obj" \
	"$(INTDIR)\ph_sort.obj" \
	"$(INTDIR)\ph_syl.obj" \
	"$(INTDIR)\ph_syntx.obj" \
	"$(INTDIR)\ph_task.obj" \
	"$(INTDIR)\ph_timng.obj" \
	"$(INTDIR)\ph_vdefi.obj" \
	"$(INTDIR)\ph_vset.obj" \
	"$(INTDIR)\phinit.obj" \
	"$(INTDIR)\phlog.obj" \
	"$(INTDIR)\services.obj" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\Usa_init.obj" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\vtmiont.obj"

"$(OUTDIR)\demostat.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

OUTDIR=.\..\build\demostat\sp\release
INTDIR=.\..\build\demostat\sp\release\link
# Begin Custom Macros
OutDir=.\..\build\demostat\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\demostat.lib"


CLEAN :
	-@erase "$(INTDIR)\cm_char.obj"
	-@erase "$(INTDIR)\cm_cmd.obj"
	-@erase "$(INTDIR)\cm_copt.obj"
	-@erase "$(INTDIR)\cm_main.obj"
	-@erase "$(INTDIR)\cm_pars.obj"
	-@erase "$(INTDIR)\cm_phon.obj"
	-@erase "$(INTDIR)\cm_text.obj"
	-@erase "$(INTDIR)\cm_util.obj"
	-@erase "$(INTDIR)\Cmd_init.obj"
	-@erase "$(INTDIR)\cmd_wav.obj"
	-@erase "$(INTDIR)\Decstd97.obj"
	-@erase "$(INTDIR)\loaddict.obj"
	-@erase "$(INTDIR)\ls_chari.obj"
	-@erase "$(INTDIR)\ls_dict.obj"
	-@erase "$(INTDIR)\ls_homo.obj"
	-@erase "$(INTDIR)\ls_math.obj"
	-@erase "$(INTDIR)\ls_proc.obj"
	-@erase "$(INTDIR)\ls_spel.obj"
	-@erase "$(INTDIR)\ls_speli.obj"
	-@erase "$(INTDIR)\ls_suff.obj"
	-@erase "$(INTDIR)\ls_suffi.obj"
	-@erase "$(INTDIR)\Lsa_adju.obj"
	-@erase "$(INTDIR)\lsa_coni.obj"
	-@erase "$(INTDIR)\lsa_fr.obj"
	-@erase "$(INTDIR)\lsa_gr.obj"
	-@erase "$(INTDIR)\lsa_ir.obj"
	-@erase "$(INTDIR)\lsa_it.obj"
	-@erase "$(INTDIR)\lsa_ja.obj"
	-@erase "$(INTDIR)\lsa_main.obj"
	-@erase "$(INTDIR)\lsa_rtbi.obj"
	-@erase "$(INTDIR)\lsa_rule.obj"
	-@erase "$(INTDIR)\lsa_sl.obj"
	-@erase "$(INTDIR)\lsa_sp.obj"
	-@erase "$(INTDIR)\lsa_task.obj"
	-@erase "$(INTDIR)\lsa_us.obj"
	-@erase "$(INTDIR)\lsa_util.obj"
	-@erase "$(INTDIR)\lsw_main.obj"
	-@erase "$(INTDIR)\par_ambi.obj"
	-@erase "$(INTDIR)\par_char.obj"
	-@erase "$(INTDIR)\par_dict.obj"
	-@erase "$(INTDIR)\par_pars.obj"
	-@erase "$(INTDIR)\par_rule.obj"
	-@erase "$(INTDIR)\ph_aloph.obj"
	-@erase "$(INTDIR)\ph_claus.obj"
	-@erase "$(INTDIR)\ph_draw.obj"
	-@erase "$(INTDIR)\ph_drwt0.obj"
	-@erase "$(INTDIR)\ph_inton.obj"
	-@erase "$(INTDIR)\ph_main.obj"
	-@erase "$(INTDIR)\ph_romi.obj"
	-@erase "$(INTDIR)\ph_setar.obj"
	-@erase "$(INTDIR)\ph_sort.obj"
	-@erase "$(INTDIR)\ph_syl.obj"
	-@erase "$(INTDIR)\ph_syntx.obj"
	-@erase "$(INTDIR)\ph_task.obj"
	-@erase "$(INTDIR)\ph_timng.obj"
	-@erase "$(INTDIR)\ph_vdefi.obj"
	-@erase "$(INTDIR)\ph_vset.obj"
	-@erase "$(INTDIR)\phinit.obj"
	-@erase "$(INTDIR)\phlog.obj"
	-@erase "$(INTDIR)\services.obj"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\Usa_init.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\vtmiont.obj"
	-@erase "$(OUTDIR)\demostat.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "SPANISH_SP" /Fp"$(INTDIR)\demostat.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\demostat.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\demostat.lib" 
LIB32_OBJS= \
	"$(INTDIR)\cm_char.obj" \
	"$(INTDIR)\cm_cmd.obj" \
	"$(INTDIR)\cm_copt.obj" \
	"$(INTDIR)\cm_main.obj" \
	"$(INTDIR)\cm_pars.obj" \
	"$(INTDIR)\cm_phon.obj" \
	"$(INTDIR)\cm_text.obj" \
	"$(INTDIR)\cm_util.obj" \
	"$(INTDIR)\Cmd_init.obj" \
	"$(INTDIR)\cmd_wav.obj" \
	"$(INTDIR)\Decstd97.obj" \
	"$(INTDIR)\loaddict.obj" \
	"$(INTDIR)\ls_chari.obj" \
	"$(INTDIR)\ls_dict.obj" \
	"$(INTDIR)\ls_homo.obj" \
	"$(INTDIR)\ls_math.obj" \
	"$(INTDIR)\ls_proc.obj" \
	"$(INTDIR)\ls_spel.obj" \
	"$(INTDIR)\ls_speli.obj" \
	"$(INTDIR)\ls_suff.obj" \
	"$(INTDIR)\ls_suffi.obj" \
	"$(INTDIR)\Lsa_adju.obj" \
	"$(INTDIR)\lsa_coni.obj" \
	"$(INTDIR)\lsa_fr.obj" \
	"$(INTDIR)\lsa_gr.obj" \
	"$(INTDIR)\lsa_ir.obj" \
	"$(INTDIR)\lsa_it.obj" \
	"$(INTDIR)\lsa_ja.obj" \
	"$(INTDIR)\lsa_main.obj" \
	"$(INTDIR)\lsa_rtbi.obj" \
	"$(INTDIR)\lsa_rule.obj" \
	"$(INTDIR)\lsa_sl.obj" \
	"$(INTDIR)\lsa_sp.obj" \
	"$(INTDIR)\lsa_task.obj" \
	"$(INTDIR)\lsa_us.obj" \
	"$(INTDIR)\lsa_util.obj" \
	"$(INTDIR)\lsw_main.obj" \
	"$(INTDIR)\par_ambi.obj" \
	"$(INTDIR)\par_char.obj" \
	"$(INTDIR)\par_dict.obj" \
	"$(INTDIR)\par_pars.obj" \
	"$(INTDIR)\par_rule.obj" \
	"$(INTDIR)\ph_aloph.obj" \
	"$(INTDIR)\ph_claus.obj" \
	"$(INTDIR)\ph_draw.obj" \
	"$(INTDIR)\ph_drwt0.obj" \
	"$(INTDIR)\ph_inton.obj" \
	"$(INTDIR)\ph_main.obj" \
	"$(INTDIR)\ph_romi.obj" \
	"$(INTDIR)\ph_setar.obj" \
	"$(INTDIR)\ph_sort.obj" \
	"$(INTDIR)\ph_syl.obj" \
	"$(INTDIR)\ph_syntx.obj" \
	"$(INTDIR)\ph_task.obj" \
	"$(INTDIR)\ph_timng.obj" \
	"$(INTDIR)\ph_vdefi.obj" \
	"$(INTDIR)\ph_vset.obj" \
	"$(INTDIR)\phinit.obj" \
	"$(INTDIR)\phlog.obj" \
	"$(INTDIR)\services.obj" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\Usa_init.obj" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\vtmiont.obj"

"$(OUTDIR)\demostat.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

OUTDIR=.\..\build\demostat\gr\release
INTDIR=.\..\build\demostat\gr\release\link
# Begin Custom Macros
OutDir=.\..\build\demostat\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\demostat.lib"


CLEAN :
	-@erase "$(INTDIR)\cm_char.obj"
	-@erase "$(INTDIR)\cm_cmd.obj"
	-@erase "$(INTDIR)\cm_copt.obj"
	-@erase "$(INTDIR)\cm_main.obj"
	-@erase "$(INTDIR)\cm_pars.obj"
	-@erase "$(INTDIR)\cm_phon.obj"
	-@erase "$(INTDIR)\cm_text.obj"
	-@erase "$(INTDIR)\cm_util.obj"
	-@erase "$(INTDIR)\Cmd_init.obj"
	-@erase "$(INTDIR)\cmd_wav.obj"
	-@erase "$(INTDIR)\Decstd97.obj"
	-@erase "$(INTDIR)\loaddict.obj"
	-@erase "$(INTDIR)\ls_chari.obj"
	-@erase "$(INTDIR)\ls_dict.obj"
	-@erase "$(INTDIR)\ls_homo.obj"
	-@erase "$(INTDIR)\ls_math.obj"
	-@erase "$(INTDIR)\ls_proc.obj"
	-@erase "$(INTDIR)\ls_spel.obj"
	-@erase "$(INTDIR)\ls_speli.obj"
	-@erase "$(INTDIR)\ls_suff.obj"
	-@erase "$(INTDIR)\ls_suffi.obj"
	-@erase "$(INTDIR)\Lsa_adju.obj"
	-@erase "$(INTDIR)\lsa_coni.obj"
	-@erase "$(INTDIR)\lsa_fr.obj"
	-@erase "$(INTDIR)\lsa_gr.obj"
	-@erase "$(INTDIR)\lsa_ir.obj"
	-@erase "$(INTDIR)\lsa_it.obj"
	-@erase "$(INTDIR)\lsa_ja.obj"
	-@erase "$(INTDIR)\lsa_main.obj"
	-@erase "$(INTDIR)\lsa_rtbi.obj"
	-@erase "$(INTDIR)\lsa_rule.obj"
	-@erase "$(INTDIR)\lsa_sl.obj"
	-@erase "$(INTDIR)\lsa_sp.obj"
	-@erase "$(INTDIR)\lsa_task.obj"
	-@erase "$(INTDIR)\lsa_us.obj"
	-@erase "$(INTDIR)\lsa_util.obj"
	-@erase "$(INTDIR)\lsw_main.obj"
	-@erase "$(INTDIR)\par_ambi.obj"
	-@erase "$(INTDIR)\par_char.obj"
	-@erase "$(INTDIR)\par_dict.obj"
	-@erase "$(INTDIR)\par_pars.obj"
	-@erase "$(INTDIR)\par_rule.obj"
	-@erase "$(INTDIR)\ph_aloph.obj"
	-@erase "$(INTDIR)\ph_claus.obj"
	-@erase "$(INTDIR)\ph_draw.obj"
	-@erase "$(INTDIR)\ph_drwt0.obj"
	-@erase "$(INTDIR)\ph_inton.obj"
	-@erase "$(INTDIR)\ph_main.obj"
	-@erase "$(INTDIR)\ph_romi.obj"
	-@erase "$(INTDIR)\ph_setar.obj"
	-@erase "$(INTDIR)\ph_sort.obj"
	-@erase "$(INTDIR)\ph_syl.obj"
	-@erase "$(INTDIR)\ph_syntx.obj"
	-@erase "$(INTDIR)\ph_task.obj"
	-@erase "$(INTDIR)\ph_timng.obj"
	-@erase "$(INTDIR)\ph_vdefi.obj"
	-@erase "$(INTDIR)\ph_vset.obj"
	-@erase "$(INTDIR)\phinit.obj"
	-@erase "$(INTDIR)\phlog.obj"
	-@erase "$(INTDIR)\services.obj"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\Usa_init.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\vtmiont.obj"
	-@erase "$(OUTDIR)\demostat.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "GERMAN" /Fp"$(INTDIR)\demostat.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /Zm200 /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\demostat.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\demostat.lib" 
LIB32_OBJS= \
	"$(INTDIR)\cm_char.obj" \
	"$(INTDIR)\cm_cmd.obj" \
	"$(INTDIR)\cm_copt.obj" \
	"$(INTDIR)\cm_main.obj" \
	"$(INTDIR)\cm_pars.obj" \
	"$(INTDIR)\cm_phon.obj" \
	"$(INTDIR)\cm_text.obj" \
	"$(INTDIR)\cm_util.obj" \
	"$(INTDIR)\Cmd_init.obj" \
	"$(INTDIR)\cmd_wav.obj" \
	"$(INTDIR)\Decstd97.obj" \
	"$(INTDIR)\loaddict.obj" \
	"$(INTDIR)\ls_chari.obj" \
	"$(INTDIR)\ls_dict.obj" \
	"$(INTDIR)\ls_homo.obj" \
	"$(INTDIR)\ls_math.obj" \
	"$(INTDIR)\ls_proc.obj" \
	"$(INTDIR)\ls_spel.obj" \
	"$(INTDIR)\ls_speli.obj" \
	"$(INTDIR)\ls_suff.obj" \
	"$(INTDIR)\ls_suffi.obj" \
	"$(INTDIR)\Lsa_adju.obj" \
	"$(INTDIR)\lsa_coni.obj" \
	"$(INTDIR)\lsa_fr.obj" \
	"$(INTDIR)\lsa_gr.obj" \
	"$(INTDIR)\lsa_ir.obj" \
	"$(INTDIR)\lsa_it.obj" \
	"$(INTDIR)\lsa_ja.obj" \
	"$(INTDIR)\lsa_main.obj" \
	"$(INTDIR)\lsa_rtbi.obj" \
	"$(INTDIR)\lsa_rule.obj" \
	"$(INTDIR)\lsa_sl.obj" \
	"$(INTDIR)\lsa_sp.obj" \
	"$(INTDIR)\lsa_task.obj" \
	"$(INTDIR)\lsa_us.obj" \
	"$(INTDIR)\lsa_util.obj" \
	"$(INTDIR)\lsw_main.obj" \
	"$(INTDIR)\par_ambi.obj" \
	"$(INTDIR)\par_char.obj" \
	"$(INTDIR)\par_dict.obj" \
	"$(INTDIR)\par_pars.obj" \
	"$(INTDIR)\par_rule.obj" \
	"$(INTDIR)\ph_aloph.obj" \
	"$(INTDIR)\ph_claus.obj" \
	"$(INTDIR)\ph_draw.obj" \
	"$(INTDIR)\ph_drwt0.obj" \
	"$(INTDIR)\ph_inton.obj" \
	"$(INTDIR)\ph_main.obj" \
	"$(INTDIR)\ph_romi.obj" \
	"$(INTDIR)\ph_setar.obj" \
	"$(INTDIR)\ph_sort.obj" \
	"$(INTDIR)\ph_syl.obj" \
	"$(INTDIR)\ph_syntx.obj" \
	"$(INTDIR)\ph_task.obj" \
	"$(INTDIR)\ph_timng.obj" \
	"$(INTDIR)\ph_vdefi.obj" \
	"$(INTDIR)\ph_vset.obj" \
	"$(INTDIR)\phinit.obj" \
	"$(INTDIR)\phlog.obj" \
	"$(INTDIR)\services.obj" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\Usa_init.obj" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\vtmiont.obj"

"$(OUTDIR)\demostat.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

OUTDIR=.\..\build\demostat\la\release
INTDIR=.\..\build\demostat\la\release\link
# Begin Custom Macros
OutDir=.\..\build\demostat\la\release
# End Custom Macros

ALL : "$(OUTDIR)\demostat.lib"


CLEAN :
	-@erase "$(INTDIR)\cm_char.obj"
	-@erase "$(INTDIR)\cm_cmd.obj"
	-@erase "$(INTDIR)\cm_copt.obj"
	-@erase "$(INTDIR)\cm_main.obj"
	-@erase "$(INTDIR)\cm_pars.obj"
	-@erase "$(INTDIR)\cm_phon.obj"
	-@erase "$(INTDIR)\cm_text.obj"
	-@erase "$(INTDIR)\cm_util.obj"
	-@erase "$(INTDIR)\Cmd_init.obj"
	-@erase "$(INTDIR)\cmd_wav.obj"
	-@erase "$(INTDIR)\Decstd97.obj"
	-@erase "$(INTDIR)\loaddict.obj"
	-@erase "$(INTDIR)\ls_chari.obj"
	-@erase "$(INTDIR)\ls_dict.obj"
	-@erase "$(INTDIR)\ls_homo.obj"
	-@erase "$(INTDIR)\ls_math.obj"
	-@erase "$(INTDIR)\ls_proc.obj"
	-@erase "$(INTDIR)\ls_spel.obj"
	-@erase "$(INTDIR)\ls_speli.obj"
	-@erase "$(INTDIR)\ls_suff.obj"
	-@erase "$(INTDIR)\ls_suffi.obj"
	-@erase "$(INTDIR)\Lsa_adju.obj"
	-@erase "$(INTDIR)\lsa_coni.obj"
	-@erase "$(INTDIR)\lsa_fr.obj"
	-@erase "$(INTDIR)\lsa_gr.obj"
	-@erase "$(INTDIR)\lsa_ir.obj"
	-@erase "$(INTDIR)\lsa_it.obj"
	-@erase "$(INTDIR)\lsa_ja.obj"
	-@erase "$(INTDIR)\lsa_main.obj"
	-@erase "$(INTDIR)\lsa_rtbi.obj"
	-@erase "$(INTDIR)\lsa_rule.obj"
	-@erase "$(INTDIR)\lsa_sl.obj"
	-@erase "$(INTDIR)\lsa_sp.obj"
	-@erase "$(INTDIR)\lsa_task.obj"
	-@erase "$(INTDIR)\lsa_us.obj"
	-@erase "$(INTDIR)\lsa_util.obj"
	-@erase "$(INTDIR)\lsw_main.obj"
	-@erase "$(INTDIR)\par_ambi.obj"
	-@erase "$(INTDIR)\par_char.obj"
	-@erase "$(INTDIR)\par_dict.obj"
	-@erase "$(INTDIR)\par_pars.obj"
	-@erase "$(INTDIR)\par_rule.obj"
	-@erase "$(INTDIR)\ph_aloph.obj"
	-@erase "$(INTDIR)\ph_claus.obj"
	-@erase "$(INTDIR)\ph_draw.obj"
	-@erase "$(INTDIR)\ph_drwt0.obj"
	-@erase "$(INTDIR)\ph_inton.obj"
	-@erase "$(INTDIR)\ph_main.obj"
	-@erase "$(INTDIR)\ph_romi.obj"
	-@erase "$(INTDIR)\ph_setar.obj"
	-@erase "$(INTDIR)\ph_sort.obj"
	-@erase "$(INTDIR)\ph_syl.obj"
	-@erase "$(INTDIR)\ph_syntx.obj"
	-@erase "$(INTDIR)\ph_task.obj"
	-@erase "$(INTDIR)\ph_timng.obj"
	-@erase "$(INTDIR)\ph_vdefi.obj"
	-@erase "$(INTDIR)\ph_vset.obj"
	-@erase "$(INTDIR)\phinit.obj"
	-@erase "$(INTDIR)\phlog.obj"
	-@erase "$(INTDIR)\services.obj"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\Usa_init.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\vtmiont.obj"
	-@erase "$(OUTDIR)\demostat.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "SPANISH_LA" /Fp"$(INTDIR)\demostat.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\demostat.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\demostat.lib" 
LIB32_OBJS= \
	"$(INTDIR)\cm_char.obj" \
	"$(INTDIR)\cm_cmd.obj" \
	"$(INTDIR)\cm_copt.obj" \
	"$(INTDIR)\cm_main.obj" \
	"$(INTDIR)\cm_pars.obj" \
	"$(INTDIR)\cm_phon.obj" \
	"$(INTDIR)\cm_text.obj" \
	"$(INTDIR)\cm_util.obj" \
	"$(INTDIR)\Cmd_init.obj" \
	"$(INTDIR)\cmd_wav.obj" \
	"$(INTDIR)\Decstd97.obj" \
	"$(INTDIR)\loaddict.obj" \
	"$(INTDIR)\ls_chari.obj" \
	"$(INTDIR)\ls_dict.obj" \
	"$(INTDIR)\ls_homo.obj" \
	"$(INTDIR)\ls_math.obj" \
	"$(INTDIR)\ls_proc.obj" \
	"$(INTDIR)\ls_spel.obj" \
	"$(INTDIR)\ls_speli.obj" \
	"$(INTDIR)\ls_suff.obj" \
	"$(INTDIR)\ls_suffi.obj" \
	"$(INTDIR)\Lsa_adju.obj" \
	"$(INTDIR)\lsa_coni.obj" \
	"$(INTDIR)\lsa_fr.obj" \
	"$(INTDIR)\lsa_gr.obj" \
	"$(INTDIR)\lsa_ir.obj" \
	"$(INTDIR)\lsa_it.obj" \
	"$(INTDIR)\lsa_ja.obj" \
	"$(INTDIR)\lsa_main.obj" \
	"$(INTDIR)\lsa_rtbi.obj" \
	"$(INTDIR)\lsa_rule.obj" \
	"$(INTDIR)\lsa_sl.obj" \
	"$(INTDIR)\lsa_sp.obj" \
	"$(INTDIR)\lsa_task.obj" \
	"$(INTDIR)\lsa_us.obj" \
	"$(INTDIR)\lsa_util.obj" \
	"$(INTDIR)\lsw_main.obj" \
	"$(INTDIR)\par_ambi.obj" \
	"$(INTDIR)\par_char.obj" \
	"$(INTDIR)\par_dict.obj" \
	"$(INTDIR)\par_pars.obj" \
	"$(INTDIR)\par_rule.obj" \
	"$(INTDIR)\ph_aloph.obj" \
	"$(INTDIR)\ph_claus.obj" \
	"$(INTDIR)\ph_draw.obj" \
	"$(INTDIR)\ph_drwt0.obj" \
	"$(INTDIR)\ph_inton.obj" \
	"$(INTDIR)\ph_main.obj" \
	"$(INTDIR)\ph_romi.obj" \
	"$(INTDIR)\ph_setar.obj" \
	"$(INTDIR)\ph_sort.obj" \
	"$(INTDIR)\ph_syl.obj" \
	"$(INTDIR)\ph_syntx.obj" \
	"$(INTDIR)\ph_task.obj" \
	"$(INTDIR)\ph_timng.obj" \
	"$(INTDIR)\ph_vdefi.obj" \
	"$(INTDIR)\ph_vset.obj" \
	"$(INTDIR)\phinit.obj" \
	"$(INTDIR)\phlog.obj" \
	"$(INTDIR)\services.obj" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\Usa_init.obj" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\vtmiont.obj"

"$(OUTDIR)\demostat.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

OUTDIR=.\..\build\demostat\sp\debug
INTDIR=.\..\build\demostat\sp\debug\link
# Begin Custom Macros
OutDir=.\..\build\demostat\sp\debug
# End Custom Macros

ALL : "$(OUTDIR)\demostat.lib"


CLEAN :
	-@erase "$(INTDIR)\cm_char.obj"
	-@erase "$(INTDIR)\cm_cmd.obj"
	-@erase "$(INTDIR)\cm_copt.obj"
	-@erase "$(INTDIR)\cm_main.obj"
	-@erase "$(INTDIR)\cm_pars.obj"
	-@erase "$(INTDIR)\cm_phon.obj"
	-@erase "$(INTDIR)\cm_text.obj"
	-@erase "$(INTDIR)\cm_util.obj"
	-@erase "$(INTDIR)\Cmd_init.obj"
	-@erase "$(INTDIR)\cmd_wav.obj"
	-@erase "$(INTDIR)\Decstd97.obj"
	-@erase "$(INTDIR)\loaddict.obj"
	-@erase "$(INTDIR)\ls_chari.obj"
	-@erase "$(INTDIR)\ls_dict.obj"
	-@erase "$(INTDIR)\ls_homo.obj"
	-@erase "$(INTDIR)\ls_math.obj"
	-@erase "$(INTDIR)\ls_proc.obj"
	-@erase "$(INTDIR)\ls_spel.obj"
	-@erase "$(INTDIR)\ls_speli.obj"
	-@erase "$(INTDIR)\ls_suff.obj"
	-@erase "$(INTDIR)\ls_suffi.obj"
	-@erase "$(INTDIR)\Lsa_adju.obj"
	-@erase "$(INTDIR)\lsa_coni.obj"
	-@erase "$(INTDIR)\lsa_fr.obj"
	-@erase "$(INTDIR)\lsa_gr.obj"
	-@erase "$(INTDIR)\lsa_ir.obj"
	-@erase "$(INTDIR)\lsa_it.obj"
	-@erase "$(INTDIR)\lsa_ja.obj"
	-@erase "$(INTDIR)\lsa_main.obj"
	-@erase "$(INTDIR)\lsa_rtbi.obj"
	-@erase "$(INTDIR)\lsa_rule.obj"
	-@erase "$(INTDIR)\lsa_sl.obj"
	-@erase "$(INTDIR)\lsa_sp.obj"
	-@erase "$(INTDIR)\lsa_task.obj"
	-@erase "$(INTDIR)\lsa_us.obj"
	-@erase "$(INTDIR)\lsa_util.obj"
	-@erase "$(INTDIR)\lsw_main.obj"
	-@erase "$(INTDIR)\par_ambi.obj"
	-@erase "$(INTDIR)\par_char.obj"
	-@erase "$(INTDIR)\par_dict.obj"
	-@erase "$(INTDIR)\par_pars.obj"
	-@erase "$(INTDIR)\par_rule.obj"
	-@erase "$(INTDIR)\ph_aloph.obj"
	-@erase "$(INTDIR)\ph_claus.obj"
	-@erase "$(INTDIR)\ph_draw.obj"
	-@erase "$(INTDIR)\ph_drwt0.obj"
	-@erase "$(INTDIR)\ph_inton.obj"
	-@erase "$(INTDIR)\ph_main.obj"
	-@erase "$(INTDIR)\ph_romi.obj"
	-@erase "$(INTDIR)\ph_setar.obj"
	-@erase "$(INTDIR)\ph_sort.obj"
	-@erase "$(INTDIR)\ph_syl.obj"
	-@erase "$(INTDIR)\ph_syntx.obj"
	-@erase "$(INTDIR)\ph_task.obj"
	-@erase "$(INTDIR)\ph_timng.obj"
	-@erase "$(INTDIR)\ph_vdefi.obj"
	-@erase "$(INTDIR)\ph_vset.obj"
	-@erase "$(INTDIR)\phinit.obj"
	-@erase "$(INTDIR)\phlog.obj"
	-@erase "$(INTDIR)\services.obj"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\Usa_init.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\vtmiont.obj"
	-@erase "$(OUTDIR)\demostat.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /GX /Z7 /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "SPANISH_SP" /Fp"$(INTDIR)\demostat.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\demostat.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\demostat.lib" 
LIB32_OBJS= \
	"$(INTDIR)\cm_char.obj" \
	"$(INTDIR)\cm_cmd.obj" \
	"$(INTDIR)\cm_copt.obj" \
	"$(INTDIR)\cm_main.obj" \
	"$(INTDIR)\cm_pars.obj" \
	"$(INTDIR)\cm_phon.obj" \
	"$(INTDIR)\cm_text.obj" \
	"$(INTDIR)\cm_util.obj" \
	"$(INTDIR)\Cmd_init.obj" \
	"$(INTDIR)\cmd_wav.obj" \
	"$(INTDIR)\Decstd97.obj" \
	"$(INTDIR)\loaddict.obj" \
	"$(INTDIR)\ls_chari.obj" \
	"$(INTDIR)\ls_dict.obj" \
	"$(INTDIR)\ls_homo.obj" \
	"$(INTDIR)\ls_math.obj" \
	"$(INTDIR)\ls_proc.obj" \
	"$(INTDIR)\ls_spel.obj" \
	"$(INTDIR)\ls_speli.obj" \
	"$(INTDIR)\ls_suff.obj" \
	"$(INTDIR)\ls_suffi.obj" \
	"$(INTDIR)\Lsa_adju.obj" \
	"$(INTDIR)\lsa_coni.obj" \
	"$(INTDIR)\lsa_fr.obj" \
	"$(INTDIR)\lsa_gr.obj" \
	"$(INTDIR)\lsa_ir.obj" \
	"$(INTDIR)\lsa_it.obj" \
	"$(INTDIR)\lsa_ja.obj" \
	"$(INTDIR)\lsa_main.obj" \
	"$(INTDIR)\lsa_rtbi.obj" \
	"$(INTDIR)\lsa_rule.obj" \
	"$(INTDIR)\lsa_sl.obj" \
	"$(INTDIR)\lsa_sp.obj" \
	"$(INTDIR)\lsa_task.obj" \
	"$(INTDIR)\lsa_us.obj" \
	"$(INTDIR)\lsa_util.obj" \
	"$(INTDIR)\lsw_main.obj" \
	"$(INTDIR)\par_ambi.obj" \
	"$(INTDIR)\par_char.obj" \
	"$(INTDIR)\par_dict.obj" \
	"$(INTDIR)\par_pars.obj" \
	"$(INTDIR)\par_rule.obj" \
	"$(INTDIR)\ph_aloph.obj" \
	"$(INTDIR)\ph_claus.obj" \
	"$(INTDIR)\ph_draw.obj" \
	"$(INTDIR)\ph_drwt0.obj" \
	"$(INTDIR)\ph_inton.obj" \
	"$(INTDIR)\ph_main.obj" \
	"$(INTDIR)\ph_romi.obj" \
	"$(INTDIR)\ph_setar.obj" \
	"$(INTDIR)\ph_sort.obj" \
	"$(INTDIR)\ph_syl.obj" \
	"$(INTDIR)\ph_syntx.obj" \
	"$(INTDIR)\ph_task.obj" \
	"$(INTDIR)\ph_timng.obj" \
	"$(INTDIR)\ph_vdefi.obj" \
	"$(INTDIR)\ph_vset.obj" \
	"$(INTDIR)\phinit.obj" \
	"$(INTDIR)\phlog.obj" \
	"$(INTDIR)\services.obj" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\Usa_init.obj" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\vtmiont.obj"

"$(OUTDIR)\demostat.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

OUTDIR=.\..\build\demostat\gr\debug
INTDIR=.\..\build\demostat\gr\debug\link
# Begin Custom Macros
OutDir=.\..\build\demostat\gr\debug
# End Custom Macros

ALL : "$(OUTDIR)\demostat.lib"


CLEAN :
	-@erase "$(INTDIR)\cm_char.obj"
	-@erase "$(INTDIR)\cm_cmd.obj"
	-@erase "$(INTDIR)\cm_copt.obj"
	-@erase "$(INTDIR)\cm_main.obj"
	-@erase "$(INTDIR)\cm_pars.obj"
	-@erase "$(INTDIR)\cm_phon.obj"
	-@erase "$(INTDIR)\cm_text.obj"
	-@erase "$(INTDIR)\cm_util.obj"
	-@erase "$(INTDIR)\Cmd_init.obj"
	-@erase "$(INTDIR)\cmd_wav.obj"
	-@erase "$(INTDIR)\Decstd97.obj"
	-@erase "$(INTDIR)\loaddict.obj"
	-@erase "$(INTDIR)\ls_chari.obj"
	-@erase "$(INTDIR)\ls_dict.obj"
	-@erase "$(INTDIR)\ls_homo.obj"
	-@erase "$(INTDIR)\ls_math.obj"
	-@erase "$(INTDIR)\ls_proc.obj"
	-@erase "$(INTDIR)\ls_spel.obj"
	-@erase "$(INTDIR)\ls_speli.obj"
	-@erase "$(INTDIR)\ls_suff.obj"
	-@erase "$(INTDIR)\ls_suffi.obj"
	-@erase "$(INTDIR)\Lsa_adju.obj"
	-@erase "$(INTDIR)\lsa_coni.obj"
	-@erase "$(INTDIR)\lsa_fr.obj"
	-@erase "$(INTDIR)\lsa_gr.obj"
	-@erase "$(INTDIR)\lsa_ir.obj"
	-@erase "$(INTDIR)\lsa_it.obj"
	-@erase "$(INTDIR)\lsa_ja.obj"
	-@erase "$(INTDIR)\lsa_main.obj"
	-@erase "$(INTDIR)\lsa_rtbi.obj"
	-@erase "$(INTDIR)\lsa_rule.obj"
	-@erase "$(INTDIR)\lsa_sl.obj"
	-@erase "$(INTDIR)\lsa_sp.obj"
	-@erase "$(INTDIR)\lsa_task.obj"
	-@erase "$(INTDIR)\lsa_us.obj"
	-@erase "$(INTDIR)\lsa_util.obj"
	-@erase "$(INTDIR)\lsw_main.obj"
	-@erase "$(INTDIR)\par_ambi.obj"
	-@erase "$(INTDIR)\par_char.obj"
	-@erase "$(INTDIR)\par_dict.obj"
	-@erase "$(INTDIR)\par_pars.obj"
	-@erase "$(INTDIR)\par_rule.obj"
	-@erase "$(INTDIR)\ph_aloph.obj"
	-@erase "$(INTDIR)\ph_claus.obj"
	-@erase "$(INTDIR)\ph_draw.obj"
	-@erase "$(INTDIR)\ph_drwt0.obj"
	-@erase "$(INTDIR)\ph_inton.obj"
	-@erase "$(INTDIR)\ph_main.obj"
	-@erase "$(INTDIR)\ph_romi.obj"
	-@erase "$(INTDIR)\ph_setar.obj"
	-@erase "$(INTDIR)\ph_sort.obj"
	-@erase "$(INTDIR)\ph_syl.obj"
	-@erase "$(INTDIR)\ph_syntx.obj"
	-@erase "$(INTDIR)\ph_task.obj"
	-@erase "$(INTDIR)\ph_timng.obj"
	-@erase "$(INTDIR)\ph_vdefi.obj"
	-@erase "$(INTDIR)\ph_vset.obj"
	-@erase "$(INTDIR)\phinit.obj"
	-@erase "$(INTDIR)\phlog.obj"
	-@erase "$(INTDIR)\services.obj"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\Usa_init.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\vtmiont.obj"
	-@erase "$(OUTDIR)\demostat.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /GX /Z7 /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "GERMAN" /Fp"$(INTDIR)\demostat.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /Zm200 /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\demostat.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\demostat.lib" 
LIB32_OBJS= \
	"$(INTDIR)\cm_char.obj" \
	"$(INTDIR)\cm_cmd.obj" \
	"$(INTDIR)\cm_copt.obj" \
	"$(INTDIR)\cm_main.obj" \
	"$(INTDIR)\cm_pars.obj" \
	"$(INTDIR)\cm_phon.obj" \
	"$(INTDIR)\cm_text.obj" \
	"$(INTDIR)\cm_util.obj" \
	"$(INTDIR)\Cmd_init.obj" \
	"$(INTDIR)\cmd_wav.obj" \
	"$(INTDIR)\Decstd97.obj" \
	"$(INTDIR)\loaddict.obj" \
	"$(INTDIR)\ls_chari.obj" \
	"$(INTDIR)\ls_dict.obj" \
	"$(INTDIR)\ls_homo.obj" \
	"$(INTDIR)\ls_math.obj" \
	"$(INTDIR)\ls_proc.obj" \
	"$(INTDIR)\ls_spel.obj" \
	"$(INTDIR)\ls_speli.obj" \
	"$(INTDIR)\ls_suff.obj" \
	"$(INTDIR)\ls_suffi.obj" \
	"$(INTDIR)\Lsa_adju.obj" \
	"$(INTDIR)\lsa_coni.obj" \
	"$(INTDIR)\lsa_fr.obj" \
	"$(INTDIR)\lsa_gr.obj" \
	"$(INTDIR)\lsa_ir.obj" \
	"$(INTDIR)\lsa_it.obj" \
	"$(INTDIR)\lsa_ja.obj" \
	"$(INTDIR)\lsa_main.obj" \
	"$(INTDIR)\lsa_rtbi.obj" \
	"$(INTDIR)\lsa_rule.obj" \
	"$(INTDIR)\lsa_sl.obj" \
	"$(INTDIR)\lsa_sp.obj" \
	"$(INTDIR)\lsa_task.obj" \
	"$(INTDIR)\lsa_us.obj" \
	"$(INTDIR)\lsa_util.obj" \
	"$(INTDIR)\lsw_main.obj" \
	"$(INTDIR)\par_ambi.obj" \
	"$(INTDIR)\par_char.obj" \
	"$(INTDIR)\par_dict.obj" \
	"$(INTDIR)\par_pars.obj" \
	"$(INTDIR)\par_rule.obj" \
	"$(INTDIR)\ph_aloph.obj" \
	"$(INTDIR)\ph_claus.obj" \
	"$(INTDIR)\ph_draw.obj" \
	"$(INTDIR)\ph_drwt0.obj" \
	"$(INTDIR)\ph_inton.obj" \
	"$(INTDIR)\ph_main.obj" \
	"$(INTDIR)\ph_romi.obj" \
	"$(INTDIR)\ph_setar.obj" \
	"$(INTDIR)\ph_sort.obj" \
	"$(INTDIR)\ph_syl.obj" \
	"$(INTDIR)\ph_syntx.obj" \
	"$(INTDIR)\ph_task.obj" \
	"$(INTDIR)\ph_timng.obj" \
	"$(INTDIR)\ph_vdefi.obj" \
	"$(INTDIR)\ph_vset.obj" \
	"$(INTDIR)\phinit.obj" \
	"$(INTDIR)\phlog.obj" \
	"$(INTDIR)\services.obj" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\Usa_init.obj" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\vtmiont.obj"

"$(OUTDIR)\demostat.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

OUTDIR=.\..\build\demostat\la\debug
INTDIR=.\..\build\demostat\la\debug\link
# Begin Custom Macros
OutDir=.\..\build\demostat\la\debug
# End Custom Macros

ALL : "$(OUTDIR)\demostat.lib"


CLEAN :
	-@erase "$(INTDIR)\cm_char.obj"
	-@erase "$(INTDIR)\cm_cmd.obj"
	-@erase "$(INTDIR)\cm_copt.obj"
	-@erase "$(INTDIR)\cm_main.obj"
	-@erase "$(INTDIR)\cm_pars.obj"
	-@erase "$(INTDIR)\cm_phon.obj"
	-@erase "$(INTDIR)\cm_text.obj"
	-@erase "$(INTDIR)\cm_util.obj"
	-@erase "$(INTDIR)\Cmd_init.obj"
	-@erase "$(INTDIR)\cmd_wav.obj"
	-@erase "$(INTDIR)\Decstd97.obj"
	-@erase "$(INTDIR)\loaddict.obj"
	-@erase "$(INTDIR)\ls_chari.obj"
	-@erase "$(INTDIR)\ls_dict.obj"
	-@erase "$(INTDIR)\ls_homo.obj"
	-@erase "$(INTDIR)\ls_math.obj"
	-@erase "$(INTDIR)\ls_proc.obj"
	-@erase "$(INTDIR)\ls_spel.obj"
	-@erase "$(INTDIR)\ls_speli.obj"
	-@erase "$(INTDIR)\ls_suff.obj"
	-@erase "$(INTDIR)\ls_suffi.obj"
	-@erase "$(INTDIR)\Lsa_adju.obj"
	-@erase "$(INTDIR)\lsa_coni.obj"
	-@erase "$(INTDIR)\lsa_fr.obj"
	-@erase "$(INTDIR)\lsa_gr.obj"
	-@erase "$(INTDIR)\lsa_ir.obj"
	-@erase "$(INTDIR)\lsa_it.obj"
	-@erase "$(INTDIR)\lsa_ja.obj"
	-@erase "$(INTDIR)\lsa_main.obj"
	-@erase "$(INTDIR)\lsa_rtbi.obj"
	-@erase "$(INTDIR)\lsa_rule.obj"
	-@erase "$(INTDIR)\lsa_sl.obj"
	-@erase "$(INTDIR)\lsa_sp.obj"
	-@erase "$(INTDIR)\lsa_task.obj"
	-@erase "$(INTDIR)\lsa_us.obj"
	-@erase "$(INTDIR)\lsa_util.obj"
	-@erase "$(INTDIR)\lsw_main.obj"
	-@erase "$(INTDIR)\par_ambi.obj"
	-@erase "$(INTDIR)\par_char.obj"
	-@erase "$(INTDIR)\par_dict.obj"
	-@erase "$(INTDIR)\par_pars.obj"
	-@erase "$(INTDIR)\par_rule.obj"
	-@erase "$(INTDIR)\ph_aloph.obj"
	-@erase "$(INTDIR)\ph_claus.obj"
	-@erase "$(INTDIR)\ph_draw.obj"
	-@erase "$(INTDIR)\ph_drwt0.obj"
	-@erase "$(INTDIR)\ph_inton.obj"
	-@erase "$(INTDIR)\ph_main.obj"
	-@erase "$(INTDIR)\ph_romi.obj"
	-@erase "$(INTDIR)\ph_setar.obj"
	-@erase "$(INTDIR)\ph_sort.obj"
	-@erase "$(INTDIR)\ph_syl.obj"
	-@erase "$(INTDIR)\ph_syntx.obj"
	-@erase "$(INTDIR)\ph_task.obj"
	-@erase "$(INTDIR)\ph_timng.obj"
	-@erase "$(INTDIR)\ph_vdefi.obj"
	-@erase "$(INTDIR)\ph_vset.obj"
	-@erase "$(INTDIR)\phinit.obj"
	-@erase "$(INTDIR)\phlog.obj"
	-@erase "$(INTDIR)\services.obj"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\Usa_init.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\vtmiont.obj"
	-@erase "$(OUTDIR)\demostat.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /GX /Z7 /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "SPANISH_LA" /Fp"$(INTDIR)\demostat.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\demostat.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\demostat.lib" 
LIB32_OBJS= \
	"$(INTDIR)\cm_char.obj" \
	"$(INTDIR)\cm_cmd.obj" \
	"$(INTDIR)\cm_copt.obj" \
	"$(INTDIR)\cm_main.obj" \
	"$(INTDIR)\cm_pars.obj" \
	"$(INTDIR)\cm_phon.obj" \
	"$(INTDIR)\cm_text.obj" \
	"$(INTDIR)\cm_util.obj" \
	"$(INTDIR)\Cmd_init.obj" \
	"$(INTDIR)\cmd_wav.obj" \
	"$(INTDIR)\Decstd97.obj" \
	"$(INTDIR)\loaddict.obj" \
	"$(INTDIR)\ls_chari.obj" \
	"$(INTDIR)\ls_dict.obj" \
	"$(INTDIR)\ls_homo.obj" \
	"$(INTDIR)\ls_math.obj" \
	"$(INTDIR)\ls_proc.obj" \
	"$(INTDIR)\ls_spel.obj" \
	"$(INTDIR)\ls_speli.obj" \
	"$(INTDIR)\ls_suff.obj" \
	"$(INTDIR)\ls_suffi.obj" \
	"$(INTDIR)\Lsa_adju.obj" \
	"$(INTDIR)\lsa_coni.obj" \
	"$(INTDIR)\lsa_fr.obj" \
	"$(INTDIR)\lsa_gr.obj" \
	"$(INTDIR)\lsa_ir.obj" \
	"$(INTDIR)\lsa_it.obj" \
	"$(INTDIR)\lsa_ja.obj" \
	"$(INTDIR)\lsa_main.obj" \
	"$(INTDIR)\lsa_rtbi.obj" \
	"$(INTDIR)\lsa_rule.obj" \
	"$(INTDIR)\lsa_sl.obj" \
	"$(INTDIR)\lsa_sp.obj" \
	"$(INTDIR)\lsa_task.obj" \
	"$(INTDIR)\lsa_us.obj" \
	"$(INTDIR)\lsa_util.obj" \
	"$(INTDIR)\lsw_main.obj" \
	"$(INTDIR)\par_ambi.obj" \
	"$(INTDIR)\par_char.obj" \
	"$(INTDIR)\par_dict.obj" \
	"$(INTDIR)\par_pars.obj" \
	"$(INTDIR)\par_rule.obj" \
	"$(INTDIR)\ph_aloph.obj" \
	"$(INTDIR)\ph_claus.obj" \
	"$(INTDIR)\ph_draw.obj" \
	"$(INTDIR)\ph_drwt0.obj" \
	"$(INTDIR)\ph_inton.obj" \
	"$(INTDIR)\ph_main.obj" \
	"$(INTDIR)\ph_romi.obj" \
	"$(INTDIR)\ph_setar.obj" \
	"$(INTDIR)\ph_sort.obj" \
	"$(INTDIR)\ph_syl.obj" \
	"$(INTDIR)\ph_syntx.obj" \
	"$(INTDIR)\ph_task.obj" \
	"$(INTDIR)\ph_timng.obj" \
	"$(INTDIR)\ph_vdefi.obj" \
	"$(INTDIR)\ph_vset.obj" \
	"$(INTDIR)\phinit.obj" \
	"$(INTDIR)\phlog.obj" \
	"$(INTDIR)\services.obj" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\Usa_init.obj" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\vtmiont.obj"

"$(OUTDIR)\demostat.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

OUTDIR=.\..\alpha\demostat\us\release
INTDIR=.\..\alpha\demostat\us\release\link

ALL : 


CLEAN :
	-@erase 

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\demostat.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\demostat.lib" 
LIB32_OBJS= \
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

OUTDIR=.\..\alpha\demostat\us\debug
INTDIR=.\..\alpha\demostat\us\debug\link

ALL : 


CLEAN :
	-@erase 

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\demostat.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\demostat.lib" 
LIB32_OBJS= \
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

OUTDIR=.\..\alpha\demostat\sp\release
INTDIR=.\..\alpha\demostat\sp\release\link

ALL : 


CLEAN :
	-@erase 

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\demostat.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\demostat.lib" 
LIB32_OBJS= \
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

OUTDIR=.\..\alpha\demostat\gr\release
INTDIR=.\..\alpha\demostat\gr\release\link

ALL : 


CLEAN :
	-@erase 

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\demostat.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\demostat.lib" 
LIB32_OBJS= \
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

OUTDIR=.\..\alpha\demostat\la\release
INTDIR=.\..\alpha\demostat\la\release\link

ALL : 


CLEAN :
	-@erase 

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\demostat.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\demostat.lib" 
LIB32_OBJS= \
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

OUTDIR=.\..\alpha\demostat\sp\debug
INTDIR=.\..\alpha\demostat\sp\debug\link

ALL : 


CLEAN :
	-@erase 

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\demostat.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\demostat.lib" 
LIB32_OBJS= \
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

OUTDIR=.\..\alpha\demostat\gr\debug
INTDIR=.\..\alpha\demostat\gr\debug\link

ALL : 


CLEAN :
	-@erase 

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\demostat.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\demostat.lib" 
LIB32_OBJS= \
	

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

OUTDIR=.\..\alpha\demostat\la\debug
INTDIR=.\..\alpha\demostat\la\debug\link

ALL : 


CLEAN :
	-@erase 

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\demostat.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\demostat.lib" 
LIB32_OBJS= \
	

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("demostat.dep")
!INCLUDE "demostat.dep"
!ELSE 
!MESSAGE Warning: cannot find "demostat.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "demostat - Win32 Release" || "$(CFG)" == "demostat - Win32 Debug" || "$(CFG)" == "demostat - Win32 Release Spanish" || "$(CFG)" == "demostat - Win32 Release German" || "$(CFG)" == "demostat - Win32 Release Latin American" || "$(CFG)" == "demostat - Win32 Debug Spanish" || "$(CFG)" == "demostat - Win32 Debug German" || "$(CFG)" == "demostat - Win32 Debug Latin American" || "$(CFG)" == "demostat - Win32 ALPHA Release" || "$(CFG)" == "demostat - Win32 ALPHA Debug" || "$(CFG)" == "demostat - Win32 ALPHA Release Spanish" || "$(CFG)" == "demostat - Win32 ALPHA Release German" || "$(CFG)" == "demostat - Win32 ALPHA Release Latin American" || "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish" || "$(CFG)" == "demostat - Win32 ALPHA Debug German" || "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"
SOURCE=.\Cmd\cm_char.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Cmd\cm_cmd.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Cmd\cm_copt.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Cmd\cm_main.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Cmd\cm_pars.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Cmd\cm_phon.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Cmd\cm_text.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Cmd\cm_util.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Cmd\Cmd_init.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Cmd\cmd_wav.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Api\Decstd97.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\Decstd97.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\Decstd97.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\Decstd97.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\Decstd97.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\Decstd97.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\Decstd97.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\Decstd97.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\Decstd97.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Lts\loaddict.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Lts\ls_chari.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Lts\ls_dict.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Lts\ls_homo.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Lts\ls_math.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Lts\ls_proc.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Lts\ls_spel.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Lts\ls_speli.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Lts\ls_suff.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Lts\ls_suffi.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Lts\Lsa_adju.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\Lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\Lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\Lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\Lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\Lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\Lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\Lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\Lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Lts\lsa_coni.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Lts\lsa_fr.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Lts\lsa_gr.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Lts\lsa_ir.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Lts\lsa_it.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Lts\lsa_ja.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Lts\lsa_main.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\lsa_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\lsa_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\lsa_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\lsa_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\lsa_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\lsa_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\lsa_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\lsa_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Lts\lsa_rtbi.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Lts\lsa_rule.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Lts\lsa_sl.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Lts\lsa_sp.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Lts\lsa_task.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Lts\lsa_us.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Lts\lsa_util.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Lts\lsw_main.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Cmd\par_ambi.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Cmd\par_char.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Cmd\par_dict.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Cmd\par_pars.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Cmd\par_rule.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Ph\ph_aloph.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Ph\ph_claus.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Ph\ph_draw.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Ph\ph_drwt0.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Ph\ph_inton.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Ph\ph_main.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Ph\ph_romi.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Ph\ph_setar.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Ph\ph_sort.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Ph\ph_syl.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Ph\ph_syntx.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Ph\ph_task.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Ph\ph_timng.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Ph\ph_vdefi.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Ph\ph_vset.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Ph\phinit.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Ph\phlog.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Kernel\services.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\services.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\services.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\services.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\services.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\services.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\services.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\services.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\services.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Api\ttsapi.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Kernel\Usa_init.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\Usa_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\Usa_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\Usa_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\Usa_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\Usa_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\Usa_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\Usa_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\Usa_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Vtm\vtm.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 

SOURCE=.\Vtm\vtmiont.c

!IF  "$(CFG)" == "demostat - Win32 Release"


"$(INTDIR)\vtmiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"


"$(INTDIR)\vtmiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"


"$(INTDIR)\vtmiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"


"$(INTDIR)\vtmiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"


"$(INTDIR)\vtmiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"


"$(INTDIR)\vtmiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"


"$(INTDIR)\vtmiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"


"$(INTDIR)\vtmiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "demostat - Win32 ALPHA Debug Latin American"

!ENDIF 


!ENDIF 

