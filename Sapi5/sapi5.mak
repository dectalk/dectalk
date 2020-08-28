# Microsoft Developer Studio Generated NMAKE File, Based on sapi5.dsp
!IF "$(CFG)" == ""
CFG=Sapi5 - Win32 Debug French
!MESSAGE No configuration specified. Defaulting to Sapi5 - Win32 Debug French.
!ENDIF 

!IF "$(CFG)" != "Sapi5 - Win32 Release" && "$(CFG)" != "Sapi5 - Win32 Debug" && "$(CFG)" != "Sapi5 - Win32 Release Spanish" && "$(CFG)" != "Sapi5 - Win32 Release German" && "$(CFG)" != "Sapi5 - Win32 Release Latin American" && "$(CFG)" != "Sapi5 - Win32 Debug Spanish" && "$(CFG)" != "Sapi5 - Win32 Debug German" && "$(CFG)" != "Sapi5 - Win32 Debug Latin American" && "$(CFG)" != "Sapi5 - Win32 Release United Kingdom" && "$(CFG)" != "Sapi5 - Win32 Debug United Kingdom" && "$(CFG)" != "Sapi5 - Win32 Debug French" && "$(CFG)" != "Sapi5 - Win32 Release French"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "sapi5.mak" CFG="Sapi5 - Win32 Debug French"
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
!MESSAGE "Sapi5 - Win32 Release United Kingdom" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Sapi5 - Win32 Debug United Kingdom" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Sapi5 - Win32 Debug French" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Sapi5 - Win32 Release French" (based on "Win32 (x86) Dynamic-Link Library")
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

!IF  "$(CFG)" == "Sapi5 - Win32 Release"

OUTDIR=.\build\us\release
INTDIR=.\build\us\release\link
# Begin Custom Macros
OutDir=.\build\us\release
# End Custom Macros

ALL : "$(OUTDIR)\sapi5.dll" "$(OUTDIR)\ttseng.tlb"


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
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\DECSTD97.OBJ"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\inithl.obj"
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
	-@erase "$(INTDIR)\nasalf1x.obj"
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
	-@erase "$(INTDIR)\phprint.obj"
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\playaud.obj"
	-@erase "$(INTDIR)\PLAYTONE.OBJ"
	-@erase "$(INTDIR)\sapiiont.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\ttseng.obj"
	-@erase "$(INTDIR)\ttsengobj.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\sapi5.dll"
	-@erase "$(OUTDIR)\sapi5.exp"
	-@erase "$(OUTDIR)\sapi5.lib"
	-@erase ".\build\us\release\ttseng.res"
	-@erase ".\build\us\release\ttseng.tlb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /Ox /I "..\dapi\src\api" /I "..\dapi\src\acna" /I "..\dapi\src\cmd" /I "..\dapi\src\lts" /I "..\dapi\src\ph" /I "..\dapi\src\vtm" /I "..\dapi\src\kernel" /I "..\dapi\src\nt" /I "..\dapi\src\include" /I "..\dapi\src\protos" /I "..\dapi\src\hlsyn" /I ".." /I ".\src" /I ".\include" /D "NDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /D "SAPI5DECTALK" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SLOWTALK" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /I ".\idl" /D "NDEBUG" /D "ENGLISH_US" /win32 
RSC_PROJ=/l 0x409 /fo".\build\us\release/ttseng.res" /d "NDEBUG" /d "ENGLISH_US" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\sapi5.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /version:5.0 /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\sapi5.pdb" /machine:I386 /def:".\src\ttseng.def" /out:"$(OUTDIR)\sapi5.dll" /implib:"$(OUTDIR)\sapi5.lib" /libpath:".\lib\i386" 
DEF_FILE= \
	".\src\ttseng.def"
LINK32_OBJS= \
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
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\DECSTD97.OBJ" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
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
	"$(INTDIR)\nasalf1x.obj" \
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
	"$(INTDIR)\phprint.obj" \
	"$(INTDIR)\PIPE.OBJ" \
	"$(INTDIR)\playaud.obj" \
	"$(INTDIR)\PLAYTONE.OBJ" \
	"$(INTDIR)\sapiiont.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\ttseng.obj" \
	"$(INTDIR)\ttsengobj.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ" \
	".\build\us\release\ttseng.res"

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

ALL : "$(OUTDIR)\sapi5.dll" "$(OUTDIR)\ttseng.tlb"


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
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\DECSTD97.OBJ"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\inithl.obj"
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
	-@erase "$(INTDIR)\nasalf1x.obj"
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
	-@erase "$(INTDIR)\phprint.obj"
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\playaud.obj"
	-@erase "$(INTDIR)\PLAYTONE.OBJ"
	-@erase "$(INTDIR)\sapiiont.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\ttseng.obj"
	-@erase "$(INTDIR)\ttsengobj.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\sapi5.dll"
	-@erase "$(OUTDIR)\sapi5.exp"
	-@erase "$(OUTDIR)\sapi5.ilk"
	-@erase "$(OUTDIR)\sapi5.lib"
	-@erase "$(OUTDIR)\sapi5.pdb"
	-@erase ".\build\us\debug\ttseng.res"
	-@erase ".\build\us\debug\ttseng.tlb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I "..\dapi\src\api" /I "..\dapi\src\acna" /I "..\dapi\src\cmd" /I "..\dapi\src\lts" /I "..\dapi\src\ph" /I "..\dapi\src\vtm" /I "..\dapi\src\kernel" /I "..\dapi\src\nt" /I "..\dapi\src\include" /I "..\dapi\src\protos" /I ".." /I ".\src" /I "..\dapi\src\hlsyn" /I ".\include" /D "_DEBUG" /D "PRINTFDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /D "SAPI5DECTALK" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SLOWTALK" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /I ".\idl" /D "_DEBUG" /D "ENGLISH_US" /win32 
