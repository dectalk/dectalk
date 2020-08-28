# Microsoft Developer Studio Generated NMAKE File, Based on dtlkstat.dsp
!IF "$(CFG)" == ""
CFG=DTLKSTAT - Win32 Release Spanish
!MESSAGE No configuration specified. Defaulting to DTLKSTAT - Win32 Release Spanish.
!ENDIF 

!IF "$(CFG)" != "DTLKSTAT - Win32 Release Spanish" && "$(CFG)" != "DTLKSTAT - Win32 Release German" && "$(CFG)" != "DTLKSTAT - Win32 Release" && "$(CFG)" != "DTLKSTAT - Win32 Debug" && "$(CFG)" != "DTLKSTAT - Win32 Debug Spanish" && "$(CFG)" != "DTLKSTAT - Win32 Debug German" && "$(CFG)" != "DTLKSTAT - Win32 Debug Latin American" && "$(CFG)" != "DTLKSTAT - Win32 Release Latin American" && "$(CFG)" != "DTLKSTAT - Win32 Release United Kingdom" && "$(CFG)" != "DTLKSTAT - Win32 Debug United Kingdom" && "$(CFG)" != "DTLKSTAT - Win32 Release French" && "$(CFG)" != "DTLKSTAT - Win32 Debug French"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "dtlkstat.mak" CFG="DTLKSTAT - Win32 Release Spanish"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "DTLKSTAT - Win32 Release Spanish" (based on "Win32 (x86) Static Library")
!MESSAGE "DTLKSTAT - Win32 Release German" (based on "Win32 (x86) Static Library")
!MESSAGE "DTLKSTAT - Win32 Release" (based on "Win32 (x86) Static Library")
!MESSAGE "DTLKSTAT - Win32 Debug" (based on "Win32 (x86) Static Library")
!MESSAGE "DTLKSTAT - Win32 Debug Spanish" (based on "Win32 (x86) Static Library")
!MESSAGE "DTLKSTAT - Win32 Debug German" (based on "Win32 (x86) Static Library")
!MESSAGE "DTLKSTAT - Win32 Debug Latin American" (based on "Win32 (x86) Static Library")
!MESSAGE "DTLKSTAT - Win32 Release Latin American" (based on "Win32 (x86) Static Library")
!MESSAGE "DTLKSTAT - Win32 Release United Kingdom" (based on "Win32 (x86) Static Library")
!MESSAGE "DTLKSTAT - Win32 Debug United Kingdom" (based on "Win32 (x86) Static Library")
!MESSAGE "DTLKSTAT - Win32 Release French" (based on "Win32 (x86) Static Library")
!MESSAGE "DTLKSTAT - Win32 Debug French" (based on "Win32 (x86) Static Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "DTLKSTAT - Win32 Release Spanish"

OUTDIR=.\..\build\dtlkstat\sp\release
INTDIR=.\..\build\dtlkstat\sp\release\link
# Begin Custom Macros
OutDir=.\..\build\dtlkstat\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\dtlkstat.lib"


CLEAN :
	-@erase "$(INTDIR)\acxf1c.obj"
	-@erase "$(INTDIR)\brent.obj"
	-@erase "$(INTDIR)\circuit.obj"
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
	-@erase "$(INTDIR)\CRYPT2.OBJ"
	-@erase "$(INTDIR)\Dbgwins.obj"
	-@erase "$(INTDIR)\frame.obj"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\inithl.obj"
	-@erase "$(INTDIR)\llinit.obj"
	-@erase "$(INTDIR)\loaddict.obj"
	-@erase "$(INTDIR)\log10table.obj"
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
	-@erase "$(INTDIR)\lsa_rtbi.obj"
	-@erase "$(INTDIR)\lsa_rule.obj"
	-@erase "$(INTDIR)\lsa_sl.obj"
	-@erase "$(INTDIR)\lsa_sp.obj"
	-@erase "$(INTDIR)\lsa_task.obj"
	-@erase "$(INTDIR)\lsa_us.obj"
	-@erase "$(INTDIR)\lsa_util.obj"
	-@erase "$(INTDIR)\lsw_main.obj"
	-@erase "$(INTDIR)\nasalf1x.obj"
	-@erase "$(INTDIR)\par_ambi.obj"
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
	-@erase "$(INTDIR)\phprint.obj"
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\voice.obj"
	-@erase "$(OUTDIR)\dtlkstat.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I ".\..\..\microsoft" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "SPANISH_SP" /Fp"$(INTDIR)\dtlkstat.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dtlkstat.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\dtlkstat.lib" 
LIB32_OBJS= \
	"$(INTDIR)\acxf1c.obj" \
	"$(INTDIR)\brent.obj" \
	"$(INTDIR)\circuit.obj" \
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
	"$(INTDIR)\CRYPT2.OBJ" \
	"$(INTDIR)\Dbgwins.obj" \
	"$(INTDIR)\frame.obj" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
	"$(INTDIR)\llinit.obj" \
	"$(INTDIR)\loaddict.obj" \
	"$(INTDIR)\log10table.obj" \
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
	"$(INTDIR)\lsa_rtbi.obj" \
	"$(INTDIR)\lsa_rule.obj" \
	"$(INTDIR)\lsa_sl.obj" \
	"$(INTDIR)\lsa_sp.obj" \
	"$(INTDIR)\lsa_task.obj" \
	"$(INTDIR)\lsa_us.obj" \
	"$(INTDIR)\lsa_util.obj" \
	"$(INTDIR)\lsw_main.obj" \
	"$(INTDIR)\nasalf1x.obj" \
	"$(INTDIR)\par_ambi.obj" \
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
	"$(INTDIR)\phprint.obj" \
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\voice.obj"

"$(OUTDIR)\dtlkstat.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "DTLKSTAT - Win32 Release German"

OUTDIR=.\..\build\dtlkstat\gr\release
INTDIR=.\..\build\dtlkstat\gr\release\link
# Begin Custom Macros
OutDir=.\..\build\dtlkstat\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\dtlkstat.lib"


CLEAN :
	-@erase "$(INTDIR)\acxf1c.obj"
	-@erase "$(INTDIR)\brent.obj"
	-@erase "$(INTDIR)\circuit.obj"
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
	-@erase "$(INTDIR)\CRYPT2.OBJ"
	-@erase "$(INTDIR)\Dbgwins.obj"
	-@erase "$(INTDIR)\frame.obj"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\inithl.obj"
	-@erase "$(INTDIR)\llinit.obj"
	-@erase "$(INTDIR)\loaddict.obj"
	-@erase "$(INTDIR)\log10table.obj"
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
	-@erase "$(INTDIR)\lsa_rtbi.obj"
	-@erase "$(INTDIR)\lsa_rule.obj"
	-@erase "$(INTDIR)\lsa_sl.obj"
	-@erase "$(INTDIR)\lsa_sp.obj"
	-@erase "$(INTDIR)\lsa_task.obj"
	-@erase "$(INTDIR)\lsa_us.obj"
	-@erase "$(INTDIR)\lsa_util.obj"
	-@erase "$(INTDIR)\lsw_main.obj"
	-@erase "$(INTDIR)\nasalf1x.obj"
	-@erase "$(INTDIR)\par_ambi.obj"
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
	-@erase "$(INTDIR)\phprint.obj"
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\voice.obj"
	-@erase "$(OUTDIR)\dtlkstat.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I ".\..\..\microsoft" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "GERMAN" /Fp"$(INTDIR)\dtlkstat.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /Zm200 /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dtlkstat.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\dtlkstat.lib" 
LIB32_OBJS= \
	"$(INTDIR)\acxf1c.obj" \
	"$(INTDIR)\brent.obj" \
	"$(INTDIR)\circuit.obj" \
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
	"$(INTDIR)\CRYPT2.OBJ" \
	"$(INTDIR)\Dbgwins.obj" \
	"$(INTDIR)\frame.obj" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
	"$(INTDIR)\llinit.obj" \
	"$(INTDIR)\loaddict.obj" \
	"$(INTDIR)\log10table.obj" \
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
	"$(INTDIR)\lsa_rtbi.obj" \
	"$(INTDIR)\lsa_rule.obj" \
	"$(INTDIR)\lsa_sl.obj" \
	"$(INTDIR)\lsa_sp.obj" \
	"$(INTDIR)\lsa_task.obj" \
	"$(INTDIR)\lsa_us.obj" \
	"$(INTDIR)\lsa_util.obj" \
	"$(INTDIR)\lsw_main.obj" \
	"$(INTDIR)\nasalf1x.obj" \
	"$(INTDIR)\par_ambi.obj" \
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
	"$(INTDIR)\phprint.obj" \
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\voice.obj"

"$(OUTDIR)\dtlkstat.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "DTLKSTAT - Win32 Release"

OUTDIR=.\..\build\dtlkstat\us\release
INTDIR=.\..\build\dtlkstat\us\release\link
# Begin Custom Macros
OutDir=.\..\build\dtlkstat\us\release
# End Custom Macros

ALL : "$(OUTDIR)\dtlkstat.lib"


CLEAN :
	-@erase "$(INTDIR)\acxf1c.obj"
	-@erase "$(INTDIR)\brent.obj"
	-@erase "$(INTDIR)\circuit.obj"
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
	-@erase "$(INTDIR)\CRYPT2.OBJ"
	-@erase "$(INTDIR)\Dbgwins.obj"
	-@erase "$(INTDIR)\frame.obj"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\inithl.obj"
	-@erase "$(INTDIR)\llinit.obj"
	-@erase "$(INTDIR)\loaddict.obj"
	-@erase "$(INTDIR)\log10table.obj"
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
	-@erase "$(INTDIR)\lsa_rtbi.obj"
	-@erase "$(INTDIR)\lsa_rule.obj"
	-@erase "$(INTDIR)\lsa_sl.obj"
	-@erase "$(INTDIR)\lsa_sp.obj"
	-@erase "$(INTDIR)\lsa_task.obj"
	-@erase "$(INTDIR)\lsa_us.obj"
	-@erase "$(INTDIR)\lsa_util.obj"
	-@erase "$(INTDIR)\lsw_main.obj"
	-@erase "$(INTDIR)\nasalf1x.obj"
	-@erase "$(INTDIR)\par_ambi.obj"
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
	-@erase "$(INTDIR)\phprint.obj"
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\voice.obj"
	-@erase "$(OUTDIR)\dtlkstat.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I ".\..\..\microsoft" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /Fp"$(INTDIR)\dtlkstat.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dtlkstat.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\dtlkstat.lib" 
LIB32_OBJS= \
	"$(INTDIR)\acxf1c.obj" \
	"$(INTDIR)\brent.obj" \
	"$(INTDIR)\circuit.obj" \
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
	"$(INTDIR)\CRYPT2.OBJ" \
	"$(INTDIR)\Dbgwins.obj" \
	"$(INTDIR)\frame.obj" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
	"$(INTDIR)\llinit.obj" \
	"$(INTDIR)\loaddict.obj" \
	"$(INTDIR)\log10table.obj" \
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
	"$(INTDIR)\lsa_rtbi.obj" \
	"$(INTDIR)\lsa_rule.obj" \
	"$(INTDIR)\lsa_sl.obj" \
	"$(INTDIR)\lsa_sp.obj" \
	"$(INTDIR)\lsa_task.obj" \
	"$(INTDIR)\lsa_us.obj" \
	"$(INTDIR)\lsa_util.obj" \
	"$(INTDIR)\lsw_main.obj" \
	"$(INTDIR)\nasalf1x.obj" \
	"$(INTDIR)\par_ambi.obj" \
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
	"$(INTDIR)\phprint.obj" \
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\voice.obj"

"$(OUTDIR)\dtlkstat.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "DTLKSTAT - Win32 Debug"

OUTDIR=.\..\build\dtlkstat\us\debug
INTDIR=.\..\build\dtlkstat\us\debug\link
# Begin Custom Macros
OutDir=.\..\build\dtlkstat\us\debug
# End Custom Macros

ALL : "$(OUTDIR)\dtlkstat.lib"


CLEAN :
	-@erase "$(INTDIR)\acxf1c.obj"
	-@erase "$(INTDIR)\brent.obj"
	-@erase "$(INTDIR)\circuit.obj"
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
	-@erase "$(INTDIR)\CRYPT2.OBJ"
	-@erase "$(INTDIR)\Dbgwins.obj"
	-@erase "$(INTDIR)\frame.obj"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\inithl.obj"
	-@erase "$(INTDIR)\llinit.obj"
	-@erase "$(INTDIR)\loaddict.obj"
	-@erase "$(INTDIR)\log10table.obj"
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
	-@erase "$(INTDIR)\lsa_rtbi.obj"
	-@erase "$(INTDIR)\lsa_rule.obj"
	-@erase "$(INTDIR)\lsa_sl.obj"
	-@erase "$(INTDIR)\lsa_sp.obj"
	-@erase "$(INTDIR)\lsa_task.obj"
	-@erase "$(INTDIR)\lsa_us.obj"
	-@erase "$(INTDIR)\lsa_util.obj"
	-@erase "$(INTDIR)\lsw_main.obj"
	-@erase "$(INTDIR)\nasalf1x.obj"
	-@erase "$(INTDIR)\par_ambi.obj"
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
	-@erase "$(INTDIR)\phprint.obj"
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\voice.obj"
	-@erase "$(OUTDIR)\dtlkstat.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I ".\..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /Fp"$(INTDIR)\dtlkstat.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dtlkstat.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\dtlkstat.lib" 
LIB32_OBJS= \
	"$(INTDIR)\acxf1c.obj" \
	"$(INTDIR)\brent.obj" \
	"$(INTDIR)\circuit.obj" \
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
	"$(INTDIR)\CRYPT2.OBJ" \
	"$(INTDIR)\Dbgwins.obj" \
	"$(INTDIR)\frame.obj" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
	"$(INTDIR)\llinit.obj" \
	"$(INTDIR)\loaddict.obj" \
	"$(INTDIR)\log10table.obj" \
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
	"$(INTDIR)\lsa_rtbi.obj" \
	"$(INTDIR)\lsa_rule.obj" \
	"$(INTDIR)\lsa_sl.obj" \
	"$(INTDIR)\lsa_sp.obj" \
	"$(INTDIR)\lsa_task.obj" \
	"$(INTDIR)\lsa_us.obj" \
	"$(INTDIR)\lsa_util.obj" \
	"$(INTDIR)\lsw_main.obj" \
	"$(INTDIR)\nasalf1x.obj" \
	"$(INTDIR)\par_ambi.obj" \
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
	"$(INTDIR)\phprint.obj" \
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\voice.obj"

"$(OUTDIR)\dtlkstat.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "DTLKSTAT - Win32 Debug Spanish"

OUTDIR=.\..\build\dtlkstat\sp\debug
INTDIR=.\..\build\dtlkstat\sp\debug\link
# Begin Custom Macros
OutDir=.\..\build\dtlkstat\sp\debug
# End Custom Macros

ALL : "$(OUTDIR)\dtlkstat.lib"


CLEAN :
	-@erase "$(INTDIR)\acxf1c.obj"
	-@erase "$(INTDIR)\brent.obj"
	-@erase "$(INTDIR)\circuit.obj"
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
	-@erase "$(INTDIR)\CRYPT2.OBJ"
	-@erase "$(INTDIR)\Dbgwins.obj"
	-@erase "$(INTDIR)\frame.obj"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\inithl.obj"
	-@erase "$(INTDIR)\llinit.obj"
	-@erase "$(INTDIR)\loaddict.obj"
	-@erase "$(INTDIR)\log10table.obj"
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
	-@erase "$(INTDIR)\lsa_rtbi.obj"
	-@erase "$(INTDIR)\lsa_rule.obj"
	-@erase "$(INTDIR)\lsa_sl.obj"
	-@erase "$(INTDIR)\lsa_sp.obj"
	-@erase "$(INTDIR)\lsa_task.obj"
	-@erase "$(INTDIR)\lsa_us.obj"
	-@erase "$(INTDIR)\lsa_util.obj"
	-@erase "$(INTDIR)\lsw_main.obj"
	-@erase "$(INTDIR)\nasalf1x.obj"
	-@erase "$(INTDIR)\par_ambi.obj"
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
	-@erase "$(INTDIR)\phprint.obj"
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\voice.obj"
	-@erase "$(OUTDIR)\dtlkstat.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I ".\..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "SPANISH_SP" /Fp"$(INTDIR)\dtlkstat.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dtlkstat.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\dtlkstat.lib" 
LIB32_OBJS= \
	"$(INTDIR)\acxf1c.obj" \
	"$(INTDIR)\brent.obj" \
	"$(INTDIR)\circuit.obj" \
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
	"$(INTDIR)\CRYPT2.OBJ" \
	"$(INTDIR)\Dbgwins.obj" \
	"$(INTDIR)\frame.obj" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
	"$(INTDIR)\llinit.obj" \
	"$(INTDIR)\loaddict.obj" \
	"$(INTDIR)\log10table.obj" \
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
	"$(INTDIR)\lsa_rtbi.obj" \
	"$(INTDIR)\lsa_rule.obj" \
	"$(INTDIR)\lsa_sl.obj" \
	"$(INTDIR)\lsa_sp.obj" \
	"$(INTDIR)\lsa_task.obj" \
	"$(INTDIR)\lsa_us.obj" \
	"$(INTDIR)\lsa_util.obj" \
	"$(INTDIR)\lsw_main.obj" \
	"$(INTDIR)\nasalf1x.obj" \
	"$(INTDIR)\par_ambi.obj" \
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
	"$(INTDIR)\phprint.obj" \
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\voice.obj"

"$(OUTDIR)\dtlkstat.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "DTLKSTAT - Win32 Debug German"

OUTDIR=.\..\build\dtlkstat\gr\debug
INTDIR=.\..\build\dtlkstat\gr\debug\link
# Begin Custom Macros
OutDir=.\..\build\dtlkstat\gr\debug
# End Custom Macros

ALL : "$(OUTDIR)\dtlkstat.lib"


CLEAN :
	-@erase "$(INTDIR)\acxf1c.obj"
	-@erase "$(INTDIR)\brent.obj"
	-@erase "$(INTDIR)\circuit.obj"
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
	-@erase "$(INTDIR)\CRYPT2.OBJ"
	-@erase "$(INTDIR)\Dbgwins.obj"
	-@erase "$(INTDIR)\frame.obj"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\inithl.obj"
	-@erase "$(INTDIR)\llinit.obj"
	-@erase "$(INTDIR)\loaddict.obj"
	-@erase "$(INTDIR)\log10table.obj"
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
	-@erase "$(INTDIR)\lsa_rtbi.obj"
	-@erase "$(INTDIR)\lsa_rule.obj"
	-@erase "$(INTDIR)\lsa_sl.obj"
	-@erase "$(INTDIR)\lsa_sp.obj"
	-@erase "$(INTDIR)\lsa_task.obj"
	-@erase "$(INTDIR)\lsa_us.obj"
	-@erase "$(INTDIR)\lsa_util.obj"
	-@erase "$(INTDIR)\lsw_main.obj"
	-@erase "$(INTDIR)\nasalf1x.obj"
	-@erase "$(INTDIR)\par_ambi.obj"
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
	-@erase "$(INTDIR)\phprint.obj"
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\voice.obj"
	-@erase "$(OUTDIR)\dtlkstat.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I ".\..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "GERMAN" /Fp"$(INTDIR)\dtlkstat.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /Zm200 /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dtlkstat.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\dtlkstat.lib" 
LIB32_OBJS= \
	"$(INTDIR)\acxf1c.obj" \
	"$(INTDIR)\brent.obj" \
	"$(INTDIR)\circuit.obj" \
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
	"$(INTDIR)\CRYPT2.OBJ" \
	"$(INTDIR)\Dbgwins.obj" \
	"$(INTDIR)\frame.obj" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
	"$(INTDIR)\llinit.obj" \
	"$(INTDIR)\loaddict.obj" \
	"$(INTDIR)\log10table.obj" \
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
	"$(INTDIR)\lsa_rtbi.obj" \
	"$(INTDIR)\lsa_rule.obj" \
	"$(INTDIR)\lsa_sl.obj" \
	"$(INTDIR)\lsa_sp.obj" \
	"$(INTDIR)\lsa_task.obj" \
	"$(INTDIR)\lsa_us.obj" \
	"$(INTDIR)\lsa_util.obj" \
	"$(INTDIR)\lsw_main.obj" \
	"$(INTDIR)\nasalf1x.obj" \
	"$(INTDIR)\par_ambi.obj" \
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
	"$(INTDIR)\phprint.obj" \
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\voice.obj"

"$(OUTDIR)\dtlkstat.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "DTLKSTAT - Win32 Debug Latin American"

OUTDIR=.\..\build\dtlkstat\la\debug
INTDIR=.\..\build\dtlkstat\la\debug\link
# Begin Custom Macros
OutDir=.\..\build\dtlkstat\la\debug
# End Custom Macros

ALL : "$(OUTDIR)\dtlkstat.lib"


CLEAN :
	-@erase "$(INTDIR)\acxf1c.obj"
	-@erase "$(INTDIR)\brent.obj"
	-@erase "$(INTDIR)\circuit.obj"
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
	-@erase "$(INTDIR)\CRYPT2.OBJ"
	-@erase "$(INTDIR)\Dbgwins.obj"
	-@erase "$(INTDIR)\frame.obj"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\inithl.obj"
	-@erase "$(INTDIR)\llinit.obj"
	-@erase "$(INTDIR)\loaddict.obj"
	-@erase "$(INTDIR)\log10table.obj"
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
	-@erase "$(INTDIR)\lsa_rtbi.obj"
	-@erase "$(INTDIR)\lsa_rule.obj"
	-@erase "$(INTDIR)\lsa_sl.obj"
	-@erase "$(INTDIR)\lsa_sp.obj"
	-@erase "$(INTDIR)\lsa_task.obj"
	-@erase "$(INTDIR)\lsa_us.obj"
	-@erase "$(INTDIR)\lsa_util.obj"
	-@erase "$(INTDIR)\lsw_main.obj"
	-@erase "$(INTDIR)\nasalf1x.obj"
	-@erase "$(INTDIR)\par_ambi.obj"
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
	-@erase "$(INTDIR)\phprint.obj"
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\voice.obj"
	-@erase "$(OUTDIR)\dtlkstat.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I ".\..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "SPANISH_LA" /Fp"$(INTDIR)\dtlkstat.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dtlkstat.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\dtlkstat.lib" 
LIB32_OBJS= \
	"$(INTDIR)\acxf1c.obj" \
	"$(INTDIR)\brent.obj" \
	"$(INTDIR)\circuit.obj" \
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
	"$(INTDIR)\CRYPT2.OBJ" \
	"$(INTDIR)\Dbgwins.obj" \
	"$(INTDIR)\frame.obj" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
	"$(INTDIR)\llinit.obj" \
	"$(INTDIR)\loaddict.obj" \
	"$(INTDIR)\log10table.obj" \
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
	"$(INTDIR)\lsa_rtbi.obj" \
	"$(INTDIR)\lsa_rule.obj" \
	"$(INTDIR)\lsa_sl.obj" \
	"$(INTDIR)\lsa_sp.obj" \
	"$(INTDIR)\lsa_task.obj" \
	"$(INTDIR)\lsa_us.obj" \
	"$(INTDIR)\lsa_util.obj" \
	"$(INTDIR)\lsw_main.obj" \
	"$(INTDIR)\nasalf1x.obj" \
	"$(INTDIR)\par_ambi.obj" \
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
	"$(INTDIR)\phprint.obj" \
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\voice.obj"

"$(OUTDIR)\dtlkstat.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "DTLKSTAT - Win32 Release Latin American"

OUTDIR=.\..\build\dtlkstat\la\release
INTDIR=.\..\build\dtlkstat\la\release\link
# Begin Custom Macros
OutDir=.\..\build\dtlkstat\la\release
# End Custom Macros

ALL : "$(OUTDIR)\dtlkstat.lib"


CLEAN :
	-@erase "$(INTDIR)\acxf1c.obj"
	-@erase "$(INTDIR)\brent.obj"
	-@erase "$(INTDIR)\circuit.obj"
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
	-@erase "$(INTDIR)\CRYPT2.OBJ"
	-@erase "$(INTDIR)\Dbgwins.obj"
	-@erase "$(INTDIR)\frame.obj"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\inithl.obj"
	-@erase "$(INTDIR)\llinit.obj"
	-@erase "$(INTDIR)\loaddict.obj"
	-@erase "$(INTDIR)\log10table.obj"
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
	-@erase "$(INTDIR)\lsa_rtbi.obj"
	-@erase "$(INTDIR)\lsa_rule.obj"
	-@erase "$(INTDIR)\lsa_sl.obj"
	-@erase "$(INTDIR)\lsa_sp.obj"
	-@erase "$(INTDIR)\lsa_task.obj"
	-@erase "$(INTDIR)\lsa_us.obj"
	-@erase "$(INTDIR)\lsa_util.obj"
	-@erase "$(INTDIR)\lsw_main.obj"
	-@erase "$(INTDIR)\nasalf1x.obj"
	-@erase "$(INTDIR)\par_ambi.obj"
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
	-@erase "$(INTDIR)\phprint.obj"
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\voice.obj"
	-@erase "$(OUTDIR)\dtlkstat.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I ".\..\..\microsoft" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "SPANISH_LA" /Fp"$(INTDIR)\dtlkstat.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dtlkstat.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\dtlkstat.lib" 
LIB32_OBJS= \
	"$(INTDIR)\acxf1c.obj" \
	"$(INTDIR)\brent.obj" \
	"$(INTDIR)\circuit.obj" \
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
	"$(INTDIR)\CRYPT2.OBJ" \
	"$(INTDIR)\Dbgwins.obj" \
	"$(INTDIR)\frame.obj" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
	"$(INTDIR)\llinit.obj" \
	"$(INTDIR)\loaddict.obj" \
	"$(INTDIR)\log10table.obj" \
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
	"$(INTDIR)\lsa_rtbi.obj" \
	"$(INTDIR)\lsa_rule.obj" \
	"$(INTDIR)\lsa_sl.obj" \
	"$(INTDIR)\lsa_sp.obj" \
	"$(INTDIR)\lsa_task.obj" \
	"$(INTDIR)\lsa_us.obj" \
	"$(INTDIR)\lsa_util.obj" \
	"$(INTDIR)\lsw_main.obj" \
	"$(INTDIR)\nasalf1x.obj" \
	"$(INTDIR)\par_ambi.obj" \
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
	"$(INTDIR)\phprint.obj" \
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\voice.obj"

"$(OUTDIR)\dtlkstat.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "DTLKSTAT - Win32 Release United Kingdom"

OUTDIR=.\..\build\dtlkstat\uk\release
INTDIR=.\..\build\dtlkstat\uk\release\link
# Begin Custom Macros
OutDir=.\..\build\dtlkstat\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\dtlkstat.lib"


CLEAN :
	-@erase "$(INTDIR)\acxf1c.obj"
	-@erase "$(INTDIR)\brent.obj"
	-@erase "$(INTDIR)\circuit.obj"
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
	-@erase "$(INTDIR)\CRYPT2.OBJ"
	-@erase "$(INTDIR)\Dbgwins.obj"
	-@erase "$(INTDIR)\frame.obj"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\inithl.obj"
	-@erase "$(INTDIR)\llinit.obj"
	-@erase "$(INTDIR)\loaddict.obj"
	-@erase "$(INTDIR)\log10table.obj"
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
	-@erase "$(INTDIR)\lsa_rtbi.obj"
	-@erase "$(INTDIR)\lsa_rule.obj"
	-@erase "$(INTDIR)\lsa_sl.obj"
	-@erase "$(INTDIR)\lsa_sp.obj"
	-@erase "$(INTDIR)\lsa_task.obj"
	-@erase "$(INTDIR)\lsa_us.obj"
	-@erase "$(INTDIR)\lsa_util.obj"
	-@erase "$(INTDIR)\lsw_main.obj"
	-@erase "$(INTDIR)\nasalf1x.obj"
	-@erase "$(INTDIR)\par_ambi.obj"
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
	-@erase "$(INTDIR)\phprint.obj"
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\voice.obj"
	-@erase "$(OUTDIR)\dtlkstat.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I ".\..\..\microsoft" /I "..\.." /D "NDEBUG" /D "ENGLISH_UK" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH" /Fp"$(INTDIR)\dtlkstat.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dtlkstat.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\dtlkstat.lib" 
LIB32_OBJS= \
	"$(INTDIR)\acxf1c.obj" \
	"$(INTDIR)\brent.obj" \
	"$(INTDIR)\circuit.obj" \
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
	"$(INTDIR)\CRYPT2.OBJ" \
	"$(INTDIR)\Dbgwins.obj" \
	"$(INTDIR)\frame.obj" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
	"$(INTDIR)\llinit.obj" \
	"$(INTDIR)\loaddict.obj" \
	"$(INTDIR)\log10table.obj" \
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
	"$(INTDIR)\lsa_rtbi.obj" \
	"$(INTDIR)\lsa_rule.obj" \
	"$(INTDIR)\lsa_sl.obj" \
	"$(INTDIR)\lsa_sp.obj" \
	"$(INTDIR)\lsa_task.obj" \
	"$(INTDIR)\lsa_us.obj" \
	"$(INTDIR)\lsa_util.obj" \
	"$(INTDIR)\lsw_main.obj" \
	"$(INTDIR)\nasalf1x.obj" \
	"$(INTDIR)\par_ambi.obj" \
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
	"$(INTDIR)\phprint.obj" \
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\voice.obj"

"$(OUTDIR)\dtlkstat.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "DTLKSTAT - Win32 Debug United Kingdom"

OUTDIR=.\..\build\dtlkstat\uk\debug
INTDIR=.\..\build\dtlkstat\uk\debug\link
# Begin Custom Macros
OutDir=.\..\build\dtlkstat\uk\debug
# End Custom Macros

ALL : "$(OUTDIR)\dtlkstat.lib"


CLEAN :
	-@erase "$(INTDIR)\acxf1c.obj"
	-@erase "$(INTDIR)\brent.obj"
	-@erase "$(INTDIR)\circuit.obj"
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
	-@erase "$(INTDIR)\CRYPT2.OBJ"
	-@erase "$(INTDIR)\Dbgwins.obj"
	-@erase "$(INTDIR)\frame.obj"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\inithl.obj"
	-@erase "$(INTDIR)\llinit.obj"
	-@erase "$(INTDIR)\loaddict.obj"
	-@erase "$(INTDIR)\log10table.obj"
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
	-@erase "$(INTDIR)\lsa_rtbi.obj"
	-@erase "$(INTDIR)\lsa_rule.obj"
	-@erase "$(INTDIR)\lsa_sl.obj"
	-@erase "$(INTDIR)\lsa_sp.obj"
	-@erase "$(INTDIR)\lsa_task.obj"
	-@erase "$(INTDIR)\lsa_us.obj"
	-@erase "$(INTDIR)\lsa_util.obj"
	-@erase "$(INTDIR)\lsw_main.obj"
	-@erase "$(INTDIR)\nasalf1x.obj"
	-@erase "$(INTDIR)\par_ambi.obj"
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
	-@erase "$(INTDIR)\phprint.obj"
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\voice.obj"
	-@erase "$(OUTDIR)\dtlkstat.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I ".\..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "ENGLISH_UK" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "ENGLISH" /Fp"$(INTDIR)\dtlkstat.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dtlkstat.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\dtlkstat.lib" 
LIB32_OBJS= \
	"$(INTDIR)\acxf1c.obj" \
	"$(INTDIR)\brent.obj" \
	"$(INTDIR)\circuit.obj" \
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
	"$(INTDIR)\CRYPT2.OBJ" \
	"$(INTDIR)\Dbgwins.obj" \
	"$(INTDIR)\frame.obj" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
	"$(INTDIR)\llinit.obj" \
	"$(INTDIR)\loaddict.obj" \
	"$(INTDIR)\log10table.obj" \
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
	"$(INTDIR)\lsa_rtbi.obj" \
	"$(INTDIR)\lsa_rule.obj" \
	"$(INTDIR)\lsa_sl.obj" \
	"$(INTDIR)\lsa_sp.obj" \
	"$(INTDIR)\lsa_task.obj" \
	"$(INTDIR)\lsa_us.obj" \
	"$(INTDIR)\lsa_util.obj" \
	"$(INTDIR)\lsw_main.obj" \
	"$(INTDIR)\nasalf1x.obj" \
	"$(INTDIR)\par_ambi.obj" \
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
	"$(INTDIR)\phprint.obj" \
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\voice.obj"

"$(OUTDIR)\dtlkstat.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "DTLKSTAT - Win32 Release French"

OUTDIR=.\..\build\dtlkstat\fr\release
INTDIR=.\..\build\dtlkstat\fr\release\link
# Begin Custom Macros
OutDir=.\..\build\dtlkstat\fr\release
# End Custom Macros

ALL : "$(OUTDIR)\dtlkstat.lib"


CLEAN :
	-@erase "$(INTDIR)\acxf1c.obj"
	-@erase "$(INTDIR)\brent.obj"
	-@erase "$(INTDIR)\circuit.obj"
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
	-@erase "$(INTDIR)\CRYPT2.OBJ"
	-@erase "$(INTDIR)\Dbgwins.obj"
	-@erase "$(INTDIR)\frame.obj"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\inithl.obj"
	-@erase "$(INTDIR)\llinit.obj"
	-@erase "$(INTDIR)\loaddict.obj"
	-@erase "$(INTDIR)\log10table.obj"
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
	-@erase "$(INTDIR)\lsa_rtbi.obj"
	-@erase "$(INTDIR)\lsa_rule.obj"
	-@erase "$(INTDIR)\lsa_sl.obj"
	-@erase "$(INTDIR)\lsa_sp.obj"
	-@erase "$(INTDIR)\lsa_task.obj"
	-@erase "$(INTDIR)\lsa_us.obj"
	-@erase "$(INTDIR)\lsa_util.obj"
	-@erase "$(INTDIR)\lsw_main.obj"
	-@erase "$(INTDIR)\nasalf1x.obj"
	-@erase "$(INTDIR)\par_ambi.obj"
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
	-@erase "$(INTDIR)\phprint.obj"
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\voice.obj"
	-@erase "$(OUTDIR)\dtlkstat.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I ".\..\..\microsoft" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "FRENCH" /Fp"$(INTDIR)\dtlkstat.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dtlkstat.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\dtlkstat.lib" 
LIB32_OBJS= \
	"$(INTDIR)\acxf1c.obj" \
	"$(INTDIR)\brent.obj" \
	"$(INTDIR)\circuit.obj" \
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
	"$(INTDIR)\CRYPT2.OBJ" \
	"$(INTDIR)\Dbgwins.obj" \
	"$(INTDIR)\frame.obj" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
	"$(INTDIR)\llinit.obj" \
	"$(INTDIR)\loaddict.obj" \
	"$(INTDIR)\log10table.obj" \
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
	"$(INTDIR)\lsa_rtbi.obj" \
	"$(INTDIR)\lsa_rule.obj" \
	"$(INTDIR)\lsa_sl.obj" \
	"$(INTDIR)\lsa_sp.obj" \
	"$(INTDIR)\lsa_task.obj" \
	"$(INTDIR)\lsa_us.obj" \
	"$(INTDIR)\lsa_util.obj" \
	"$(INTDIR)\lsw_main.obj" \
	"$(INTDIR)\nasalf1x.obj" \
	"$(INTDIR)\par_ambi.obj" \
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
	"$(INTDIR)\phprint.obj" \
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\voice.obj"

"$(OUTDIR)\dtlkstat.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "DTLKSTAT - Win32 Debug French"

OUTDIR=.\..\build\dtlkstat\fr\debug
INTDIR=.\..\build\dtlkstat\fr\debug\link
# Begin Custom Macros
OutDir=.\..\build\dtlkstat\fr\debug
# End Custom Macros

ALL : "$(OUTDIR)\dtlkstat.lib"


CLEAN :
	-@erase "$(INTDIR)\acxf1c.obj"
	-@erase "$(INTDIR)\brent.obj"
	-@erase "$(INTDIR)\circuit.obj"
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
	-@erase "$(INTDIR)\CRYPT2.OBJ"
	-@erase "$(INTDIR)\Dbgwins.obj"
	-@erase "$(INTDIR)\frame.obj"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\inithl.obj"
	-@erase "$(INTDIR)\llinit.obj"
	-@erase "$(INTDIR)\loaddict.obj"
	-@erase "$(INTDIR)\log10table.obj"
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
	-@erase "$(INTDIR)\lsa_rtbi.obj"
	-@erase "$(INTDIR)\lsa_rule.obj"
	-@erase "$(INTDIR)\lsa_sl.obj"
	-@erase "$(INTDIR)\lsa_sp.obj"
	-@erase "$(INTDIR)\lsa_task.obj"
	-@erase "$(INTDIR)\lsa_us.obj"
	-@erase "$(INTDIR)\lsa_util.obj"
	-@erase "$(INTDIR)\lsw_main.obj"
	-@erase "$(INTDIR)\nasalf1x.obj"
	-@erase "$(INTDIR)\par_ambi.obj"
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
	-@erase "$(INTDIR)\phprint.obj"
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\voice.obj"
	-@erase "$(OUTDIR)\dtlkstat.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I ".\..\..\microsoft" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "FRENCH" /Fp"$(INTDIR)\dtlkstat.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dtlkstat.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\dtlkstat.lib" 
LIB32_OBJS= \
	"$(INTDIR)\acxf1c.obj" \
	"$(INTDIR)\brent.obj" \
	"$(INTDIR)\circuit.obj" \
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
	"$(INTDIR)\CRYPT2.OBJ" \
	"$(INTDIR)\Dbgwins.obj" \
	"$(INTDIR)\frame.obj" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
	"$(INTDIR)\llinit.obj" \
	"$(INTDIR)\loaddict.obj" \
	"$(INTDIR)\log10table.obj" \
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
	"$(INTDIR)\lsa_rtbi.obj" \
	"$(INTDIR)\lsa_rule.obj" \
	"$(INTDIR)\lsa_sl.obj" \
	"$(INTDIR)\lsa_sp.obj" \
	"$(INTDIR)\lsa_task.obj" \
	"$(INTDIR)\lsa_us.obj" \
	"$(INTDIR)\lsa_util.obj" \
	"$(INTDIR)\lsw_main.obj" \
	"$(INTDIR)\nasalf1x.obj" \
	"$(INTDIR)\par_ambi.obj" \
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
	"$(INTDIR)\phprint.obj" \
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\voice.obj"

"$(OUTDIR)\dtlkstat.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("dtlkstat.dep")
!INCLUDE "dtlkstat.dep"
!ELSE 
!MESSAGE Warning: cannot find "dtlkstat.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "DTLKSTAT - Win32 Release Spanish" || "$(CFG)" == "DTLKSTAT - Win32 Release German" || "$(CFG)" == "DTLKSTAT - Win32 Release" || "$(CFG)" == "DTLKSTAT - Win32 Debug" || "$(CFG)" == "DTLKSTAT - Win32 Debug Spanish" || "$(CFG)" == "DTLKSTAT - Win32 Debug German" || "$(CFG)" == "DTLKSTAT - Win32 Debug Latin American" || "$(CFG)" == "DTLKSTAT - Win32 Release Latin American" || "$(CFG)" == "DTLKSTAT - Win32 Release United Kingdom" || "$(CFG)" == "DTLKSTAT - Win32 Debug United Kingdom" || "$(CFG)" == "DTLKSTAT - Win32 Release French" || "$(CFG)" == "DTLKSTAT - Win32 Debug French"
SOURCE=.\hlsyn\acxf1c.c

"$(INTDIR)\acxf1c.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\hlsyn\brent.c

"$(INTDIR)\brent.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\hlsyn\circuit.c

"$(INTDIR)\circuit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Cmd\cm_char.c

"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Cmd\cm_cmd.c

"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Cmd\cm_copt.c

"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Cmd\cm_main.c

"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Cmd\cm_pars.c

"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Cmd\cm_phon.c

"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Cmd\cm_text.c

"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Cmd\cm_util.c

"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Cmd\Cmd_init.c

"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Cmd\cmd_wav.c

"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\API\CRYPT2.C

"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Nt\Dbgwins.c

"$(INTDIR)\Dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\hlsyn\frame.c

"$(INTDIR)\frame.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\hlsyn\hlframe.c

"$(INTDIR)\hlframe.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\hlsyn\inithl.c

"$(INTDIR)\inithl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\hlsyn\llinit.c

"$(INTDIR)\llinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Lts\loaddict.c

"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\hlsyn\log10table.c

"$(INTDIR)\log10table.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Lts\ls_chari.c

"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Lts\ls_dict.c

"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Lts\ls_homo.c

"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Lts\ls_math.c

"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Lts\ls_proc.c

"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Lts\ls_spel.c

"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Lts\ls_speli.c

"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Lts\ls_suff.c

"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Lts\ls_suffi.c

"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Lts\Lsa_adju.c

"$(INTDIR)\Lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Lts\lsa_coni.c

"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Lts\lsa_fr.c

"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Lts\lsa_gr.c

"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Lts\lsa_ir.c

"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Lts\lsa_it.c

"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Lts\lsa_ja.c

"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Lts\lsa_rtbi.c

"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Lts\lsa_rule.c

"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Lts\lsa_sl.c

"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Lts\lsa_sp.c

"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Lts\lsa_task.c

"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Lts\lsa_us.c

"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Lts\lsa_util.c

"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Lts\lsw_main.c

"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\hlsyn\nasalf1x.c

"$(INTDIR)\nasalf1x.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Cmd\par_ambi.c

"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Cmd\par_dict.c

"$(INTDIR)\par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Cmd\par_pars.c

"$(INTDIR)\par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Cmd\par_rule.c

"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Ph\ph_aloph.c

"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Ph\ph_claus.c

"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Ph\ph_draw.c

"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Ph\ph_drwt0.c

"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Ph\ph_inton.c

"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Ph\ph_main.c

"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Ph\ph_romi.c

"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Ph\ph_setar.c

"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Ph\ph_sort.c

"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Ph\ph_syl.c

"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Ph\ph_syntx.c

"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Ph\ph_task.c

"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Ph\ph_timng.c

"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Ph\ph_vdefi.c

"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Ph\ph_vset.c

"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Ph\phinit.c

"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Ph\phlog.c

"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\PH\phprint.c

"$(INTDIR)\phprint.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\hlsyn\reson.c

"$(INTDIR)\reson.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\hlsyn\sample.c

"$(INTDIR)\sample.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\hlsyn\sqrttable.c

"$(INTDIR)\sqrttable.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\API\ttsapi.c

"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\hlsyn\voice.c

"$(INTDIR)\voice.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)



!ENDIF 

