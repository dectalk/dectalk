# Microsoft Developer Studio Generated NMAKE File, Based on sapi5.dsp
!IF "$(CFG)" == ""
CFG=Sapi5 - Win32 Release
!MESSAGE No configuration specified. Defaulting to Sapi5 - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "Sapi5 - Win32 Release" && "$(CFG)" != "Sapi5 - Win32 Debug" && "$(CFG)" != "Sapi5 - Win32 Release Spanish" && "$(CFG)" != "Sapi5 - Win32 Release German" && "$(CFG)" != "Sapi5 - Win32 Release Latin American" && "$(CFG)" != "Sapi5 - Win32 Debug Spanish" && "$(CFG)" != "Sapi5 - Win32 Debug German" && "$(CFG)" != "Sapi5 - Win32 Debug Latin American" && "$(CFG)" != "Sapi5 - Win32 Release Access32" && "$(CFG)" != "Sapi5 - Win32 Release Access32 Spanish" && "$(CFG)" != "Sapi5 - Win32 Release Access32 German" && "$(CFG)" != "Sapi5 - Win32 Release Access32 Latin American" && "$(CFG)" != "Sapi5 - Win32 Debug Access32" && "$(CFG)" != "Sapi5 - Win32 Debug Access32 Spanish" && "$(CFG)" != "Sapi5 - Win32 Debug Access32 German" && "$(CFG)" != "Sapi5 - Win32 Debug Access32 Latin American" && "$(CFG)" != "Sapi5 - Win32 Release United Kingdom" && "$(CFG)" != "Sapi5 - Win32 Debug United Kingdom" && "$(CFG)" != "Sapi5 - Win32 Release Access32 United Kingdom" && "$(CFG)" != "Sapi5 - Win32 Debug Access32 United Kingdom"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "sapi5.mak" CFG="Sapi5 - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Sapi5 - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Sapi5 - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Sapi5 - Win32 Release Spanish" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Sapi5 - Win32 Release German" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Sapi5 - Win32 Release Latin American" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Sapi5 - Win32 Debug Spanish" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Sapi5 - Win32 Debug German" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Sapi5 - Win32 Debug Latin American" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Sapi5 - Win32 Release Access32" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Sapi5 - Win32 Release Access32 Spanish" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Sapi5 - Win32 Release Access32 German" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Sapi5 - Win32 Release Access32 Latin American" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Sapi5 - Win32 Debug Access32" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Sapi5 - Win32 Debug Access32 Spanish" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Sapi5 - Win32 Debug Access32 German" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Sapi5 - Win32 Debug Access32 Latin American" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Sapi5 - Win32 Release United Kingdom" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Sapi5 - Win32 Debug United Kingdom" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Sapi5 - Win32 Release Access32 United Kingdom" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Sapi5 - Win32 Debug Access32 United Kingdom" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "Sapi5 - Win32 Release"

OUTDIR=.\build\us\release
INTDIR=.\build\us\release\link
# Begin Custom Macros
OutDir=.\build\us\release
# End Custom Macros

ALL : "$(OUTDIR)\sapi5.dll" "$(OUTDIR)\ttseng.tlb" "$(OUTDIR)\sapi5.bsc"


CLEAN :
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
	-@erase "$(INTDIR)\CRYPT2.OBJ"
	-@erase "$(INTDIR)\CRYPT2.SBR"
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\dbgwins.sbr"
	-@erase "$(INTDIR)\DECSTD97.OBJ"
	-@erase "$(INTDIR)\DECSTD97.SBR"
	-@erase "$(INTDIR)\loaddict.obj"
	-@erase "$(INTDIR)\loaddict.sbr"
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
	-@erase "$(INTDIR)\lsa_adju.obj"
	-@erase "$(INTDIR)\lsa_adju.sbr"
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
	-@erase "$(INTDIR)\mmalloc.obj"
	-@erase "$(INTDIR)\mmalloc.sbr"
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\opthread.sbr"
	-@erase "$(INTDIR)\par_ambi.obj"
	-@erase "$(INTDIR)\par_ambi.sbr"
	-@erase "$(INTDIR)\Par_char.obj"
	-@erase "$(INTDIR)\Par_char.sbr"
	-@erase "$(INTDIR)\Par_dict.obj"
	-@erase "$(INTDIR)\Par_dict.sbr"
	-@erase "$(INTDIR)\Par_pars.obj"
	-@erase "$(INTDIR)\Par_pars.sbr"
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
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\PIPE.SBR"
	-@erase "$(INTDIR)\playaud.obj"
	-@erase "$(INTDIR)\playaud.sbr"
	-@erase "$(INTDIR)\PLAYTONE.OBJ"
	-@erase "$(INTDIR)\PLAYTONE.SBR"
	-@erase "$(INTDIR)\sapiiont.obj"
	-@erase "$(INTDIR)\sapiiont.sbr"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SERVICES.SBR"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\SPC.SBR"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\stdafx.sbr"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\SYNC.SBR"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\ttsapi.sbr"
	-@erase "$(INTDIR)\ttseng.obj"
	-@erase "$(INTDIR)\ttseng.res"
	-@erase "$(INTDIR)\ttseng.sbr"
	-@erase "$(INTDIR)\ttsengobj.obj"
	-@erase "$(INTDIR)\ttsengobj.sbr"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\USA_INIT.SBR"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\vtm.sbr"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(INTDIR)\VTMIONT.SBR"
	-@erase "$(OUTDIR)\sapi5.bsc"
	-@erase "$(OUTDIR)\sapi5.dll"
	-@erase "$(OUTDIR)\sapi5.exp"
	-@erase "$(OUTDIR)\sapi5.lib"
	-@erase ".\build\us\release\ttseng.tlb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I "..\dapi\src\api" /I "..\dapi\src\acna" /I "..\dapi\src\cmd" /I "..\dapi\src\lts" /I "..\dapi\src\ph" /I "..\dapi\src\vtm" /I "..\dapi\src\kernel" /I "..\dapi\src\nt" /I "..\dapi\src\include" /I "..\dapi\src\protos" /I ".." /I ".\include" /I ".\src" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /D "SAPI5DECTALK" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\sapi5.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
MTL_PROJ=/nologo /I ".\idl" /D "NDEBUG" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\ttseng.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\sapi5.bsc" 
BSC32_SBRS= \
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
	"$(INTDIR)\CRYPT2.SBR" \
	"$(INTDIR)\dbgwins.sbr" \
	"$(INTDIR)\DECSTD97.SBR" \
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
	"$(INTDIR)\lsa_adju.sbr" \
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
	"$(INTDIR)\mmalloc.sbr" \
	"$(INTDIR)\opthread.sbr" \
	"$(INTDIR)\par_ambi.sbr" \
	"$(INTDIR)\Par_char.sbr" \
	"$(INTDIR)\Par_dict.sbr" \
	"$(INTDIR)\Par_pars.sbr" \
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
	"$(INTDIR)\PIPE.SBR" \
	"$(INTDIR)\playaud.sbr" \
	"$(INTDIR)\PLAYTONE.SBR" \
	"$(INTDIR)\sapiiont.sbr" \
	"$(INTDIR)\SERVICES.SBR" \
	"$(INTDIR)\SPC.SBR" \
	"$(INTDIR)\stdafx.sbr" \
	"$(INTDIR)\SYNC.SBR" \
	"$(INTDIR)\ttsapi.sbr" \
	"$(INTDIR)\ttseng.sbr" \
	"$(INTDIR)\ttsengobj.sbr" \
	"$(INTDIR)\USA_INIT.SBR" \
	"$(INTDIR)\vtm.sbr" \
	"$(INTDIR)\VTMIONT.SBR"

"$(OUTDIR)\sapi5.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\sapi5.pdb" /machine:I386 /def:".\src\ttseng.def" /out:"$(OUTDIR)\sapi5.dll" /implib:"$(OUTDIR)\sapi5.lib" /libpath:".\lib\i386" 
DEF_FILE= \
	".\src\ttseng.def"
LINK32_OBJS= \
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
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\DECSTD97.OBJ" \
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
	"$(INTDIR)\lsa_adju.obj" \
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
	"$(INTDIR)\mmalloc.obj" \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\par_ambi.obj" \
	"$(INTDIR)\Par_char.obj" \
	"$(INTDIR)\Par_dict.obj" \
	"$(INTDIR)\Par_pars.obj" \
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
	"$(INTDIR)\PIPE.OBJ" \
	"$(INTDIR)\playaud.obj" \
	"$(INTDIR)\PLAYTONE.OBJ" \
	"$(INTDIR)\sapiiont.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\ttseng.obj" \
	"$(INTDIR)\ttsengobj.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ" \
	"$(INTDIR)\ttseng.res"

"$(OUTDIR)\sapi5.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"

OUTDIR=.\build\us\debug
INTDIR=.\build\us\debug\link
# Begin Custom Macros
OutDir=.\build\us\debug
# End Custom Macros

ALL : "$(OUTDIR)\sapi5.dll" "$(OUTDIR)\ttseng.tlb" "$(OUTDIR)\sapi5.bsc"


CLEAN :
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
	-@erase "$(INTDIR)\CRYPT2.OBJ"
	-@erase "$(INTDIR)\CRYPT2.SBR"
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\dbgwins.sbr"
	-@erase "$(INTDIR)\DECSTD97.OBJ"
	-@erase "$(INTDIR)\DECSTD97.SBR"
	-@erase "$(INTDIR)\loaddict.obj"
	-@erase "$(INTDIR)\loaddict.sbr"
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
	-@erase "$(INTDIR)\lsa_adju.obj"
	-@erase "$(INTDIR)\lsa_adju.sbr"
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
	-@erase "$(INTDIR)\mmalloc.obj"
	-@erase "$(INTDIR)\mmalloc.sbr"
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\opthread.sbr"
	-@erase "$(INTDIR)\par_ambi.obj"
	-@erase "$(INTDIR)\par_ambi.sbr"
	-@erase "$(INTDIR)\Par_char.obj"
	-@erase "$(INTDIR)\Par_char.sbr"
	-@erase "$(INTDIR)\Par_dict.obj"
	-@erase "$(INTDIR)\Par_dict.sbr"
	-@erase "$(INTDIR)\Par_pars.obj"
	-@erase "$(INTDIR)\Par_pars.sbr"
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
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\PIPE.SBR"
	-@erase "$(INTDIR)\playaud.obj"
	-@erase "$(INTDIR)\playaud.sbr"
	-@erase "$(INTDIR)\PLAYTONE.OBJ"
	-@erase "$(INTDIR)\PLAYTONE.SBR"
	-@erase "$(INTDIR)\sapiiont.obj"
	-@erase "$(INTDIR)\sapiiont.sbr"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SERVICES.SBR"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\SPC.SBR"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\stdafx.sbr"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\SYNC.SBR"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\ttsapi.sbr"
	-@erase "$(INTDIR)\ttseng.obj"
	-@erase "$(INTDIR)\ttseng.res"
	-@erase "$(INTDIR)\ttseng.sbr"
	-@erase "$(INTDIR)\ttsengobj.obj"
	-@erase "$(INTDIR)\ttsengobj.sbr"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\USA_INIT.SBR"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\vtm.sbr"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(INTDIR)\VTMIONT.SBR"
	-@erase "$(OUTDIR)\sapi5.bsc"
	-@erase "$(OUTDIR)\sapi5.dll"
	-@erase "$(OUTDIR)\sapi5.exp"
	-@erase "$(OUTDIR)\sapi5.ilk"
	-@erase "$(OUTDIR)\sapi5.lib"
	-@erase "$(OUTDIR)\sapi5.pdb"
	-@erase ".\build\us\debug\ttseng.tlb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I "..\dapi\src\api" /I "..\dapi\src\acna" /I "..\dapi\src\cmd" /I "..\dapi\src\lts" /I "..\dapi\src\ph" /I "..\dapi\src\vtm" /I "..\dapi\src\kernel" /I "..\dapi\src\nt" /I "..\dapi\src\include" /I "..\dapi\src\protos" /I ".." /I ".\include" /I ".\src" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /D "SAPI5DECTALK" /Fr"$(INTDIR)\\" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