RSC_PROJ=/l 0x409 /fo".\build\us\debug/ttseng.res" /d "_DEBUG" /d "ENGLISH_US" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\sapi5.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /version:5.0 /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\sapi5.pdb" /debug /debugtype:both /machine:IX86 /def:".\src\ttseng.def" /out:"$(OUTDIR)\sapi5.dll" /implib:"$(OUTDIR)\sapi5.lib" /pdbtype:sept /libpath:".\lib\i386" 
DEF_FILE= \
	".\src\ttseng.def"
LINK32_OBJS= \
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
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\DECSTD97.OBJ" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
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
	"$(INTDIR)\nasalf1x.obj" \
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
	"$(INTDIR)\phprint.obj" \
	"$(INTDIR)\PIPE.OBJ" \
	"$(INTDIR)\playaud.obj" \
	"$(INTDIR)\PLAYTONE.OBJ" \
	"$(INTDIR)\sapiiont.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\ttseng.obj" \
	"$(INTDIR)\ttsengobj.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ" \
	".\build\us\debug\ttseng.res"

"$(OUTDIR)\sapi5.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"

OUTDIR=.\build\sp\release
INTDIR=.\build\sp\release\link
# Begin Custom Macros
OutDir=.\build\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\sapi5.dll" "$(OUTDIR)\ttseng.tlb"


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
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\DECSTD97.OBJ"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\inithl.obj"
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
	-@erase "$(INTDIR)\nasalf1x.obj"
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
	-@erase "$(INTDIR)\phprint.obj"
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\playaud.obj"
	-@erase "$(INTDIR)\PLAYTONE.OBJ"
	-@erase "$(INTDIR)\sapiiont.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\ttseng.obj"
	-@erase "$(INTDIR)\ttsengobj.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\sapi5.dll"
	-@erase "$(OUTDIR)\sapi5.exp"
	-@erase "$(OUTDIR)\sapi5.lib"
	-@erase ".\build\sp\release\ttseng.res"
	-@erase ".\build\sp\release\ttseng.tlb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /Ox /I "..\dapi\src\api" /I "..\dapi\src\acna" /I "..\dapi\src\cmd" /I "..\dapi\src\lts" /I "..\dapi\src\ph" /I "..\dapi\src\vtm" /I "..\dapi\src\kernel" /I "..\dapi\src\nt" /I "..\dapi\src\include" /I "..\dapi\src\protos" /I "..\dapi\src\hlsyn" /I ".." /I ".\src" /I ".\include" /D "NDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "SAPI5DECTALK" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SLOWTALK" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /I ".\idl" /D "NDEBUG" /D "SPANISH_SP" /win32 
RSC_PROJ=/l 0x40a /fo".\build\sp\release/ttseng.res" /d "NDEBUG" /d "SPANISH_SP" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o".\..\build\dectalk\sp\release\dectalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /version:5.0 /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\sapi5.pdb" /machine:I386 /def:".\src\ttseng.def" /out:"$(OUTDIR)\sapi5.dll" /implib:"$(OUTDIR)\sapi5.lib" /libpath:".\lib\i386" 
DEF_FILE= \
	".\src\ttseng.def"
LINK32_OBJS= \
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
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\DECSTD97.OBJ" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
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
	"$(INTDIR)\nasalf1x.obj" \
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
	"$(INTDIR)\phprint.obj" \
	"$(INTDIR)\PIPE.OBJ" \
	"$(INTDIR)\playaud.obj" \
	"$(INTDIR)\PLAYTONE.OBJ" \
	"$(INTDIR)\sapiiont.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\ttseng.obj" \
	"$(INTDIR)\ttsengobj.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ" \
	".\build\sp\release\ttseng.res"

"$(OUTDIR)\sapi5.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"

OUTDIR=.\build\gr\release
INTDIR=.\build\gr\release\link
# Begin Custom Macros
OutDir=.\build\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\sapi5.dll" "$(OUTDIR)\ttseng.tlb"


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
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\DECSTD97.OBJ"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\inithl.obj"
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
	-@erase "$(INTDIR)\nasalf1x.obj"
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
	-@erase "$(INTDIR)\phprint.obj"
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\playaud.obj"
	-@erase "$(INTDIR)\PLAYTONE.OBJ"
	-@erase "$(INTDIR)\sapiiont.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\ttseng.obj"
	-@erase "$(INTDIR)\ttsengobj.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\sapi5.dll"
	-@erase "$(OUTDIR)\sapi5.exp"
	-@erase "$(OUTDIR)\sapi5.lib"
	-@erase ".\build\gr\release\ttseng.res"
	-@erase ".\build\gr\release\ttseng.tlb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /Ox /I "..\dapi\src\api" /I "..\dapi\src\acna" /I "..\dapi\src\cmd" /I "..\dapi\src\lts" /I "..\dapi\src\ph" /I "..\dapi\src\vtm" /I "..\dapi\src\kernel" /I "..\dapi\src\nt" /I "..\dapi\src\include" /I "..\dapi\src\protos" /I "..\dapi\src\hlsyn" /I ".." /I ".\include" /I ".\src" /D "NDEBUG" /D "GERMAN" /D "SAPI5DECTALK" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SLOWTALK" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /Zm200 /c 
