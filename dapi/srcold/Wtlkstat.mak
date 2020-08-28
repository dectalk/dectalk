# Microsoft Developer Studio Generated NMAKE File, Based on Wtlkstat.dsp
!IF "$(CFG)" == ""
CFG=wtlkstat - Win32 Debug French
!MESSAGE No configuration specified. Defaulting to wtlkstat - Win32 Debug French.
!ENDIF 

!IF "$(CFG)" != "wtlkstat - Win32 Release Spanish" && "$(CFG)" != "wtlkstat - Win32 Release German" && "$(CFG)" != "wtlkstat - Win32 Release Latin American" && "$(CFG)" != "wtlkstat - Win32 Debug Spanish" && "$(CFG)" != "wtlkstat - Win32 Debug German" && "$(CFG)" != "wtlkstat - Win32 Debug Latin American" && "$(CFG)" != "wtlkstat - Win32 Debug" && "$(CFG)" != "wtlkstat - Win32 Release" && "$(CFG)" != "wtlkstat - Win32 Release United Kingdom" && "$(CFG)" != "wtlkstat - Win32 Debug United Kingdom" && "$(CFG)" != "wtlkstat - Win32 Release French" && "$(CFG)" != "wtlkstat - Win32 Debug French"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "Wtlkstat.mak" CFG="wtlkstat - Win32 Debug French"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "wtlkstat - Win32 Release Spanish" (based on "Win32 (x86) Static Library")
!MESSAGE "wtlkstat - Win32 Release German" (based on "Win32 (x86) Static Library")
!MESSAGE "wtlkstat - Win32 Release Latin American" (based on "Win32 (x86) Static Library")
!MESSAGE "wtlkstat - Win32 Debug Spanish" (based on "Win32 (x86) Static Library")
!MESSAGE "wtlkstat - Win32 Debug German" (based on "Win32 (x86) Static Library")
!MESSAGE "wtlkstat - Win32 Debug Latin American" (based on "Win32 (x86) Static Library")
!MESSAGE "wtlkstat - Win32 Debug" (based on "Win32 (x86) Static Library")
!MESSAGE "wtlkstat - Win32 Release" (based on "Win32 (x86) Static Library")
!MESSAGE "wtlkstat - Win32 Release United Kingdom" (based on "Win32 (x86) Static Library")
!MESSAGE "wtlkstat - Win32 Debug United Kingdom" (based on "Win32 (x86) Static Library")
!MESSAGE "wtlkstat - Win32 Release French" (based on "Win32 (x86) Static Library")
!MESSAGE "wtlkstat - Win32 Debug French" (based on "Win32 (x86) Static Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"

OUTDIR=.\..\build\wtlkstat\sp\Release
INTDIR=.\..\build\wtlkstat\sp\Release\Link
# Begin Custom Macros
OutDir=.\..\build\wtlkstat\sp\Release
# End Custom Macros

ALL : "$(OUTDIR)\Wtlkstat.lib"


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
	-@erase "$(INTDIR)\Crypt2.obj"
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\diffuse.obj"
	-@erase "$(INTDIR)\fixfft32.obj"
	-@erase "$(INTDIR)\formtrak.obj"
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
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\Ttsapi.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\voice.obj"
	-@erase "$(INTDIR)\Vtm.obj"
	-@erase "$(OUTDIR)\Wtlkstat.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "NDEBUG" /D "i386" /D "SPANISH_SP" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "SPANISH" /Fp"$(INTDIR)\Wtlkstat.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wtlkstat.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\Wtlkstat.lib" 
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
	"$(INTDIR)\Crypt2.obj" \
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\diffuse.obj" \
	"$(INTDIR)\fixfft32.obj" \
	"$(INTDIR)\formtrak.obj" \
	"$(INTDIR)\frame.obj" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
	"$(INTDIR)\llinit.obj" \
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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\Ttsapi.obj" \
	"$(INTDIR)\voice.obj" \
	"$(INTDIR)\Vtm.obj" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\log10table.obj"

"$(OUTDIR)\Wtlkstat.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"

OUTDIR=.\..\build\wtlkstat\gr\Release
INTDIR=.\..\build\wtlkstat\gr\Release\Link
# Begin Custom Macros
OutDir=.\..\build\wtlkstat\gr\Release
# End Custom Macros

ALL : "$(OUTDIR)\Wtlkstat.lib"


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
	-@erase "$(INTDIR)\Crypt2.obj"
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\diffuse.obj"
	-@erase "$(INTDIR)\fixfft32.obj"
	-@erase "$(INTDIR)\formtrak.obj"
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
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\Ttsapi.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\voice.obj"
	-@erase "$(INTDIR)\Vtm.obj"
	-@erase "$(OUTDIR)\Wtlkstat.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "GERMAN" /Fp"$(INTDIR)\Wtlkstat.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /Zm200 /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wtlkstat.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\Wtlkstat.lib" 
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
	"$(INTDIR)\Crypt2.obj" \
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\diffuse.obj" \
	"$(INTDIR)\fixfft32.obj" \
	"$(INTDIR)\formtrak.obj" \
	"$(INTDIR)\frame.obj" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
	"$(INTDIR)\llinit.obj" \
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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\Ttsapi.obj" \
	"$(INTDIR)\voice.obj" \
	"$(INTDIR)\Vtm.obj" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\log10table.obj"

"$(OUTDIR)\Wtlkstat.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"

OUTDIR=.\..\build\wtlkstat\la\Release
INTDIR=.\..\build\wtlkstat\la\Release\Link
# Begin Custom Macros
OutDir=.\..\build\wtlkstat\la\Release
# End Custom Macros

ALL : "$(OUTDIR)\Wtlkstat.lib"


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
	-@erase "$(INTDIR)\Crypt2.obj"
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\diffuse.obj"
	-@erase "$(INTDIR)\fixfft32.obj"
	-@erase "$(INTDIR)\formtrak.obj"
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
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\Ttsapi.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\voice.obj"
	-@erase "$(INTDIR)\Vtm.obj"
	-@erase "$(OUTDIR)\Wtlkstat.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_LA" /Fp"$(INTDIR)\Wtlkstat.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wtlkstat.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\Wtlkstat.lib" 
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
	"$(INTDIR)\Crypt2.obj" \
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\diffuse.obj" \
	"$(INTDIR)\fixfft32.obj" \
	"$(INTDIR)\formtrak.obj" \
	"$(INTDIR)\frame.obj" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
	"$(INTDIR)\llinit.obj" \
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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\Ttsapi.obj" \
	"$(INTDIR)\voice.obj" \
	"$(INTDIR)\Vtm.obj" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\log10table.obj"

"$(OUTDIR)\Wtlkstat.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"

OUTDIR=.\..\build\wtlkstat\sp\debug
INTDIR=.\..\build\wtlkstat\sp\debug\Link
# Begin Custom Macros
OutDir=.\..\build\wtlkstat\sp\debug
# End Custom Macros

ALL : "$(OUTDIR)\Wtlkstat.lib" "$(OUTDIR)\Wtlkstat.bsc"


CLEAN :
	-@erase "$(INTDIR)\acxf1c.obj"
	-@erase "$(INTDIR)\acxf1c.sbr"
	-@erase "$(INTDIR)\brent.obj"
	-@erase "$(INTDIR)\brent.sbr"
	-@erase "$(INTDIR)\circuit.obj"
	-@erase "$(INTDIR)\circuit.sbr"
	-@erase "$(INTDIR)\cm_char.obj"
	-@erase "$(INTDIR)\cm_char.sbr"
	-@erase "$(INTDIR)\cm_cmd.obj"
	-@erase "$(INTDIR)\cm_cmd.sbr"
	-@erase "$(INTDIR)\cm_copt.obj"
	-@erase "$(INTDIR)\cm_copt.sbr"
	-@erase "$(INTDIR)\cm_main.obj"
	-@erase "$(INTDIR)\cm_main.sbr"
	-@erase "$(INTDIR)\cm_pars.obj"
	-@erase "$(INTDIR)\cm_pars.sbr"
	-@erase "$(INTDIR)\cm_phon.obj"
	-@erase "$(INTDIR)\cm_phon.sbr"
	-@erase "$(INTDIR)\cm_text.obj"
	-@erase "$(INTDIR)\cm_text.sbr"
	-@erase "$(INTDIR)\cm_util.obj"
	-@erase "$(INTDIR)\cm_util.sbr"
	-@erase "$(INTDIR)\Cmd_init.obj"
	-@erase "$(INTDIR)\Cmd_init.sbr"
	-@erase "$(INTDIR)\cmd_wav.obj"
	-@erase "$(INTDIR)\cmd_wav.sbr"
	-@erase "$(INTDIR)\Crypt2.obj"
	-@erase "$(INTDIR)\Crypt2.sbr"
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\dbgwins.sbr"
	-@erase "$(INTDIR)\diffuse.obj"
	-@erase "$(INTDIR)\diffuse.sbr"
	-@erase "$(INTDIR)\fixfft32.obj"
	-@erase "$(INTDIR)\fixfft32.sbr"
	-@erase "$(INTDIR)\formtrak.obj"
	-@erase "$(INTDIR)\formtrak.sbr"
	-@erase "$(INTDIR)\frame.obj"
	-@erase "$(INTDIR)\frame.sbr"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\hlframe.sbr"
	-@erase "$(INTDIR)\inithl.obj"
	-@erase "$(INTDIR)\inithl.sbr"
	-@erase "$(INTDIR)\llinit.obj"
	-@erase "$(INTDIR)\llinit.sbr"
	-@erase "$(INTDIR)\loaddict.obj"
	-@erase "$(INTDIR)\loaddict.sbr"
	-@erase "$(INTDIR)\log10table.obj"
	-@erase "$(INTDIR)\log10table.sbr"
	-@erase "$(INTDIR)\ls_chari.obj"
	-@erase "$(INTDIR)\ls_chari.sbr"
	-@erase "$(INTDIR)\ls_dict.obj"
	-@erase "$(INTDIR)\ls_dict.sbr"
	-@erase "$(INTDIR)\ls_homo.obj"
	-@erase "$(INTDIR)\ls_homo.sbr"
	-@erase "$(INTDIR)\ls_math.obj"
	-@erase "$(INTDIR)\ls_math.sbr"
	-@erase "$(INTDIR)\ls_proc.obj"
	-@erase "$(INTDIR)\ls_proc.sbr"
	-@erase "$(INTDIR)\ls_spel.obj"
	-@erase "$(INTDIR)\ls_spel.sbr"
	-@erase "$(INTDIR)\ls_speli.obj"
	-@erase "$(INTDIR)\ls_speli.sbr"
	-@erase "$(INTDIR)\ls_suff.obj"
	-@erase "$(INTDIR)\ls_suff.sbr"
	-@erase "$(INTDIR)\ls_suffi.obj"
	-@erase "$(INTDIR)\ls_suffi.sbr"
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
	-@erase "$(INTDIR)\lsa_rtbi.obj"
	-@erase "$(INTDIR)\lsa_rtbi.sbr"
	-@erase "$(INTDIR)\lsa_rule.obj"
	-@erase "$(INTDIR)\lsa_rule.sbr"
	-@erase "$(INTDIR)\lsa_sl.obj"
	-@erase "$(INTDIR)\lsa_sl.sbr"
	-@erase "$(INTDIR)\lsa_sp.obj"
	-@erase "$(INTDIR)\lsa_sp.sbr"
	-@erase "$(INTDIR)\lsa_task.obj"
	-@erase "$(INTDIR)\lsa_task.sbr"
	-@erase "$(INTDIR)\lsa_us.obj"
	-@erase "$(INTDIR)\lsa_us.sbr"
	-@erase "$(INTDIR)\lsa_util.obj"
	-@erase "$(INTDIR)\lsa_util.sbr"
	-@erase "$(INTDIR)\lsw_main.obj"
	-@erase "$(INTDIR)\lsw_main.sbr"
	-@erase "$(INTDIR)\nasalf1x.obj"
	-@erase "$(INTDIR)\nasalf1x.sbr"
	-@erase "$(INTDIR)\par_ambi.obj"
	-@erase "$(INTDIR)\par_ambi.sbr"
	-@erase "$(INTDIR)\par_dict.obj"
	-@erase "$(INTDIR)\par_dict.sbr"
	-@erase "$(INTDIR)\par_pars.obj"
	-@erase "$(INTDIR)\par_pars.sbr"
	-@erase "$(INTDIR)\par_rule.obj"
	-@erase "$(INTDIR)\par_rule.sbr"
	-@erase "$(INTDIR)\ph_aloph.obj"
	-@erase "$(INTDIR)\ph_aloph.sbr"
	-@erase "$(INTDIR)\ph_claus.obj"
	-@erase "$(INTDIR)\ph_claus.sbr"
	-@erase "$(INTDIR)\ph_draw.obj"
	-@erase "$(INTDIR)\ph_draw.sbr"
	-@erase "$(INTDIR)\ph_drwt0.obj"
	-@erase "$(INTDIR)\ph_drwt0.sbr"
	-@erase "$(INTDIR)\ph_inton.obj"
	-@erase "$(INTDIR)\ph_inton.sbr"
	-@erase "$(INTDIR)\ph_main.obj"
	-@erase "$(INTDIR)\ph_main.sbr"
	-@erase "$(INTDIR)\ph_romi.obj"
	-@erase "$(INTDIR)\ph_romi.sbr"
	-@erase "$(INTDIR)\ph_setar.obj"
	-@erase "$(INTDIR)\ph_setar.sbr"
	-@erase "$(INTDIR)\ph_sort.obj"
	-@erase "$(INTDIR)\ph_sort.sbr"
	-@erase "$(INTDIR)\ph_syl.obj"
	-@erase "$(INTDIR)\ph_syl.sbr"
	-@erase "$(INTDIR)\ph_syntx.obj"
	-@erase "$(INTDIR)\ph_syntx.sbr"
	-@erase "$(INTDIR)\ph_task.obj"
	-@erase "$(INTDIR)\ph_task.sbr"
	-@erase "$(INTDIR)\ph_timng.obj"
	-@erase "$(INTDIR)\ph_timng.sbr"
	-@erase "$(INTDIR)\ph_vdefi.obj"
	-@erase "$(INTDIR)\ph_vdefi.sbr"
	-@erase "$(INTDIR)\ph_vset.obj"
	-@erase "$(INTDIR)\ph_vset.sbr"
	-@erase "$(INTDIR)\phinit.obj"
	-@erase "$(INTDIR)\phinit.sbr"
	-@erase "$(INTDIR)\phlog.obj"
	-@erase "$(INTDIR)\phlog.sbr"
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\reson.sbr"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\sample.sbr"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\sqrttable.sbr"
	-@erase "$(INTDIR)\Ttsapi.obj"
	-@erase "$(INTDIR)\Ttsapi.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\voice.obj"
	-@erase "$(INTDIR)\voice.sbr"
	-@erase "$(INTDIR)\Vtm.obj"
	-@erase "$(INTDIR)\Vtm.sbr"
	-@erase "$(OUTDIR)\Wtlkstat.bsc"
	-@erase "$(OUTDIR)\Wtlkstat.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "_DEBUG" /D "i386" /D "PRINTFDEBUG" /D "WIN32" /D "_WINDOWS" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_SP" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wtlkstat.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wtlkstat.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\acxf1c.sbr" \
	"$(INTDIR)\brent.sbr" \
	"$(INTDIR)\circuit.sbr" \
	"$(INTDIR)\cm_char.sbr" \
	"$(INTDIR)\cm_cmd.sbr" \
	"$(INTDIR)\cm_copt.sbr" \
	"$(INTDIR)\cm_main.sbr" \
	"$(INTDIR)\cm_pars.sbr" \
	"$(INTDIR)\cm_phon.sbr" \
	"$(INTDIR)\cm_text.sbr" \
	"$(INTDIR)\cm_util.sbr" \
	"$(INTDIR)\Cmd_init.sbr" \
	"$(INTDIR)\cmd_wav.sbr" \
	"$(INTDIR)\Crypt2.sbr" \
	"$(INTDIR)\dbgwins.sbr" \
	"$(INTDIR)\diffuse.sbr" \
	"$(INTDIR)\fixfft32.sbr" \
	"$(INTDIR)\formtrak.sbr" \
	"$(INTDIR)\frame.sbr" \
	"$(INTDIR)\hlframe.sbr" \
	"$(INTDIR)\inithl.sbr" \
	"$(INTDIR)\llinit.sbr" \
	"$(INTDIR)\loaddict.sbr" \
	"$(INTDIR)\ls_chari.sbr" \
	"$(INTDIR)\ls_dict.sbr" \
	"$(INTDIR)\ls_homo.sbr" \
	"$(INTDIR)\ls_math.sbr" \
	"$(INTDIR)\ls_proc.sbr" \
	"$(INTDIR)\ls_spel.sbr" \
	"$(INTDIR)\ls_speli.sbr" \
	"$(INTDIR)\ls_suff.sbr" \
	"$(INTDIR)\ls_suffi.sbr" \
	"$(INTDIR)\Lsa_adju.sbr" \
	"$(INTDIR)\lsa_coni.sbr" \
	"$(INTDIR)\lsa_fr.sbr" \
	"$(INTDIR)\lsa_gr.sbr" \
	"$(INTDIR)\lsa_ir.sbr" \
	"$(INTDIR)\lsa_it.sbr" \
	"$(INTDIR)\lsa_ja.sbr" \
	"$(INTDIR)\lsa_rtbi.sbr" \
	"$(INTDIR)\lsa_rule.sbr" \
	"$(INTDIR)\lsa_sl.sbr" \
	"$(INTDIR)\lsa_sp.sbr" \
	"$(INTDIR)\lsa_task.sbr" \
	"$(INTDIR)\lsa_us.sbr" \
	"$(INTDIR)\lsa_util.sbr" \
	"$(INTDIR)\lsw_main.sbr" \
	"$(INTDIR)\nasalf1x.sbr" \
	"$(INTDIR)\par_ambi.sbr" \
	"$(INTDIR)\par_dict.sbr" \
	"$(INTDIR)\par_pars.sbr" \
	"$(INTDIR)\par_rule.sbr" \
	"$(INTDIR)\ph_aloph.sbr" \
	"$(INTDIR)\ph_claus.sbr" \
	"$(INTDIR)\ph_draw.sbr" \
	"$(INTDIR)\ph_drwt0.sbr" \
	"$(INTDIR)\ph_inton.sbr" \
	"$(INTDIR)\ph_main.sbr" \
	"$(INTDIR)\ph_romi.sbr" \
	"$(INTDIR)\ph_setar.sbr" \
	"$(INTDIR)\ph_sort.sbr" \
	"$(INTDIR)\ph_syl.sbr" \
	"$(INTDIR)\ph_syntx.sbr" \
	"$(INTDIR)\ph_task.sbr" \
	"$(INTDIR)\ph_timng.sbr" \
	"$(INTDIR)\ph_vdefi.sbr" \
	"$(INTDIR)\ph_vset.sbr" \
	"$(INTDIR)\phinit.sbr" \
	"$(INTDIR)\phlog.sbr" \
	"$(INTDIR)\reson.sbr" \
	"$(INTDIR)\sample.sbr" \
	"$(INTDIR)\Ttsapi.sbr" \
	"$(INTDIR)\voice.sbr" \
	"$(INTDIR)\Vtm.sbr" \
	"$(INTDIR)\sqrttable.sbr" \
	"$(INTDIR)\log10table.sbr"

"$(OUTDIR)\Wtlkstat.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\Wtlkstat.lib" 
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
	"$(INTDIR)\Crypt2.obj" \
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\diffuse.obj" \
	"$(INTDIR)\fixfft32.obj" \
	"$(INTDIR)\formtrak.obj" \
	"$(INTDIR)\frame.obj" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
	"$(INTDIR)\llinit.obj" \
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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\Ttsapi.obj" \
	"$(INTDIR)\voice.obj" \
	"$(INTDIR)\Vtm.obj" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\log10table.obj"

"$(OUTDIR)\Wtlkstat.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"

OUTDIR=.\..\build\wtlkstat\gr\debug
INTDIR=.\..\build\wtlkstat\gr\debug\Link
# Begin Custom Macros
OutDir=.\..\build\wtlkstat\gr\debug
# End Custom Macros

ALL : "$(OUTDIR)\Wtlkstat.lib" "$(OUTDIR)\Wtlkstat.bsc"


CLEAN :
	-@erase "$(INTDIR)\acxf1c.obj"
	-@erase "$(INTDIR)\acxf1c.sbr"
	-@erase "$(INTDIR)\brent.obj"
	-@erase "$(INTDIR)\brent.sbr"
	-@erase "$(INTDIR)\circuit.obj"
	-@erase "$(INTDIR)\circuit.sbr"
	-@erase "$(INTDIR)\cm_char.obj"
	-@erase "$(INTDIR)\cm_char.sbr"
	-@erase "$(INTDIR)\cm_cmd.obj"
	-@erase "$(INTDIR)\cm_cmd.sbr"
	-@erase "$(INTDIR)\cm_copt.obj"
	-@erase "$(INTDIR)\cm_copt.sbr"
	-@erase "$(INTDIR)\cm_main.obj"
	-@erase "$(INTDIR)\cm_main.sbr"
	-@erase "$(INTDIR)\cm_pars.obj"
	-@erase "$(INTDIR)\cm_pars.sbr"
	-@erase "$(INTDIR)\cm_phon.obj"
	-@erase "$(INTDIR)\cm_phon.sbr"
	-@erase "$(INTDIR)\cm_text.obj"
	-@erase "$(INTDIR)\cm_text.sbr"
	-@erase "$(INTDIR)\cm_util.obj"
	-@erase "$(INTDIR)\cm_util.sbr"
	-@erase "$(INTDIR)\Cmd_init.obj"
	-@erase "$(INTDIR)\Cmd_init.sbr"
	-@erase "$(INTDIR)\cmd_wav.obj"
	-@erase "$(INTDIR)\cmd_wav.sbr"
	-@erase "$(INTDIR)\Crypt2.obj"
	-@erase "$(INTDIR)\Crypt2.sbr"
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\dbgwins.sbr"
	-@erase "$(INTDIR)\diffuse.obj"
	-@erase "$(INTDIR)\diffuse.sbr"
	-@erase "$(INTDIR)\fixfft32.obj"
	-@erase "$(INTDIR)\fixfft32.sbr"
	-@erase "$(INTDIR)\formtrak.obj"
	-@erase "$(INTDIR)\formtrak.sbr"
	-@erase "$(INTDIR)\frame.obj"
	-@erase "$(INTDIR)\frame.sbr"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\hlframe.sbr"
	-@erase "$(INTDIR)\inithl.obj"
	-@erase "$(INTDIR)\inithl.sbr"
	-@erase "$(INTDIR)\llinit.obj"
	-@erase "$(INTDIR)\llinit.sbr"
	-@erase "$(INTDIR)\loaddict.obj"
	-@erase "$(INTDIR)\loaddict.sbr"
	-@erase "$(INTDIR)\log10table.obj"
	-@erase "$(INTDIR)\log10table.sbr"
	-@erase "$(INTDIR)\ls_chari.obj"
	-@erase "$(INTDIR)\ls_chari.sbr"
	-@erase "$(INTDIR)\ls_dict.obj"
	-@erase "$(INTDIR)\ls_dict.sbr"
	-@erase "$(INTDIR)\ls_homo.obj"
	-@erase "$(INTDIR)\ls_homo.sbr"
	-@erase "$(INTDIR)\ls_math.obj"
	-@erase "$(INTDIR)\ls_math.sbr"
	-@erase "$(INTDIR)\ls_proc.obj"
	-@erase "$(INTDIR)\ls_proc.sbr"
	-@erase "$(INTDIR)\ls_spel.obj"
	-@erase "$(INTDIR)\ls_spel.sbr"
	-@erase "$(INTDIR)\ls_speli.obj"
	-@erase "$(INTDIR)\ls_speli.sbr"
	-@erase "$(INTDIR)\ls_suff.obj"
	-@erase "$(INTDIR)\ls_suff.sbr"
	-@erase "$(INTDIR)\ls_suffi.obj"
	-@erase "$(INTDIR)\ls_suffi.sbr"
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
	-@erase "$(INTDIR)\lsa_rtbi.obj"
	-@erase "$(INTDIR)\lsa_rtbi.sbr"
	-@erase "$(INTDIR)\lsa_rule.obj"
	-@erase "$(INTDIR)\lsa_rule.sbr"
	-@erase "$(INTDIR)\lsa_sl.obj"
	-@erase "$(INTDIR)\lsa_sl.sbr"
	-@erase "$(INTDIR)\lsa_sp.obj"
	-@erase "$(INTDIR)\lsa_sp.sbr"
	-@erase "$(INTDIR)\lsa_task.obj"
	-@erase "$(INTDIR)\lsa_task.sbr"
	-@erase "$(INTDIR)\lsa_us.obj"
	-@erase "$(INTDIR)\lsa_us.sbr"
	-@erase "$(INTDIR)\lsa_util.obj"
	-@erase "$(INTDIR)\lsa_util.sbr"
	-@erase "$(INTDIR)\lsw_main.obj"
	-@erase "$(INTDIR)\lsw_main.sbr"
	-@erase "$(INTDIR)\nasalf1x.obj"
	-@erase "$(INTDIR)\nasalf1x.sbr"
	-@erase "$(INTDIR)\par_ambi.obj"
	-@erase "$(INTDIR)\par_ambi.sbr"
	-@erase "$(INTDIR)\par_dict.obj"
	-@erase "$(INTDIR)\par_dict.sbr"
	-@erase "$(INTDIR)\par_pars.obj"
	-@erase "$(INTDIR)\par_pars.sbr"
	-@erase "$(INTDIR)\par_rule.obj"
	-@erase "$(INTDIR)\par_rule.sbr"
	-@erase "$(INTDIR)\ph_aloph.obj"
	-@erase "$(INTDIR)\ph_aloph.sbr"
	-@erase "$(INTDIR)\ph_claus.obj"
	-@erase "$(INTDIR)\ph_claus.sbr"
	-@erase "$(INTDIR)\ph_draw.obj"
	-@erase "$(INTDIR)\ph_draw.sbr"
	-@erase "$(INTDIR)\ph_drwt0.obj"
	-@erase "$(INTDIR)\ph_drwt0.sbr"
	-@erase "$(INTDIR)\ph_inton.obj"
	-@erase "$(INTDIR)\ph_inton.sbr"
	-@erase "$(INTDIR)\ph_main.obj"
	-@erase "$(INTDIR)\ph_main.sbr"
	-@erase "$(INTDIR)\ph_romi.obj"
	-@erase "$(INTDIR)\ph_romi.sbr"
	-@erase "$(INTDIR)\ph_setar.obj"
	-@erase "$(INTDIR)\ph_setar.sbr"
	-@erase "$(INTDIR)\ph_sort.obj"
	-@erase "$(INTDIR)\ph_sort.sbr"
	-@erase "$(INTDIR)\ph_syl.obj"
	-@erase "$(INTDIR)\ph_syl.sbr"
	-@erase "$(INTDIR)\ph_syntx.obj"
	-@erase "$(INTDIR)\ph_syntx.sbr"
	-@erase "$(INTDIR)\ph_task.obj"
	-@erase "$(INTDIR)\ph_task.sbr"
	-@erase "$(INTDIR)\ph_timng.obj"
	-@erase "$(INTDIR)\ph_timng.sbr"
	-@erase "$(INTDIR)\ph_vdefi.obj"
	-@erase "$(INTDIR)\ph_vdefi.sbr"
	-@erase "$(INTDIR)\ph_vset.obj"
	-@erase "$(INTDIR)\ph_vset.sbr"
	-@erase "$(INTDIR)\phinit.obj"
	-@erase "$(INTDIR)\phinit.sbr"
	-@erase "$(INTDIR)\phlog.obj"
	-@erase "$(INTDIR)\phlog.sbr"
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\reson.sbr"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\sample.sbr"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\sqrttable.sbr"
	-@erase "$(INTDIR)\Ttsapi.obj"
	-@erase "$(INTDIR)\Ttsapi.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\voice.obj"
	-@erase "$(INTDIR)\voice.sbr"
	-@erase "$(INTDIR)\Vtm.obj"
	-@erase "$(INTDIR)\Vtm.sbr"
	-@erase "$(OUTDIR)\Wtlkstat.bsc"
	-@erase "$(OUTDIR)\Wtlkstat.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "WILLOWPOND" /D "GERMAN" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wtlkstat.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /Zm200 /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wtlkstat.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\acxf1c.sbr" \
	"$(INTDIR)\brent.sbr" \
	"$(INTDIR)\circuit.sbr" \
	"$(INTDIR)\cm_char.sbr" \
	"$(INTDIR)\cm_cmd.sbr" \
	"$(INTDIR)\cm_copt.sbr" \
	"$(INTDIR)\cm_main.sbr" \
	"$(INTDIR)\cm_pars.sbr" \
	"$(INTDIR)\cm_phon.sbr" \
	"$(INTDIR)\cm_text.sbr" \
	"$(INTDIR)\cm_util.sbr" \
	"$(INTDIR)\Cmd_init.sbr" \
	"$(INTDIR)\cmd_wav.sbr" \
	"$(INTDIR)\Crypt2.sbr" \
	"$(INTDIR)\dbgwins.sbr" \
	"$(INTDIR)\diffuse.sbr" \
	"$(INTDIR)\fixfft32.sbr" \
	"$(INTDIR)\formtrak.sbr" \
	"$(INTDIR)\frame.sbr" \
	"$(INTDIR)\hlframe.sbr" \
	"$(INTDIR)\inithl.sbr" \
	"$(INTDIR)\llinit.sbr" \
	"$(INTDIR)\loaddict.sbr" \
	"$(INTDIR)\ls_chari.sbr" \
	"$(INTDIR)\ls_dict.sbr" \
	"$(INTDIR)\ls_homo.sbr" \
	"$(INTDIR)\ls_math.sbr" \
	"$(INTDIR)\ls_proc.sbr" \
	"$(INTDIR)\ls_spel.sbr" \
	"$(INTDIR)\ls_speli.sbr" \
	"$(INTDIR)\ls_suff.sbr" \
	"$(INTDIR)\ls_suffi.sbr" \
	"$(INTDIR)\Lsa_adju.sbr" \
	"$(INTDIR)\lsa_coni.sbr" \
	"$(INTDIR)\lsa_fr.sbr" \
	"$(INTDIR)\lsa_gr.sbr" \
	"$(INTDIR)\lsa_ir.sbr" \
	"$(INTDIR)\lsa_it.sbr" \
	"$(INTDIR)\lsa_ja.sbr" \
	"$(INTDIR)\lsa_rtbi.sbr" \
	"$(INTDIR)\lsa_rule.sbr" \
	"$(INTDIR)\lsa_sl.sbr" \
	"$(INTDIR)\lsa_sp.sbr" \
	"$(INTDIR)\lsa_task.sbr" \
	"$(INTDIR)\lsa_us.sbr" \
	"$(INTDIR)\lsa_util.sbr" \
	"$(INTDIR)\lsw_main.sbr" \
	"$(INTDIR)\nasalf1x.sbr" \
	"$(INTDIR)\par_ambi.sbr" \
	"$(INTDIR)\par_dict.sbr" \
	"$(INTDIR)\par_pars.sbr" \
	"$(INTDIR)\par_rule.sbr" \
	"$(INTDIR)\ph_aloph.sbr" \
	"$(INTDIR)\ph_claus.sbr" \
	"$(INTDIR)\ph_draw.sbr" \
	"$(INTDIR)\ph_drwt0.sbr" \
	"$(INTDIR)\ph_inton.sbr" \
	"$(INTDIR)\ph_main.sbr" \
	"$(INTDIR)\ph_romi.sbr" \
	"$(INTDIR)\ph_setar.sbr" \
	"$(INTDIR)\ph_sort.sbr" \
	"$(INTDIR)\ph_syl.sbr" \
	"$(INTDIR)\ph_syntx.sbr" \
	"$(INTDIR)\ph_task.sbr" \
	"$(INTDIR)\ph_timng.sbr" \
	"$(INTDIR)\ph_vdefi.sbr" \
	"$(INTDIR)\ph_vset.sbr" \
	"$(INTDIR)\phinit.sbr" \
	"$(INTDIR)\phlog.sbr" \
	"$(INTDIR)\reson.sbr" \
	"$(INTDIR)\sample.sbr" \
	"$(INTDIR)\Ttsapi.sbr" \
	"$(INTDIR)\voice.sbr" \
	"$(INTDIR)\Vtm.sbr" \
	"$(INTDIR)\sqrttable.sbr" \
	"$(INTDIR)\log10table.sbr"

"$(OUTDIR)\Wtlkstat.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\Wtlkstat.lib" 
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
	"$(INTDIR)\Crypt2.obj" \
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\diffuse.obj" \
	"$(INTDIR)\fixfft32.obj" \
	"$(INTDIR)\formtrak.obj" \
	"$(INTDIR)\frame.obj" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
	"$(INTDIR)\llinit.obj" \
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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\Ttsapi.obj" \
	"$(INTDIR)\voice.obj" \
	"$(INTDIR)\Vtm.obj" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\log10table.obj"

"$(OUTDIR)\Wtlkstat.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"

OUTDIR=.\..\build\wtlkstat\la\debug
INTDIR=.\..\build\wtlkstat\la\debug\Link
# Begin Custom Macros
OutDir=.\..\build\wtlkstat\la\debug
# End Custom Macros

ALL : "$(OUTDIR)\Wtlkstat.lib" "$(OUTDIR)\Wtlkstat.bsc"


CLEAN :
	-@erase "$(INTDIR)\acxf1c.obj"
	-@erase "$(INTDIR)\acxf1c.sbr"
	-@erase "$(INTDIR)\brent.obj"
	-@erase "$(INTDIR)\brent.sbr"
	-@erase "$(INTDIR)\circuit.obj"
	-@erase "$(INTDIR)\circuit.sbr"
	-@erase "$(INTDIR)\cm_char.obj"
	-@erase "$(INTDIR)\cm_char.sbr"
	-@erase "$(INTDIR)\cm_cmd.obj"
	-@erase "$(INTDIR)\cm_cmd.sbr"
	-@erase "$(INTDIR)\cm_copt.obj"
	-@erase "$(INTDIR)\cm_copt.sbr"
	-@erase "$(INTDIR)\cm_main.obj"
	-@erase "$(INTDIR)\cm_main.sbr"
	-@erase "$(INTDIR)\cm_pars.obj"
	-@erase "$(INTDIR)\cm_pars.sbr"
	-@erase "$(INTDIR)\cm_phon.obj"
	-@erase "$(INTDIR)\cm_phon.sbr"
	-@erase "$(INTDIR)\cm_text.obj"
	-@erase "$(INTDIR)\cm_text.sbr"
	-@erase "$(INTDIR)\cm_util.obj"
	-@erase "$(INTDIR)\cm_util.sbr"
	-@erase "$(INTDIR)\Cmd_init.obj"
	-@erase "$(INTDIR)\Cmd_init.sbr"
	-@erase "$(INTDIR)\cmd_wav.obj"
	-@erase "$(INTDIR)\cmd_wav.sbr"
	-@erase "$(INTDIR)\Crypt2.obj"
	-@erase "$(INTDIR)\Crypt2.sbr"
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\dbgwins.sbr"
	-@erase "$(INTDIR)\diffuse.obj"
	-@erase "$(INTDIR)\diffuse.sbr"
	-@erase "$(INTDIR)\fixfft32.obj"
	-@erase "$(INTDIR)\fixfft32.sbr"
	-@erase "$(INTDIR)\formtrak.obj"
	-@erase "$(INTDIR)\formtrak.sbr"
	-@erase "$(INTDIR)\frame.obj"
	-@erase "$(INTDIR)\frame.sbr"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\hlframe.sbr"
	-@erase "$(INTDIR)\inithl.obj"
	-@erase "$(INTDIR)\inithl.sbr"
	-@erase "$(INTDIR)\llinit.obj"
	-@erase "$(INTDIR)\llinit.sbr"
	-@erase "$(INTDIR)\loaddict.obj"
	-@erase "$(INTDIR)\loaddict.sbr"
	-@erase "$(INTDIR)\log10table.obj"
	-@erase "$(INTDIR)\log10table.sbr"
	-@erase "$(INTDIR)\ls_chari.obj"
	-@erase "$(INTDIR)\ls_chari.sbr"
	-@erase "$(INTDIR)\ls_dict.obj"
	-@erase "$(INTDIR)\ls_dict.sbr"
	-@erase "$(INTDIR)\ls_homo.obj"
	-@erase "$(INTDIR)\ls_homo.sbr"
	-@erase "$(INTDIR)\ls_math.obj"
	-@erase "$(INTDIR)\ls_math.sbr"
	-@erase "$(INTDIR)\ls_proc.obj"
	-@erase "$(INTDIR)\ls_proc.sbr"
	-@erase "$(INTDIR)\ls_spel.obj"
	-@erase "$(INTDIR)\ls_spel.sbr"
	-@erase "$(INTDIR)\ls_speli.obj"
	-@erase "$(INTDIR)\ls_speli.sbr"
	-@erase "$(INTDIR)\ls_suff.obj"
	-@erase "$(INTDIR)\ls_suff.sbr"
	-@erase "$(INTDIR)\ls_suffi.obj"
	-@erase "$(INTDIR)\ls_suffi.sbr"
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
	-@erase "$(INTDIR)\lsa_rtbi.obj"
	-@erase "$(INTDIR)\lsa_rtbi.sbr"
	-@erase "$(INTDIR)\lsa_rule.obj"
	-@erase "$(INTDIR)\lsa_rule.sbr"
	-@erase "$(INTDIR)\lsa_sl.obj"
	-@erase "$(INTDIR)\lsa_sl.sbr"
	-@erase "$(INTDIR)\lsa_sp.obj"
	-@erase "$(INTDIR)\lsa_sp.sbr"
	-@erase "$(INTDIR)\lsa_task.obj"
	-@erase "$(INTDIR)\lsa_task.sbr"
	-@erase "$(INTDIR)\lsa_us.obj"
	-@erase "$(INTDIR)\lsa_us.sbr"
	-@erase "$(INTDIR)\lsa_util.obj"
	-@erase "$(INTDIR)\lsa_util.sbr"
	-@erase "$(INTDIR)\lsw_main.obj"
	-@erase "$(INTDIR)\lsw_main.sbr"
	-@erase "$(INTDIR)\nasalf1x.obj"
	-@erase "$(INTDIR)\nasalf1x.sbr"
	-@erase "$(INTDIR)\par_ambi.obj"
	-@erase "$(INTDIR)\par_ambi.sbr"
	-@erase "$(INTDIR)\par_dict.obj"
	-@erase "$(INTDIR)\par_dict.sbr"
	-@erase "$(INTDIR)\par_pars.obj"
	-@erase "$(INTDIR)\par_pars.sbr"
	-@erase "$(INTDIR)\par_rule.obj"
	-@erase "$(INTDIR)\par_rule.sbr"
	-@erase "$(INTDIR)\ph_aloph.obj"
	-@erase "$(INTDIR)\ph_aloph.sbr"
	-@erase "$(INTDIR)\ph_claus.obj"
	-@erase "$(INTDIR)\ph_claus.sbr"
	-@erase "$(INTDIR)\ph_draw.obj"
	-@erase "$(INTDIR)\ph_draw.sbr"
	-@erase "$(INTDIR)\ph_drwt0.obj"
	-@erase "$(INTDIR)\ph_drwt0.sbr"
	-@erase "$(INTDIR)\ph_inton.obj"
	-@erase "$(INTDIR)\ph_inton.sbr"
	-@erase "$(INTDIR)\ph_main.obj"
	-@erase "$(INTDIR)\ph_main.sbr"
	-@erase "$(INTDIR)\ph_romi.obj"
	-@erase "$(INTDIR)\ph_romi.sbr"
	-@erase "$(INTDIR)\ph_setar.obj"
	-@erase "$(INTDIR)\ph_setar.sbr"
	-@erase "$(INTDIR)\ph_sort.obj"
	-@erase "$(INTDIR)\ph_sort.sbr"
	-@erase "$(INTDIR)\ph_syl.obj"
	-@erase "$(INTDIR)\ph_syl.sbr"
	-@erase "$(INTDIR)\ph_syntx.obj"
	-@erase "$(INTDIR)\ph_syntx.sbr"
	-@erase "$(INTDIR)\ph_task.obj"
	-@erase "$(INTDIR)\ph_task.sbr"
	-@erase "$(INTDIR)\ph_timng.obj"
	-@erase "$(INTDIR)\ph_timng.sbr"
	-@erase "$(INTDIR)\ph_vdefi.obj"
	-@erase "$(INTDIR)\ph_vdefi.sbr"
	-@erase "$(INTDIR)\ph_vset.obj"
	-@erase "$(INTDIR)\ph_vset.sbr"
	-@erase "$(INTDIR)\phinit.obj"
	-@erase "$(INTDIR)\phinit.sbr"
	-@erase "$(INTDIR)\phlog.obj"
	-@erase "$(INTDIR)\phlog.sbr"
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\reson.sbr"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\sample.sbr"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\sqrttable.sbr"
	-@erase "$(INTDIR)\Ttsapi.obj"
	-@erase "$(INTDIR)\Ttsapi.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\voice.obj"
	-@erase "$(INTDIR)\voice.sbr"
	-@erase "$(INTDIR)\Vtm.obj"
	-@erase "$(INTDIR)\Vtm.sbr"
	-@erase "$(OUTDIR)\Wtlkstat.bsc"
	-@erase "$(OUTDIR)\Wtlkstat.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "WILLOWPOND" /D "SPANISH" /D "SPANISH_LA" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wtlkstat.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wtlkstat.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\acxf1c.sbr" \
	"$(INTDIR)\brent.sbr" \
	"$(INTDIR)\circuit.sbr" \
	"$(INTDIR)\cm_char.sbr" \
	"$(INTDIR)\cm_cmd.sbr" \
	"$(INTDIR)\cm_copt.sbr" \
	"$(INTDIR)\cm_main.sbr" \
	"$(INTDIR)\cm_pars.sbr" \
	"$(INTDIR)\cm_phon.sbr" \
	"$(INTDIR)\cm_text.sbr" \
	"$(INTDIR)\cm_util.sbr" \
	"$(INTDIR)\Cmd_init.sbr" \
	"$(INTDIR)\cmd_wav.sbr" \
	"$(INTDIR)\Crypt2.sbr" \
	"$(INTDIR)\dbgwins.sbr" \
	"$(INTDIR)\diffuse.sbr" \
	"$(INTDIR)\fixfft32.sbr" \
	"$(INTDIR)\formtrak.sbr" \
	"$(INTDIR)\frame.sbr" \
	"$(INTDIR)\hlframe.sbr" \
	"$(INTDIR)\inithl.sbr" \
	"$(INTDIR)\llinit.sbr" \
	"$(INTDIR)\loaddict.sbr" \
	"$(INTDIR)\ls_chari.sbr" \
	"$(INTDIR)\ls_dict.sbr" \
	"$(INTDIR)\ls_homo.sbr" \
	"$(INTDIR)\ls_math.sbr" \
	"$(INTDIR)\ls_proc.sbr" \
	"$(INTDIR)\ls_spel.sbr" \
	"$(INTDIR)\ls_speli.sbr" \
	"$(INTDIR)\ls_suff.sbr" \
	"$(INTDIR)\ls_suffi.sbr" \
	"$(INTDIR)\Lsa_adju.sbr" \
	"$(INTDIR)\lsa_coni.sbr" \
	"$(INTDIR)\lsa_fr.sbr" \
	"$(INTDIR)\lsa_gr.sbr" \
	"$(INTDIR)\lsa_ir.sbr" \
	"$(INTDIR)\lsa_it.sbr" \
	"$(INTDIR)\lsa_ja.sbr" \
	"$(INTDIR)\lsa_rtbi.sbr" \
	"$(INTDIR)\lsa_rule.sbr" \
	"$(INTDIR)\lsa_sl.sbr" \
	"$(INTDIR)\lsa_sp.sbr" \
	"$(INTDIR)\lsa_task.sbr" \
	"$(INTDIR)\lsa_us.sbr" \
	"$(INTDIR)\lsa_util.sbr" \
	"$(INTDIR)\lsw_main.sbr" \
	"$(INTDIR)\nasalf1x.sbr" \
	"$(INTDIR)\par_ambi.sbr" \
	"$(INTDIR)\par_dict.sbr" \
	"$(INTDIR)\par_pars.sbr" \
	"$(INTDIR)\par_rule.sbr" \
	"$(INTDIR)\ph_aloph.sbr" \
	"$(INTDIR)\ph_claus.sbr" \
	"$(INTDIR)\ph_draw.sbr" \
	"$(INTDIR)\ph_drwt0.sbr" \
	"$(INTDIR)\ph_inton.sbr" \
	"$(INTDIR)\ph_main.sbr" \
	"$(INTDIR)\ph_romi.sbr" \
	"$(INTDIR)\ph_setar.sbr" \
	"$(INTDIR)\ph_sort.sbr" \
	"$(INTDIR)\ph_syl.sbr" \
	"$(INTDIR)\ph_syntx.sbr" \
	"$(INTDIR)\ph_task.sbr" \
	"$(INTDIR)\ph_timng.sbr" \
	"$(INTDIR)\ph_vdefi.sbr" \
	"$(INTDIR)\ph_vset.sbr" \
	"$(INTDIR)\phinit.sbr" \
	"$(INTDIR)\phlog.sbr" \
	"$(INTDIR)\reson.sbr" \
	"$(INTDIR)\sample.sbr" \
	"$(INTDIR)\Ttsapi.sbr" \
	"$(INTDIR)\voice.sbr" \
	"$(INTDIR)\Vtm.sbr" \
	"$(INTDIR)\sqrttable.sbr" \
	"$(INTDIR)\log10table.sbr"

"$(OUTDIR)\Wtlkstat.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\Wtlkstat.lib" 
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
	"$(INTDIR)\Crypt2.obj" \
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\diffuse.obj" \
	"$(INTDIR)\fixfft32.obj" \
	"$(INTDIR)\formtrak.obj" \
	"$(INTDIR)\frame.obj" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
	"$(INTDIR)\llinit.obj" \
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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\Ttsapi.obj" \
	"$(INTDIR)\voice.obj" \
	"$(INTDIR)\Vtm.obj" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\log10table.obj"

"$(OUTDIR)\Wtlkstat.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"

OUTDIR=.\..\build\wtlkstat\us\debug
INTDIR=.\..\build\wtlkstat\us\debug\Link
# Begin Custom Macros
OutDir=.\..\build\wtlkstat\us\debug
# End Custom Macros

ALL : "$(OUTDIR)\Wtlkstat.lib" "$(OUTDIR)\Wtlkstat.bsc"


CLEAN :
	-@erase "$(INTDIR)\acxf1c.obj"
	-@erase "$(INTDIR)\acxf1c.sbr"
	-@erase "$(INTDIR)\brent.obj"
	-@erase "$(INTDIR)\brent.sbr"
	-@erase "$(INTDIR)\circuit.obj"
	-@erase "$(INTDIR)\circuit.sbr"
	-@erase "$(INTDIR)\cm_char.obj"
	-@erase "$(INTDIR)\cm_char.sbr"
	-@erase "$(INTDIR)\cm_cmd.obj"
	-@erase "$(INTDIR)\cm_cmd.sbr"
	-@erase "$(INTDIR)\cm_copt.obj"
	-@erase "$(INTDIR)\cm_copt.sbr"
	-@erase "$(INTDIR)\cm_main.obj"
	-@erase "$(INTDIR)\cm_main.sbr"
	-@erase "$(INTDIR)\cm_pars.obj"
	-@erase "$(INTDIR)\cm_pars.sbr"
	-@erase "$(INTDIR)\cm_phon.obj"
	-@erase "$(INTDIR)\cm_phon.sbr"
	-@erase "$(INTDIR)\cm_text.obj"
	-@erase "$(INTDIR)\cm_text.sbr"
	-@erase "$(INTDIR)\cm_util.obj"
	-@erase "$(INTDIR)\cm_util.sbr"
	-@erase "$(INTDIR)\Cmd_init.obj"
	-@erase "$(INTDIR)\Cmd_init.sbr"
	-@erase "$(INTDIR)\cmd_wav.obj"
	-@erase "$(INTDIR)\cmd_wav.sbr"
	-@erase "$(INTDIR)\Crypt2.obj"
	-@erase "$(INTDIR)\Crypt2.sbr"
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\dbgwins.sbr"
	-@erase "$(INTDIR)\diffuse.obj"
	-@erase "$(INTDIR)\diffuse.sbr"
	-@erase "$(INTDIR)\fixfft32.obj"
	-@erase "$(INTDIR)\fixfft32.sbr"
	-@erase "$(INTDIR)\formtrak.obj"
	-@erase "$(INTDIR)\formtrak.sbr"
	-@erase "$(INTDIR)\frame.obj"
	-@erase "$(INTDIR)\frame.sbr"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\hlframe.sbr"
	-@erase "$(INTDIR)\inithl.obj"
	-@erase "$(INTDIR)\inithl.sbr"
	-@erase "$(INTDIR)\llinit.obj"
	-@erase "$(INTDIR)\llinit.sbr"
	-@erase "$(INTDIR)\loaddict.obj"
	-@erase "$(INTDIR)\loaddict.sbr"
	-@erase "$(INTDIR)\log10table.obj"
	-@erase "$(INTDIR)\log10table.sbr"
	-@erase "$(INTDIR)\ls_chari.obj"
	-@erase "$(INTDIR)\ls_chari.sbr"
	-@erase "$(INTDIR)\ls_dict.obj"
	-@erase "$(INTDIR)\ls_dict.sbr"
	-@erase "$(INTDIR)\ls_homo.obj"
	-@erase "$(INTDIR)\ls_homo.sbr"
	-@erase "$(INTDIR)\ls_math.obj"
	-@erase "$(INTDIR)\ls_math.sbr"
	-@erase "$(INTDIR)\ls_proc.obj"
	-@erase "$(INTDIR)\ls_proc.sbr"
	-@erase "$(INTDIR)\ls_spel.obj"
	-@erase "$(INTDIR)\ls_spel.sbr"
	-@erase "$(INTDIR)\ls_speli.obj"
	-@erase "$(INTDIR)\ls_speli.sbr"
	-@erase "$(INTDIR)\ls_suff.obj"
	-@erase "$(INTDIR)\ls_suff.sbr"
	-@erase "$(INTDIR)\ls_suffi.obj"
	-@erase "$(INTDIR)\ls_suffi.sbr"
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
	-@erase "$(INTDIR)\lsa_rtbi.obj"
	-@erase "$(INTDIR)\lsa_rtbi.sbr"
	-@erase "$(INTDIR)\lsa_rule.obj"
	-@erase "$(INTDIR)\lsa_rule.sbr"
	-@erase "$(INTDIR)\lsa_sl.obj"
	-@erase "$(INTDIR)\lsa_sl.sbr"
	-@erase "$(INTDIR)\lsa_sp.obj"
	-@erase "$(INTDIR)\lsa_sp.sbr"
	-@erase "$(INTDIR)\lsa_task.obj"
	-@erase "$(INTDIR)\lsa_task.sbr"
	-@erase "$(INTDIR)\lsa_us.obj"
	-@erase "$(INTDIR)\lsa_us.sbr"
	-@erase "$(INTDIR)\lsa_util.obj"
	-@erase "$(INTDIR)\lsa_util.sbr"
	-@erase "$(INTDIR)\lsw_main.obj"
	-@erase "$(INTDIR)\lsw_main.sbr"
	-@erase "$(INTDIR)\nasalf1x.obj"
	-@erase "$(INTDIR)\nasalf1x.sbr"
	-@erase "$(INTDIR)\par_ambi.obj"
	-@erase "$(INTDIR)\par_ambi.sbr"
	-@erase "$(INTDIR)\par_dict.obj"
	-@erase "$(INTDIR)\par_dict.sbr"
	-@erase "$(INTDIR)\par_pars.obj"
	-@erase "$(INTDIR)\par_pars.sbr"
	-@erase "$(INTDIR)\par_rule.obj"
	-@erase "$(INTDIR)\par_rule.sbr"
	-@erase "$(INTDIR)\ph_aloph.obj"
	-@erase "$(INTDIR)\ph_aloph.sbr"
	-@erase "$(INTDIR)\ph_claus.obj"
	-@erase "$(INTDIR)\ph_claus.sbr"
	-@erase "$(INTDIR)\ph_draw.obj"
	-@erase "$(INTDIR)\ph_draw.sbr"
	-@erase "$(INTDIR)\ph_drwt0.obj"
	-@erase "$(INTDIR)\ph_drwt0.sbr"
	-@erase "$(INTDIR)\ph_inton.obj"
	-@erase "$(INTDIR)\ph_inton.sbr"
	-@erase "$(INTDIR)\ph_main.obj"
	-@erase "$(INTDIR)\ph_main.sbr"
	-@erase "$(INTDIR)\ph_romi.obj"
	-@erase "$(INTDIR)\ph_romi.sbr"
	-@erase "$(INTDIR)\ph_setar.obj"
	-@erase "$(INTDIR)\ph_setar.sbr"
	-@erase "$(INTDIR)\ph_sort.obj"
	-@erase "$(INTDIR)\ph_sort.sbr"
	-@erase "$(INTDIR)\ph_syl.obj"
	-@erase "$(INTDIR)\ph_syl.sbr"
	-@erase "$(INTDIR)\ph_syntx.obj"
	-@erase "$(INTDIR)\ph_syntx.sbr"
	-@erase "$(INTDIR)\ph_task.obj"
	-@erase "$(INTDIR)\ph_task.sbr"
	-@erase "$(INTDIR)\ph_timng.obj"
	-@erase "$(INTDIR)\ph_timng.sbr"
	-@erase "$(INTDIR)\ph_vdefi.obj"
	-@erase "$(INTDIR)\ph_vdefi.sbr"
	-@erase "$(INTDIR)\ph_vset.obj"
	-@erase "$(INTDIR)\ph_vset.sbr"
	-@erase "$(INTDIR)\phinit.obj"
	-@erase "$(INTDIR)\phinit.sbr"
	-@erase "$(INTDIR)\phlog.obj"
	-@erase "$(INTDIR)\phlog.sbr"
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\reson.sbr"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\sample.sbr"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\sqrttable.sbr"
	-@erase "$(INTDIR)\Ttsapi.obj"
	-@erase "$(INTDIR)\Ttsapi.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\voice.obj"
	-@erase "$(INTDIR)\voice.sbr"
	-@erase "$(INTDIR)\Vtm.obj"
	-@erase "$(INTDIR)\Vtm.sbr"
	-@erase "$(OUTDIR)\Wtlkstat.bsc"
	-@erase "$(OUTDIR)\Wtlkstat.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "WILLOWPOND" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wtlkstat.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wtlkstat.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\acxf1c.sbr" \
	"$(INTDIR)\brent.sbr" \
	"$(INTDIR)\circuit.sbr" \
	"$(INTDIR)\cm_char.sbr" \
	"$(INTDIR)\cm_cmd.sbr" \
	"$(INTDIR)\cm_copt.sbr" \
	"$(INTDIR)\cm_main.sbr" \
	"$(INTDIR)\cm_pars.sbr" \
	"$(INTDIR)\cm_phon.sbr" \
	"$(INTDIR)\cm_text.sbr" \
	"$(INTDIR)\cm_util.sbr" \
	"$(INTDIR)\Cmd_init.sbr" \
	"$(INTDIR)\cmd_wav.sbr" \
	"$(INTDIR)\Crypt2.sbr" \
	"$(INTDIR)\dbgwins.sbr" \
	"$(INTDIR)\diffuse.sbr" \
	"$(INTDIR)\fixfft32.sbr" \
	"$(INTDIR)\formtrak.sbr" \
	"$(INTDIR)\frame.sbr" \
	"$(INTDIR)\hlframe.sbr" \
	"$(INTDIR)\inithl.sbr" \
	"$(INTDIR)\llinit.sbr" \
	"$(INTDIR)\loaddict.sbr" \
	"$(INTDIR)\ls_chari.sbr" \
	"$(INTDIR)\ls_dict.sbr" \
	"$(INTDIR)\ls_homo.sbr" \
	"$(INTDIR)\ls_math.sbr" \
	"$(INTDIR)\ls_proc.sbr" \
	"$(INTDIR)\ls_spel.sbr" \
	"$(INTDIR)\ls_speli.sbr" \
	"$(INTDIR)\ls_suff.sbr" \
	"$(INTDIR)\ls_suffi.sbr" \
	"$(INTDIR)\Lsa_adju.sbr" \
	"$(INTDIR)\lsa_coni.sbr" \
	"$(INTDIR)\lsa_fr.sbr" \
	"$(INTDIR)\lsa_gr.sbr" \
	"$(INTDIR)\lsa_ir.sbr" \
	"$(INTDIR)\lsa_it.sbr" \
	"$(INTDIR)\lsa_ja.sbr" \
	"$(INTDIR)\lsa_rtbi.sbr" \
	"$(INTDIR)\lsa_rule.sbr" \
	"$(INTDIR)\lsa_sl.sbr" \
	"$(INTDIR)\lsa_sp.sbr" \
	"$(INTDIR)\lsa_task.sbr" \
	"$(INTDIR)\lsa_us.sbr" \
	"$(INTDIR)\lsa_util.sbr" \
	"$(INTDIR)\lsw_main.sbr" \
	"$(INTDIR)\nasalf1x.sbr" \
	"$(INTDIR)\par_ambi.sbr" \
	"$(INTDIR)\par_dict.sbr" \
	"$(INTDIR)\par_pars.sbr" \
	"$(INTDIR)\par_rule.sbr" \
	"$(INTDIR)\ph_aloph.sbr" \
	"$(INTDIR)\ph_claus.sbr" \
	"$(INTDIR)\ph_draw.sbr" \
	"$(INTDIR)\ph_drwt0.sbr" \
	"$(INTDIR)\ph_inton.sbr" \
	"$(INTDIR)\ph_main.sbr" \
	"$(INTDIR)\ph_romi.sbr" \
	"$(INTDIR)\ph_setar.sbr" \
	"$(INTDIR)\ph_sort.sbr" \
	"$(INTDIR)\ph_syl.sbr" \
	"$(INTDIR)\ph_syntx.sbr" \
	"$(INTDIR)\ph_task.sbr" \
	"$(INTDIR)\ph_timng.sbr" \
	"$(INTDIR)\ph_vdefi.sbr" \
	"$(INTDIR)\ph_vset.sbr" \
	"$(INTDIR)\phinit.sbr" \
	"$(INTDIR)\phlog.sbr" \
	"$(INTDIR)\reson.sbr" \
	"$(INTDIR)\sample.sbr" \
	"$(INTDIR)\Ttsapi.sbr" \
	"$(INTDIR)\voice.sbr" \
	"$(INTDIR)\Vtm.sbr" \
	"$(INTDIR)\sqrttable.sbr" \
	"$(INTDIR)\log10table.sbr"

"$(OUTDIR)\Wtlkstat.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\Wtlkstat.lib" 
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
	"$(INTDIR)\Crypt2.obj" \
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\diffuse.obj" \
	"$(INTDIR)\fixfft32.obj" \
	"$(INTDIR)\formtrak.obj" \
	"$(INTDIR)\frame.obj" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
	"$(INTDIR)\llinit.obj" \
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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\Ttsapi.obj" \
	"$(INTDIR)\voice.obj" \
	"$(INTDIR)\Vtm.obj" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\log10table.obj"

"$(OUTDIR)\Wtlkstat.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"

OUTDIR=.\..\build\wtlkstat\us\Release
INTDIR=.\..\build\wtlkstat\us\Release\Link
# Begin Custom Macros
OutDir=.\..\build\wtlkstat\us\Release
# End Custom Macros

ALL : "$(OUTDIR)\Wtlkstat.lib" "$(OUTDIR)\Wtlkstat.bsc"


CLEAN :
	-@erase "$(INTDIR)\acxf1c.obj"
	-@erase "$(INTDIR)\acxf1c.sbr"
	-@erase "$(INTDIR)\brent.obj"
	-@erase "$(INTDIR)\brent.sbr"
	-@erase "$(INTDIR)\circuit.obj"
	-@erase "$(INTDIR)\circuit.sbr"
	-@erase "$(INTDIR)\cm_char.obj"
	-@erase "$(INTDIR)\cm_char.sbr"
	-@erase "$(INTDIR)\cm_cmd.obj"
	-@erase "$(INTDIR)\cm_cmd.sbr"
	-@erase "$(INTDIR)\cm_copt.obj"
	-@erase "$(INTDIR)\cm_copt.sbr"
	-@erase "$(INTDIR)\cm_main.obj"
	-@erase "$(INTDIR)\cm_main.sbr"
	-@erase "$(INTDIR)\cm_pars.obj"
	-@erase "$(INTDIR)\cm_pars.sbr"
	-@erase "$(INTDIR)\cm_phon.obj"
	-@erase "$(INTDIR)\cm_phon.sbr"
	-@erase "$(INTDIR)\cm_text.obj"
	-@erase "$(INTDIR)\cm_text.sbr"
	-@erase "$(INTDIR)\cm_util.obj"
	-@erase "$(INTDIR)\cm_util.sbr"
	-@erase "$(INTDIR)\Cmd_init.obj"
	-@erase "$(INTDIR)\Cmd_init.sbr"
	-@erase "$(INTDIR)\cmd_wav.obj"
	-@erase "$(INTDIR)\cmd_wav.sbr"
	-@erase "$(INTDIR)\Crypt2.obj"
	-@erase "$(INTDIR)\Crypt2.sbr"
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\dbgwins.sbr"
	-@erase "$(INTDIR)\diffuse.obj"
	-@erase "$(INTDIR)\diffuse.sbr"
	-@erase "$(INTDIR)\fixfft32.obj"
	-@erase "$(INTDIR)\fixfft32.sbr"
	-@erase "$(INTDIR)\formtrak.obj"
	-@erase "$(INTDIR)\formtrak.sbr"
	-@erase "$(INTDIR)\frame.obj"
	-@erase "$(INTDIR)\frame.sbr"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\hlframe.sbr"
	-@erase "$(INTDIR)\inithl.obj"
	-@erase "$(INTDIR)\inithl.sbr"
	-@erase "$(INTDIR)\llinit.obj"
	-@erase "$(INTDIR)\llinit.sbr"
	-@erase "$(INTDIR)\loaddict.obj"
	-@erase "$(INTDIR)\loaddict.sbr"
	-@erase "$(INTDIR)\log10table.obj"
	-@erase "$(INTDIR)\log10table.sbr"
	-@erase "$(INTDIR)\ls_chari.obj"
	-@erase "$(INTDIR)\ls_chari.sbr"
	-@erase "$(INTDIR)\ls_dict.obj"
	-@erase "$(INTDIR)\ls_dict.sbr"
	-@erase "$(INTDIR)\ls_homo.obj"
	-@erase "$(INTDIR)\ls_homo.sbr"
	-@erase "$(INTDIR)\ls_math.obj"
	-@erase "$(INTDIR)\ls_math.sbr"
	-@erase "$(INTDIR)\ls_proc.obj"
	-@erase "$(INTDIR)\ls_proc.sbr"
	-@erase "$(INTDIR)\ls_spel.obj"
	-@erase "$(INTDIR)\ls_spel.sbr"
	-@erase "$(INTDIR)\ls_speli.obj"
	-@erase "$(INTDIR)\ls_speli.sbr"
	-@erase "$(INTDIR)\ls_suff.obj"
	-@erase "$(INTDIR)\ls_suff.sbr"
	-@erase "$(INTDIR)\ls_suffi.obj"
	-@erase "$(INTDIR)\ls_suffi.sbr"
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
	-@erase "$(INTDIR)\lsa_rtbi.obj"
	-@erase "$(INTDIR)\lsa_rtbi.sbr"
	-@erase "$(INTDIR)\lsa_rule.obj"
	-@erase "$(INTDIR)\lsa_rule.sbr"
	-@erase "$(INTDIR)\lsa_sl.obj"
	-@erase "$(INTDIR)\lsa_sl.sbr"
	-@erase "$(INTDIR)\lsa_sp.obj"
	-@erase "$(INTDIR)\lsa_sp.sbr"
	-@erase "$(INTDIR)\lsa_task.obj"
	-@erase "$(INTDIR)\lsa_task.sbr"
	-@erase "$(INTDIR)\lsa_us.obj"
	-@erase "$(INTDIR)\lsa_us.sbr"
	-@erase "$(INTDIR)\lsa_util.obj"
	-@erase "$(INTDIR)\lsa_util.sbr"
	-@erase "$(INTDIR)\lsw_main.obj"
	-@erase "$(INTDIR)\lsw_main.sbr"
	-@erase "$(INTDIR)\nasalf1x.obj"
	-@erase "$(INTDIR)\nasalf1x.sbr"
	-@erase "$(INTDIR)\par_ambi.obj"
	-@erase "$(INTDIR)\par_ambi.sbr"
	-@erase "$(INTDIR)\par_dict.obj"
	-@erase "$(INTDIR)\par_dict.sbr"
	-@erase "$(INTDIR)\par_pars.obj"
	-@erase "$(INTDIR)\par_pars.sbr"
	-@erase "$(INTDIR)\par_rule.obj"
	-@erase "$(INTDIR)\par_rule.sbr"
	-@erase "$(INTDIR)\ph_aloph.obj"
	-@erase "$(INTDIR)\ph_aloph.sbr"
	-@erase "$(INTDIR)\ph_claus.obj"
	-@erase "$(INTDIR)\ph_claus.sbr"
	-@erase "$(INTDIR)\ph_draw.obj"
	-@erase "$(INTDIR)\ph_draw.sbr"
	-@erase "$(INTDIR)\ph_drwt0.obj"
	-@erase "$(INTDIR)\ph_drwt0.sbr"
	-@erase "$(INTDIR)\ph_inton.obj"
	-@erase "$(INTDIR)\ph_inton.sbr"
	-@erase "$(INTDIR)\ph_main.obj"
	-@erase "$(INTDIR)\ph_main.sbr"
	-@erase "$(INTDIR)\ph_romi.obj"
	-@erase "$(INTDIR)\ph_romi.sbr"
	-@erase "$(INTDIR)\ph_setar.obj"
	-@erase "$(INTDIR)\ph_setar.sbr"
	-@erase "$(INTDIR)\ph_sort.obj"
	-@erase "$(INTDIR)\ph_sort.sbr"
	-@erase "$(INTDIR)\ph_syl.obj"
	-@erase "$(INTDIR)\ph_syl.sbr"
	-@erase "$(INTDIR)\ph_syntx.obj"
	-@erase "$(INTDIR)\ph_syntx.sbr"
	-@erase "$(INTDIR)\ph_task.obj"
	-@erase "$(INTDIR)\ph_task.sbr"
	-@erase "$(INTDIR)\ph_timng.obj"
	-@erase "$(INTDIR)\ph_timng.sbr"
	-@erase "$(INTDIR)\ph_vdefi.obj"
	-@erase "$(INTDIR)\ph_vdefi.sbr"
	-@erase "$(INTDIR)\ph_vset.obj"
	-@erase "$(INTDIR)\ph_vset.sbr"
	-@erase "$(INTDIR)\phinit.obj"
	-@erase "$(INTDIR)\phinit.sbr"
	-@erase "$(INTDIR)\phlog.obj"
	-@erase "$(INTDIR)\phlog.sbr"
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\reson.sbr"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\sample.sbr"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\sqrttable.sbr"
	-@erase "$(INTDIR)\Ttsapi.obj"
	-@erase "$(INTDIR)\Ttsapi.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\voice.obj"
	-@erase "$(INTDIR)\voice.sbr"
	-@erase "$(INTDIR)\Vtm.obj"
	-@erase "$(INTDIR)\Vtm.sbr"
	-@erase "$(OUTDIR)\Wtlkstat.bsc"
	-@erase "$(OUTDIR)\Wtlkstat.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wtlkstat.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wtlkstat.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\acxf1c.sbr" \
	"$(INTDIR)\brent.sbr" \
	"$(INTDIR)\circuit.sbr" \
	"$(INTDIR)\cm_char.sbr" \
	"$(INTDIR)\cm_cmd.sbr" \
	"$(INTDIR)\cm_copt.sbr" \
	"$(INTDIR)\cm_main.sbr" \
	"$(INTDIR)\cm_pars.sbr" \
	"$(INTDIR)\cm_phon.sbr" \
	"$(INTDIR)\cm_text.sbr" \
	"$(INTDIR)\cm_util.sbr" \
	"$(INTDIR)\Cmd_init.sbr" \
	"$(INTDIR)\cmd_wav.sbr" \
	"$(INTDIR)\Crypt2.sbr" \
	"$(INTDIR)\dbgwins.sbr" \
	"$(INTDIR)\diffuse.sbr" \
	"$(INTDIR)\fixfft32.sbr" \
	"$(INTDIR)\formtrak.sbr" \
	"$(INTDIR)\frame.sbr" \
	"$(INTDIR)\hlframe.sbr" \
	"$(INTDIR)\inithl.sbr" \
	"$(INTDIR)\llinit.sbr" \
	"$(INTDIR)\loaddict.sbr" \
	"$(INTDIR)\ls_chari.sbr" \
	"$(INTDIR)\ls_dict.sbr" \
	"$(INTDIR)\ls_homo.sbr" \
	"$(INTDIR)\ls_math.sbr" \
	"$(INTDIR)\ls_proc.sbr" \
	"$(INTDIR)\ls_spel.sbr" \
	"$(INTDIR)\ls_speli.sbr" \
	"$(INTDIR)\ls_suff.sbr" \
	"$(INTDIR)\ls_suffi.sbr" \
	"$(INTDIR)\Lsa_adju.sbr" \
	"$(INTDIR)\lsa_coni.sbr" \
	"$(INTDIR)\lsa_fr.sbr" \
	"$(INTDIR)\lsa_gr.sbr" \
	"$(INTDIR)\lsa_ir.sbr" \
	"$(INTDIR)\lsa_it.sbr" \
	"$(INTDIR)\lsa_ja.sbr" \
	"$(INTDIR)\lsa_rtbi.sbr" \
	"$(INTDIR)\lsa_rule.sbr" \
	"$(INTDIR)\lsa_sl.sbr" \
	"$(INTDIR)\lsa_sp.sbr" \
	"$(INTDIR)\lsa_task.sbr" \
	"$(INTDIR)\lsa_us.sbr" \
	"$(INTDIR)\lsa_util.sbr" \
	"$(INTDIR)\lsw_main.sbr" \
	"$(INTDIR)\nasalf1x.sbr" \
	"$(INTDIR)\par_ambi.sbr" \
	"$(INTDIR)\par_dict.sbr" \
	"$(INTDIR)\par_pars.sbr" \
	"$(INTDIR)\par_rule.sbr" \
	"$(INTDIR)\ph_aloph.sbr" \
	"$(INTDIR)\ph_claus.sbr" \
	"$(INTDIR)\ph_draw.sbr" \
	"$(INTDIR)\ph_drwt0.sbr" \
	"$(INTDIR)\ph_inton.sbr" \
	"$(INTDIR)\ph_main.sbr" \
	"$(INTDIR)\ph_romi.sbr" \
	"$(INTDIR)\ph_setar.sbr" \
	"$(INTDIR)\ph_sort.sbr" \
	"$(INTDIR)\ph_syl.sbr" \
	"$(INTDIR)\ph_syntx.sbr" \
	"$(INTDIR)\ph_task.sbr" \
	"$(INTDIR)\ph_timng.sbr" \
	"$(INTDIR)\ph_vdefi.sbr" \
	"$(INTDIR)\ph_vset.sbr" \
	"$(INTDIR)\phinit.sbr" \
	"$(INTDIR)\phlog.sbr" \
	"$(INTDIR)\reson.sbr" \
	"$(INTDIR)\sample.sbr" \
	"$(INTDIR)\Ttsapi.sbr" \
	"$(INTDIR)\voice.sbr" \
	"$(INTDIR)\Vtm.sbr" \
	"$(INTDIR)\sqrttable.sbr" \
	"$(INTDIR)\log10table.sbr"

"$(OUTDIR)\Wtlkstat.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\Wtlkstat.lib" 
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
	"$(INTDIR)\Crypt2.obj" \
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\diffuse.obj" \
	"$(INTDIR)\fixfft32.obj" \
	"$(INTDIR)\formtrak.obj" \
	"$(INTDIR)\frame.obj" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
	"$(INTDIR)\llinit.obj" \
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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\Ttsapi.obj" \
	"$(INTDIR)\voice.obj" \
	"$(INTDIR)\Vtm.obj" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\log10table.obj"

"$(OUTDIR)\Wtlkstat.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"

OUTDIR=.\..\build\wtlkstat\uk\Release
INTDIR=.\..\build\wtlkstat\uk\Release\Link
# Begin Custom Macros
OutDir=.\..\build\wtlkstat\uk\Release
# End Custom Macros

ALL : "$(OUTDIR)\Wtlkstat.lib"


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
	-@erase "$(INTDIR)\Crypt2.obj"
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\diffuse.obj"
	-@erase "$(INTDIR)\fixfft32.obj"
	-@erase "$(INTDIR)\formtrak.obj"
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
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\Ttsapi.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\voice.obj"
	-@erase "$(INTDIR)\Vtm.obj"
	-@erase "$(OUTDIR)\Wtlkstat.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "ENGLISH_UK" /D "ENGLISH" /Fp"$(INTDIR)\Wtlkstat.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wtlkstat.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\Wtlkstat.lib" 
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
	"$(INTDIR)\Crypt2.obj" \
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\diffuse.obj" \
	"$(INTDIR)\fixfft32.obj" \
	"$(INTDIR)\formtrak.obj" \
	"$(INTDIR)\frame.obj" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
	"$(INTDIR)\llinit.obj" \
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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\Ttsapi.obj" \
	"$(INTDIR)\voice.obj" \
	"$(INTDIR)\Vtm.obj" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\log10table.obj"

"$(OUTDIR)\Wtlkstat.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"

OUTDIR=.\..\build\wtlkstat\uk\debug
INTDIR=.\..\build\wtlkstat\uk\debug\Link
# Begin Custom Macros
OutDir=.\..\build\wtlkstat\uk\debug
# End Custom Macros

ALL : "$(OUTDIR)\Wtlkstat.lib" "$(OUTDIR)\Wtlkstat.bsc"


CLEAN :
	-@erase "$(INTDIR)\acxf1c.obj"
	-@erase "$(INTDIR)\acxf1c.sbr"
	-@erase "$(INTDIR)\brent.obj"
	-@erase "$(INTDIR)\brent.sbr"
	-@erase "$(INTDIR)\circuit.obj"
	-@erase "$(INTDIR)\circuit.sbr"
	-@erase "$(INTDIR)\cm_char.obj"
	-@erase "$(INTDIR)\cm_char.sbr"
	-@erase "$(INTDIR)\cm_cmd.obj"
	-@erase "$(INTDIR)\cm_cmd.sbr"
	-@erase "$(INTDIR)\cm_copt.obj"
	-@erase "$(INTDIR)\cm_copt.sbr"
	-@erase "$(INTDIR)\cm_main.obj"
	-@erase "$(INTDIR)\cm_main.sbr"
	-@erase "$(INTDIR)\cm_pars.obj"
	-@erase "$(INTDIR)\cm_pars.sbr"
	-@erase "$(INTDIR)\cm_phon.obj"
	-@erase "$(INTDIR)\cm_phon.sbr"
	-@erase "$(INTDIR)\cm_text.obj"
	-@erase "$(INTDIR)\cm_text.sbr"
	-@erase "$(INTDIR)\cm_util.obj"
	-@erase "$(INTDIR)\cm_util.sbr"
	-@erase "$(INTDIR)\Cmd_init.obj"
	-@erase "$(INTDIR)\Cmd_init.sbr"
	-@erase "$(INTDIR)\cmd_wav.obj"
	-@erase "$(INTDIR)\cmd_wav.sbr"
	-@erase "$(INTDIR)\Crypt2.obj"
	-@erase "$(INTDIR)\Crypt2.sbr"
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\dbgwins.sbr"
	-@erase "$(INTDIR)\diffuse.obj"
	-@erase "$(INTDIR)\diffuse.sbr"
	-@erase "$(INTDIR)\fixfft32.obj"
	-@erase "$(INTDIR)\fixfft32.sbr"
	-@erase "$(INTDIR)\formtrak.obj"
	-@erase "$(INTDIR)\formtrak.sbr"
	-@erase "$(INTDIR)\frame.obj"
	-@erase "$(INTDIR)\frame.sbr"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\hlframe.sbr"
	-@erase "$(INTDIR)\inithl.obj"
	-@erase "$(INTDIR)\inithl.sbr"
	-@erase "$(INTDIR)\llinit.obj"
	-@erase "$(INTDIR)\llinit.sbr"
	-@erase "$(INTDIR)\loaddict.obj"
	-@erase "$(INTDIR)\loaddict.sbr"
	-@erase "$(INTDIR)\log10table.obj"
	-@erase "$(INTDIR)\log10table.sbr"
	-@erase "$(INTDIR)\ls_chari.obj"
	-@erase "$(INTDIR)\ls_chari.sbr"
	-@erase "$(INTDIR)\ls_dict.obj"
	-@erase "$(INTDIR)\ls_dict.sbr"
	-@erase "$(INTDIR)\ls_homo.obj"
	-@erase "$(INTDIR)\ls_homo.sbr"
	-@erase "$(INTDIR)\ls_math.obj"
	-@erase "$(INTDIR)\ls_math.sbr"
	-@erase "$(INTDIR)\ls_proc.obj"
	-@erase "$(INTDIR)\ls_proc.sbr"
	-@erase "$(INTDIR)\ls_spel.obj"
	-@erase "$(INTDIR)\ls_spel.sbr"
	-@erase "$(INTDIR)\ls_speli.obj"
	-@erase "$(INTDIR)\ls_speli.sbr"
	-@erase "$(INTDIR)\ls_suff.obj"
	-@erase "$(INTDIR)\ls_suff.sbr"
	-@erase "$(INTDIR)\ls_suffi.obj"
	-@erase "$(INTDIR)\ls_suffi.sbr"
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
	-@erase "$(INTDIR)\lsa_rtbi.obj"
	-@erase "$(INTDIR)\lsa_rtbi.sbr"
	-@erase "$(INTDIR)\lsa_rule.obj"
	-@erase "$(INTDIR)\lsa_rule.sbr"
	-@erase "$(INTDIR)\lsa_sl.obj"
	-@erase "$(INTDIR)\lsa_sl.sbr"
	-@erase "$(INTDIR)\lsa_sp.obj"
	-@erase "$(INTDIR)\lsa_sp.sbr"
	-@erase "$(INTDIR)\lsa_task.obj"
	-@erase "$(INTDIR)\lsa_task.sbr"
	-@erase "$(INTDIR)\lsa_us.obj"
	-@erase "$(INTDIR)\lsa_us.sbr"
	-@erase "$(INTDIR)\lsa_util.obj"
	-@erase "$(INTDIR)\lsa_util.sbr"
	-@erase "$(INTDIR)\lsw_main.obj"
	-@erase "$(INTDIR)\lsw_main.sbr"
	-@erase "$(INTDIR)\nasalf1x.obj"
	-@erase "$(INTDIR)\nasalf1x.sbr"
	-@erase "$(INTDIR)\par_ambi.obj"
	-@erase "$(INTDIR)\par_ambi.sbr"
	-@erase "$(INTDIR)\par_dict.obj"
	-@erase "$(INTDIR)\par_dict.sbr"
	-@erase "$(INTDIR)\par_pars.obj"
	-@erase "$(INTDIR)\par_pars.sbr"
	-@erase "$(INTDIR)\par_rule.obj"
	-@erase "$(INTDIR)\par_rule.sbr"
	-@erase "$(INTDIR)\ph_aloph.obj"
	-@erase "$(INTDIR)\ph_aloph.sbr"
	-@erase "$(INTDIR)\ph_claus.obj"
	-@erase "$(INTDIR)\ph_claus.sbr"
	-@erase "$(INTDIR)\ph_draw.obj"
	-@erase "$(INTDIR)\ph_draw.sbr"
	-@erase "$(INTDIR)\ph_drwt0.obj"
	-@erase "$(INTDIR)\ph_drwt0.sbr"
	-@erase "$(INTDIR)\ph_inton.obj"
	-@erase "$(INTDIR)\ph_inton.sbr"
	-@erase "$(INTDIR)\ph_main.obj"
	-@erase "$(INTDIR)\ph_main.sbr"
	-@erase "$(INTDIR)\ph_romi.obj"
	-@erase "$(INTDIR)\ph_romi.sbr"
	-@erase "$(INTDIR)\ph_setar.obj"
	-@erase "$(INTDIR)\ph_setar.sbr"
	-@erase "$(INTDIR)\ph_sort.obj"
	-@erase "$(INTDIR)\ph_sort.sbr"
	-@erase "$(INTDIR)\ph_syl.obj"
	-@erase "$(INTDIR)\ph_syl.sbr"
	-@erase "$(INTDIR)\ph_syntx.obj"
	-@erase "$(INTDIR)\ph_syntx.sbr"
	-@erase "$(INTDIR)\ph_task.obj"
	-@erase "$(INTDIR)\ph_task.sbr"
	-@erase "$(INTDIR)\ph_timng.obj"
	-@erase "$(INTDIR)\ph_timng.sbr"
	-@erase "$(INTDIR)\ph_vdefi.obj"
	-@erase "$(INTDIR)\ph_vdefi.sbr"
	-@erase "$(INTDIR)\ph_vset.obj"
	-@erase "$(INTDIR)\ph_vset.sbr"
	-@erase "$(INTDIR)\phinit.obj"
	-@erase "$(INTDIR)\phinit.sbr"
	-@erase "$(INTDIR)\phlog.obj"
	-@erase "$(INTDIR)\phlog.sbr"
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\reson.sbr"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\sample.sbr"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\sqrttable.sbr"
	-@erase "$(INTDIR)\Ttsapi.obj"
	-@erase "$(INTDIR)\Ttsapi.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\voice.obj"
	-@erase "$(INTDIR)\voice.sbr"
	-@erase "$(INTDIR)\Vtm.obj"
	-@erase "$(INTDIR)\Vtm.sbr"
	-@erase "$(OUTDIR)\Wtlkstat.bsc"
	-@erase "$(OUTDIR)\Wtlkstat.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "WILLOWPOND" /D "ENGLISH_UK" /D "ENGLISH" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wtlkstat.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wtlkstat.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\acxf1c.sbr" \
	"$(INTDIR)\brent.sbr" \
	"$(INTDIR)\circuit.sbr" \
	"$(INTDIR)\cm_char.sbr" \
	"$(INTDIR)\cm_cmd.sbr" \
	"$(INTDIR)\cm_copt.sbr" \
	"$(INTDIR)\cm_main.sbr" \
	"$(INTDIR)\cm_pars.sbr" \
	"$(INTDIR)\cm_phon.sbr" \
	"$(INTDIR)\cm_text.sbr" \
	"$(INTDIR)\cm_util.sbr" \
	"$(INTDIR)\Cmd_init.sbr" \
	"$(INTDIR)\cmd_wav.sbr" \
	"$(INTDIR)\Crypt2.sbr" \
	"$(INTDIR)\dbgwins.sbr" \
	"$(INTDIR)\diffuse.sbr" \
	"$(INTDIR)\fixfft32.sbr" \
	"$(INTDIR)\formtrak.sbr" \
	"$(INTDIR)\frame.sbr" \
	"$(INTDIR)\hlframe.sbr" \
	"$(INTDIR)\inithl.sbr" \
	"$(INTDIR)\llinit.sbr" \
	"$(INTDIR)\loaddict.sbr" \
	"$(INTDIR)\ls_chari.sbr" \
	"$(INTDIR)\ls_dict.sbr" \
	"$(INTDIR)\ls_homo.sbr" \
	"$(INTDIR)\ls_math.sbr" \
	"$(INTDIR)\ls_proc.sbr" \
	"$(INTDIR)\ls_spel.sbr" \
	"$(INTDIR)\ls_speli.sbr" \
	"$(INTDIR)\ls_suff.sbr" \
	"$(INTDIR)\ls_suffi.sbr" \
	"$(INTDIR)\Lsa_adju.sbr" \
	"$(INTDIR)\lsa_coni.sbr" \
	"$(INTDIR)\lsa_fr.sbr" \
	"$(INTDIR)\lsa_gr.sbr" \
	"$(INTDIR)\lsa_ir.sbr" \
	"$(INTDIR)\lsa_it.sbr" \
	"$(INTDIR)\lsa_ja.sbr" \
	"$(INTDIR)\lsa_rtbi.sbr" \
	"$(INTDIR)\lsa_rule.sbr" \
	"$(INTDIR)\lsa_sl.sbr" \
	"$(INTDIR)\lsa_sp.sbr" \
	"$(INTDIR)\lsa_task.sbr" \
	"$(INTDIR)\lsa_us.sbr" \
	"$(INTDIR)\lsa_util.sbr" \
	"$(INTDIR)\lsw_main.sbr" \
	"$(INTDIR)\nasalf1x.sbr" \
	"$(INTDIR)\par_ambi.sbr" \
	"$(INTDIR)\par_dict.sbr" \
	"$(INTDIR)\par_pars.sbr" \
	"$(INTDIR)\par_rule.sbr" \
	"$(INTDIR)\ph_aloph.sbr" \
	"$(INTDIR)\ph_claus.sbr" \
	"$(INTDIR)\ph_draw.sbr" \
	"$(INTDIR)\ph_drwt0.sbr" \
	"$(INTDIR)\ph_inton.sbr" \
	"$(INTDIR)\ph_main.sbr" \
	"$(INTDIR)\ph_romi.sbr" \
	"$(INTDIR)\ph_setar.sbr" \
	"$(INTDIR)\ph_sort.sbr" \
	"$(INTDIR)\ph_syl.sbr" \
	"$(INTDIR)\ph_syntx.sbr" \
	"$(INTDIR)\ph_task.sbr" \
	"$(INTDIR)\ph_timng.sbr" \
	"$(INTDIR)\ph_vdefi.sbr" \
	"$(INTDIR)\ph_vset.sbr" \
	"$(INTDIR)\phinit.sbr" \
	"$(INTDIR)\phlog.sbr" \
	"$(INTDIR)\reson.sbr" \
	"$(INTDIR)\sample.sbr" \
	"$(INTDIR)\Ttsapi.sbr" \
	"$(INTDIR)\voice.sbr" \
	"$(INTDIR)\Vtm.sbr" \
	"$(INTDIR)\sqrttable.sbr" \
	"$(INTDIR)\log10table.sbr"

"$(OUTDIR)\Wtlkstat.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\Wtlkstat.lib" 
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
	"$(INTDIR)\Crypt2.obj" \
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\diffuse.obj" \
	"$(INTDIR)\fixfft32.obj" \
	"$(INTDIR)\formtrak.obj" \
	"$(INTDIR)\frame.obj" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
	"$(INTDIR)\llinit.obj" \
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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\Ttsapi.obj" \
	"$(INTDIR)\voice.obj" \
	"$(INTDIR)\Vtm.obj" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\log10table.obj"

"$(OUTDIR)\Wtlkstat.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"

OUTDIR=.\..\build\wtlkstat\fr\Release
INTDIR=.\..\build\wtlkstat\fr\Release\Link
# Begin Custom Macros
OutDir=.\..\build\wtlkstat\fr\Release
# End Custom Macros

ALL : "$(OUTDIR)\Wtlkstat.lib"


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
	-@erase "$(INTDIR)\Crypt2.obj"
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\diffuse.obj"
	-@erase "$(INTDIR)\fixfft32.obj"
	-@erase "$(INTDIR)\formtrak.obj"
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
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\Ttsapi.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\voice.obj"
	-@erase "$(INTDIR)\Vtm.obj"
	-@erase "$(OUTDIR)\Wtlkstat.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "WILLOWPOND" /D "FRENCH" /Fp"$(INTDIR)\Wtlkstat.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /Zm200 /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wtlkstat.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\Wtlkstat.lib" 
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
	"$(INTDIR)\Crypt2.obj" \
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\diffuse.obj" \
	"$(INTDIR)\fixfft32.obj" \
	"$(INTDIR)\formtrak.obj" \
	"$(INTDIR)\frame.obj" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
	"$(INTDIR)\llinit.obj" \
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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\Ttsapi.obj" \
	"$(INTDIR)\voice.obj" \
	"$(INTDIR)\Vtm.obj" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\log10table.obj"

"$(OUTDIR)\Wtlkstat.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"

OUTDIR=.\..\build\wtlkstat\fr\debug
INTDIR=.\..\build\wtlkstat\fr\debug\Link
# Begin Custom Macros
OutDir=.\..\build\wtlkstat\fr\debug
# End Custom Macros

ALL : "$(OUTDIR)\Wtlkstat.lib" "$(OUTDIR)\Wtlkstat.bsc"


CLEAN :
	-@erase "$(INTDIR)\acxf1c.obj"
	-@erase "$(INTDIR)\acxf1c.sbr"
	-@erase "$(INTDIR)\brent.obj"
	-@erase "$(INTDIR)\brent.sbr"
	-@erase "$(INTDIR)\circuit.obj"
	-@erase "$(INTDIR)\circuit.sbr"
	-@erase "$(INTDIR)\cm_char.obj"
	-@erase "$(INTDIR)\cm_char.sbr"
	-@erase "$(INTDIR)\cm_cmd.obj"
	-@erase "$(INTDIR)\cm_cmd.sbr"
	-@erase "$(INTDIR)\cm_copt.obj"
	-@erase "$(INTDIR)\cm_copt.sbr"
	-@erase "$(INTDIR)\cm_main.obj"
	-@erase "$(INTDIR)\cm_main.sbr"
	-@erase "$(INTDIR)\cm_pars.obj"
	-@erase "$(INTDIR)\cm_pars.sbr"
	-@erase "$(INTDIR)\cm_phon.obj"
	-@erase "$(INTDIR)\cm_phon.sbr"
	-@erase "$(INTDIR)\cm_text.obj"
	-@erase "$(INTDIR)\cm_text.sbr"
	-@erase "$(INTDIR)\cm_util.obj"
	-@erase "$(INTDIR)\cm_util.sbr"
	-@erase "$(INTDIR)\Cmd_init.obj"
	-@erase "$(INTDIR)\Cmd_init.sbr"
	-@erase "$(INTDIR)\cmd_wav.obj"
	-@erase "$(INTDIR)\cmd_wav.sbr"
	-@erase "$(INTDIR)\Crypt2.obj"
	-@erase "$(INTDIR)\Crypt2.sbr"
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\dbgwins.sbr"
	-@erase "$(INTDIR)\diffuse.obj"
	-@erase "$(INTDIR)\diffuse.sbr"
	-@erase "$(INTDIR)\fixfft32.obj"
	-@erase "$(INTDIR)\fixfft32.sbr"
	-@erase "$(INTDIR)\formtrak.obj"
	-@erase "$(INTDIR)\formtrak.sbr"
	-@erase "$(INTDIR)\frame.obj"
	-@erase "$(INTDIR)\frame.sbr"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\hlframe.sbr"
	-@erase "$(INTDIR)\inithl.obj"
	-@erase "$(INTDIR)\inithl.sbr"
	-@erase "$(INTDIR)\llinit.obj"
	-@erase "$(INTDIR)\llinit.sbr"
	-@erase "$(INTDIR)\loaddict.obj"
	-@erase "$(INTDIR)\loaddict.sbr"
	-@erase "$(INTDIR)\log10table.obj"
	-@erase "$(INTDIR)\log10table.sbr"
	-@erase "$(INTDIR)\ls_chari.obj"
	-@erase "$(INTDIR)\ls_chari.sbr"
	-@erase "$(INTDIR)\ls_dict.obj"
	-@erase "$(INTDIR)\ls_dict.sbr"
	-@erase "$(INTDIR)\ls_homo.obj"
	-@erase "$(INTDIR)\ls_homo.sbr"
	-@erase "$(INTDIR)\ls_math.obj"
	-@erase "$(INTDIR)\ls_math.sbr"
	-@erase "$(INTDIR)\ls_proc.obj"
	-@erase "$(INTDIR)\ls_proc.sbr"
	-@erase "$(INTDIR)\ls_spel.obj"
	-@erase "$(INTDIR)\ls_spel.sbr"
	-@erase "$(INTDIR)\ls_speli.obj"
	-@erase "$(INTDIR)\ls_speli.sbr"
	-@erase "$(INTDIR)\ls_suff.obj"
	-@erase "$(INTDIR)\ls_suff.sbr"
	-@erase "$(INTDIR)\ls_suffi.obj"
	-@erase "$(INTDIR)\ls_suffi.sbr"
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
	-@erase "$(INTDIR)\lsa_rtbi.obj"
	-@erase "$(INTDIR)\lsa_rtbi.sbr"
	-@erase "$(INTDIR)\lsa_rule.obj"
	-@erase "$(INTDIR)\lsa_rule.sbr"
	-@erase "$(INTDIR)\lsa_sl.obj"
	-@erase "$(INTDIR)\lsa_sl.sbr"
	-@erase "$(INTDIR)\lsa_sp.obj"
	-@erase "$(INTDIR)\lsa_sp.sbr"
	-@erase "$(INTDIR)\lsa_task.obj"
	-@erase "$(INTDIR)\lsa_task.sbr"
	-@erase "$(INTDIR)\lsa_us.obj"
	-@erase "$(INTDIR)\lsa_us.sbr"
	-@erase "$(INTDIR)\lsa_util.obj"
	-@erase "$(INTDIR)\lsa_util.sbr"
	-@erase "$(INTDIR)\lsw_main.obj"
	-@erase "$(INTDIR)\lsw_main.sbr"
	-@erase "$(INTDIR)\nasalf1x.obj"
	-@erase "$(INTDIR)\nasalf1x.sbr"
	-@erase "$(INTDIR)\par_ambi.obj"
	-@erase "$(INTDIR)\par_ambi.sbr"
	-@erase "$(INTDIR)\par_dict.obj"
	-@erase "$(INTDIR)\par_dict.sbr"
	-@erase "$(INTDIR)\par_pars.obj"
	-@erase "$(INTDIR)\par_pars.sbr"
	-@erase "$(INTDIR)\par_rule.obj"
	-@erase "$(INTDIR)\par_rule.sbr"
	-@erase "$(INTDIR)\ph_aloph.obj"
	-@erase "$(INTDIR)\ph_aloph.sbr"
	-@erase "$(INTDIR)\ph_claus.obj"
	-@erase "$(INTDIR)\ph_claus.sbr"
	-@erase "$(INTDIR)\ph_draw.obj"
	-@erase "$(INTDIR)\ph_draw.sbr"
	-@erase "$(INTDIR)\ph_drwt0.obj"
	-@erase "$(INTDIR)\ph_drwt0.sbr"
	-@erase "$(INTDIR)\ph_inton.obj"
	-@erase "$(INTDIR)\ph_inton.sbr"
	-@erase "$(INTDIR)\ph_main.obj"
	-@erase "$(INTDIR)\ph_main.sbr"
	-@erase "$(INTDIR)\ph_romi.obj"
	-@erase "$(INTDIR)\ph_romi.sbr"
	-@erase "$(INTDIR)\ph_setar.obj"
	-@erase "$(INTDIR)\ph_setar.sbr"
	-@erase "$(INTDIR)\ph_sort.obj"
	-@erase "$(INTDIR)\ph_sort.sbr"
	-@erase "$(INTDIR)\ph_syl.obj"
	-@erase "$(INTDIR)\ph_syl.sbr"
	-@erase "$(INTDIR)\ph_syntx.obj"
	-@erase "$(INTDIR)\ph_syntx.sbr"
	-@erase "$(INTDIR)\ph_task.obj"
	-@erase "$(INTDIR)\ph_task.sbr"
	-@erase "$(INTDIR)\ph_timng.obj"
	-@erase "$(INTDIR)\ph_timng.sbr"
	-@erase "$(INTDIR)\ph_vdefi.obj"
	-@erase "$(INTDIR)\ph_vdefi.sbr"
	-@erase "$(INTDIR)\ph_vset.obj"
	-@erase "$(INTDIR)\ph_vset.sbr"
	-@erase "$(INTDIR)\phinit.obj"
	-@erase "$(INTDIR)\phinit.sbr"
	-@erase "$(INTDIR)\phlog.obj"
	-@erase "$(INTDIR)\phlog.sbr"
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\reson.sbr"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\sample.sbr"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\sqrttable.sbr"
	-@erase "$(INTDIR)\Ttsapi.obj"
	-@erase "$(INTDIR)\Ttsapi.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\voice.obj"
	-@erase "$(INTDIR)\voice.sbr"
	-@erase "$(INTDIR)\Vtm.obj"
	-@erase "$(INTDIR)\Vtm.sbr"
	-@erase "$(OUTDIR)\Wtlkstat.bsc"
	-@erase "$(OUTDIR)\Wtlkstat.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\..\cpanel\src" /I ".\..\..\microsoft" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "OLEDECTALK" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "WILLOWPOND" /D "FRENCH" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Wtlkstat.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /Zm200 /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Wtlkstat.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\acxf1c.sbr" \
	"$(INTDIR)\brent.sbr" \
	"$(INTDIR)\circuit.sbr" \
	"$(INTDIR)\cm_char.sbr" \
	"$(INTDIR)\cm_cmd.sbr" \
	"$(INTDIR)\cm_copt.sbr" \
	"$(INTDIR)\cm_main.sbr" \
	"$(INTDIR)\cm_pars.sbr" \
	"$(INTDIR)\cm_phon.sbr" \
	"$(INTDIR)\cm_text.sbr" \
	"$(INTDIR)\cm_util.sbr" \
	"$(INTDIR)\Cmd_init.sbr" \
	"$(INTDIR)\cmd_wav.sbr" \
	"$(INTDIR)\Crypt2.sbr" \
	"$(INTDIR)\dbgwins.sbr" \
	"$(INTDIR)\diffuse.sbr" \
	"$(INTDIR)\fixfft32.sbr" \
	"$(INTDIR)\formtrak.sbr" \
	"$(INTDIR)\frame.sbr" \
	"$(INTDIR)\hlframe.sbr" \
	"$(INTDIR)\inithl.sbr" \
	"$(INTDIR)\llinit.sbr" \
	"$(INTDIR)\loaddict.sbr" \
	"$(INTDIR)\ls_chari.sbr" \
	"$(INTDIR)\ls_dict.sbr" \
	"$(INTDIR)\ls_homo.sbr" \
	"$(INTDIR)\ls_math.sbr" \
	"$(INTDIR)\ls_proc.sbr" \
	"$(INTDIR)\ls_spel.sbr" \
	"$(INTDIR)\ls_speli.sbr" \
	"$(INTDIR)\ls_suff.sbr" \
	"$(INTDIR)\ls_suffi.sbr" \
	"$(INTDIR)\Lsa_adju.sbr" \
	"$(INTDIR)\lsa_coni.sbr" \
	"$(INTDIR)\lsa_fr.sbr" \
	"$(INTDIR)\lsa_gr.sbr" \
	"$(INTDIR)\lsa_ir.sbr" \
	"$(INTDIR)\lsa_it.sbr" \
	"$(INTDIR)\lsa_ja.sbr" \
	"$(INTDIR)\lsa_rtbi.sbr" \
	"$(INTDIR)\lsa_rule.sbr" \
	"$(INTDIR)\lsa_sl.sbr" \
	"$(INTDIR)\lsa_sp.sbr" \
	"$(INTDIR)\lsa_task.sbr" \
	"$(INTDIR)\lsa_us.sbr" \
	"$(INTDIR)\lsa_util.sbr" \
	"$(INTDIR)\lsw_main.sbr" \
	"$(INTDIR)\nasalf1x.sbr" \
	"$(INTDIR)\par_ambi.sbr" \
	"$(INTDIR)\par_dict.sbr" \
	"$(INTDIR)\par_pars.sbr" \
	"$(INTDIR)\par_rule.sbr" \
	"$(INTDIR)\ph_aloph.sbr" \
	"$(INTDIR)\ph_claus.sbr" \
	"$(INTDIR)\ph_draw.sbr" \
	"$(INTDIR)\ph_drwt0.sbr" \
	"$(INTDIR)\ph_inton.sbr" \
	"$(INTDIR)\ph_main.sbr" \
	"$(INTDIR)\ph_romi.sbr" \
	"$(INTDIR)\ph_setar.sbr" \
	"$(INTDIR)\ph_sort.sbr" \
	"$(INTDIR)\ph_syl.sbr" \
	"$(INTDIR)\ph_syntx.sbr" \
	"$(INTDIR)\ph_task.sbr" \
	"$(INTDIR)\ph_timng.sbr" \
	"$(INTDIR)\ph_vdefi.sbr" \
	"$(INTDIR)\ph_vset.sbr" \
	"$(INTDIR)\phinit.sbr" \
	"$(INTDIR)\phlog.sbr" \
	"$(INTDIR)\reson.sbr" \
	"$(INTDIR)\sample.sbr" \
	"$(INTDIR)\Ttsapi.sbr" \
	"$(INTDIR)\voice.sbr" \
	"$(INTDIR)\Vtm.sbr" \
	"$(INTDIR)\sqrttable.sbr" \
	"$(INTDIR)\log10table.sbr"

"$(OUTDIR)\Wtlkstat.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\Wtlkstat.lib" 
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
	"$(INTDIR)\Crypt2.obj" \
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\diffuse.obj" \
	"$(INTDIR)\fixfft32.obj" \
	"$(INTDIR)\formtrak.obj" \
	"$(INTDIR)\frame.obj" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
	"$(INTDIR)\llinit.obj" \
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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\Ttsapi.obj" \
	"$(INTDIR)\voice.obj" \
	"$(INTDIR)\Vtm.obj" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\log10table.obj"

"$(OUTDIR)\Wtlkstat.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Wtlkstat.dep")
!INCLUDE "Wtlkstat.dep"
!ELSE 
!MESSAGE Warning: cannot find "Wtlkstat.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "wtlkstat - Win32 Release Spanish" || "$(CFG)" == "wtlkstat - Win32 Release German" || "$(CFG)" == "wtlkstat - Win32 Release Latin American" || "$(CFG)" == "wtlkstat - Win32 Debug Spanish" || "$(CFG)" == "wtlkstat - Win32 Debug German" || "$(CFG)" == "wtlkstat - Win32 Debug Latin American" || "$(CFG)" == "wtlkstat - Win32 Debug" || "$(CFG)" == "wtlkstat - Win32 Release" || "$(CFG)" == "wtlkstat - Win32 Release United Kingdom" || "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom" || "$(CFG)" == "wtlkstat - Win32 Release French" || "$(CFG)" == "wtlkstat - Win32 Debug French"
SOURCE=.\hlsyn\acxf1c.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\acxf1c.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\acxf1c.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\acxf1c.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\acxf1c.obj"	"$(INTDIR)\acxf1c.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\acxf1c.obj"	"$(INTDIR)\acxf1c.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\acxf1c.obj"	"$(INTDIR)\acxf1c.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\acxf1c.obj"	"$(INTDIR)\acxf1c.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\acxf1c.obj"	"$(INTDIR)\acxf1c.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\acxf1c.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\acxf1c.obj"	"$(INTDIR)\acxf1c.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\acxf1c.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\acxf1c.obj"	"$(INTDIR)\acxf1c.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\hlsyn\brent.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\brent.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\brent.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\brent.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\brent.obj"	"$(INTDIR)\brent.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\brent.obj"	"$(INTDIR)\brent.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\brent.obj"	"$(INTDIR)\brent.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\brent.obj"	"$(INTDIR)\brent.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\brent.obj"	"$(INTDIR)\brent.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\brent.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\brent.obj"	"$(INTDIR)\brent.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\brent.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\brent.obj"	"$(INTDIR)\brent.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\hlsyn\circuit.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\circuit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\circuit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\circuit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\circuit.obj"	"$(INTDIR)\circuit.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\circuit.obj"	"$(INTDIR)\circuit.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\circuit.obj"	"$(INTDIR)\circuit.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\circuit.obj"	"$(INTDIR)\circuit.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\circuit.obj"	"$(INTDIR)\circuit.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\circuit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\circuit.obj"	"$(INTDIR)\circuit.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\circuit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\circuit.obj"	"$(INTDIR)\circuit.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Cmd\cm_char.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\cm_char.obj"	"$(INTDIR)\cm_char.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\cm_char.obj"	"$(INTDIR)\cm_char.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\cm_char.obj"	"$(INTDIR)\cm_char.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\cm_char.obj"	"$(INTDIR)\cm_char.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\cm_char.obj"	"$(INTDIR)\cm_char.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\cm_char.obj"	"$(INTDIR)\cm_char.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\cm_char.obj"	"$(INTDIR)\cm_char.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Cmd\cm_cmd.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\cm_cmd.obj"	"$(INTDIR)\cm_cmd.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\cm_cmd.obj"	"$(INTDIR)\cm_cmd.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\cm_cmd.obj"	"$(INTDIR)\cm_cmd.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\cm_cmd.obj"	"$(INTDIR)\cm_cmd.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\cm_cmd.obj"	"$(INTDIR)\cm_cmd.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\cm_cmd.obj"	"$(INTDIR)\cm_cmd.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\cm_cmd.obj"	"$(INTDIR)\cm_cmd.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Cmd\cm_copt.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\cm_copt.obj"	"$(INTDIR)\cm_copt.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\cm_copt.obj"	"$(INTDIR)\cm_copt.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\cm_copt.obj"	"$(INTDIR)\cm_copt.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\cm_copt.obj"	"$(INTDIR)\cm_copt.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\cm_copt.obj"	"$(INTDIR)\cm_copt.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\cm_copt.obj"	"$(INTDIR)\cm_copt.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\cm_copt.obj"	"$(INTDIR)\cm_copt.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Cmd\cm_main.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\cm_main.obj"	"$(INTDIR)\cm_main.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\cm_main.obj"	"$(INTDIR)\cm_main.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\cm_main.obj"	"$(INTDIR)\cm_main.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\cm_main.obj"	"$(INTDIR)\cm_main.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\cm_main.obj"	"$(INTDIR)\cm_main.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\cm_main.obj"	"$(INTDIR)\cm_main.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\cm_main.obj"	"$(INTDIR)\cm_main.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Cmd\cm_pars.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\cm_pars.obj"	"$(INTDIR)\cm_pars.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\cm_pars.obj"	"$(INTDIR)\cm_pars.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\cm_pars.obj"	"$(INTDIR)\cm_pars.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\cm_pars.obj"	"$(INTDIR)\cm_pars.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\cm_pars.obj"	"$(INTDIR)\cm_pars.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\cm_pars.obj"	"$(INTDIR)\cm_pars.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\cm_pars.obj"	"$(INTDIR)\cm_pars.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Cmd\cm_phon.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\cm_phon.obj"	"$(INTDIR)\cm_phon.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\cm_phon.obj"	"$(INTDIR)\cm_phon.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\cm_phon.obj"	"$(INTDIR)\cm_phon.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\cm_phon.obj"	"$(INTDIR)\cm_phon.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\cm_phon.obj"	"$(INTDIR)\cm_phon.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\cm_phon.obj"	"$(INTDIR)\cm_phon.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\cm_phon.obj"	"$(INTDIR)\cm_phon.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Cmd\cm_text.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\cm_text.obj"	"$(INTDIR)\cm_text.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\cm_text.obj"	"$(INTDIR)\cm_text.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\cm_text.obj"	"$(INTDIR)\cm_text.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\cm_text.obj"	"$(INTDIR)\cm_text.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\cm_text.obj"	"$(INTDIR)\cm_text.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\cm_text.obj"	"$(INTDIR)\cm_text.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\cm_text.obj"	"$(INTDIR)\cm_text.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Cmd\cm_util.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\cm_util.obj"	"$(INTDIR)\cm_util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\cm_util.obj"	"$(INTDIR)\cm_util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\cm_util.obj"	"$(INTDIR)\cm_util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\cm_util.obj"	"$(INTDIR)\cm_util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\cm_util.obj"	"$(INTDIR)\cm_util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\cm_util.obj"	"$(INTDIR)\cm_util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\cm_util.obj"	"$(INTDIR)\cm_util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Cmd\Cmd_init.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\Cmd_init.obj"	"$(INTDIR)\Cmd_init.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\Cmd_init.obj"	"$(INTDIR)\Cmd_init.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\Cmd_init.obj"	"$(INTDIR)\Cmd_init.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\Cmd_init.obj"	"$(INTDIR)\Cmd_init.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\Cmd_init.obj"	"$(INTDIR)\Cmd_init.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\Cmd_init.obj"	"$(INTDIR)\Cmd_init.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\Cmd_init.obj"	"$(INTDIR)\Cmd_init.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Cmd\cmd_wav.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\cmd_wav.obj"	"$(INTDIR)\cmd_wav.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\cmd_wav.obj"	"$(INTDIR)\cmd_wav.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\cmd_wav.obj"	"$(INTDIR)\cmd_wav.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\cmd_wav.obj"	"$(INTDIR)\cmd_wav.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\cmd_wav.obj"	"$(INTDIR)\cmd_wav.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\cmd_wav.obj"	"$(INTDIR)\cmd_wav.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\cmd_wav.obj"	"$(INTDIR)\cmd_wav.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Api\Crypt2.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\Crypt2.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\Crypt2.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\Crypt2.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\Crypt2.obj"	"$(INTDIR)\Crypt2.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\Crypt2.obj"	"$(INTDIR)\Crypt2.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\Crypt2.obj"	"$(INTDIR)\Crypt2.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\Crypt2.obj"	"$(INTDIR)\Crypt2.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\Crypt2.obj"	"$(INTDIR)\Crypt2.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\Crypt2.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\Crypt2.obj"	"$(INTDIR)\Crypt2.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\Crypt2.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\Crypt2.obj"	"$(INTDIR)\Crypt2.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Nt\dbgwins.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\dbgwins.obj"	"$(INTDIR)\dbgwins.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\dbgwins.obj"	"$(INTDIR)\dbgwins.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\dbgwins.obj"	"$(INTDIR)\dbgwins.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\dbgwins.obj"	"$(INTDIR)\dbgwins.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\dbgwins.obj"	"$(INTDIR)\dbgwins.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\dbgwins.obj"	"$(INTDIR)\dbgwins.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\dbgwins.obj"	"$(INTDIR)\dbgwins.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\hlsyn\diffuse.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\diffuse.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\diffuse.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\diffuse.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\diffuse.obj"	"$(INTDIR)\diffuse.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\diffuse.obj"	"$(INTDIR)\diffuse.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\diffuse.obj"	"$(INTDIR)\diffuse.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\diffuse.obj"	"$(INTDIR)\diffuse.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\diffuse.obj"	"$(INTDIR)\diffuse.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\diffuse.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\diffuse.obj"	"$(INTDIR)\diffuse.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\diffuse.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\diffuse.obj"	"$(INTDIR)\diffuse.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\hlsyn\fixfft32.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\fixfft32.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\fixfft32.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\fixfft32.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\fixfft32.obj"	"$(INTDIR)\fixfft32.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\fixfft32.obj"	"$(INTDIR)\fixfft32.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\fixfft32.obj"	"$(INTDIR)\fixfft32.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\fixfft32.obj"	"$(INTDIR)\fixfft32.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\fixfft32.obj"	"$(INTDIR)\fixfft32.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\fixfft32.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\fixfft32.obj"	"$(INTDIR)\fixfft32.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\fixfft32.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\fixfft32.obj"	"$(INTDIR)\fixfft32.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Nt\formtrak.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\formtrak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\formtrak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\formtrak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\formtrak.obj"	"$(INTDIR)\formtrak.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\formtrak.obj"	"$(INTDIR)\formtrak.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\formtrak.obj"	"$(INTDIR)\formtrak.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\formtrak.obj"	"$(INTDIR)\formtrak.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\formtrak.obj"	"$(INTDIR)\formtrak.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\formtrak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\formtrak.obj"	"$(INTDIR)\formtrak.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\formtrak.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\formtrak.obj"	"$(INTDIR)\formtrak.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\hlsyn\frame.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\frame.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\frame.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\frame.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\frame.obj"	"$(INTDIR)\frame.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\frame.obj"	"$(INTDIR)\frame.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\frame.obj"	"$(INTDIR)\frame.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\frame.obj"	"$(INTDIR)\frame.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\frame.obj"	"$(INTDIR)\frame.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\frame.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\frame.obj"	"$(INTDIR)\frame.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\frame.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\frame.obj"	"$(INTDIR)\frame.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\hlsyn\hlframe.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\hlframe.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\hlframe.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\hlframe.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\hlframe.obj"	"$(INTDIR)\hlframe.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\hlframe.obj"	"$(INTDIR)\hlframe.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\hlframe.obj"	"$(INTDIR)\hlframe.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\hlframe.obj"	"$(INTDIR)\hlframe.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\hlframe.obj"	"$(INTDIR)\hlframe.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\hlframe.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\hlframe.obj"	"$(INTDIR)\hlframe.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\hlframe.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\hlframe.obj"	"$(INTDIR)\hlframe.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\hlsyn\inithl.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\inithl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\inithl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\inithl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\inithl.obj"	"$(INTDIR)\inithl.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\inithl.obj"	"$(INTDIR)\inithl.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\inithl.obj"	"$(INTDIR)\inithl.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\inithl.obj"	"$(INTDIR)\inithl.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\inithl.obj"	"$(INTDIR)\inithl.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\inithl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\inithl.obj"	"$(INTDIR)\inithl.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\inithl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\inithl.obj"	"$(INTDIR)\inithl.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\hlsyn\llinit.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\llinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\llinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\llinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\llinit.obj"	"$(INTDIR)\llinit.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\llinit.obj"	"$(INTDIR)\llinit.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\llinit.obj"	"$(INTDIR)\llinit.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\llinit.obj"	"$(INTDIR)\llinit.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\llinit.obj"	"$(INTDIR)\llinit.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\llinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\llinit.obj"	"$(INTDIR)\llinit.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\llinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\llinit.obj"	"$(INTDIR)\llinit.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\loaddict.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\loaddict.obj"	"$(INTDIR)\loaddict.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\loaddict.obj"	"$(INTDIR)\loaddict.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\loaddict.obj"	"$(INTDIR)\loaddict.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\loaddict.obj"	"$(INTDIR)\loaddict.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\loaddict.obj"	"$(INTDIR)\loaddict.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\loaddict.obj"	"$(INTDIR)\loaddict.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\loaddict.obj"	"$(INTDIR)\loaddict.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\hlsyn\log10table.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\log10table.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\log10table.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\log10table.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\log10table.obj"	"$(INTDIR)\log10table.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\log10table.obj"	"$(INTDIR)\log10table.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\log10table.obj"	"$(INTDIR)\log10table.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\log10table.obj"	"$(INTDIR)\log10table.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\log10table.obj"	"$(INTDIR)\log10table.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\log10table.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\log10table.obj"	"$(INTDIR)\log10table.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\log10table.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\log10table.obj"	"$(INTDIR)\log10table.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\ls_chari.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\ls_chari.obj"	"$(INTDIR)\ls_chari.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\ls_chari.obj"	"$(INTDIR)\ls_chari.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\ls_chari.obj"	"$(INTDIR)\ls_chari.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\ls_chari.obj"	"$(INTDIR)\ls_chari.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\ls_chari.obj"	"$(INTDIR)\ls_chari.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\ls_chari.obj"	"$(INTDIR)\ls_chari.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\ls_chari.obj"	"$(INTDIR)\ls_chari.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\ls_dict.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\ls_dict.obj"	"$(INTDIR)\ls_dict.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\ls_dict.obj"	"$(INTDIR)\ls_dict.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\ls_dict.obj"	"$(INTDIR)\ls_dict.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\ls_dict.obj"	"$(INTDIR)\ls_dict.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\ls_dict.obj"	"$(INTDIR)\ls_dict.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\ls_dict.obj"	"$(INTDIR)\ls_dict.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\ls_dict.obj"	"$(INTDIR)\ls_dict.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\ls_homo.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\ls_homo.obj"	"$(INTDIR)\ls_homo.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\ls_homo.obj"	"$(INTDIR)\ls_homo.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\ls_homo.obj"	"$(INTDIR)\ls_homo.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\ls_homo.obj"	"$(INTDIR)\ls_homo.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\ls_homo.obj"	"$(INTDIR)\ls_homo.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\ls_homo.obj"	"$(INTDIR)\ls_homo.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\ls_homo.obj"	"$(INTDIR)\ls_homo.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\ls_math.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\ls_math.obj"	"$(INTDIR)\ls_math.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\ls_math.obj"	"$(INTDIR)\ls_math.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\ls_math.obj"	"$(INTDIR)\ls_math.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\ls_math.obj"	"$(INTDIR)\ls_math.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\ls_math.obj"	"$(INTDIR)\ls_math.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\ls_math.obj"	"$(INTDIR)\ls_math.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\ls_math.obj"	"$(INTDIR)\ls_math.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\ls_proc.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\ls_proc.obj"	"$(INTDIR)\ls_proc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\ls_proc.obj"	"$(INTDIR)\ls_proc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\ls_proc.obj"	"$(INTDIR)\ls_proc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\ls_proc.obj"	"$(INTDIR)\ls_proc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\ls_proc.obj"	"$(INTDIR)\ls_proc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\ls_proc.obj"	"$(INTDIR)\ls_proc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\ls_proc.obj"	"$(INTDIR)\ls_proc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\ls_spel.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\ls_spel.obj"	"$(INTDIR)\ls_spel.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\ls_spel.obj"	"$(INTDIR)\ls_spel.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\ls_spel.obj"	"$(INTDIR)\ls_spel.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\ls_spel.obj"	"$(INTDIR)\ls_spel.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\ls_spel.obj"	"$(INTDIR)\ls_spel.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\ls_spel.obj"	"$(INTDIR)\ls_spel.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\ls_spel.obj"	"$(INTDIR)\ls_spel.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\ls_speli.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\ls_speli.obj"	"$(INTDIR)\ls_speli.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\ls_speli.obj"	"$(INTDIR)\ls_speli.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\ls_speli.obj"	"$(INTDIR)\ls_speli.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\ls_speli.obj"	"$(INTDIR)\ls_speli.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\ls_speli.obj"	"$(INTDIR)\ls_speli.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\ls_speli.obj"	"$(INTDIR)\ls_speli.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\ls_speli.obj"	"$(INTDIR)\ls_speli.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\ls_suff.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\ls_suff.obj"	"$(INTDIR)\ls_suff.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\ls_suff.obj"	"$(INTDIR)\ls_suff.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\ls_suff.obj"	"$(INTDIR)\ls_suff.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\ls_suff.obj"	"$(INTDIR)\ls_suff.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\ls_suff.obj"	"$(INTDIR)\ls_suff.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\ls_suff.obj"	"$(INTDIR)\ls_suff.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\ls_suff.obj"	"$(INTDIR)\ls_suff.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\ls_suffi.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\ls_suffi.obj"	"$(INTDIR)\ls_suffi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\ls_suffi.obj"	"$(INTDIR)\ls_suffi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\ls_suffi.obj"	"$(INTDIR)\ls_suffi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\ls_suffi.obj"	"$(INTDIR)\ls_suffi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\ls_suffi.obj"	"$(INTDIR)\ls_suffi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\ls_suffi.obj"	"$(INTDIR)\ls_suffi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\ls_suffi.obj"	"$(INTDIR)\ls_suffi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\Lsa_adju.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\Lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\Lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\Lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\Lsa_adju.obj"	"$(INTDIR)\Lsa_adju.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\Lsa_adju.obj"	"$(INTDIR)\Lsa_adju.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\Lsa_adju.obj"	"$(INTDIR)\Lsa_adju.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\Lsa_adju.obj"	"$(INTDIR)\Lsa_adju.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\Lsa_adju.obj"	"$(INTDIR)\Lsa_adju.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\Lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\Lsa_adju.obj"	"$(INTDIR)\Lsa_adju.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\Lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\Lsa_adju.obj"	"$(INTDIR)\Lsa_adju.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_coni.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\lsa_coni.obj"	"$(INTDIR)\lsa_coni.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\lsa_coni.obj"	"$(INTDIR)\lsa_coni.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\lsa_coni.obj"	"$(INTDIR)\lsa_coni.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\lsa_coni.obj"	"$(INTDIR)\lsa_coni.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\lsa_coni.obj"	"$(INTDIR)\lsa_coni.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_coni.obj"	"$(INTDIR)\lsa_coni.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\lsa_coni.obj"	"$(INTDIR)\lsa_coni.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_fr.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\lsa_fr.obj"	"$(INTDIR)\lsa_fr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\lsa_fr.obj"	"$(INTDIR)\lsa_fr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\lsa_fr.obj"	"$(INTDIR)\lsa_fr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\lsa_fr.obj"	"$(INTDIR)\lsa_fr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\lsa_fr.obj"	"$(INTDIR)\lsa_fr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_fr.obj"	"$(INTDIR)\lsa_fr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\lsa_fr.obj"	"$(INTDIR)\lsa_fr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_gr.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\lsa_gr.obj"	"$(INTDIR)\lsa_gr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\lsa_gr.obj"	"$(INTDIR)\lsa_gr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\lsa_gr.obj"	"$(INTDIR)\lsa_gr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\lsa_gr.obj"	"$(INTDIR)\lsa_gr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\lsa_gr.obj"	"$(INTDIR)\lsa_gr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_gr.obj"	"$(INTDIR)\lsa_gr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\lsa_gr.obj"	"$(INTDIR)\lsa_gr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_ir.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\lsa_ir.obj"	"$(INTDIR)\lsa_ir.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\lsa_ir.obj"	"$(INTDIR)\lsa_ir.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\lsa_ir.obj"	"$(INTDIR)\lsa_ir.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\lsa_ir.obj"	"$(INTDIR)\lsa_ir.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\lsa_ir.obj"	"$(INTDIR)\lsa_ir.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_ir.obj"	"$(INTDIR)\lsa_ir.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\lsa_ir.obj"	"$(INTDIR)\lsa_ir.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_it.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\lsa_it.obj"	"$(INTDIR)\lsa_it.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\lsa_it.obj"	"$(INTDIR)\lsa_it.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\lsa_it.obj"	"$(INTDIR)\lsa_it.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\lsa_it.obj"	"$(INTDIR)\lsa_it.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\lsa_it.obj"	"$(INTDIR)\lsa_it.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_it.obj"	"$(INTDIR)\lsa_it.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\lsa_it.obj"	"$(INTDIR)\lsa_it.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_ja.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\lsa_ja.obj"	"$(INTDIR)\lsa_ja.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\lsa_ja.obj"	"$(INTDIR)\lsa_ja.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\lsa_ja.obj"	"$(INTDIR)\lsa_ja.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\lsa_ja.obj"	"$(INTDIR)\lsa_ja.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\lsa_ja.obj"	"$(INTDIR)\lsa_ja.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_ja.obj"	"$(INTDIR)\lsa_ja.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\lsa_ja.obj"	"$(INTDIR)\lsa_ja.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_rtbi.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\lsa_rtbi.obj"	"$(INTDIR)\lsa_rtbi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\lsa_rtbi.obj"	"$(INTDIR)\lsa_rtbi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\lsa_rtbi.obj"	"$(INTDIR)\lsa_rtbi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\lsa_rtbi.obj"	"$(INTDIR)\lsa_rtbi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\lsa_rtbi.obj"	"$(INTDIR)\lsa_rtbi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_rtbi.obj"	"$(INTDIR)\lsa_rtbi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\lsa_rtbi.obj"	"$(INTDIR)\lsa_rtbi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_rule.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\lsa_rule.obj"	"$(INTDIR)\lsa_rule.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\lsa_rule.obj"	"$(INTDIR)\lsa_rule.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\lsa_rule.obj"	"$(INTDIR)\lsa_rule.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\lsa_rule.obj"	"$(INTDIR)\lsa_rule.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\lsa_rule.obj"	"$(INTDIR)\lsa_rule.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_rule.obj"	"$(INTDIR)\lsa_rule.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\lsa_rule.obj"	"$(INTDIR)\lsa_rule.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_sl.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\lsa_sl.obj"	"$(INTDIR)\lsa_sl.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\lsa_sl.obj"	"$(INTDIR)\lsa_sl.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\lsa_sl.obj"	"$(INTDIR)\lsa_sl.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\lsa_sl.obj"	"$(INTDIR)\lsa_sl.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\lsa_sl.obj"	"$(INTDIR)\lsa_sl.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_sl.obj"	"$(INTDIR)\lsa_sl.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\lsa_sl.obj"	"$(INTDIR)\lsa_sl.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_sp.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\lsa_sp.obj"	"$(INTDIR)\lsa_sp.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\lsa_sp.obj"	"$(INTDIR)\lsa_sp.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\lsa_sp.obj"	"$(INTDIR)\lsa_sp.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\lsa_sp.obj"	"$(INTDIR)\lsa_sp.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\lsa_sp.obj"	"$(INTDIR)\lsa_sp.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_sp.obj"	"$(INTDIR)\lsa_sp.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\lsa_sp.obj"	"$(INTDIR)\lsa_sp.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_task.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\lsa_task.obj"	"$(INTDIR)\lsa_task.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\lsa_task.obj"	"$(INTDIR)\lsa_task.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\lsa_task.obj"	"$(INTDIR)\lsa_task.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\lsa_task.obj"	"$(INTDIR)\lsa_task.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\lsa_task.obj"	"$(INTDIR)\lsa_task.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_task.obj"	"$(INTDIR)\lsa_task.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\lsa_task.obj"	"$(INTDIR)\lsa_task.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_us.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\lsa_us.obj"	"$(INTDIR)\lsa_us.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\lsa_us.obj"	"$(INTDIR)\lsa_us.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\lsa_us.obj"	"$(INTDIR)\lsa_us.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\lsa_us.obj"	"$(INTDIR)\lsa_us.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\lsa_us.obj"	"$(INTDIR)\lsa_us.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_us.obj"	"$(INTDIR)\lsa_us.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\lsa_us.obj"	"$(INTDIR)\lsa_us.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_util.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\lsa_util.obj"	"$(INTDIR)\lsa_util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\lsa_util.obj"	"$(INTDIR)\lsa_util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\lsa_util.obj"	"$(INTDIR)\lsa_util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\lsa_util.obj"	"$(INTDIR)\lsa_util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\lsa_util.obj"	"$(INTDIR)\lsa_util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_util.obj"	"$(INTDIR)\lsa_util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\lsa_util.obj"	"$(INTDIR)\lsa_util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsw_main.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\lsw_main.obj"	"$(INTDIR)\lsw_main.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\lsw_main.obj"	"$(INTDIR)\lsw_main.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\lsw_main.obj"	"$(INTDIR)\lsw_main.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\lsw_main.obj"	"$(INTDIR)\lsw_main.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\lsw_main.obj"	"$(INTDIR)\lsw_main.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\lsw_main.obj"	"$(INTDIR)\lsw_main.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\lsw_main.obj"	"$(INTDIR)\lsw_main.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\hlsyn\nasalf1x.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\nasalf1x.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\nasalf1x.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\nasalf1x.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\nasalf1x.obj"	"$(INTDIR)\nasalf1x.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\nasalf1x.obj"	"$(INTDIR)\nasalf1x.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\nasalf1x.obj"	"$(INTDIR)\nasalf1x.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\nasalf1x.obj"	"$(INTDIR)\nasalf1x.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\nasalf1x.obj"	"$(INTDIR)\nasalf1x.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\nasalf1x.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\nasalf1x.obj"	"$(INTDIR)\nasalf1x.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\nasalf1x.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\nasalf1x.obj"	"$(INTDIR)\nasalf1x.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Cmd\par_ambi.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\par_ambi.obj"	"$(INTDIR)\par_ambi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\par_ambi.obj"	"$(INTDIR)\par_ambi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\par_ambi.obj"	"$(INTDIR)\par_ambi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\par_ambi.obj"	"$(INTDIR)\par_ambi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\par_ambi.obj"	"$(INTDIR)\par_ambi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\par_ambi.obj"	"$(INTDIR)\par_ambi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\par_ambi.obj"	"$(INTDIR)\par_ambi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Cmd\par_dict.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\par_dict.obj"	"$(INTDIR)\par_dict.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\par_dict.obj"	"$(INTDIR)\par_dict.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\par_dict.obj"	"$(INTDIR)\par_dict.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\par_dict.obj"	"$(INTDIR)\par_dict.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\par_dict.obj"	"$(INTDIR)\par_dict.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\par_dict.obj"	"$(INTDIR)\par_dict.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\par_dict.obj"	"$(INTDIR)\par_dict.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Cmd\par_pars.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\par_pars.obj"	"$(INTDIR)\par_pars.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\par_pars.obj"	"$(INTDIR)\par_pars.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\par_pars.obj"	"$(INTDIR)\par_pars.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\par_pars.obj"	"$(INTDIR)\par_pars.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\par_pars.obj"	"$(INTDIR)\par_pars.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\par_pars.obj"	"$(INTDIR)\par_pars.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\par_pars.obj"	"$(INTDIR)\par_pars.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Cmd\par_rule.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\par_rule.obj"	"$(INTDIR)\par_rule.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\par_rule.obj"	"$(INTDIR)\par_rule.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\par_rule.obj"	"$(INTDIR)\par_rule.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\par_rule.obj"	"$(INTDIR)\par_rule.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\par_rule.obj"	"$(INTDIR)\par_rule.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\par_rule.obj"	"$(INTDIR)\par_rule.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\par_rule.obj"	"$(INTDIR)\par_rule.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Ph\ph_aloph.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\ph_aloph.obj"	"$(INTDIR)\ph_aloph.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\ph_aloph.obj"	"$(INTDIR)\ph_aloph.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\ph_aloph.obj"	"$(INTDIR)\ph_aloph.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\ph_aloph.obj"	"$(INTDIR)\ph_aloph.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\ph_aloph.obj"	"$(INTDIR)\ph_aloph.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\ph_aloph.obj"	"$(INTDIR)\ph_aloph.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\ph_aloph.obj"	"$(INTDIR)\ph_aloph.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Ph\ph_claus.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\ph_claus.obj"	"$(INTDIR)\ph_claus.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\ph_claus.obj"	"$(INTDIR)\ph_claus.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\ph_claus.obj"	"$(INTDIR)\ph_claus.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\ph_claus.obj"	"$(INTDIR)\ph_claus.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\ph_claus.obj"	"$(INTDIR)\ph_claus.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\ph_claus.obj"	"$(INTDIR)\ph_claus.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\ph_claus.obj"	"$(INTDIR)\ph_claus.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Ph\ph_draw.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\ph_draw.obj"	"$(INTDIR)\ph_draw.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\ph_draw.obj"	"$(INTDIR)\ph_draw.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\ph_draw.obj"	"$(INTDIR)\ph_draw.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\ph_draw.obj"	"$(INTDIR)\ph_draw.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\ph_draw.obj"	"$(INTDIR)\ph_draw.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\ph_draw.obj"	"$(INTDIR)\ph_draw.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\ph_draw.obj"	"$(INTDIR)\ph_draw.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Ph\ph_drwt0.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\ph_drwt0.obj"	"$(INTDIR)\ph_drwt0.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\ph_drwt0.obj"	"$(INTDIR)\ph_drwt0.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\ph_drwt0.obj"	"$(INTDIR)\ph_drwt0.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\ph_drwt0.obj"	"$(INTDIR)\ph_drwt0.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\ph_drwt0.obj"	"$(INTDIR)\ph_drwt0.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\ph_drwt0.obj"	"$(INTDIR)\ph_drwt0.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\ph_drwt0.obj"	"$(INTDIR)\ph_drwt0.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Ph\ph_inton.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\ph_inton.obj"	"$(INTDIR)\ph_inton.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\ph_inton.obj"	"$(INTDIR)\ph_inton.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\ph_inton.obj"	"$(INTDIR)\ph_inton.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\ph_inton.obj"	"$(INTDIR)\ph_inton.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\ph_inton.obj"	"$(INTDIR)\ph_inton.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\ph_inton.obj"	"$(INTDIR)\ph_inton.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\ph_inton.obj"	"$(INTDIR)\ph_inton.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Ph\ph_main.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\ph_main.obj"	"$(INTDIR)\ph_main.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\ph_main.obj"	"$(INTDIR)\ph_main.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\ph_main.obj"	"$(INTDIR)\ph_main.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\ph_main.obj"	"$(INTDIR)\ph_main.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\ph_main.obj"	"$(INTDIR)\ph_main.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\ph_main.obj"	"$(INTDIR)\ph_main.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\ph_main.obj"	"$(INTDIR)\ph_main.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Ph\ph_romi.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\ph_romi.obj"	"$(INTDIR)\ph_romi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\ph_romi.obj"	"$(INTDIR)\ph_romi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\ph_romi.obj"	"$(INTDIR)\ph_romi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\ph_romi.obj"	"$(INTDIR)\ph_romi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\ph_romi.obj"	"$(INTDIR)\ph_romi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\ph_romi.obj"	"$(INTDIR)\ph_romi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\ph_romi.obj"	"$(INTDIR)\ph_romi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Ph\ph_setar.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\ph_setar.obj"	"$(INTDIR)\ph_setar.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\ph_setar.obj"	"$(INTDIR)\ph_setar.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\ph_setar.obj"	"$(INTDIR)\ph_setar.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\ph_setar.obj"	"$(INTDIR)\ph_setar.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\ph_setar.obj"	"$(INTDIR)\ph_setar.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\ph_setar.obj"	"$(INTDIR)\ph_setar.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\ph_setar.obj"	"$(INTDIR)\ph_setar.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Ph\ph_sort.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\ph_sort.obj"	"$(INTDIR)\ph_sort.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\ph_sort.obj"	"$(INTDIR)\ph_sort.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\ph_sort.obj"	"$(INTDIR)\ph_sort.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\ph_sort.obj"	"$(INTDIR)\ph_sort.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\ph_sort.obj"	"$(INTDIR)\ph_sort.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\ph_sort.obj"	"$(INTDIR)\ph_sort.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\ph_sort.obj"	"$(INTDIR)\ph_sort.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Ph\ph_syl.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\ph_syl.obj"	"$(INTDIR)\ph_syl.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\ph_syl.obj"	"$(INTDIR)\ph_syl.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\ph_syl.obj"	"$(INTDIR)\ph_syl.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\ph_syl.obj"	"$(INTDIR)\ph_syl.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\ph_syl.obj"	"$(INTDIR)\ph_syl.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\ph_syl.obj"	"$(INTDIR)\ph_syl.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\ph_syl.obj"	"$(INTDIR)\ph_syl.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Ph\ph_syntx.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\ph_syntx.obj"	"$(INTDIR)\ph_syntx.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\ph_syntx.obj"	"$(INTDIR)\ph_syntx.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\ph_syntx.obj"	"$(INTDIR)\ph_syntx.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\ph_syntx.obj"	"$(INTDIR)\ph_syntx.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\ph_syntx.obj"	"$(INTDIR)\ph_syntx.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\ph_syntx.obj"	"$(INTDIR)\ph_syntx.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\ph_syntx.obj"	"$(INTDIR)\ph_syntx.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Ph\ph_task.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\ph_task.obj"	"$(INTDIR)\ph_task.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\ph_task.obj"	"$(INTDIR)\ph_task.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\ph_task.obj"	"$(INTDIR)\ph_task.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\ph_task.obj"	"$(INTDIR)\ph_task.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\ph_task.obj"	"$(INTDIR)\ph_task.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\ph_task.obj"	"$(INTDIR)\ph_task.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\ph_task.obj"	"$(INTDIR)\ph_task.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Ph\ph_timng.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\ph_timng.obj"	"$(INTDIR)\ph_timng.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\ph_timng.obj"	"$(INTDIR)\ph_timng.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\ph_timng.obj"	"$(INTDIR)\ph_timng.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\ph_timng.obj"	"$(INTDIR)\ph_timng.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\ph_timng.obj"	"$(INTDIR)\ph_timng.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\ph_timng.obj"	"$(INTDIR)\ph_timng.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\ph_timng.obj"	"$(INTDIR)\ph_timng.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Ph\ph_vdefi.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\ph_vdefi.obj"	"$(INTDIR)\ph_vdefi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\ph_vdefi.obj"	"$(INTDIR)\ph_vdefi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\ph_vdefi.obj"	"$(INTDIR)\ph_vdefi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\ph_vdefi.obj"	"$(INTDIR)\ph_vdefi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\ph_vdefi.obj"	"$(INTDIR)\ph_vdefi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\ph_vdefi.obj"	"$(INTDIR)\ph_vdefi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\ph_vdefi.obj"	"$(INTDIR)\ph_vdefi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Ph\ph_vset.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\ph_vset.obj"	"$(INTDIR)\ph_vset.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\ph_vset.obj"	"$(INTDIR)\ph_vset.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\ph_vset.obj"	"$(INTDIR)\ph_vset.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\ph_vset.obj"	"$(INTDIR)\ph_vset.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\ph_vset.obj"	"$(INTDIR)\ph_vset.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\ph_vset.obj"	"$(INTDIR)\ph_vset.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\ph_vset.obj"	"$(INTDIR)\ph_vset.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Ph\phinit.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\phinit.obj"	"$(INTDIR)\phinit.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\phinit.obj"	"$(INTDIR)\phinit.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\phinit.obj"	"$(INTDIR)\phinit.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\phinit.obj"	"$(INTDIR)\phinit.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\phinit.obj"	"$(INTDIR)\phinit.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\phinit.obj"	"$(INTDIR)\phinit.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\phinit.obj"	"$(INTDIR)\phinit.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Ph\phlog.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\phlog.obj"	"$(INTDIR)\phlog.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\phlog.obj"	"$(INTDIR)\phlog.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\phlog.obj"	"$(INTDIR)\phlog.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\phlog.obj"	"$(INTDIR)\phlog.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\phlog.obj"	"$(INTDIR)\phlog.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\phlog.obj"	"$(INTDIR)\phlog.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\phlog.obj"	"$(INTDIR)\phlog.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\hlsyn\reson.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\reson.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\reson.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\reson.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\reson.obj"	"$(INTDIR)\reson.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\reson.obj"	"$(INTDIR)\reson.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\reson.obj"	"$(INTDIR)\reson.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\reson.obj"	"$(INTDIR)\reson.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\reson.obj"	"$(INTDIR)\reson.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\reson.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\reson.obj"	"$(INTDIR)\reson.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\reson.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\reson.obj"	"$(INTDIR)\reson.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\hlsyn\sample.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\sample.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\sample.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\sample.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\sample.obj"	"$(INTDIR)\sample.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\sample.obj"	"$(INTDIR)\sample.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\sample.obj"	"$(INTDIR)\sample.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\sample.obj"	"$(INTDIR)\sample.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\sample.obj"	"$(INTDIR)\sample.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\sample.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\sample.obj"	"$(INTDIR)\sample.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\sample.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\sample.obj"	"$(INTDIR)\sample.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\hlsyn\sqrttable.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\sqrttable.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\sqrttable.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\sqrttable.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\sqrttable.obj"	"$(INTDIR)\sqrttable.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\sqrttable.obj"	"$(INTDIR)\sqrttable.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\sqrttable.obj"	"$(INTDIR)\sqrttable.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\sqrttable.obj"	"$(INTDIR)\sqrttable.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\sqrttable.obj"	"$(INTDIR)\sqrttable.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\sqrttable.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\sqrttable.obj"	"$(INTDIR)\sqrttable.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\sqrttable.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\sqrttable.obj"	"$(INTDIR)\sqrttable.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Api\Ttsapi.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\Ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\Ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\Ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\Ttsapi.obj"	"$(INTDIR)\Ttsapi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\Ttsapi.obj"	"$(INTDIR)\Ttsapi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\Ttsapi.obj"	"$(INTDIR)\Ttsapi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\Ttsapi.obj"	"$(INTDIR)\Ttsapi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\Ttsapi.obj"	"$(INTDIR)\Ttsapi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\Ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\Ttsapi.obj"	"$(INTDIR)\Ttsapi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\Ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\Ttsapi.obj"	"$(INTDIR)\Ttsapi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\hlsyn\voice.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\voice.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\voice.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\voice.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\voice.obj"	"$(INTDIR)\voice.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\voice.obj"	"$(INTDIR)\voice.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\voice.obj"	"$(INTDIR)\voice.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\voice.obj"	"$(INTDIR)\voice.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\voice.obj"	"$(INTDIR)\voice.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\voice.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\voice.obj"	"$(INTDIR)\voice.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\voice.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\voice.obj"	"$(INTDIR)\voice.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Vtm\Vtm.c

!IF  "$(CFG)" == "wtlkstat - Win32 Release Spanish"


"$(INTDIR)\Vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release German"


"$(INTDIR)\Vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release Latin American"


"$(INTDIR)\Vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Spanish"


"$(INTDIR)\Vtm.obj"	"$(INTDIR)\Vtm.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug German"


"$(INTDIR)\Vtm.obj"	"$(INTDIR)\Vtm.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug Latin American"


"$(INTDIR)\Vtm.obj"	"$(INTDIR)\Vtm.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug"


"$(INTDIR)\Vtm.obj"	"$(INTDIR)\Vtm.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release"


"$(INTDIR)\Vtm.obj"	"$(INTDIR)\Vtm.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release United Kingdom"


"$(INTDIR)\Vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug United Kingdom"


"$(INTDIR)\Vtm.obj"	"$(INTDIR)\Vtm.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Release French"


"$(INTDIR)\Vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "wtlkstat - Win32 Debug French"


"$(INTDIR)\Vtm.obj"	"$(INTDIR)\Vtm.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 


!ENDIF 