MTL_PROJ=/nologo /I ".\idl" /D "_DEBUG" /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\ttseng.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\sapi5.bsc" 
BSC32_SBRS= \
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
	"$(INTDIR)\CRYPT2.SBR" \
	"$(INTDIR)\dbgwins.sbr" \
	"$(INTDIR)\DECSTD97.SBR" \
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
	"$(INTDIR)\lsa_adju.sbr" \
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
	"$(INTDIR)\mmalloc.sbr" \
	"$(INTDIR)\opthread.sbr" \
	"$(INTDIR)\par_ambi.sbr" \
	"$(INTDIR)\Par_char.sbr" \
	"$(INTDIR)\Par_dict.sbr" \
	"$(INTDIR)\Par_pars.sbr" \
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
	"$(INTDIR)\PIPE.SBR" \
	"$(INTDIR)\playaud.sbr" \
	"$(INTDIR)\PLAYTONE.SBR" \
	"$(INTDIR)\sapiiont.sbr" \
	"$(INTDIR)\SERVICES.SBR" \
	"$(INTDIR)\SPC.SBR" \
	"$(INTDIR)\stdafx.sbr" \
	"$(INTDIR)\SYNC.SBR" \
	"$(INTDIR)\ttsapi.sbr" \
	"$(INTDIR)\ttseng.sbr" \
	"$(INTDIR)\ttsengobj.sbr" \
	"$(INTDIR)\USA_INIT.SBR" \
	"$(INTDIR)\vtm.sbr" \
	"$(INTDIR)\VTMIONT.SBR"

"$(OUTDIR)\sapi5.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\sapi5.pdb" /debug /debugtype:both /machine:IX86 /def:".\src\ttseng.def" /out:"$(OUTDIR)\sapi5.dll" /implib:"$(OUTDIR)\sapi5.lib" /pdbtype:sept /libpath:".\lib\i386" 
DEF_FILE= \
	".\src\ttseng.def"
LINK32_OBJS= \
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
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\DECSTD97.OBJ" \
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
	"$(INTDIR)\lsa_adju.obj" \
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
	"$(INTDIR)\mmalloc.obj" \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\par_ambi.obj" \
	"$(INTDIR)\Par_char.obj" \
	"$(INTDIR)\Par_dict.obj" \
	"$(INTDIR)\Par_pars.obj" \
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
	"$(INTDIR)\PIPE.OBJ" \
	"$(INTDIR)\playaud.obj" \
	"$(INTDIR)\PLAYTONE.OBJ" \
	"$(INTDIR)\sapiiont.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\ttseng.obj" \
	"$(INTDIR)\ttsengobj.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ" \
	"$(INTDIR)\ttseng.res"

"$(OUTDIR)\sapi5.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"

OUTDIR=.\..\build\dectalk\sp\release
INTDIR=.\..\build\dectalk\sp\release\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll" "$(OUTDIR)\ttseng.tlb"


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
	-@erase "$(INTDIR)\CRYPT2.OBJ"
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\DECSTD97.OBJ"
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
	-@erase "$(INTDIR)\lsa_adju.obj"
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
	-@erase "$(INTDIR)\mmalloc.obj"
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\par_ambi.obj"
	-@erase "$(INTDIR)\Par_char.obj"
	-@erase "$(INTDIR)\Par_dict.obj"
	-@erase "$(INTDIR)\Par_pars.obj"
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
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\playaud.obj"
	-@erase "$(INTDIR)\PLAYTONE.OBJ"
	-@erase "$(INTDIR)\sapiiont.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\ttseng.obj"
	-@erase "$(INTDIR)\ttseng.res"
	-@erase "$(INTDIR)\ttsengobj.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.lib"
	-@erase "..\build\dectalk\sp\release\ttseng.tlb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "SPANISH_SP" /Fp"$(INTDIR)\sapi5.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\ttseng.res" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dectalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dectalk.pdb" /machine:I386 /def:".\src\ttseng.def" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\src\ttseng.def"
LINK32_OBJS= \
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
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\DECSTD97.OBJ" \
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
	"$(INTDIR)\lsa_adju.obj" \
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
	"$(INTDIR)\mmalloc.obj" \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\par_ambi.obj" \
	"$(INTDIR)\Par_char.obj" \
	"$(INTDIR)\Par_dict.obj" \
	"$(INTDIR)\Par_pars.obj" \
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
	"$(INTDIR)\PIPE.OBJ" \
	"$(INTDIR)\playaud.obj" \
	"$(INTDIR)\PLAYTONE.OBJ" \
	"$(INTDIR)\sapiiont.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\ttseng.obj" \
	"$(INTDIR)\ttsengobj.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ" \
	"$(INTDIR)\ttseng.res"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"

OUTDIR=.\..\build\dectalk\gr\release
INTDIR=.\..\build\dectalk\gr\release\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll" "$(OUTDIR)\ttseng.tlb"


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
	-@erase "$(INTDIR)\CRYPT2.OBJ"
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\DECSTD97.OBJ"
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
	-@erase "$(INTDIR)\lsa_adju.obj"
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
	-@erase "$(INTDIR)\mmalloc.obj"
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\par_ambi.obj"
	-@erase "$(INTDIR)\Par_char.obj"
	-@erase "$(INTDIR)\Par_dict.obj"
	-@erase "$(INTDIR)\Par_pars.obj"
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
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\playaud.obj"
	-@erase "$(INTDIR)\PLAYTONE.OBJ"
	-@erase "$(INTDIR)\sapiiont.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\ttseng.obj"
	-@erase "$(INTDIR)\ttseng.res"
	-@erase "$(INTDIR)\ttsengobj.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.lib"
	-@erase "..\build\dectalk\gr\release\ttseng.tlb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "GERMAN" /Fp"$(INTDIR)\sapi5.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /Zm200 /c 

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
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\ttseng.res" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dectalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dectalk.pdb" /machine:I386 /def:".\src\ttseng.def" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\src\ttseng.def"
LINK32_OBJS= \
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
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\DECSTD97.OBJ" \
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
	"$(INTDIR)\lsa_adju.obj" \
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
	"$(INTDIR)\mmalloc.obj" \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\par_ambi.obj" \
	"$(INTDIR)\Par_char.obj" \
	"$(INTDIR)\Par_dict.obj" \
	"$(INTDIR)\Par_pars.obj" \
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
	"$(INTDIR)\PIPE.OBJ" \
	"$(INTDIR)\playaud.obj" \
	"$(INTDIR)\PLAYTONE.OBJ" \
	"$(INTDIR)\sapiiont.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\ttseng.obj" \
	"$(INTDIR)\ttsengobj.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ" \
	"$(INTDIR)\ttseng.res"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"

OUTDIR=.\..\build\dectalk\la\release
INTDIR=.\..\build\dectalk\la\release\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\la\release
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll" "$(OUTDIR)\ttseng.tlb"


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
	-@erase "$(INTDIR)\CRYPT2.OBJ"
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\DECSTD97.OBJ"
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
	-@erase "$(INTDIR)\lsa_adju.obj"
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
	-@erase "$(INTDIR)\mmalloc.obj"
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\par_ambi.obj"
	-@erase "$(INTDIR)\Par_char.obj"
	-@erase "$(INTDIR)\Par_dict.obj"
	-@erase "$(INTDIR)\Par_pars.obj"
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
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\playaud.obj"
	-@erase "$(INTDIR)\PLAYTONE.OBJ"
	-@erase "$(INTDIR)\sapiiont.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\ttseng.obj"
	-@erase "$(INTDIR)\ttseng.res"
	-@erase "$(INTDIR)\ttsengobj.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.lib"
	-@erase "..\build\dectalk\la\release\ttseng.tlb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "SPANISH_LA" /Fp"$(INTDIR)\sapi5.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\ttseng.res" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dectalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dectalk.pdb" /machine:I386 /def:".\src\ttseng.def" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\src\ttseng.def"
LINK32_OBJS= \
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
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\DECSTD97.OBJ" \
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
	"$(INTDIR)\lsa_adju.obj" \
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
	"$(INTDIR)\mmalloc.obj" \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\par_ambi.obj" \
	"$(INTDIR)\Par_char.obj" \
	"$(INTDIR)\Par_dict.obj" \
	"$(INTDIR)\Par_pars.obj" \
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
	"$(INTDIR)\PIPE.OBJ" \
	"$(INTDIR)\playaud.obj" \
	"$(INTDIR)\PLAYTONE.OBJ" \
	"$(INTDIR)\sapiiont.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\ttseng.obj" \
	"$(INTDIR)\ttsengobj.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ" \
	"$(INTDIR)\ttseng.res"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"

OUTDIR=.\..\build\dectalk\sp\debug
INTDIR=.\..\build\dectalk\sp\debug\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\sp\debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll" "$(OUTDIR)\ttseng.tlb"


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
	-@erase "$(INTDIR)\CRYPT2.OBJ"
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\DECSTD97.OBJ"
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
	-@erase "$(INTDIR)\lsa_adju.obj"
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
	-@erase "$(INTDIR)\mmalloc.obj"
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\par_ambi.obj"
	-@erase "$(INTDIR)\Par_char.obj"
	-@erase "$(INTDIR)\Par_dict.obj"
	-@erase "$(INTDIR)\Par_pars.obj"
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
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\playaud.obj"
	-@erase "$(INTDIR)\PLAYTONE.OBJ"
	-@erase "$(INTDIR)\sapiiont.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\ttseng.obj"
	-@erase "$(INTDIR)\ttseng.res"
	-@erase "$(INTDIR)\ttsengobj.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.ilk"
	-@erase "$(OUTDIR)\dectalk.lib"
	-@erase "$(OUTDIR)\dectalk.pdb"
	-@erase "..\build\dectalk\sp\debug\ttseng.tlb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "SPANISH" /D "SPANISH_SP" /Fp"$(INTDIR)\sapi5.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\ttseng.res" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\sapi5.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /debug /debugtype:both /machine:IX86 /def:".\src\ttseng.def" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\src\ttseng.def"
LINK32_OBJS= \
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
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\DECSTD97.OBJ" \
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
	"$(INTDIR)\lsa_adju.obj" \
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
	"$(INTDIR)\mmalloc.obj" \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\par_ambi.obj" \
	"$(INTDIR)\Par_char.obj" \
	"$(INTDIR)\Par_dict.obj" \
	"$(INTDIR)\Par_pars.obj" \
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
	"$(INTDIR)\PIPE.OBJ" \
	"$(INTDIR)\playaud.obj" \
	"$(INTDIR)\PLAYTONE.OBJ" \
	"$(INTDIR)\sapiiont.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\ttseng.obj" \
	"$(INTDIR)\ttsengobj.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ" \
	"$(INTDIR)\ttseng.res"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"