MTL_PROJ=/nologo /I ".\idl" /D "NDEBUG" /D "GERMAN" /win32 
RSC_PROJ=/l 0x407 /fo".\build\gr\release/ttseng.res" /d "NDEBUG" /d "GERMAN" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o".\..\build\dectalk\gr\release\dectalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /version:5.0 /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\sapi5.pdb" /machine:I386 /def:".\src\ttseng.def" /out:"$(OUTDIR)\sapi5.dll" /implib:"$(OUTDIR)\sapi5.lib" /libpath:".\lib\i386" 
DEF_FILE= \
	".\src\ttseng.def"
LINK32_OBJS= \
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
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\DECSTD97.OBJ" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
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
	"$(INTDIR)\nasalf1x.obj" \
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
	"$(INTDIR)\phprint.obj" \
	"$(INTDIR)\PIPE.OBJ" \
	"$(INTDIR)\playaud.obj" \
	"$(INTDIR)\PLAYTONE.OBJ" \
	"$(INTDIR)\sapiiont.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\ttseng.obj" \
	"$(INTDIR)\ttsengobj.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ" \
	".\build\gr\release\ttseng.res"

"$(OUTDIR)\sapi5.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"

OUTDIR=.\build\la\release
INTDIR=.\build\la\release\link
# Begin Custom Macros
OutDir=.\build\la\release
# End Custom Macros

ALL : "$(OUTDIR)\sapi5.dll" "$(OUTDIR)\ttseng.tlb"


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
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\DECSTD97.OBJ"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\inithl.obj"
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
	-@erase "$(INTDIR)\nasalf1x.obj"
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
	-@erase "$(INTDIR)\phprint.obj"
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\playaud.obj"
	-@erase "$(INTDIR)\PLAYTONE.OBJ"
	-@erase "$(INTDIR)\sapiiont.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\ttseng.obj"
	-@erase "$(INTDIR)\ttsengobj.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\sapi5.dll"
	-@erase "$(OUTDIR)\sapi5.exp"
	-@erase "$(OUTDIR)\sapi5.lib"
	-@erase ".\build\la\release\ttseng.res"
	-@erase ".\build\la\release\ttseng.tlb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /Ox /I "..\dapi\src\api" /I "..\dapi\src\acna" /I "..\dapi\src\cmd" /I "..\dapi\src\lts" /I "..\dapi\src\ph" /I "..\dapi\src\vtm" /I "..\dapi\src\kernel" /I "..\dapi\src\nt" /I "..\dapi\src\include" /I "..\dapi\src\protos" /I "..\dapi\src\hlsyn" /I ".." /I ".\src" /I ".\include" /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "SAPI5DECTALK" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SLOWTALK" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /I ".\idl" /D "NDEBUG" /D "SPANISH_LA" /win32 
RSC_PROJ=/l 0x40a /fo".\build\la\release/ttseng.res" /d "NDEBUG" /d "SPANISH_LA" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o".\..\build\dectalk\la\release\dectalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /version:5.0 /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\sapi5.pdb" /machine:I386 /def:".\src\ttseng.def" /out:"$(OUTDIR)\sapi5.dll" /implib:"$(OUTDIR)\sapi5.lib" /libpath:".\lib\i386" 
DEF_FILE= \
	".\src\ttseng.def"
LINK32_OBJS= \
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
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\DECSTD97.OBJ" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
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
	"$(INTDIR)\nasalf1x.obj" \
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
	"$(INTDIR)\phprint.obj" \
	"$(INTDIR)\PIPE.OBJ" \
	"$(INTDIR)\playaud.obj" \
	"$(INTDIR)\PLAYTONE.OBJ" \
	"$(INTDIR)\sapiiont.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\ttseng.obj" \
	"$(INTDIR)\ttsengobj.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ" \
	".\build\la\release\ttseng.res"

"$(OUTDIR)\sapi5.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"

OUTDIR=.\build\sp\debug
INTDIR=.\build\sp\debug\link
# Begin Custom Macros
OutDir=.\build\sp\debug
# End Custom Macros

ALL : "$(OUTDIR)\sapi5.dll" "$(OUTDIR)\ttseng.tlb"


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
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\DECSTD97.OBJ"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\inithl.obj"
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
	-@erase "$(INTDIR)\nasalf1x.obj"
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
	-@erase "$(INTDIR)\phprint.obj"
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\playaud.obj"
	-@erase "$(INTDIR)\PLAYTONE.OBJ"
	-@erase "$(INTDIR)\sapiiont.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\ttseng.obj"
	-@erase "$(INTDIR)\ttsengobj.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\sapi5.dll"
	-@erase "$(OUTDIR)\sapi5.exp"
	-@erase "$(OUTDIR)\sapi5.ilk"
	-@erase "$(OUTDIR)\sapi5.lib"
	-@erase "$(OUTDIR)\sapi5.pdb"
	-@erase ".\build\sp\debug\ttseng.res"
	-@erase ".\build\sp\debug\ttseng.tlb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I "..\dapi\src\api" /I "..\dapi\src\acna" /I "..\dapi\src\cmd" /I "..\dapi\src\lts" /I "..\dapi\src\ph" /I "..\dapi\src\vtm" /I "..\dapi\src\kernel" /I "..\dapi\src\nt" /I "..\dapi\src\include" /I "..\dapi\src\protos" /I "..\dapi\src\hlsyn" /I ".." /I ".\include" /I ".\src" /D "_DEBUG" /D "PRINTFDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "SAPI5DECTALK" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SLOWTALK" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /I ".\idl" /D "_DEBUG" /D "SPANISH_SP" /win32 
RSC_PROJ=/l 0x40a /fo".\build\sp\debug/ttseng.res" /d "_DEBUG" /d "SPANISH_SP" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\sapi5.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /version:5.0 /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\sapi5.pdb" /debug /debugtype:both /machine:IX86 /def:".\src\ttseng.def" /out:"$(OUTDIR)\sapi5.dll" /implib:"$(OUTDIR)\sapi5.lib" /pdbtype:sept /libpath:".\lib\i386" 
DEF_FILE= \
	".\src\ttseng.def"