OUTDIR=.\..\build\dectalk\gr\debug
INTDIR=.\..\build\dectalk\gr\debug\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\gr\debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll" "$(OUTDIR)\ttseng.tlb" "$(OUTDIR)\sapi5.bsc"


CLEAN :
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
	-@erase "$(INTDIR)\CRYPT2.OBJ"
	-@erase "$(INTDIR)\CRYPT2.SBR"
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\dbgwins.sbr"
	-@erase "$(INTDIR)\DECSTD97.OBJ"
	-@erase "$(INTDIR)\DECSTD97.SBR"
	-@erase "$(INTDIR)\loaddict.obj"
	-@erase "$(INTDIR)\loaddict.sbr"
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
	-@erase "$(INTDIR)\lsa_adju.obj"
	-@erase "$(INTDIR)\lsa_adju.sbr"
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
	-@erase "$(INTDIR)\mmalloc.obj"
	-@erase "$(INTDIR)\mmalloc.sbr"
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\opthread.sbr"
	-@erase "$(INTDIR)\par_ambi.obj"
	-@erase "$(INTDIR)\par_ambi.sbr"
	-@erase "$(INTDIR)\Par_char.obj"
	-@erase "$(INTDIR)\Par_char.sbr"
	-@erase "$(INTDIR)\Par_dict.obj"
	-@erase "$(INTDIR)\Par_dict.sbr"
	-@erase "$(INTDIR)\Par_pars.obj"
	-@erase "$(INTDIR)\Par_pars.sbr"
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
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\PIPE.SBR"
	-@erase "$(INTDIR)\playaud.obj"
	-@erase "$(INTDIR)\playaud.sbr"
	-@erase "$(INTDIR)\PLAYTONE.OBJ"
	-@erase "$(INTDIR)\PLAYTONE.SBR"
	-@erase "$(INTDIR)\sapiiont.obj"
	-@erase "$(INTDIR)\sapiiont.sbr"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SERVICES.SBR"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\SPC.SBR"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\stdafx.sbr"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\SYNC.SBR"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\ttsapi.sbr"
	-@erase "$(INTDIR)\ttseng.obj"
	-@erase "$(INTDIR)\ttseng.res"
	-@erase "$(INTDIR)\ttseng.sbr"
	-@erase "$(INTDIR)\ttsengobj.obj"
	-@erase "$(INTDIR)\ttsengobj.sbr"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\USA_INIT.SBR"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\vtm.sbr"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(INTDIR)\VTMIONT.SBR"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.ilk"
	-@erase "$(OUTDIR)\dectalk.lib"
	-@erase "$(OUTDIR)\dectalk.pdb"
	-@erase "$(OUTDIR)\sapi5.bsc"
	-@erase "..\build\dectalk\gr\debug\ttseng.tlb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "GERMAN" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\sapi5.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /Zm200 /c 

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
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\ttseng.res" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\sapi5.bsc" 
BSC32_SBRS= \
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
	"$(INTDIR)\CRYPT2.SBR" \
	"$(INTDIR)\dbgwins.sbr" \
	"$(INTDIR)\DECSTD97.SBR" \
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
	"$(INTDIR)\lsa_adju.sbr" \
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
	"$(INTDIR)\mmalloc.sbr" \
	"$(INTDIR)\opthread.sbr" \
	"$(INTDIR)\par_ambi.sbr" \
	"$(INTDIR)\Par_char.sbr" \
	"$(INTDIR)\Par_dict.sbr" \
	"$(INTDIR)\Par_pars.sbr" \
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
	"$(INTDIR)\PIPE.SBR" \
	"$(INTDIR)\playaud.sbr" \
	"$(INTDIR)\PLAYTONE.SBR" \
	"$(INTDIR)\sapiiont.sbr" \
	"$(INTDIR)\SERVICES.SBR" \
	"$(INTDIR)\SPC.SBR" \
	"$(INTDIR)\stdafx.sbr" \
	"$(INTDIR)\SYNC.SBR" \
	"$(INTDIR)\ttsapi.sbr" \
	"$(INTDIR)\ttseng.sbr" \
	"$(INTDIR)\ttsengobj.sbr" \
	"$(INTDIR)\USA_INIT.SBR" \
	"$(INTDIR)\vtm.sbr" \
	"$(INTDIR)\VTMIONT.SBR"

"$(OUTDIR)\sapi5.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /debug /debugtype:both /machine:IX86 /def:".\src\ttseng.def" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\src\ttseng.def"
LINK32_OBJS= \
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
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\DECSTD97.OBJ" \
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
	"$(INTDIR)\lsa_adju.obj" \
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
	"$(INTDIR)\mmalloc.obj" \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\par_ambi.obj" \
	"$(INTDIR)\Par_char.obj" \
	"$(INTDIR)\Par_dict.obj" \
	"$(INTDIR)\Par_pars.obj" \
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
	"$(INTDIR)\PIPE.OBJ" \
	"$(INTDIR)\playaud.obj" \
	"$(INTDIR)\PLAYTONE.OBJ" \
	"$(INTDIR)\sapiiont.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\ttseng.obj" \
	"$(INTDIR)\ttsengobj.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ" \
	"$(INTDIR)\ttseng.res"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"

OUTDIR=.\..\build\dectalk\la\debug
INTDIR=.\..\build\dectalk\la\debug\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\la\debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll" "$(OUTDIR)\ttseng.tlb"


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
	-@erase "$(INTDIR)\CRYPT2.OBJ"
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\DECSTD97.OBJ"
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
	-@erase "$(INTDIR)\lsa_adju.obj"
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
	-@erase "$(INTDIR)\mmalloc.obj"
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\par_ambi.obj"
	-@erase "$(INTDIR)\Par_char.obj"
	-@erase "$(INTDIR)\Par_dict.obj"
	-@erase "$(INTDIR)\Par_pars.obj"
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
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\playaud.obj"
	-@erase "$(INTDIR)\PLAYTONE.OBJ"
	-@erase "$(INTDIR)\sapiiont.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\ttseng.obj"
	-@erase "$(INTDIR)\ttseng.res"
	-@erase "$(INTDIR)\ttsengobj.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.ilk"
	-@erase "$(OUTDIR)\dectalk.lib"
	-@erase "$(OUTDIR)\dectalk.pdb"
	-@erase "..\build\dectalk\la\debug\ttseng.tlb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "SPANISH" /D "SPANISH_LA" /Fp"$(INTDIR)\sapi5.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\ttseng.res" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\sapi5.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /debug /debugtype:both /machine:IX86 /def:".\src\ttseng.def" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\src\ttseng.def"
LINK32_OBJS= \
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
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\DECSTD97.OBJ" \
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
	"$(INTDIR)\lsa_adju.obj" \
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
	"$(INTDIR)\mmalloc.obj" \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\par_ambi.obj" \
	"$(INTDIR)\Par_char.obj" \
	"$(INTDIR)\Par_dict.obj" \
	"$(INTDIR)\Par_pars.obj" \
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
	"$(INTDIR)\PIPE.OBJ" \
	"$(INTDIR)\playaud.obj" \
	"$(INTDIR)\PLAYTONE.OBJ" \
	"$(INTDIR)\sapiiont.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\ttseng.obj" \
	"$(INTDIR)\ttsengobj.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ" \
	"$(INTDIR)\ttseng.res"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"

OUTDIR=.\..\build\dectalk\us\access32
INTDIR=.\..\build\dectalk\us\access32\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\us\access32
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll" "$(OUTDIR)\ttseng.tlb"


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
	-@erase "$(INTDIR)\CRYPT2.OBJ"
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\DECSTD97.OBJ"
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
	-@erase "$(INTDIR)\lsa_adju.obj"
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
	-@erase "$(INTDIR)\mmalloc.obj"
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\par_ambi.obj"
	-@erase "$(INTDIR)\Par_char.obj"
	-@erase "$(INTDIR)\Par_dict.obj"
	-@erase "$(INTDIR)\Par_pars.obj"
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
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\playaud.obj"
	-@erase "$(INTDIR)\PLAYTONE.OBJ"
	-@erase "$(INTDIR)\sapiiont.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\ttseng.obj"
	-@erase "$(INTDIR)\ttseng.res"
	-@erase "$(INTDIR)\ttsengobj.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.lib"
	-@erase "..\build\dectalk\us\access32\ttseng.tlb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /D "ACNA" /Fp"$(INTDIR)\sapi5.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\ttseng.res" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dectalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dectalk.pdb" /machine:I386 /def:".\src\ttseng.def" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\src\ttseng.def"
LINK32_OBJS= \
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
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\DECSTD97.OBJ" \
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
	"$(INTDIR)\lsa_adju.obj" \
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
	"$(INTDIR)\mmalloc.obj" \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\par_ambi.obj" \
	"$(INTDIR)\Par_char.obj" \
	"$(INTDIR)\Par_dict.obj" \
	"$(INTDIR)\Par_pars.obj" \
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
	"$(INTDIR)\PIPE.OBJ" \
	"$(INTDIR)\playaud.obj" \
	"$(INTDIR)\PLAYTONE.OBJ" \
	"$(INTDIR)\sapiiont.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\ttseng.obj" \
	"$(INTDIR)\ttsengobj.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ" \
	"$(INTDIR)\ttseng.res"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"

OUTDIR=.\..\build\dectalk\sp\access32
INTDIR=.\..\build\dectalk\sp\access32\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\sp\access32
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll" "$(OUTDIR)\ttseng.tlb"


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
	-@erase "$(INTDIR)\CRYPT2.OBJ"
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\DECSTD97.OBJ"
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
	-@erase "$(INTDIR)\lsa_adju.obj"
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
	-@erase "$(INTDIR)\mmalloc.obj"
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\par_ambi.obj"
	-@erase "$(INTDIR)\Par_char.obj"
	-@erase "$(INTDIR)\Par_dict.obj"
	-@erase "$(INTDIR)\Par_pars.obj"
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
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\playaud.obj"
	-@erase "$(INTDIR)\PLAYTONE.OBJ"
	-@erase "$(INTDIR)\sapiiont.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\ttseng.obj"
	-@erase "$(INTDIR)\ttseng.res"
	-@erase "$(INTDIR)\ttsengobj.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.lib"
	-@erase "..\build\dectalk\sp\access32\ttseng.tlb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /Fp"$(INTDIR)\sapi5.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\ttseng.res" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dectalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dectalk.pdb" /machine:I386 /def:".\src\ttseng.def" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\src\ttseng.def"
LINK32_OBJS= \
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
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\DECSTD97.OBJ" \
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
	"$(INTDIR)\lsa_adju.obj" \
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
	"$(INTDIR)\mmalloc.obj" \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\par_ambi.obj" \
	"$(INTDIR)\Par_char.obj" \
	"$(INTDIR)\Par_dict.obj" \
	"$(INTDIR)\Par_pars.obj" \
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
	"$(INTDIR)\PIPE.OBJ" \
	"$(INTDIR)\playaud.obj" \
	"$(INTDIR)\PLAYTONE.OBJ" \
	"$(INTDIR)\sapiiont.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\ttseng.obj" \
	"$(INTDIR)\ttsengobj.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ" \
	"$(INTDIR)\ttseng.res"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"

OUTDIR=.\..\build\dectalk\gr\access32
INTDIR=.\..\build\dectalk\gr\access32\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\gr\access32
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll" "$(OUTDIR)\ttseng.tlb"


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
	-@erase "$(INTDIR)\CRYPT2.OBJ"
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\DECSTD97.OBJ"
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
	-@erase "$(INTDIR)\lsa_adju.obj"
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
	-@erase "$(INTDIR)\mmalloc.obj"
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\par_ambi.obj"
	-@erase "$(INTDIR)\Par_char.obj"
	-@erase "$(INTDIR)\Par_dict.obj"
	-@erase "$(INTDIR)\Par_pars.obj"
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
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\playaud.obj"
	-@erase "$(INTDIR)\PLAYTONE.OBJ"
	-@erase "$(INTDIR)\sapiiont.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\ttseng.obj"
	-@erase "$(INTDIR)\ttseng.res"
	-@erase "$(INTDIR)\ttsengobj.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.lib"
	-@erase "..\build\dectalk\gr\access32\ttseng.tlb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "GERMAN" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /Fp"$(INTDIR)\sapi5.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /Zm200 /c 

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
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\ttseng.res" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dectalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dectalk.pdb" /machine:I386 /def:".\src\ttseng.def" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\src\ttseng.def"
LINK32_OBJS= \
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
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\DECSTD97.OBJ" \
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
	"$(INTDIR)\lsa_adju.obj" \
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
	"$(INTDIR)\mmalloc.obj" \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\par_ambi.obj" \
	"$(INTDIR)\Par_char.obj" \
	"$(INTDIR)\Par_dict.obj" \
	"$(INTDIR)\Par_pars.obj" \
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
	"$(INTDIR)\PIPE.OBJ" \
	"$(INTDIR)\playaud.obj" \
	"$(INTDIR)\PLAYTONE.OBJ" \
	"$(INTDIR)\sapiiont.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\ttseng.obj" \
	"$(INTDIR)\ttsengobj.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ" \
	"$(INTDIR)\ttseng.res"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"

OUTDIR=.\..\build\dectalk\la\access32
INTDIR=.\..\build\dectalk\la\access32\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\la\access32
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll" "$(OUTDIR)\ttseng.tlb"


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
	-@erase "$(INTDIR)\CRYPT2.OBJ"
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\DECSTD97.OBJ"
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
	-@erase "$(INTDIR)\lsa_adju.obj"
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
	-@erase "$(INTDIR)\mmalloc.obj"
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\par_ambi.obj"
	-@erase "$(INTDIR)\Par_char.obj"
	-@erase "$(INTDIR)\Par_dict.obj"
	-@erase "$(INTDIR)\Par_pars.obj"
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
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\playaud.obj"
	-@erase "$(INTDIR)\PLAYTONE.OBJ"
	-@erase "$(INTDIR)\sapiiont.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\ttseng.obj"
	-@erase "$(INTDIR)\ttseng.res"
	-@erase "$(INTDIR)\ttsengobj.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.lib"
	-@erase "..\build\dectalk\la\access32\ttseng.tlb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /Fp"$(INTDIR)\sapi5.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\ttseng.res" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dectalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dectalk.pdb" /machine:I386 /def:".\src\ttseng.def" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\src\ttseng.def"
LINK32_OBJS= \
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
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\DECSTD97.OBJ" \
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
	"$(INTDIR)\lsa_adju.obj" \
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
	"$(INTDIR)\mmalloc.obj" \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\par_ambi.obj" \
	"$(INTDIR)\Par_char.obj" \
	"$(INTDIR)\Par_dict.obj" \
	"$(INTDIR)\Par_pars.obj" \
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
	"$(INTDIR)\PIPE.OBJ" \
	"$(INTDIR)\playaud.obj" \
	"$(INTDIR)\PLAYTONE.OBJ" \
	"$(INTDIR)\sapiiont.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\ttseng.obj" \
	"$(INTDIR)\ttsengobj.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ" \
	"$(INTDIR)\ttseng.res"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"

OUTDIR=.\..\build\dectalk\us\a32debug
INTDIR=.\..\build\dectalk\us\a32debug\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\us\a32debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll" "$(OUTDIR)\ttseng.tlb"


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
	-@erase "$(INTDIR)\CRYPT2.OBJ"
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\DECSTD97.OBJ"
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
	-@erase "$(INTDIR)\lsa_adju.obj"
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
	-@erase "$(INTDIR)\mmalloc.obj"
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\par_ambi.obj"
	-@erase "$(INTDIR)\Par_char.obj"
	-@erase "$(INTDIR)\Par_dict.obj"
	-@erase "$(INTDIR)\Par_pars.obj"
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
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\playaud.obj"
	-@erase "$(INTDIR)\PLAYTONE.OBJ"
	-@erase "$(INTDIR)\sapiiont.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\ttseng.obj"
	-@erase "$(INTDIR)\ttseng.res"
	-@erase "$(INTDIR)\ttsengobj.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.ilk"
	-@erase "$(OUTDIR)\dectalk.lib"
	-@erase "$(OUTDIR)\dectalk.pdb"
	-@erase "..\build\dectalk\us\a32debug\ttseng.tlb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "ENGLISH" /D "ENGLISH_US" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /D "ACNA" /Fp"$(INTDIR)\sapi5.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\ttseng.res" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\sapi5.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /debug /debugtype:both /machine:IX86 /def:".\src\ttseng.def" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\src\ttseng.def"
LINK32_OBJS= \
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
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\DECSTD97.OBJ" \
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
	"$(INTDIR)\lsa_adju.obj" \
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
	"$(INTDIR)\mmalloc.obj" \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\par_ambi.obj" \
	"$(INTDIR)\Par_char.obj" \
	"$(INTDIR)\Par_dict.obj" \
	"$(INTDIR)\Par_pars.obj" \
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
	"$(INTDIR)\PIPE.OBJ" \
	"$(INTDIR)\playaud.obj" \
	"$(INTDIR)\PLAYTONE.OBJ" \
	"$(INTDIR)\sapiiont.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\ttseng.obj" \
	"$(INTDIR)\ttsengobj.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ" \
	"$(INTDIR)\ttseng.res"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"

OUTDIR=.\..\build\dectalk\sp\a32debug
INTDIR=.\..\build\dectalk\sp\a32debug\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\sp\a32debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll" "$(OUTDIR)\ttseng.tlb"


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
	-@erase "$(INTDIR)\CRYPT2.OBJ"
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\DECSTD97.OBJ"
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
	-@erase "$(INTDIR)\lsa_adju.obj"
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
	-@erase "$(INTDIR)\mmalloc.obj"
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\par_ambi.obj"
	-@erase "$(INTDIR)\Par_char.obj"
	-@erase "$(INTDIR)\Par_dict.obj"
	-@erase "$(INTDIR)\Par_pars.obj"
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
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\playaud.obj"
	-@erase "$(INTDIR)\PLAYTONE.OBJ"
	-@erase "$(INTDIR)\sapiiont.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\ttseng.obj"
	-@erase "$(INTDIR)\ttseng.res"
	-@erase "$(INTDIR)\ttsengobj.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.ilk"
	-@erase "$(OUTDIR)\dectalk.lib"
	-@erase "$(OUTDIR)\dectalk.pdb"
	-@erase "..\build\dectalk\sp\a32debug\ttseng.tlb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /Fp"$(INTDIR)\sapi5.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\ttseng.res" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\sapi5.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /debug /debugtype:both /machine:IX86 /def:".\src\ttseng.def" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\src\ttseng.def"
LINK32_OBJS= \
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
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\DECSTD97.OBJ" \
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
	"$(INTDIR)\lsa_adju.obj" \
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
	"$(INTDIR)\mmalloc.obj" \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\par_ambi.obj" \
	"$(INTDIR)\Par_char.obj" \
	"$(INTDIR)\Par_dict.obj" \
	"$(INTDIR)\Par_pars.obj" \
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
	"$(INTDIR)\PIPE.OBJ" \
	"$(INTDIR)\playaud.obj" \
	"$(INTDIR)\PLAYTONE.OBJ" \
	"$(INTDIR)\sapiiont.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\ttseng.obj" \
	"$(INTDIR)\ttsengobj.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ" \
	"$(INTDIR)\ttseng.res"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"

OUTDIR=.\..\build\dectalk\gr\a32debug
INTDIR=.\..\build\dectalk\gr\a32debug\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\gr\a32debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll" "$(OUTDIR)\ttseng.tlb"


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
	-@erase "$(INTDIR)\CRYPT2.OBJ"
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\DECSTD97.OBJ"
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
	-@erase "$(INTDIR)\lsa_adju.obj"
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
	-@erase "$(INTDIR)\mmalloc.obj"
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\par_ambi.obj"
	-@erase "$(INTDIR)\Par_char.obj"
	-@erase "$(INTDIR)\Par_dict.obj"
	-@erase "$(INTDIR)\Par_pars.obj"
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
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\playaud.obj"
	-@erase "$(INTDIR)\PLAYTONE.OBJ"
	-@erase "$(INTDIR)\sapiiont.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\ttseng.obj"
	-@erase "$(INTDIR)\ttseng.res"
	-@erase "$(INTDIR)\ttsengobj.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.ilk"
	-@erase "$(OUTDIR)\dectalk.lib"
	-@erase "$(OUTDIR)\dectalk.pdb"
	-@erase "..\build\dectalk\gr\a32debug\ttseng.tlb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "GERMAN" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /Fp"$(INTDIR)\sapi5.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /Zm200 /c 

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
RSC_PROJ=/l 0x407 /fo"$(INTDIR)\ttseng.res" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\sapi5.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /debug /debugtype:both /machine:IX86 /def:".\src\ttseng.def" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\src\ttseng.def"
LINK32_OBJS= \
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
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\DECSTD97.OBJ" \
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
	"$(INTDIR)\lsa_adju.obj" \
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
	"$(INTDIR)\mmalloc.obj" \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\par_ambi.obj" \
	"$(INTDIR)\Par_char.obj" \
	"$(INTDIR)\Par_dict.obj" \
	"$(INTDIR)\Par_pars.obj" \
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
	"$(INTDIR)\PIPE.OBJ" \
	"$(INTDIR)\playaud.obj" \
	"$(INTDIR)\PLAYTONE.OBJ" \
	"$(INTDIR)\sapiiont.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\ttseng.obj" \
	"$(INTDIR)\ttsengobj.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ" \
	"$(INTDIR)\ttseng.res"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"

OUTDIR=.\..\build\dectalk\la\a32debug
INTDIR=.\..\build\dectalk\la\a32debug\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\la\a32debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll" "$(OUTDIR)\ttseng.tlb"


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
	-@erase "$(INTDIR)\CRYPT2.OBJ"
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\DECSTD97.OBJ"
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
	-@erase "$(INTDIR)\lsa_adju.obj"
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
	-@erase "$(INTDIR)\mmalloc.obj"
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\par_ambi.obj"
	-@erase "$(INTDIR)\Par_char.obj"
	-@erase "$(INTDIR)\Par_dict.obj"
	-@erase "$(INTDIR)\Par_pars.obj"
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
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\playaud.obj"
	-@erase "$(INTDIR)\PLAYTONE.OBJ"
	-@erase "$(INTDIR)\sapiiont.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\ttseng.obj"
	-@erase "$(INTDIR)\ttseng.res"
	-@erase "$(INTDIR)\ttsengobj.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.ilk"
	-@erase "$(OUTDIR)\dectalk.lib"
	-@erase "$(OUTDIR)\dectalk.pdb"
	-@erase "..\build\dectalk\la\a32debug\ttseng.tlb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /Fp"$(INTDIR)\sapi5.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x40a /fo"$(INTDIR)\ttseng.res" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\sapi5.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /debug /debugtype:both /machine:IX86 /def:".\src\ttseng.def" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\src\ttseng.def"