LINK32_OBJS= \
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
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\DECSTD97.OBJ" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
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
	"$(INTDIR)\nasalf1x.obj" \
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
	"$(INTDIR)\phprint.obj" \
	"$(INTDIR)\PIPE.OBJ" \
	"$(INTDIR)\playaud.obj" \
	"$(INTDIR)\PLAYTONE.OBJ" \
	"$(INTDIR)\sapiiont.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\ttseng.obj" \
	"$(INTDIR)\ttsengobj.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ" \
	".\build\sp\debug\ttseng.res"

"$(OUTDIR)\sapi5.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"

OUTDIR=.\build\gr\debug
INTDIR=.\build\gr\debug\link
# Begin Custom Macros
OutDir=.\build\gr\debug
# End Custom Macros

ALL : "$(OUTDIR)\sapi5.dll" "$(OUTDIR)\ttseng.tlb"


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
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\DECSTD97.OBJ"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\inithl.obj"
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
	-@erase "$(INTDIR)\nasalf1x.obj"
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
	-@erase "$(INTDIR)\phprint.obj"
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\playaud.obj"
	-@erase "$(INTDIR)\PLAYTONE.OBJ"
	-@erase "$(INTDIR)\sapiiont.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\ttseng.obj"
	-@erase "$(INTDIR)\ttsengobj.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\sapi5.dll"
	-@erase "$(OUTDIR)\sapi5.exp"
	-@erase "$(OUTDIR)\sapi5.ilk"
	-@erase "$(OUTDIR)\sapi5.lib"
	-@erase "$(OUTDIR)\sapi5.pdb"
	-@erase ".\build\gr\debug\ttseng.res"
	-@erase ".\build\gr\debug\ttseng.tlb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I "..\dapi\src\api" /I "..\dapi\src\acna" /I "..\dapi\src\cmd" /I "..\dapi\src\lts" /I "..\dapi\src\ph" /I "..\dapi\src\vtm" /I "..\dapi\src\kernel" /I "..\dapi\src\nt" /I "..\dapi\src\include" /I "..\dapi\src\protos" /I "..\dapi\src\hlsyn" /I ".." /I ".\include" /I ".\src" /D "_DEBUG" /D "PRINTFDEBUG" /D "GERMAN" /D "SAPI5DECTALK" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SLOWTALK" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /Zm200 /c 
MTL_PROJ=/nologo /I ".\idl" /D "_DEBUG" /D "GERMAN" /win32 
RSC_PROJ=/l 0x407 /fo".\build\gr\debug/ttseng.res" /d "_DEBUG" /d "GERMAN" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\sapi5.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /version:5.0 /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\sapi5.pdb" /debug /debugtype:both /machine:IX86 /def:".\src\ttseng.def" /out:"$(OUTDIR)\sapi5.dll" /implib:"$(OUTDIR)\sapi5.lib" /pdbtype:sept /libpath:".\lib\i386" 
DEF_FILE= \
	".\src\ttseng.def"
LINK32_OBJS= \
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
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\DECSTD97.OBJ" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
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
	"$(INTDIR)\nasalf1x.obj" \
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
	"$(INTDIR)\phprint.obj" \
	"$(INTDIR)\PIPE.OBJ" \
	"$(INTDIR)\playaud.obj" \
	"$(INTDIR)\PLAYTONE.OBJ" \
	"$(INTDIR)\sapiiont.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\ttseng.obj" \
	"$(INTDIR)\ttsengobj.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ" \
	".\build\gr\debug\ttseng.res"

"$(OUTDIR)\sapi5.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"

OUTDIR=.\build\la\debug
INTDIR=.\build\la\debug\link
# Begin Custom Macros
OutDir=.\build\la\debug
# End Custom Macros

ALL : "$(OUTDIR)\sapi5.dll" "$(OUTDIR)\ttseng.tlb"


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
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\DECSTD97.OBJ"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\inithl.obj"
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
	-@erase "$(INTDIR)\nasalf1x.obj"
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
	-@erase "$(INTDIR)\phprint.obj"
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\playaud.obj"
	-@erase "$(INTDIR)\PLAYTONE.OBJ"
	-@erase "$(INTDIR)\sapiiont.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\ttseng.obj"
	-@erase "$(INTDIR)\ttsengobj.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\sapi5.dll"
	-@erase "$(OUTDIR)\sapi5.exp"
	-@erase "$(OUTDIR)\sapi5.ilk"
	-@erase "$(OUTDIR)\sapi5.lib"
	-@erase "$(OUTDIR)\sapi5.pdb"
	-@erase ".\build\la\debug\ttseng.res"
	-@erase ".\build\la\debug\ttseng.tlb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I "..\dapi\src\api" /I "..\dapi\src\acna" /I "..\dapi\src\cmd" /I "..\dapi\src\lts" /I "..\dapi\src\ph" /I "..\dapi\src\vtm" /I "..\dapi\src\kernel" /I "..\dapi\src\nt" /I "..\dapi\src\include" /I "..\dapi\src\protos" /I "..\dapi\src\hlsyn" /I ".." /I ".\include" /I ".\src" /D "_DEBUG" /D "PRINTFDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "SAPI5DECTALK" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SLOWTALK" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /I ".\idl" /D "_DEBUG" /D "SPANISH_LA" /win32 