LINK32_OBJS= \
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
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\DECSTD97.OBJ" \
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
	"$(INTDIR)\lsa_adju.obj" \
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
	"$(INTDIR)\mmalloc.obj" \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\par_ambi.obj" \
	"$(INTDIR)\Par_char.obj" \
	"$(INTDIR)\Par_dict.obj" \
	"$(INTDIR)\Par_pars.obj" \
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
	"$(INTDIR)\PIPE.OBJ" \
	"$(INTDIR)\playaud.obj" \
	"$(INTDIR)\PLAYTONE.OBJ" \
	"$(INTDIR)\sapiiont.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\ttseng.obj" \
	"$(INTDIR)\ttsengobj.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ" \
	"$(INTDIR)\ttseng.res"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"

OUTDIR=.\..\build\dectalk\uk\release
INTDIR=.\..\build\dectalk\uk\release\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll" "$(OUTDIR)\ttseng.tlb" "$(OUTDIR)\dectalk.bsc"


CLEAN :
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
	-@erase "$(INTDIR)\CRYPT2.OBJ"
	-@erase "$(INTDIR)\CRYPT2.SBR"
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\dbgwins.sbr"
	-@erase "$(INTDIR)\DECSTD97.OBJ"
	-@erase "$(INTDIR)\DECSTD97.SBR"
	-@erase "$(INTDIR)\loaddict.obj"
	-@erase "$(INTDIR)\loaddict.sbr"
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
	-@erase "$(INTDIR)\lsa_adju.obj"
	-@erase "$(INTDIR)\lsa_adju.sbr"
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
	-@erase "$(INTDIR)\mmalloc.obj"
	-@erase "$(INTDIR)\mmalloc.sbr"
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\opthread.sbr"
	-@erase "$(INTDIR)\par_ambi.obj"
	-@erase "$(INTDIR)\par_ambi.sbr"
	-@erase "$(INTDIR)\Par_char.obj"
	-@erase "$(INTDIR)\Par_char.sbr"
	-@erase "$(INTDIR)\Par_dict.obj"
	-@erase "$(INTDIR)\Par_dict.sbr"
	-@erase "$(INTDIR)\Par_pars.obj"
	-@erase "$(INTDIR)\Par_pars.sbr"
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
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\PIPE.SBR"
	-@erase "$(INTDIR)\playaud.obj"
	-@erase "$(INTDIR)\playaud.sbr"
	-@erase "$(INTDIR)\PLAYTONE.OBJ"
	-@erase "$(INTDIR)\PLAYTONE.SBR"
	-@erase "$(INTDIR)\sapiiont.obj"
	-@erase "$(INTDIR)\sapiiont.sbr"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SERVICES.SBR"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\SPC.SBR"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\stdafx.sbr"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\SYNC.SBR"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\ttsapi.sbr"
	-@erase "$(INTDIR)\ttseng.obj"
	-@erase "$(INTDIR)\ttseng.res"
	-@erase "$(INTDIR)\ttseng.sbr"
	-@erase "$(INTDIR)\ttsengobj.obj"
	-@erase "$(INTDIR)\ttsengobj.sbr"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\USA_INIT.SBR"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\vtm.sbr"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(INTDIR)\VTMIONT.SBR"
	-@erase "$(OUTDIR)\dectalk.bsc"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.lib"
	-@erase "..\build\dectalk\uk\release\ttseng.tlb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "ENGLISH_UK" /D "ENGLISH" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\sapi5.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\ttseng.res" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dectalk.bsc" 
BSC32_SBRS= \
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
	"$(INTDIR)\CRYPT2.SBR" \
	"$(INTDIR)\dbgwins.sbr" \
	"$(INTDIR)\DECSTD97.SBR" \
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
	"$(INTDIR)\lsa_adju.sbr" \
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
	"$(INTDIR)\mmalloc.sbr" \
	"$(INTDIR)\opthread.sbr" \
	"$(INTDIR)\par_ambi.sbr" \
	"$(INTDIR)\Par_char.sbr" \
	"$(INTDIR)\Par_dict.sbr" \
	"$(INTDIR)\Par_pars.sbr" \
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
	"$(INTDIR)\PIPE.SBR" \
	"$(INTDIR)\playaud.sbr" \
	"$(INTDIR)\PLAYTONE.SBR" \
	"$(INTDIR)\sapiiont.sbr" \
	"$(INTDIR)\SERVICES.SBR" \
	"$(INTDIR)\SPC.SBR" \
	"$(INTDIR)\stdafx.sbr" \
	"$(INTDIR)\SYNC.SBR" \
	"$(INTDIR)\ttsapi.sbr" \
	"$(INTDIR)\ttseng.sbr" \
	"$(INTDIR)\ttsengobj.sbr" \
	"$(INTDIR)\USA_INIT.SBR" \
	"$(INTDIR)\vtm.sbr" \
	"$(INTDIR)\VTMIONT.SBR"

"$(OUTDIR)\dectalk.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dectalk.pdb" /machine:I386 /def:".\src\ttseng.def" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\src\ttseng.def"
LINK32_OBJS= \
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
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\DECSTD97.OBJ" \
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
	"$(INTDIR)\lsa_adju.obj" \
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
	"$(INTDIR)\mmalloc.obj" \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\par_ambi.obj" \
	"$(INTDIR)\Par_char.obj" \
	"$(INTDIR)\Par_dict.obj" \
	"$(INTDIR)\Par_pars.obj" \
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
	"$(INTDIR)\PIPE.OBJ" \
	"$(INTDIR)\playaud.obj" \
	"$(INTDIR)\PLAYTONE.OBJ" \
	"$(INTDIR)\sapiiont.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\ttseng.obj" \
	"$(INTDIR)\ttsengobj.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ" \
	"$(INTDIR)\ttseng.res"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"

OUTDIR=.\..\build\dectalk\uk\debug
INTDIR=.\..\build\dectalk\uk\debug\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\uk\debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll" "$(OUTDIR)\ttseng.tlb"


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
	-@erase "$(INTDIR)\CRYPT2.OBJ"
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\DECSTD97.OBJ"
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
	-@erase "$(INTDIR)\lsa_adju.obj"
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
	-@erase "$(INTDIR)\mmalloc.obj"
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\par_ambi.obj"
	-@erase "$(INTDIR)\Par_char.obj"
	-@erase "$(INTDIR)\Par_dict.obj"
	-@erase "$(INTDIR)\Par_pars.obj"
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
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\playaud.obj"
	-@erase "$(INTDIR)\PLAYTONE.OBJ"
	-@erase "$(INTDIR)\sapiiont.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\ttseng.obj"
	-@erase "$(INTDIR)\ttseng.res"
	-@erase "$(INTDIR)\ttsengobj.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.ilk"
	-@erase "$(OUTDIR)\dectalk.lib"
	-@erase "$(OUTDIR)\dectalk.pdb"
	-@erase "..\build\dectalk\uk\debug\ttseng.tlb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "ENGLISH_UK" /D "ENGLISH" /Fp"$(INTDIR)\sapi5.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\ttseng.res" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\sapi5.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /debug /debugtype:both /machine:IX86 /def:".\src\ttseng.def" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\src\ttseng.def"
LINK32_OBJS= \
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
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\DECSTD97.OBJ" \
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
	"$(INTDIR)\lsa_adju.obj" \
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
	"$(INTDIR)\mmalloc.obj" \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\par_ambi.obj" \
	"$(INTDIR)\Par_char.obj" \
	"$(INTDIR)\Par_dict.obj" \
	"$(INTDIR)\Par_pars.obj" \
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
	"$(INTDIR)\PIPE.OBJ" \
	"$(INTDIR)\playaud.obj" \
	"$(INTDIR)\PLAYTONE.OBJ" \
	"$(INTDIR)\sapiiont.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\ttseng.obj" \
	"$(INTDIR)\ttsengobj.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ" \
	"$(INTDIR)\ttseng.res"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"

OUTDIR=.\..\build\dectalk\uk\access32
INTDIR=.\..\build\dectalk\uk\access32\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\uk\access32
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll" "$(OUTDIR)\ttseng.tlb"


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
	-@erase "$(INTDIR)\CRYPT2.OBJ"
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\DECSTD97.OBJ"
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
	-@erase "$(INTDIR)\lsa_adju.obj"
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
	-@erase "$(INTDIR)\mmalloc.obj"
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\par_ambi.obj"
	-@erase "$(INTDIR)\Par_char.obj"
	-@erase "$(INTDIR)\Par_dict.obj"
	-@erase "$(INTDIR)\Par_pars.obj"
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
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\playaud.obj"
	-@erase "$(INTDIR)\PLAYTONE.OBJ"
	-@erase "$(INTDIR)\sapiiont.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\ttseng.obj"
	-@erase "$(INTDIR)\ttseng.res"
	-@erase "$(INTDIR)\ttsengobj.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.lib"
	-@erase "..\build\dectalk\uk\access32\ttseng.tlb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "ENGLISH_UK" /D "ENGLISH" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /Fp"$(INTDIR)\sapi5.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\ttseng.res" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dectalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dectalk.pdb" /machine:I386 /def:".\src\ttseng.def" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\src\ttseng.def"
LINK32_OBJS= \
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
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\DECSTD97.OBJ" \
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
	"$(INTDIR)\lsa_adju.obj" \
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
	"$(INTDIR)\mmalloc.obj" \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\par_ambi.obj" \
	"$(INTDIR)\Par_char.obj" \
	"$(INTDIR)\Par_dict.obj" \
	"$(INTDIR)\Par_pars.obj" \
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
	"$(INTDIR)\PIPE.OBJ" \
	"$(INTDIR)\playaud.obj" \
	"$(INTDIR)\PLAYTONE.OBJ" \
	"$(INTDIR)\sapiiont.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\ttseng.obj" \
	"$(INTDIR)\ttsengobj.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ" \
	"$(INTDIR)\ttseng.res"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"

OUTDIR=.\..\build\dectalk\uk\a32debug
INTDIR=.\..\build\dectalk\uk\a32debug\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\uk\a32debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll" "$(OUTDIR)\ttseng.tlb"


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
	-@erase "$(INTDIR)\CRYPT2.OBJ"
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\DECSTD97.OBJ"
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
	-@erase "$(INTDIR)\lsa_adju.obj"
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
	-@erase "$(INTDIR)\mmalloc.obj"
	-@erase "$(INTDIR)\opthread.obj"
	-@erase "$(INTDIR)\par_ambi.obj"
	-@erase "$(INTDIR)\Par_char.obj"
	-@erase "$(INTDIR)\Par_dict.obj"
	-@erase "$(INTDIR)\Par_pars.obj"
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
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\playaud.obj"
	-@erase "$(INTDIR)\PLAYTONE.OBJ"
	-@erase "$(INTDIR)\sapiiont.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\ttseng.obj"
	-@erase "$(INTDIR)\ttseng.res"
	-@erase "$(INTDIR)\ttsengobj.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.ilk"
	-@erase "$(OUTDIR)\dectalk.lib"
	-@erase "$(OUTDIR)\dectalk.pdb"
	-@erase "..\build\dectalk\uk\a32debug\ttseng.tlb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "ENGLISH" /D "ENGLISH_UK" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /Fp"$(INTDIR)\sapi5.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x809 /fo"$(INTDIR)\ttseng.res" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\sapi5.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /debug /debugtype:both /machine:IX86 /def:".\src\ttseng.def" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\src\ttseng.def"
LINK32_OBJS= \
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
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\DECSTD97.OBJ" \
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
	"$(INTDIR)\lsa_adju.obj" \
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
	"$(INTDIR)\mmalloc.obj" \
	"$(INTDIR)\opthread.obj" \
	"$(INTDIR)\par_ambi.obj" \
	"$(INTDIR)\Par_char.obj" \
	"$(INTDIR)\Par_dict.obj" \
	"$(INTDIR)\Par_pars.obj" \
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
	"$(INTDIR)\PIPE.OBJ" \
	"$(INTDIR)\playaud.obj" \
	"$(INTDIR)\PLAYTONE.OBJ" \
	"$(INTDIR)\sapiiont.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\ttseng.obj" \
	"$(INTDIR)\ttsengobj.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ" \
	"$(INTDIR)\ttseng.res"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("sapi5.dep")