RSC_PROJ=/l 0x40a /fo".\build\la\debug/ttseng.res" /d "_DEBUG" /d "SPANISH_LA" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\sapi5.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /version:5.0 /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\sapi5.pdb" /debug /debugtype:both /machine:IX86 /def:".\src\ttseng.def" /out:"$(OUTDIR)\sapi5.dll" /implib:"$(OUTDIR)\sapi5.lib" /pdbtype:sept /libpath:".\lib\i386" 
DEF_FILE= \
	".\src\ttseng.def"
LINK32_OBJS= \
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
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\DECSTD97.OBJ" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
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
	"$(INTDIR)\nasalf1x.obj" \
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
	"$(INTDIR)\phprint.obj" \
	"$(INTDIR)\PIPE.OBJ" \
	"$(INTDIR)\playaud.obj" \
	"$(INTDIR)\PLAYTONE.OBJ" \
	"$(INTDIR)\sapiiont.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\ttseng.obj" \
	"$(INTDIR)\ttsengobj.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ" \
	".\build\la\debug\ttseng.res"

"$(OUTDIR)\sapi5.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"

OUTDIR=.\build\uk\release
INTDIR=.\build\uk\release\link
# Begin Custom Macros
OutDir=.\build\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\sapi5.dll" "$(OUTDIR)\ttseng.tlb"


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
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\DECSTD97.OBJ"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\inithl.obj"
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
	-@erase "$(INTDIR)\nasalf1x.obj"
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
	-@erase "$(INTDIR)\phprint.obj"
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\playaud.obj"
	-@erase "$(INTDIR)\PLAYTONE.OBJ"
	-@erase "$(INTDIR)\sapiiont.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\ttseng.obj"
	-@erase "$(INTDIR)\ttsengobj.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\sapi5.dll"
	-@erase "$(OUTDIR)\sapi5.exp"
	-@erase "$(OUTDIR)\sapi5.lib"
	-@erase ".\build\uk\release\ttseng.res"
	-@erase ".\build\uk\release\ttseng.tlb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /Ox /I "..\dapi\src\api" /I "..\dapi\src\acna" /I "..\dapi\src\cmd" /I "..\dapi\src\lts" /I "..\dapi\src\ph" /I "..\dapi\src\vtm" /I "..\dapi\src\kernel" /I "..\dapi\src\nt" /I "..\dapi\src\include" /I "..\dapi\src\protos" /I "..\dapi\src\hlsyn" /I ".." /I ".\include" /I ".\src" /D "NDEBUG" /D "ENGLISH_UK" /D "ENGLISH" /D "SAPI5DECTALK" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SLOWTALK" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /I ".\idl" /D "NDEBUG" /D "ENGLISH_UK" /win32 
RSC_PROJ=/l 0x809 /fo".\build\uk\release/ttseng.res" /d "NDEBUG" /d "ENGLISH_UK" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o".\..\build\dectalk\uk\release\dectalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /version:5.0 /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\sapi5.pdb" /machine:I386 /def:".\src\ttseng.def" /out:"$(OUTDIR)\sapi5.dll" /implib:"$(OUTDIR)\sapi5.lib" /libpath:".\lib\i386" 
DEF_FILE= \
	".\src\ttseng.def"
LINK32_OBJS= \
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
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\DECSTD97.OBJ" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
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
	"$(INTDIR)\nasalf1x.obj" \
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
	"$(INTDIR)\phprint.obj" \
	"$(INTDIR)\PIPE.OBJ" \
	"$(INTDIR)\playaud.obj" \
	"$(INTDIR)\PLAYTONE.OBJ" \
	"$(INTDIR)\sapiiont.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\ttseng.obj" \
	"$(INTDIR)\ttsengobj.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ" \
	".\build\uk\release\ttseng.res"

"$(OUTDIR)\sapi5.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"

OUTDIR=.\build\uk\debug
INTDIR=.\build\uk\debug\link
# Begin Custom Macros
OutDir=.\build\uk\debug
# End Custom Macros

ALL : "$(OUTDIR)\sapi5.dll" "$(OUTDIR)\ttseng.tlb"


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
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\DECSTD97.OBJ"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\inithl.obj"
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
	-@erase "$(INTDIR)\nasalf1x.obj"
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
	-@erase "$(INTDIR)\phprint.obj"
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\playaud.obj"
	-@erase "$(INTDIR)\PLAYTONE.OBJ"
	-@erase "$(INTDIR)\sapiiont.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\ttseng.obj"
	-@erase "$(INTDIR)\ttsengobj.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\sapi5.dll"
	-@erase "$(OUTDIR)\sapi5.exp"
	-@erase "$(OUTDIR)\sapi5.ilk"
	-@erase "$(OUTDIR)\sapi5.lib"
	-@erase "$(OUTDIR)\sapi5.pdb"
	-@erase ".\build\la\debug\ttseng.res"
	-@erase ".\build\uk\debug\ttseng.tlb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I "..\dapi\src\api" /I "..\dapi\src\acna" /I "..\dapi\src\cmd" /I "..\dapi\src\lts" /I "..\dapi\src\ph" /I "..\dapi\src\vtm" /I "..\dapi\src\kernel" /I "..\dapi\src\nt" /I "..\dapi\src\include" /I "..\dapi\src\protos" /I "..\dapi\src\hlsyn" /I ".." /I ".\include" /I ".\src" /D "_DEBUG" /D "PRINTFDEBUG" /D "ENGLISH_UK" /D "ENGLISH" /D "SAPI5DECTALK" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SLOWTALK" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /I ".\idl" /D "_DEBUG" /D "ENGLISH_UK" /win32 