!INCLUDE "sapi5.dep"
!ELSE 
!MESSAGE Warning: cannot find "sapi5.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "Sapi5 - Win32 Release" || "$(CFG)" == "Sapi5 - Win32 Debug" || "$(CFG)" == "Sapi5 - Win32 Release Spanish" || "$(CFG)" == "Sapi5 - Win32 Release German" || "$(CFG)" == "Sapi5 - Win32 Release Latin American" || "$(CFG)" == "Sapi5 - Win32 Debug Spanish" || "$(CFG)" == "Sapi5 - Win32 Debug German" || "$(CFG)" == "Sapi5 - Win32 Debug Latin American" || "$(CFG)" == "Sapi5 - Win32 Release Access32" || "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish" || "$(CFG)" == "Sapi5 - Win32 Release Access32 German" || "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American" || "$(CFG)" == "Sapi5 - Win32 Debug Access32" || "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish" || "$(CFG)" == "Sapi5 - Win32 Debug Access32 German" || "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American" || "$(CFG)" == "Sapi5 - Win32 Release United Kingdom" || "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom" || "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom" || "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"
SOURCE=..\dapi\src\Cmd\cm_char.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\cm_char.obj"	"$(INTDIR)\cm_char.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\cm_char.obj"	"$(INTDIR)\cm_char.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\cm_char.obj"	"$(INTDIR)\cm_char.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\cm_char.obj"	"$(INTDIR)\cm_char.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Cmd\cm_cmd.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\cm_cmd.obj"	"$(INTDIR)\cm_cmd.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\cm_cmd.obj"	"$(INTDIR)\cm_cmd.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\cm_cmd.obj"	"$(INTDIR)\cm_cmd.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\cm_cmd.obj"	"$(INTDIR)\cm_cmd.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Cmd\cm_copt.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\cm_copt.obj"	"$(INTDIR)\cm_copt.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\cm_copt.obj"	"$(INTDIR)\cm_copt.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\cm_copt.obj"	"$(INTDIR)\cm_copt.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\cm_copt.obj"	"$(INTDIR)\cm_copt.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Cmd\cm_main.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\cm_main.obj"	"$(INTDIR)\cm_main.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\cm_main.obj"	"$(INTDIR)\cm_main.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\cm_main.obj"	"$(INTDIR)\cm_main.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\cm_main.obj"	"$(INTDIR)\cm_main.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Cmd\cm_pars.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\cm_pars.obj"	"$(INTDIR)\cm_pars.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\cm_pars.obj"	"$(INTDIR)\cm_pars.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\cm_pars.obj"	"$(INTDIR)\cm_pars.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\cm_pars.obj"	"$(INTDIR)\cm_pars.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Cmd\cm_phon.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\cm_phon.obj"	"$(INTDIR)\cm_phon.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\cm_phon.obj"	"$(INTDIR)\cm_phon.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\cm_phon.obj"	"$(INTDIR)\cm_phon.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\cm_phon.obj"	"$(INTDIR)\cm_phon.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Cmd\cm_text.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\cm_text.obj"	"$(INTDIR)\cm_text.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\cm_text.obj"	"$(INTDIR)\cm_text.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\cm_text.obj"	"$(INTDIR)\cm_text.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\cm_text.obj"	"$(INTDIR)\cm_text.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Cmd\cm_util.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\cm_util.obj"	"$(INTDIR)\cm_util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\cm_util.obj"	"$(INTDIR)\cm_util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\cm_util.obj"	"$(INTDIR)\cm_util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\cm_util.obj"	"$(INTDIR)\cm_util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Cmd\Cmd_init.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\Cmd_init.obj"	"$(INTDIR)\Cmd_init.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\Cmd_init.obj"	"$(INTDIR)\Cmd_init.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\Cmd_init.obj"	"$(INTDIR)\Cmd_init.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\Cmd_init.obj"	"$(INTDIR)\Cmd_init.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Cmd\cmd_wav.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\cmd_wav.obj"	"$(INTDIR)\cmd_wav.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\cmd_wav.obj"	"$(INTDIR)\cmd_wav.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\cmd_wav.obj"	"$(INTDIR)\cmd_wav.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\cmd_wav.obj"	"$(INTDIR)\cmd_wav.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\API\CRYPT2.C

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\CRYPT2.OBJ"	"$(INTDIR)\CRYPT2.SBR" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\CRYPT2.OBJ"	"$(INTDIR)\CRYPT2.SBR" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\CRYPT2.OBJ"	"$(INTDIR)\CRYPT2.SBR" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\CRYPT2.OBJ"	"$(INTDIR)\CRYPT2.SBR" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Nt\dbgwins.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\dbgwins.obj"	"$(INTDIR)\dbgwins.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\dbgwins.obj"	"$(INTDIR)\dbgwins.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\dbgwins.obj"	"$(INTDIR)\dbgwins.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\dbgwins.obj"	"$(INTDIR)\dbgwins.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\api\DECSTD97.C

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\DECSTD97.OBJ"	"$(INTDIR)\DECSTD97.SBR" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\DECSTD97.OBJ"	"$(INTDIR)\DECSTD97.SBR" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\DECSTD97.OBJ"	"$(INTDIR)\DECSTD97.SBR" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\DECSTD97.OBJ"	"$(INTDIR)\DECSTD97.SBR" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Lts\loaddict.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\loaddict.obj"	"$(INTDIR)\loaddict.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\loaddict.obj"	"$(INTDIR)\loaddict.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\loaddict.obj"	"$(INTDIR)\loaddict.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\loaddict.obj"	"$(INTDIR)\loaddict.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Lts\ls_chari.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\ls_chari.obj"	"$(INTDIR)\ls_chari.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\ls_chari.obj"	"$(INTDIR)\ls_chari.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\ls_chari.obj"	"$(INTDIR)\ls_chari.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\ls_chari.obj"	"$(INTDIR)\ls_chari.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Lts\ls_dict.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\ls_dict.obj"	"$(INTDIR)\ls_dict.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\ls_dict.obj"	"$(INTDIR)\ls_dict.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\ls_dict.obj"	"$(INTDIR)\ls_dict.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\ls_dict.obj"	"$(INTDIR)\ls_dict.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Lts\ls_homo.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\ls_homo.obj"	"$(INTDIR)\ls_homo.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\ls_homo.obj"	"$(INTDIR)\ls_homo.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\ls_homo.obj"	"$(INTDIR)\ls_homo.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\ls_homo.obj"	"$(INTDIR)\ls_homo.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Lts\ls_math.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\ls_math.obj"	"$(INTDIR)\ls_math.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\ls_math.obj"	"$(INTDIR)\ls_math.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\ls_math.obj"	"$(INTDIR)\ls_math.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\ls_math.obj"	"$(INTDIR)\ls_math.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Lts\ls_proc.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\ls_proc.obj"	"$(INTDIR)\ls_proc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\ls_proc.obj"	"$(INTDIR)\ls_proc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\ls_proc.obj"	"$(INTDIR)\ls_proc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\ls_proc.obj"	"$(INTDIR)\ls_proc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Lts\ls_spel.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\ls_spel.obj"	"$(INTDIR)\ls_spel.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\ls_spel.obj"	"$(INTDIR)\ls_spel.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\ls_spel.obj"	"$(INTDIR)\ls_spel.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\ls_spel.obj"	"$(INTDIR)\ls_spel.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Lts\ls_speli.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\ls_speli.obj"	"$(INTDIR)\ls_speli.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\ls_speli.obj"	"$(INTDIR)\ls_speli.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\ls_speli.obj"	"$(INTDIR)\ls_speli.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\ls_speli.obj"	"$(INTDIR)\ls_speli.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Lts\ls_suff.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\ls_suff.obj"	"$(INTDIR)\ls_suff.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\ls_suff.obj"	"$(INTDIR)\ls_suff.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\ls_suff.obj"	"$(INTDIR)\ls_suff.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\ls_suff.obj"	"$(INTDIR)\ls_suff.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Lts\ls_suffi.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\ls_suffi.obj"	"$(INTDIR)\ls_suffi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\ls_suffi.obj"	"$(INTDIR)\ls_suffi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\ls_suffi.obj"	"$(INTDIR)\ls_suffi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\ls_suffi.obj"	"$(INTDIR)\ls_suffi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Lts\lsa_adju.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\lsa_adju.obj"	"$(INTDIR)\lsa_adju.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\lsa_adju.obj"	"$(INTDIR)\lsa_adju.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\lsa_adju.obj"	"$(INTDIR)\lsa_adju.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\lsa_adju.obj"	"$(INTDIR)\lsa_adju.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Lts\lsa_coni.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\lsa_coni.obj"	"$(INTDIR)\lsa_coni.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\lsa_coni.obj"	"$(INTDIR)\lsa_coni.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\lsa_coni.obj"	"$(INTDIR)\lsa_coni.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\lsa_coni.obj"	"$(INTDIR)\lsa_coni.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Lts\lsa_fr.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\lsa_fr.obj"	"$(INTDIR)\lsa_fr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\lsa_fr.obj"	"$(INTDIR)\lsa_fr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\lsa_fr.obj"	"$(INTDIR)\lsa_fr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\lsa_fr.obj"	"$(INTDIR)\lsa_fr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Lts\lsa_gr.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\lsa_gr.obj"	"$(INTDIR)\lsa_gr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\lsa_gr.obj"	"$(INTDIR)\lsa_gr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\lsa_gr.obj"	"$(INTDIR)\lsa_gr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\lsa_gr.obj"	"$(INTDIR)\lsa_gr.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Lts\lsa_ir.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\lsa_ir.obj"	"$(INTDIR)\lsa_ir.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\lsa_ir.obj"	"$(INTDIR)\lsa_ir.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\lsa_ir.obj"	"$(INTDIR)\lsa_ir.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\lsa_ir.obj"	"$(INTDIR)\lsa_ir.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Lts\lsa_it.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\lsa_it.obj"	"$(INTDIR)\lsa_it.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\lsa_it.obj"	"$(INTDIR)\lsa_it.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\lsa_it.obj"	"$(INTDIR)\lsa_it.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\lsa_it.obj"	"$(INTDIR)\lsa_it.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Lts\lsa_ja.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\lsa_ja.obj"	"$(INTDIR)\lsa_ja.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\lsa_ja.obj"	"$(INTDIR)\lsa_ja.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\lsa_ja.obj"	"$(INTDIR)\lsa_ja.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\lsa_ja.obj"	"$(INTDIR)\lsa_ja.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Lts\lsa_rtbi.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\lsa_rtbi.obj"	"$(INTDIR)\lsa_rtbi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\lsa_rtbi.obj"	"$(INTDIR)\lsa_rtbi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\lsa_rtbi.obj"	"$(INTDIR)\lsa_rtbi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\lsa_rtbi.obj"	"$(INTDIR)\lsa_rtbi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Lts\lsa_rule.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\lsa_rule.obj"	"$(INTDIR)\lsa_rule.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\lsa_rule.obj"	"$(INTDIR)\lsa_rule.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\lsa_rule.obj"	"$(INTDIR)\lsa_rule.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\lsa_rule.obj"	"$(INTDIR)\lsa_rule.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Lts\lsa_sl.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\lsa_sl.obj"	"$(INTDIR)\lsa_sl.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\lsa_sl.obj"	"$(INTDIR)\lsa_sl.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\lsa_sl.obj"	"$(INTDIR)\lsa_sl.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\lsa_sl.obj"	"$(INTDIR)\lsa_sl.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Lts\lsa_sp.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\lsa_sp.obj"	"$(INTDIR)\lsa_sp.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\lsa_sp.obj"	"$(INTDIR)\lsa_sp.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\lsa_sp.obj"	"$(INTDIR)\lsa_sp.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\lsa_sp.obj"	"$(INTDIR)\lsa_sp.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Lts\lsa_task.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\lsa_task.obj"	"$(INTDIR)\lsa_task.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\lsa_task.obj"	"$(INTDIR)\lsa_task.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\lsa_task.obj"	"$(INTDIR)\lsa_task.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\lsa_task.obj"	"$(INTDIR)\lsa_task.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Lts\lsa_us.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\lsa_us.obj"	"$(INTDIR)\lsa_us.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\lsa_us.obj"	"$(INTDIR)\lsa_us.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\lsa_us.obj"	"$(INTDIR)\lsa_us.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\lsa_us.obj"	"$(INTDIR)\lsa_us.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Lts\lsa_util.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\lsa_util.obj"	"$(INTDIR)\lsa_util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\lsa_util.obj"	"$(INTDIR)\lsa_util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\lsa_util.obj"	"$(INTDIR)\lsa_util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\lsa_util.obj"	"$(INTDIR)\lsa_util.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Lts\lsw_main.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\lsw_main.obj"	"$(INTDIR)\lsw_main.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\lsw_main.obj"	"$(INTDIR)\lsw_main.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\lsw_main.obj"	"$(INTDIR)\lsw_main.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\lsw_main.obj"	"$(INTDIR)\lsw_main.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\NT\mmalloc.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\mmalloc.obj"	"$(INTDIR)\mmalloc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\mmalloc.obj"	"$(INTDIR)\mmalloc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\mmalloc.obj"	"$(INTDIR)\mmalloc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\mmalloc.obj"	"$(INTDIR)\mmalloc.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\NT\opthread.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\opthread.obj"	"$(INTDIR)\opthread.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\opthread.obj"	"$(INTDIR)\opthread.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\opthread.obj"	"$(INTDIR)\opthread.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\opthread.obj"	"$(INTDIR)\opthread.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Cmd\par_ambi.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\par_ambi.obj"	"$(INTDIR)\par_ambi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\par_ambi.obj"	"$(INTDIR)\par_ambi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\par_ambi.obj"	"$(INTDIR)\par_ambi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\par_ambi.obj"	"$(INTDIR)\par_ambi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Cmd\Par_char.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\Par_char.obj"	"$(INTDIR)\Par_char.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\Par_char.obj"	"$(INTDIR)\Par_char.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\Par_char.obj"	"$(INTDIR)\Par_char.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\Par_char.obj"	"$(INTDIR)\Par_char.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Cmd\Par_dict.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\Par_dict.obj"	"$(INTDIR)\Par_dict.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\Par_dict.obj"	"$(INTDIR)\Par_dict.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\Par_dict.obj"	"$(INTDIR)\Par_dict.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\Par_dict.obj"	"$(INTDIR)\Par_dict.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Cmd\Par_pars.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\Par_pars.obj"	"$(INTDIR)\Par_pars.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\Par_pars.obj"	"$(INTDIR)\Par_pars.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\Par_pars.obj"	"$(INTDIR)\Par_pars.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\Par_pars.obj"	"$(INTDIR)\Par_pars.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Cmd\par_rule.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\par_rule.obj"	"$(INTDIR)\par_rule.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\par_rule.obj"	"$(INTDIR)\par_rule.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\par_rule.obj"	"$(INTDIR)\par_rule.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\par_rule.obj"	"$(INTDIR)\par_rule.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Ph\ph_aloph.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\ph_aloph.obj"	"$(INTDIR)\ph_aloph.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\ph_aloph.obj"	"$(INTDIR)\ph_aloph.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\ph_aloph.obj"	"$(INTDIR)\ph_aloph.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\ph_aloph.obj"	"$(INTDIR)\ph_aloph.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Ph\ph_claus.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\ph_claus.obj"	"$(INTDIR)\ph_claus.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\ph_claus.obj"	"$(INTDIR)\ph_claus.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\ph_claus.obj"	"$(INTDIR)\ph_claus.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\ph_claus.obj"	"$(INTDIR)\ph_claus.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Ph\ph_draw.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\ph_draw.obj"	"$(INTDIR)\ph_draw.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\ph_draw.obj"	"$(INTDIR)\ph_draw.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\ph_draw.obj"	"$(INTDIR)\ph_draw.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\ph_draw.obj"	"$(INTDIR)\ph_draw.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Ph\ph_drwt0.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\ph_drwt0.obj"	"$(INTDIR)\ph_drwt0.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\ph_drwt0.obj"	"$(INTDIR)\ph_drwt0.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\ph_drwt0.obj"	"$(INTDIR)\ph_drwt0.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\ph_drwt0.obj"	"$(INTDIR)\ph_drwt0.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Ph\ph_inton.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\ph_inton.obj"	"$(INTDIR)\ph_inton.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\ph_inton.obj"	"$(INTDIR)\ph_inton.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\ph_inton.obj"	"$(INTDIR)\ph_inton.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\ph_inton.obj"	"$(INTDIR)\ph_inton.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Ph\ph_main.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\ph_main.obj"	"$(INTDIR)\ph_main.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\ph_main.obj"	"$(INTDIR)\ph_main.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\ph_main.obj"	"$(INTDIR)\ph_main.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\ph_main.obj"	"$(INTDIR)\ph_main.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Ph\ph_romi.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\ph_romi.obj"	"$(INTDIR)\ph_romi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\ph_romi.obj"	"$(INTDIR)\ph_romi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\ph_romi.obj"	"$(INTDIR)\ph_romi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\ph_romi.obj"	"$(INTDIR)\ph_romi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Ph\ph_setar.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\ph_setar.obj"	"$(INTDIR)\ph_setar.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\ph_setar.obj"	"$(INTDIR)\ph_setar.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\ph_setar.obj"	"$(INTDIR)\ph_setar.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\ph_setar.obj"	"$(INTDIR)\ph_setar.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Ph\ph_sort.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\ph_sort.obj"	"$(INTDIR)\ph_sort.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\ph_sort.obj"	"$(INTDIR)\ph_sort.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\ph_sort.obj"	"$(INTDIR)\ph_sort.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\ph_sort.obj"	"$(INTDIR)\ph_sort.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Ph\ph_syl.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\ph_syl.obj"	"$(INTDIR)\ph_syl.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\ph_syl.obj"	"$(INTDIR)\ph_syl.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\ph_syl.obj"	"$(INTDIR)\ph_syl.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\ph_syl.obj"	"$(INTDIR)\ph_syl.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Ph\ph_syntx.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\ph_syntx.obj"	"$(INTDIR)\ph_syntx.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\ph_syntx.obj"	"$(INTDIR)\ph_syntx.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\ph_syntx.obj"	"$(INTDIR)\ph_syntx.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\ph_syntx.obj"	"$(INTDIR)\ph_syntx.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Ph\ph_task.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\ph_task.obj"	"$(INTDIR)\ph_task.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\ph_task.obj"	"$(INTDIR)\ph_task.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\ph_task.obj"	"$(INTDIR)\ph_task.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\ph_task.obj"	"$(INTDIR)\ph_task.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Ph\ph_timng.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\ph_timng.obj"	"$(INTDIR)\ph_timng.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\ph_timng.obj"	"$(INTDIR)\ph_timng.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\ph_timng.obj"	"$(INTDIR)\ph_timng.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\ph_timng.obj"	"$(INTDIR)\ph_timng.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Ph\ph_vdefi.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\ph_vdefi.obj"	"$(INTDIR)\ph_vdefi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\ph_vdefi.obj"	"$(INTDIR)\ph_vdefi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\ph_vdefi.obj"	"$(INTDIR)\ph_vdefi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\ph_vdefi.obj"	"$(INTDIR)\ph_vdefi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Ph\ph_vset.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\ph_vset.obj"	"$(INTDIR)\ph_vset.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\ph_vset.obj"	"$(INTDIR)\ph_vset.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\ph_vset.obj"	"$(INTDIR)\ph_vset.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\ph_vset.obj"	"$(INTDIR)\ph_vset.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Ph\phinit.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\phinit.obj"	"$(INTDIR)\phinit.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\phinit.obj"	"$(INTDIR)\phinit.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\phinit.obj"	"$(INTDIR)\phinit.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\phinit.obj"	"$(INTDIR)\phinit.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Ph\phlog.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\phlog.obj"	"$(INTDIR)\phlog.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\phlog.obj"	"$(INTDIR)\phlog.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\phlog.obj"	"$(INTDIR)\phlog.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\phlog.obj"	"$(INTDIR)\phlog.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\nt\PIPE.C

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\PIPE.OBJ"	"$(INTDIR)\PIPE.SBR" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\PIPE.OBJ"	"$(INTDIR)\PIPE.SBR" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\PIPE.OBJ"	"$(INTDIR)\PIPE.SBR" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\PIPE.OBJ"	"$(INTDIR)\PIPE.SBR" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\NT\playaud.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\playaud.obj"	"$(INTDIR)\playaud.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\playaud.obj"	"$(INTDIR)\playaud.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\playaud.obj"	"$(INTDIR)\playaud.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\playaud.obj"	"$(INTDIR)\playaud.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\vtm\PLAYTONE.C

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\PLAYTONE.OBJ"	"$(INTDIR)\PLAYTONE.SBR" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\PLAYTONE.OBJ"	"$(INTDIR)\PLAYTONE.SBR" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\PLAYTONE.OBJ"	"$(INTDIR)\PLAYTONE.SBR" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\PLAYTONE.OBJ"	"$(INTDIR)\PLAYTONE.SBR" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\src\sapiiont.cpp

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\sapiiont.obj"	"$(INTDIR)\sapiiont.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\sapiiont.obj"	"$(INTDIR)\sapiiont.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\sapiiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\sapiiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\sapiiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\sapiiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\sapiiont.obj"	"$(INTDIR)\sapiiont.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\sapiiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\sapiiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\sapiiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\sapiiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\sapiiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\sapiiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\sapiiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\sapiiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\sapiiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\sapiiont.obj"	"$(INTDIR)\sapiiont.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\sapiiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\sapiiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\sapiiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\kernel\SERVICES.C

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\SERVICES.OBJ"	"$(INTDIR)\SERVICES.SBR" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\SERVICES.OBJ"	"$(INTDIR)\SERVICES.SBR" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\SERVICES.OBJ"	"$(INTDIR)\SERVICES.SBR" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\SERVICES.OBJ"	"$(INTDIR)\SERVICES.SBR" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\nt\SPC.C

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\SPC.OBJ"	"$(INTDIR)\SPC.SBR" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\SPC.OBJ"	"$(INTDIR)\SPC.SBR" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\SPC.OBJ"	"$(INTDIR)\SPC.SBR" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\SPC.OBJ"	"$(INTDIR)\SPC.SBR" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\src\stdafx.cpp

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\stdafx.obj"	"$(INTDIR)\stdafx.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\stdafx.obj"	"$(INTDIR)\stdafx.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\stdafx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\stdafx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\stdafx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\stdafx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\stdafx.obj"	"$(INTDIR)\stdafx.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\stdafx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\stdafx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\stdafx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\stdafx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\stdafx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\stdafx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\stdafx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\stdafx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\stdafx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\stdafx.obj"	"$(INTDIR)\stdafx.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\stdafx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\stdafx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\stdafx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\vtm\SYNC.C

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\SYNC.OBJ"	"$(INTDIR)\SYNC.SBR" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\SYNC.OBJ"	"$(INTDIR)\SYNC.SBR" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\SYNC.OBJ"	"$(INTDIR)\SYNC.SBR" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\SYNC.OBJ"	"$(INTDIR)\SYNC.SBR" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\api\ttsapi.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\ttsapi.obj"	"$(INTDIR)\ttsapi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\ttsapi.obj"	"$(INTDIR)\ttsapi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\ttsapi.obj"	"$(INTDIR)\ttsapi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\ttsapi.obj"	"$(INTDIR)\ttsapi.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\src\ttseng.cpp

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\ttseng.obj"	"$(INTDIR)\ttseng.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\ttseng.obj"	"$(INTDIR)\ttseng.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\ttseng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\ttseng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\ttseng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\ttseng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\ttseng.obj"	"$(INTDIR)\ttseng.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\ttseng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\ttseng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\ttseng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\ttseng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\ttseng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\ttseng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ttseng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\ttseng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ttseng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\ttseng.obj"	"$(INTDIR)\ttseng.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\ttseng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ttseng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ttseng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\src\ttseng.idl

!IF  "$(CFG)" == "Sapi5 - Win32 Release"

MTL_SWITCHES=/nologo /I ".\idl" /D "NDEBUG" /tlb "$(OUTDIR)\ttseng.tlb" /win32 

".\build\us\release\ttseng.tlb" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"

MTL_SWITCHES=/nologo /I ".\idl" /D "_DEBUG" /tlb "$(OUTDIR)\ttseng.tlb" /win32 

".\build\us\debug\ttseng.tlb" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"

MTL_SWITCHES=/nologo /D "NDEBUG" /tlb "$(OUTDIR)\ttseng.tlb" /mktyplib203 /win32 

"..\build\dectalk\sp\release\ttseng.tlb" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"

MTL_SWITCHES=/nologo /D "NDEBUG" /tlb "$(OUTDIR)\ttseng.tlb" /mktyplib203 /win32 

"..\build\dectalk\gr\release\ttseng.tlb" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"

MTL_SWITCHES=/nologo /D "NDEBUG" /tlb "$(OUTDIR)\ttseng.tlb" /mktyplib203 /win32 

"..\build\dectalk\la\release\ttseng.tlb" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"

MTL_SWITCHES=/nologo /D "_DEBUG" /tlb "$(OUTDIR)\ttseng.tlb" /mktyplib203 /win32 

"..\build\dectalk\sp\debug\ttseng.tlb" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"

MTL_SWITCHES=/nologo /D "_DEBUG" /tlb "$(OUTDIR)\ttseng.tlb" /mktyplib203 /win32 

"..\build\dectalk\gr\debug\ttseng.tlb" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"

MTL_SWITCHES=/nologo /D "_DEBUG" /tlb "$(OUTDIR)\ttseng.tlb" /mktyplib203 /win32 

"..\build\dectalk\la\debug\ttseng.tlb" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"

MTL_SWITCHES=/nologo /D "NDEBUG" /tlb "$(OUTDIR)\ttseng.tlb" /mktyplib203 /win32 

"..\build\dectalk\us\access32\ttseng.tlb" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"

MTL_SWITCHES=/nologo /D "NDEBUG" /tlb "$(OUTDIR)\ttseng.tlb" /mktyplib203 /win32 

"..\build\dectalk\sp\access32\ttseng.tlb" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"

MTL_SWITCHES=/nologo /D "NDEBUG" /tlb "$(OUTDIR)\ttseng.tlb" /mktyplib203 /win32 

"..\build\dectalk\gr\access32\ttseng.tlb" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"

MTL_SWITCHES=/nologo /D "NDEBUG" /tlb "$(OUTDIR)\ttseng.tlb" /mktyplib203 /win32 

"..\build\dectalk\la\access32\ttseng.tlb" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"

MTL_SWITCHES=/nologo /D "_DEBUG" /tlb "$(OUTDIR)\ttseng.tlb" /mktyplib203 /win32 

"..\build\dectalk\us\a32debug\ttseng.tlb" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"

MTL_SWITCHES=/nologo /D "_DEBUG" /tlb "$(OUTDIR)\ttseng.tlb" /mktyplib203 /win32 

"..\build\dectalk\sp\a32debug\ttseng.tlb" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"

MTL_SWITCHES=/nologo /D "_DEBUG" /tlb "$(OUTDIR)\ttseng.tlb" /mktyplib203 /win32 

"..\build\dectalk\gr\a32debug\ttseng.tlb" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"

MTL_SWITCHES=/nologo /D "_DEBUG" /tlb "$(OUTDIR)\ttseng.tlb" /mktyplib203 /win32 

"..\build\dectalk\la\a32debug\ttseng.tlb" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"

MTL_SWITCHES=/nologo /D "NDEBUG" /tlb "$(OUTDIR)\ttseng.tlb" /mktyplib203 /win32 

"..\build\dectalk\uk\release\ttseng.tlb" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"

MTL_SWITCHES=/nologo /D "_DEBUG" /tlb "$(OUTDIR)\ttseng.tlb" /mktyplib203 /win32 

"..\build\dectalk\uk\debug\ttseng.tlb" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"

MTL_SWITCHES=/nologo /D "NDEBUG" /tlb "$(OUTDIR)\ttseng.tlb" /mktyplib203 /win32 

"..\build\dectalk\uk\access32\ttseng.tlb" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"

MTL_SWITCHES=/nologo /D "_DEBUG" /tlb "$(OUTDIR)\ttseng.tlb" /mktyplib203 /win32 

"..\build\dectalk\uk\a32debug\ttseng.tlb" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\src\ttseng.rc

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\ttseng.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\ttseng.res" /i "src" /d "NDEBUG" $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\ttseng.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\ttseng.res" /i "src" /d "_DEBUG" $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\ttseng.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x40a /fo"$(INTDIR)\ttseng.res" /i "src" $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\ttseng.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x407 /fo"$(INTDIR)\ttseng.res" /i "src" $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\ttseng.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x40a /fo"$(INTDIR)\ttseng.res" /i "src" $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\ttseng.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x40a /fo"$(INTDIR)\ttseng.res" /i "src" $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\ttseng.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x407 /fo"$(INTDIR)\ttseng.res" /i "src" $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\ttseng.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x40a /fo"$(INTDIR)\ttseng.res" /i "src" $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\ttseng.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\ttseng.res" /i "src" $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\ttseng.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x40a /fo"$(INTDIR)\ttseng.res" /i "src" $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\ttseng.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x407 /fo"$(INTDIR)\ttseng.res" /i "src" $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\ttseng.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x40a /fo"$(INTDIR)\ttseng.res" /i "src" $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\ttseng.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\ttseng.res" /i "src" $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ttseng.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x40a /fo"$(INTDIR)\ttseng.res" /i "src" $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\ttseng.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x407 /fo"$(INTDIR)\ttseng.res" /i "src" $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ttseng.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x40a /fo"$(INTDIR)\ttseng.res" /i "src" $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\ttseng.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x809 /fo"$(INTDIR)\ttseng.res" /i "src" $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\ttseng.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x809 /fo"$(INTDIR)\ttseng.res" /i "src" $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ttseng.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x809 /fo"$(INTDIR)\ttseng.res" /i "src" $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ttseng.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x809 /fo"$(INTDIR)\ttseng.res" /i "src" $(SOURCE)


!ENDIF 

SOURCE=.\src\ttsengobj.cpp

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\ttsengobj.obj"	"$(INTDIR)\ttsengobj.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\ttsengobj.obj"	"$(INTDIR)\ttsengobj.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\ttsengobj.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\ttsengobj.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\ttsengobj.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\ttsengobj.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\ttsengobj.obj"	"$(INTDIR)\ttsengobj.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\ttsengobj.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\ttsengobj.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\ttsengobj.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\ttsengobj.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\ttsengobj.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\ttsengobj.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ttsengobj.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\ttsengobj.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ttsengobj.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\ttsengobj.obj"	"$(INTDIR)\ttsengobj.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\ttsengobj.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ttsengobj.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ttsengobj.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\kernel\USA_INIT.C

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\USA_INIT.OBJ"	"$(INTDIR)\USA_INIT.SBR" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\USA_INIT.OBJ"	"$(INTDIR)\USA_INIT.SBR" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\USA_INIT.OBJ"	"$(INTDIR)\USA_INIT.SBR" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\USA_INIT.OBJ"	"$(INTDIR)\USA_INIT.SBR" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\Vtm\vtm.c

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\vtm.obj"	"$(INTDIR)\vtm.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\vtm.obj"	"$(INTDIR)\vtm.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\vtm.obj"	"$(INTDIR)\vtm.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\vtm.obj"	"$(INTDIR)\vtm.sbr" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\dapi\src\vtm\VTMIONT.C

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


"$(INTDIR)\VTMIONT.OBJ"	"$(INTDIR)\VTMIONT.SBR" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


"$(INTDIR)\VTMIONT.OBJ"	"$(INTDIR)\VTMIONT.SBR" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


"$(INTDIR)\VTMIONT.OBJ"	"$(INTDIR)\VTMIONT.SBR" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Spanish"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 German"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 Latin American"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Spanish"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 German"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 Latin American"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


"$(INTDIR)\VTMIONT.OBJ"	"$(INTDIR)\VTMIONT.SBR" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 


!ENDIF 