RSC_PROJ=/l 0x809 /fo".\build\la\debug/ttseng.res" /d "_DEBUG" /d "ENGLISH_UK" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\sapi5.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /version:5.0 /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\sapi5.pdb" /debug /debugtype:both /machine:IX86 /def:".\src\ttseng.def" /out:"$(OUTDIR)\sapi5.dll" /implib:"$(OUTDIR)\sapi5.lib" /pdbtype:sept /libpath:".\lib\i386" 
DEF_FILE= \
	".\src\ttseng.def"
LINK32_OBJS= \
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
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\DECSTD97.OBJ" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
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
	"$(INTDIR)\nasalf1x.obj" \
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
	"$(INTDIR)\phprint.obj" \
	"$(INTDIR)\PIPE.OBJ" \
	"$(INTDIR)\playaud.obj" \
	"$(INTDIR)\PLAYTONE.OBJ" \
	"$(INTDIR)\sapiiont.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\ttseng.obj" \
	"$(INTDIR)\ttsengobj.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ" \
	".\build\la\debug\ttseng.res"

"$(OUTDIR)\sapi5.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug French"

OUTDIR=.\build\fr\debug
INTDIR=.\build\fr\debug\link
# Begin Custom Macros
OutDir=.\build\fr\debug
# End Custom Macros

ALL : "$(OUTDIR)\sapi5.dll" "$(OUTDIR)\ttseng.tlb"


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
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\DECSTD97.OBJ"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\inithl.obj"
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
	-@erase "$(INTDIR)\nasalf1x.obj"
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
	-@erase "$(INTDIR)\phprint.obj"
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\playaud.obj"
	-@erase "$(INTDIR)\PLAYTONE.OBJ"
	-@erase "$(INTDIR)\sapiiont.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\ttseng.obj"
	-@erase "$(INTDIR)\ttsengobj.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\sapi5.dll"
	-@erase "$(OUTDIR)\sapi5.exp"
	-@erase "$(OUTDIR)\sapi5.ilk"
	-@erase "$(OUTDIR)\sapi5.lib"
	-@erase "$(OUTDIR)\sapi5.pdb"
	-@erase ".\build\fr\debug\ttseng.res"
	-@erase ".\build\fr\debug\ttseng.tlb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I "..\dapi\src\api" /I "..\dapi\src\acna" /I "..\dapi\src\cmd" /I "..\dapi\src\lts" /I "..\dapi\src\ph" /I "..\dapi\src\vtm" /I "..\dapi\src\kernel" /I "..\dapi\src\nt" /I "..\dapi\src\include" /I "..\dapi\src\protos" /I "..\dapi\src\hlsyn" /I ".." /I ".\include" /I ".\src" /D "_DEBUG" /D "PRINTFDEBUG" /D "FRENCH" /D "SAPI5DECTALK" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SLOWTALK" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /I ".\idl" /D "_DEBUG" /D "FRENCH" /win32 
RSC_PROJ=/l 0x40c /fo".\build\fr\debug/ttseng.res" /d "_DEBUG" /d "FRENCH" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\sapi5.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /version:5.0 /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\sapi5.pdb" /debug /debugtype:both /machine:IX86 /def:".\src\ttseng.def" /out:"$(OUTDIR)\sapi5.dll" /implib:"$(OUTDIR)\sapi5.lib" /pdbtype:sept /libpath:".\lib\i386" 
DEF_FILE= \
	".\src\ttseng.def"
LINK32_OBJS= \
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
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\DECSTD97.OBJ" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
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
	"$(INTDIR)\nasalf1x.obj" \
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
	"$(INTDIR)\phprint.obj" \
	"$(INTDIR)\PIPE.OBJ" \
	"$(INTDIR)\playaud.obj" \
	"$(INTDIR)\PLAYTONE.OBJ" \
	"$(INTDIR)\sapiiont.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\ttseng.obj" \
	"$(INTDIR)\ttsengobj.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ" \
	".\build\fr\debug\ttseng.res"

"$(OUTDIR)\sapi5.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release French"

OUTDIR=.\build\fr\release
INTDIR=.\build\fr\release\link
# Begin Custom Macros
OutDir=.\build\fr\release
# End Custom Macros

ALL : "$(OUTDIR)\sapi5.dll" "$(OUTDIR)\ttseng.tlb"


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
	-@erase "$(INTDIR)\dbgwins.obj"
	-@erase "$(INTDIR)\DECSTD97.OBJ"
	-@erase "$(INTDIR)\hlframe.obj"
	-@erase "$(INTDIR)\inithl.obj"
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
	-@erase "$(INTDIR)\nasalf1x.obj"
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
	-@erase "$(INTDIR)\phprint.obj"
	-@erase "$(INTDIR)\PIPE.OBJ"
	-@erase "$(INTDIR)\playaud.obj"
	-@erase "$(INTDIR)\PLAYTONE.OBJ"
	-@erase "$(INTDIR)\sapiiont.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\ttseng.obj"
	-@erase "$(INTDIR)\ttsengobj.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\sapi5.dll"
	-@erase "$(OUTDIR)\sapi5.exp"
	-@erase "$(OUTDIR)\sapi5.lib"
	-@erase ".\build\fr\release\ttseng.res"
	-@erase ".\build\fr\release\ttseng.tlb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP_PROJ=/nologo /MD /W3 /GX /Ox /I "..\dapi\src\api" /I "..\dapi\src\acna" /I "..\dapi\src\cmd" /I "..\dapi\src\lts" /I "..\dapi\src\ph" /I "..\dapi\src\vtm" /I "..\dapi\src\kernel" /I "..\dapi\src\nt" /I "..\dapi\src\include" /I "..\dapi\src\protos" /I "..\dapi\src\hlsyn" /I ".." /I ".\src" /I ".\include" /D "NDEBUG" /D "FRENCH" /D "SAPI5DECTALK" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SLOWTALK" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /I ".\idl" /D "NDEBUG" /D "FRENCH" /win32 
RSC_PROJ=/l 0x40c /fo".\build\fr\release/ttseng.res" /d "NDEBUG" /d "FRENCH" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o".\..\build\dectalk\sp\release\dectalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /version:5.0 /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\sapi5.pdb" /machine:I386 /def:".\src\ttseng.def" /out:"$(OUTDIR)\sapi5.dll" /implib:"$(OUTDIR)\sapi5.lib" /libpath:".\lib\i386" 
DEF_FILE= \
	".\src\ttseng.def"
LINK32_OBJS= \
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
	"$(INTDIR)\dbgwins.obj" \
	"$(INTDIR)\DECSTD97.OBJ" \
	"$(INTDIR)\hlframe.obj" \
	"$(INTDIR)\inithl.obj" \
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
	"$(INTDIR)\nasalf1x.obj" \
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
	"$(INTDIR)\phprint.obj" \
	"$(INTDIR)\PIPE.OBJ" \
	"$(INTDIR)\playaud.obj" \
	"$(INTDIR)\PLAYTONE.OBJ" \
	"$(INTDIR)\sapiiont.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\ttseng.obj" \
	"$(INTDIR)\ttsengobj.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ" \
	".\build\fr\release\ttseng.res"

"$(OUTDIR)\sapi5.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 

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


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("sapi5.dep")
!INCLUDE "sapi5.dep"
!ELSE 
!MESSAGE Warning: cannot find "sapi5.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "Sapi5 - Win32 Release" || "$(CFG)" == "Sapi5 - Win32 Debug" || "$(CFG)" == "Sapi5 - Win32 Release Spanish" || "$(CFG)" == "Sapi5 - Win32 Release German" || "$(CFG)" == "Sapi5 - Win32 Release Latin American" || "$(CFG)" == "Sapi5 - Win32 Debug Spanish" || "$(CFG)" == "Sapi5 - Win32 Debug German" || "$(CFG)" == "Sapi5 - Win32 Debug Latin American" || "$(CFG)" == "Sapi5 - Win32 Release United Kingdom" || "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom" || "$(CFG)" == "Sapi5 - Win32 Debug French" || "$(CFG)" == "Sapi5 - Win32 Release French"
SOURCE=..\dapi\src\hlsyn\acxf1c.c

"$(INTDIR)\acxf1c.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\hlsyn\brent.c

"$(INTDIR)\brent.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\hlsyn\circuit.c

"$(INTDIR)\circuit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Cmd\cm_char.c

"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Cmd\cm_cmd.c

"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Cmd\cm_copt.c

"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Cmd\cm_main.c

"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Cmd\cm_pars.c

"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Cmd\cm_phon.c

"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Cmd\cm_text.c

"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Cmd\cm_util.c

"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Cmd\Cmd_init.c

"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Cmd\cmd_wav.c

"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\API\CRYPT2.C

"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Nt\dbgwins.c

"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\api\DECSTD97.C

"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\hlsyn\hlframe.c

"$(INTDIR)\hlframe.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\hlsyn\inithl.c

"$(INTDIR)\inithl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Lts\loaddict.c

"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\hlsyn\log10table.c

"$(INTDIR)\log10table.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Lts\ls_chari.c

"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Lts\ls_dict.c

"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Lts\ls_homo.c

"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Lts\ls_math.c

"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Lts\ls_proc.c

"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Lts\ls_spel.c

"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Lts\ls_speli.c

"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Lts\ls_suff.c

"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Lts\ls_suffi.c

"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Lts\lsa_adju.c

"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Lts\lsa_coni.c

"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Lts\lsa_fr.c

"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Lts\lsa_gr.c

"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Lts\lsa_ir.c

"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Lts\lsa_it.c

"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Lts\lsa_ja.c

"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Lts\lsa_rtbi.c

"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Lts\lsa_rule.c

"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Lts\lsa_sl.c

"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Lts\lsa_sp.c

"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Lts\lsa_task.c

"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Lts\lsa_us.c

"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Lts\lsa_util.c

"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Lts\lsw_main.c

"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\NT\mmalloc.c

"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\hlsyn\nasalf1x.c

"$(INTDIR)\nasalf1x.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\NT\opthread.c

"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Cmd\par_ambi.c

"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Cmd\Par_char.c

"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Cmd\Par_dict.c

"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Cmd\Par_pars.c

"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Cmd\par_rule.c

"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Ph\ph_aloph.c

"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Ph\ph_claus.c

"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Ph\ph_draw.c

"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Ph\ph_drwt0.c

"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Ph\ph_inton.c

"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Ph\ph_main.c

"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Ph\ph_romi.c

"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Ph\ph_setar.c

"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Ph\ph_sort.c

"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Ph\ph_syl.c

"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Ph\ph_syntx.c

"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Ph\ph_task.c

"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Ph\ph_timng.c

"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Ph\ph_vdefi.c

"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Ph\ph_vset.c

"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Ph\phinit.c

"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Ph\phlog.c

"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\PH\phprint.c

"$(INTDIR)\phprint.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\nt\PIPE.C

"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\NT\playaud.c

"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\vtm\PLAYTONE.C

"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\src\sapiiont.cpp

"$(INTDIR)\sapiiont.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\kernel\SERVICES.C

"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\nt\SPC.C

"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\hlsyn\sqrttable.c

"$(INTDIR)\sqrttable.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\src\stdafx.cpp

"$(INTDIR)\stdafx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\vtm\SYNC.C

"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\api\ttsapi.c

"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\src\ttseng.cpp

"$(INTDIR)\ttseng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\src\ttseng.idl

!IF  "$(CFG)" == "Sapi5 - Win32 Release"

MTL_SWITCHES=/nologo /I ".\idl" /D "NDEBUG" /D "ENGLISH_US" /tlb "$(OUTDIR)\ttseng.tlb" /win32 

".\build\us\release\ttseng.tlb" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"

MTL_SWITCHES=/nologo /I ".\idl" /D "_DEBUG" /D "ENGLISH_US" /tlb "$(OUTDIR)\ttseng.tlb" /win32 

".\build\us\debug\ttseng.tlb" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"

MTL_SWITCHES=/nologo /I ".\idl" /D "NDEBUG" /D "SPANISH_SP" /tlb "$(OUTDIR)\ttseng.tlb" /win32 

".\build\sp\release\ttseng.tlb" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"

MTL_SWITCHES=/nologo /I ".\idl" /D "NDEBUG" /D "GERMAN" /tlb "$(OUTDIR)\ttseng.tlb" /win32 

".\build\gr\release\ttseng.tlb" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"

MTL_SWITCHES=/nologo /I ".\idl" /D "NDEBUG" /D "SPANISH_LA" /tlb "$(OUTDIR)\ttseng.tlb" /win32 

".\build\la\release\ttseng.tlb" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"

MTL_SWITCHES=/nologo /I ".\idl" /D "_DEBUG" /D "SPANISH_SP" /tlb "$(OUTDIR)\ttseng.tlb" /win32 

".\build\sp\debug\ttseng.tlb" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"

MTL_SWITCHES=/nologo /I ".\idl" /D "_DEBUG" /D "GERMAN" /tlb "$(OUTDIR)\ttseng.tlb" /win32 

".\build\gr\debug\ttseng.tlb" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"

MTL_SWITCHES=/nologo /I ".\idl" /D "_DEBUG" /D "SPANISH_LA" /tlb "$(OUTDIR)\ttseng.tlb" /win32 

".\build\la\debug\ttseng.tlb" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"

MTL_SWITCHES=/nologo /I ".\idl" /D "NDEBUG" /D "ENGLISH_UK" /tlb "$(OUTDIR)\ttseng.tlb" /win32 

".\build\uk\release\ttseng.tlb" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"

MTL_SWITCHES=/nologo /I ".\idl" /D "_DEBUG" /D "ENGLISH_UK" /tlb "$(OUTDIR)\ttseng.tlb" /win32 

".\build\uk\debug\ttseng.tlb" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug French"

MTL_SWITCHES=/nologo /I ".\idl" /D "_DEBUG" /D "FRENCH" /tlb "$(OUTDIR)\ttseng.tlb" /win32 

".\build\fr\debug\ttseng.tlb" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release French"

MTL_SWITCHES=/nologo /I ".\idl" /D "NDEBUG" /D "FRENCH" /tlb "$(OUTDIR)\ttseng.tlb" /win32 

".\build\fr\release\ttseng.tlb" : $(SOURCE) "$(INTDIR)"
	$(MTL) @<<
  $(MTL_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\src\ttseng.rc

!IF  "$(CFG)" == "Sapi5 - Win32 Release"


".\build\us\release\ttseng.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo".\build\us\release/ttseng.res" /i "src" /d "NDEBUG" /d "ENGLISH_US" $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug"


".\build\us\debug\ttseng.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo".\build\us\debug/ttseng.res" /i "src" /d "_DEBUG" /d "ENGLISH_US" $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Spanish"


".\build\sp\release\ttseng.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x40a /fo".\build\sp\release/ttseng.res" /i "src" /d "NDEBUG" /d "SPANISH_SP" $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release German"


".\build\gr\release\ttseng.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x407 /fo".\build\gr\release/ttseng.res" /i "src" /d "NDEBUG" /d "GERMAN" $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release Latin American"


".\build\la\release\ttseng.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x40a /fo".\build\la\release/ttseng.res" /i "src" /d "NDEBUG" /d "SPANISH_LA" $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Spanish"


".\build\sp\debug\ttseng.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x40a /fo".\build\sp\debug/ttseng.res" /i "src" /d "_DEBUG" /d "SPANISH_SP" $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug German"


".\build\gr\debug\ttseng.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x407 /fo".\build\gr\debug/ttseng.res" /i "src" /d "_DEBUG" /d "GERMAN" $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug Latin American"


".\build\la\debug\ttseng.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x40a /fo".\build\la\debug/ttseng.res" /i "src" /d "_DEBUG" /d "SPANISH_LA" $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release United Kingdom"


".\build\uk\release\ttseng.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x809 /fo".\build\uk\release/ttseng.res" /i "src" /d "NDEBUG" /d "ENGLISH_UK" $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug United Kingdom"


".\build\la\debug\ttseng.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x809 /fo".\build\la\debug/ttseng.res" /i "src" /d "_DEBUG" /d "ENGLISH_UK" $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Debug French"


".\build\fr\debug\ttseng.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x40c /fo".\build\fr\debug/ttseng.res" /i "src" /d "_DEBUG" /d "FRENCH" $(SOURCE)


!ELSEIF  "$(CFG)" == "Sapi5 - Win32 Release French"


".\build\fr\release\ttseng.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x40c /fo".\build\fr\release/ttseng.res" /i "src" /d "NDEBUG" /d "FRENCH" $(SOURCE)


!ENDIF 

SOURCE=.\src\ttsengobj.cpp

"$(INTDIR)\ttsengobj.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\kernel\USA_INIT.C

"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\Vtm\vtm.c

"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\dapi\src\vtm\VTMIONT.C

"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)



!ENDIF 

