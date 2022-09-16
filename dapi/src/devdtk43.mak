# Microsoft Developer Studio Generated NMAKE File, Based on devdtk43.dsp
!IF "$(CFG)" == ""
CFG=devdtk43 - Win32 Debug NWS_LA
!MESSAGE No configuration specified. Defaulting to devdtk43 - Win32 Debug NWS_LA.
!ENDIF 

!IF "$(CFG)" != "devdtk43 - Win32 Release" && "$(CFG)" != "devdtk43 - Win32 Debug" && "$(CFG)" != "devdtk43 - Win32 Release Spanish" && "$(CFG)" != "devdtk43 - Win32 Release German" && "$(CFG)" != "devdtk43 - Win32 Release Latin American" && "$(CFG)" != "devdtk43 - Win32 Debug Spanish" && "$(CFG)" != "devdtk43 - Win32 Debug German" && "$(CFG)" != "devdtk43 - Win32 Debug Latin American" && "$(CFG)" != "devdtk43 - Win32 Debug DIGITAL API" && "$(CFG)" != "devdtk43 - Win32 Release DIGITAL API" && "$(CFG)" != "devdtk43 - Win32 ALPHA Release" && "$(CFG)" != "devdtk43 - Win32 ALPHA Debug" && "$(CFG)" != "devdtk43 - Win32 ALPHA Release Spanish" && "$(CFG)" != "devdtk43 - Win32 ALPHA Release German" && "$(CFG)" != "devdtk43 - Win32 ALPHA Release Latin American" && "$(CFG)" != "devdtk43 - Win32 ALPHA Debug Spanish" && "$(CFG)" != "devdtk43 - Win32 ALPHA Debug German" && "$(CFG)" != "devdtk43 - Win32 ALPHA Debug Latin American" && "$(CFG)" != "devdtk43 - Win32 Release Access32" && "$(CFG)" != "devdtk43 - Win32 Release Access32 Spanish" && "$(CFG)" != "devdtk43 - Win32 Release Access32 German" && "$(CFG)" != "devdtk43 - Win32 Release Access32 Latin American" && "$(CFG)" !=\
 "devdtk43 - Win32 Debug Access32" && "$(CFG)" != "devdtk43 - Win32 Debug Access32 Spanish" && "$(CFG)" != "devdtk43 - Win32 Debug Access32 German" && "$(CFG)" != "devdtk43 - Win32 Debug Access32 Latin American" && "$(CFG)" != "devdtk43 - Win32 ALPHA Debug Access32" && "$(CFG)" != "devdtk43 - Win32 ALPHA Debug Access32 Spanish" && "$(CFG)" != "devdtk43 - Win32 ALPHA Debug Access32 German" && "$(CFG)" != "devdtk43 - Win32 ALPHA Debug Access32 Latin American" && "$(CFG)" != "devdtk43 - Win32 ALPHA Release Access32" && "$(CFG)" != "devdtk43 - Win32 ALPHA Release Access32 Spanish" && "$(CFG)" != "devdtk43 - Win32 ALPHA Release Access32 German" && "$(CFG)" != "devdtk43 - Win32 ALPHA Release Access32 Latin American" && "$(CFG)" != "devdtk43 - Win32 Release United Kingdom" && "$(CFG)" != "devdtk43 - Win32 Debug United Kingdom" && "$(CFG)" != "devdtk43 - Win32 Release Access32 United Kingdom" && "$(CFG)" != "devdtk43 - Win32 Debug Access32 United Kingdom" && "$(CFG)" != "devdtk43 - Win32 ALPHA Release United Kingdom" && "$(CFG)" != "devdtk43 - Win32 ALPHA Debug United Kingdom" && "$(CFG)" != "devdtk43 - Win32 ALPHA Release Access32 United Kingdom" && "$(CFG)" !=\
 "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom" && "$(CFG)" != "devdtk43 - Win32 Debug NWS_US" && "$(CFG)" != "devdtk43 - Win32 Debug NWS_LA"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "devdtk43.mak" CFG="devdtk43 - Win32 Debug NWS_LA"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "devdtk43 - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Release Spanish" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Release German" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Release Latin American" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug Spanish" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug German" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug Latin American" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug DIGITAL API" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Release DIGITAL API" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 ALPHA Release" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 ALPHA Debug" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 ALPHA Release Spanish" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 ALPHA Release German" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 ALPHA Release Latin American" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 ALPHA Debug Spanish" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 ALPHA Debug German" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 ALPHA Debug Latin American" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Release Access32" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Release Access32 Spanish" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Release Access32 German" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Release Access32 Latin American" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug Access32" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug Access32 Spanish" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug Access32 German" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug Access32 Latin American" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 ALPHA Debug Access32" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 ALPHA Debug Access32 Spanish" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 ALPHA Debug Access32 German" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 ALPHA Debug Access32 Latin American" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 ALPHA Release Access32" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 ALPHA Release Access32 Spanish" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 ALPHA Release Access32 German" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 ALPHA Release Access32 Latin American" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Release United Kingdom" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug United Kingdom" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Release Access32 United Kingdom" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug Access32 United Kingdom" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 ALPHA Release United Kingdom" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 ALPHA Debug United Kingdom" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 ALPHA Release Access32 United Kingdom" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom" (based on "Win32 (ALPHA) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug NWS_US" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug NWS_LA" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "devdtk43 - Win32 Release"

OUTDIR=.\..\build\dectalk\us\release
INTDIR=.\..\build\dectalk\us\release\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\us\release
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


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
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dectalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dectalk.pdb" /machine:I386 /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
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
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"

OUTDIR=.\..\build\dectalk\us\debug
INTDIR=.\..\build\dectalk\us\debug\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\us\debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


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
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
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

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\devdtk43.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /debug /debugtype:both /machine:IX86 /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
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
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"

OUTDIR=.\..\build\dectalk\sp\release
INTDIR=.\..\build\dectalk\sp\release\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


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
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "SPANISH_SP" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dectalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dectalk.pdb" /machine:I386 /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
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
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"

OUTDIR=.\..\build\dectalk\gr\release
INTDIR=.\..\build\dectalk\gr\release\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


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
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "GERMAN" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /Zm200 /c 

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
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dectalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dectalk.pdb" /machine:I386 /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
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
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"

OUTDIR=.\..\build\dectalk\la\release
INTDIR=.\..\build\dectalk\la\release\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\la\release
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


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
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "SPANISH_LA" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dectalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dectalk.pdb" /machine:I386 /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
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
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"

OUTDIR=.\..\build\dectalk\sp\debug
INTDIR=.\..\build\dectalk\sp\debug\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\sp\debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


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
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
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

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "SPANISH" /D "SPANISH_SP" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\devdtk43.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /debug /debugtype:both /machine:IX86 /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
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
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"

OUTDIR=.\..\build\dectalk\gr\debug
INTDIR=.\..\build\dectalk\gr\debug\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\gr\debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


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
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
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

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "GERMAN" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /Zm200 /c 

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
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\devdtk43.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /debug /debugtype:both /machine:IX86 /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
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
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"

OUTDIR=.\..\build\dectalk\la\debug
INTDIR=.\..\build\dectalk\la\debug\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\la\debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


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
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
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

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "SPANISH" /D "SPANISH_LA" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\devdtk43.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /debug /debugtype:both /machine:IX86 /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
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
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"

OUTDIR=.\..\build\dectalk\multi\debug
INTDIR=.\..\build\dectalk\multi\debug\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\multi\debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


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
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
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

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "USE_CORE_DLL" /D "ACNA" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\devdtk43.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /debug /debugtype:both /machine:IX86 /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
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
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"

OUTDIR=.\..\build\dectalk\multi\release
INTDIR=.\..\build\dectalk\multi\release\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\multi\release
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


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
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /D "ENGLISH" /D "USE_CORE_DLL" /D "ACNA" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o".\..\build\dectalk\us\release\dectalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dectalk.pdb" /machine:I386 /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
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
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

OUTDIR=.\..\alpha\dectalk\us\release
INTDIR=.\..\alpha\dectalk\us\release\link
# Begin Custom Macros
OutDir=.\..\alpha\dectalk\us\release
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


CLEAN :
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /mktyplib203 /alpha 
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\devdtk43.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain" /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dectalk.pdb" /machine:ALPHA /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
LINK32_OBJS= \
	

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

OUTDIR=.\..\alpha\dectalk\us\debug
INTDIR=.\..\alpha\dectalk\us\debug\link
# Begin Custom Macros
OutDir=.\..\alpha\dectalk\us\debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


CLEAN :
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.ilk"
	-@erase "$(OUTDIR)\dectalk.lib"
	-@erase "$(OUTDIR)\dectalk.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /alpha 
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\devdtk43.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain" /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /debug /debugtype:both /machine:ALPHA /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
LINK32_OBJS= \
	

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

OUTDIR=.\..\alpha\dectalk\sp\release
INTDIR=.\..\alpha\dectalk\sp\release\link
# Begin Custom Macros
OutDir=.\..\alpha\dectalk\sp\release
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


CLEAN :
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dectalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=ole32.lib oleaut32.lib uuid.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain" /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dectalk.pdb" /machine:ALPHA /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
LINK32_OBJS= \
	

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

OUTDIR=.\..\alpha\dectalk\gr\release
INTDIR=.\..\alpha\dectalk\gr\release\link
# Begin Custom Macros
OutDir=.\..\alpha\dectalk\gr\release
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


CLEAN :
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dectalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=ole32.lib oleaut32.lib uuid.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain" /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dectalk.pdb" /machine:ALPHA /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
LINK32_OBJS= \
	

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

OUTDIR=.\..\alpha\dectalk\la\release
INTDIR=.\..\alpha\dectalk\la\release\link
# Begin Custom Macros
OutDir=.\..\alpha\dectalk\la\release
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


CLEAN :
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dectalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=ole32.lib oleaut32.lib uuid.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain" /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dectalk.pdb" /machine:ALPHA /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
LINK32_OBJS= \
	

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

OUTDIR=.\..\alpha\dectalk\sp\debug
INTDIR=.\..\alpha\dectalk\sp\debug\link
# Begin Custom Macros
OutDir=.\..\alpha\dectalk\sp\debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


CLEAN :
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.ilk"
	-@erase "$(OUTDIR)\dectalk.lib"
	-@erase "$(OUTDIR)\dectalk.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\devdtk43.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=ole32.lib oleaut32.lib uuid.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain" /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /debug /debugtype:both /machine:ALPHA /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
LINK32_OBJS= \
	

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

OUTDIR=.\..\alpha\dectalk\gr\debug
INTDIR=.\..\alpha\dectalk\gr\debug\link
# Begin Custom Macros
OutDir=.\..\alpha\dectalk\gr\debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


CLEAN :
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.ilk"
	-@erase "$(OUTDIR)\dectalk.lib"
	-@erase "$(OUTDIR)\dectalk.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\devdtk43.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=ole32.lib oleaut32.lib uuid.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain" /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /debug /debugtype:both /machine:ALPHA /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
LINK32_OBJS= \
	

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

OUTDIR=.\..\alpha\dectalk\la\debug
INTDIR=.\..\alpha\dectalk\la\debug\link
# Begin Custom Macros
OutDir=.\..\alpha\dectalk\la\debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


CLEAN :
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.ilk"
	-@erase "$(OUTDIR)\dectalk.lib"
	-@erase "$(OUTDIR)\dectalk.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\devdtk43.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=ole32.lib oleaut32.lib uuid.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain" /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /debug /debugtype:both /machine:ALPHA /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
LINK32_OBJS= \
	

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"

OUTDIR=.\..\build\dectalk\us\access32
INTDIR=.\..\build\dectalk\us\access32\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\us\access32
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


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
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /D "ACNA" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dectalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dectalk.pdb" /machine:I386 /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
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
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"

OUTDIR=.\..\build\dectalk\sp\access32
INTDIR=.\..\build\dectalk\sp\access32\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\sp\access32
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


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
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dectalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dectalk.pdb" /machine:I386 /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
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
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"

OUTDIR=.\..\build\dectalk\gr\access32
INTDIR=.\..\build\dectalk\gr\access32\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\gr\access32
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


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
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "GERMAN" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /Zm200 /c 

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
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dectalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dectalk.pdb" /machine:I386 /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
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
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"

OUTDIR=.\..\build\dectalk\la\access32
INTDIR=.\..\build\dectalk\la\access32\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\la\access32
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


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
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dectalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dectalk.pdb" /machine:I386 /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
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
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"

OUTDIR=.\..\build\dectalk\us\a32debug
INTDIR=.\..\build\dectalk\us\a32debug\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\us\a32debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


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
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
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

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "ENGLISH" /D "ENGLISH_US" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /D "ACNA" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\devdtk43.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /debug /debugtype:both /machine:IX86 /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
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
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"

OUTDIR=.\..\build\dectalk\sp\a32debug
INTDIR=.\..\build\dectalk\sp\a32debug\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\sp\a32debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


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
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
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

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\devdtk43.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /debug /debugtype:both /machine:IX86 /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
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
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"

OUTDIR=.\..\build\dectalk\gr\a32debug
INTDIR=.\..\build\dectalk\gr\a32debug\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\gr\a32debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


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
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
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

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "GERMAN" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /Zm200 /c 

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
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\devdtk43.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /debug /debugtype:both /machine:IX86 /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
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
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"

OUTDIR=.\..\build\dectalk\la\a32debug
INTDIR=.\..\build\dectalk\la\a32debug\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\la\a32debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


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
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
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

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\devdtk43.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /debug /debugtype:both /machine:IX86 /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
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
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

OUTDIR=.\..\alpha\dectalk\us\a32debug
INTDIR=.\..\alpha\dectalk\us\a32debug\link
# Begin Custom Macros
OutDir=.\..\alpha\dectalk\us\a32debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


CLEAN :
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.ilk"
	-@erase "$(OUTDIR)\dectalk.lib"
	-@erase "$(OUTDIR)\dectalk.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /alpha 
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\devdtk43.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain" /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /debug /debugtype:both /machine:ALPHA /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
LINK32_OBJS= \
	

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

OUTDIR=.\..\alpha\dectalk\sp\a32debug
INTDIR=.\..\alpha\dectalk\sp\a32debug\link
# Begin Custom Macros
OutDir=.\..\alpha\dectalk\sp\a32debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


CLEAN :
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.ilk"
	-@erase "$(OUTDIR)\dectalk.lib"
	-@erase "$(OUTDIR)\dectalk.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\devdtk43.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=ole32.lib oleaut32.lib uuid.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain" /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /debug /debugtype:both /machine:ALPHA /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
LINK32_OBJS= \
	

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

OUTDIR=.\..\alpha\dectalk\gr\a32debug
INTDIR=.\..\alpha\dectalk\gr\a32debug\link
# Begin Custom Macros
OutDir=.\..\alpha\dectalk\gr\a32debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


CLEAN :
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.ilk"
	-@erase "$(OUTDIR)\dectalk.lib"
	-@erase "$(OUTDIR)\dectalk.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\devdtk43.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=ole32.lib oleaut32.lib uuid.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain" /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /debug /debugtype:both /machine:ALPHA /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
LINK32_OBJS= \
	

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

OUTDIR=.\..\alpha\dectalk\la\a32debug
INTDIR=.\..\alpha\dectalk\la\a32debug\link
# Begin Custom Macros
OutDir=.\..\alpha\dectalk\la\a32debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


CLEAN :
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.ilk"
	-@erase "$(OUTDIR)\dectalk.lib"
	-@erase "$(OUTDIR)\dectalk.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\devdtk43.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=ole32.lib oleaut32.lib uuid.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain" /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /debug /debugtype:both /machine:ALPHA /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
LINK32_OBJS= \
	

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

OUTDIR=.\..\alpha\dectalk\us\access32
INTDIR=.\..\alpha\dectalk\us\access32\link
# Begin Custom Macros
OutDir=.\..\alpha\dectalk\us\access32
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


CLEAN :
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /mktyplib203 /alpha 
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\devdtk43.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain" /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dectalk.pdb" /machine:ALPHA /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
LINK32_OBJS= \
	

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

OUTDIR=.\..\alpha\dectalk\sp\access32
INTDIR=.\..\alpha\dectalk\sp\access32\link
# Begin Custom Macros
OutDir=.\..\alpha\dectalk\sp\access32
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


CLEAN :
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o".\..\alpha\dectalk\sp\release\dectalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=ole32.lib oleaut32.lib uuid.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain" /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dectalk.pdb" /machine:ALPHA /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
LINK32_OBJS= \
	

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

OUTDIR=.\..\alpha\dectalk\gr\access32
INTDIR=.\..\alpha\dectalk\gr\access32\link
# Begin Custom Macros
OutDir=.\..\alpha\dectalk\gr\access32
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


CLEAN :
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o".\..\alpha\dectalk\gr\release\dectalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=ole32.lib oleaut32.lib uuid.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain" /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dectalk.pdb" /machine:ALPHA /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
LINK32_OBJS= \
	

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

OUTDIR=.\..\alpha\dectalk\la\access32
INTDIR=.\..\alpha\dectalk\la\access32\link
# Begin Custom Macros
OutDir=.\..\alpha\dectalk\la\access32
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


CLEAN :
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o".\..\alpha\dectalk\la\release\dectalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=ole32.lib oleaut32.lib uuid.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain" /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dectalk.pdb" /machine:ALPHA /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
LINK32_OBJS= \
	

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"

OUTDIR=.\..\build\dectalk\uk\release
INTDIR=.\..\build\dectalk\uk\release\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


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
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "ENGLISH_UK" /D "ENGLISH" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dectalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dectalk.pdb" /machine:I386 /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
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
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"

OUTDIR=.\..\build\dectalk\uk\debug
INTDIR=.\..\build\dectalk\uk\debug\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\uk\debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


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
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
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

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "ENGLISH_UK" /D "ENGLISH" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\devdtk43.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /debug /debugtype:both /machine:IX86 /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
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
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"

OUTDIR=.\..\build\dectalk\uk\access32
INTDIR=.\..\build\dectalk\uk\access32\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\uk\access32
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


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
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vtm.obj"
	-@erase "$(INTDIR)\VTMIONT.OBJ"
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "ENGLISH_UK" /D "ENGLISH" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dectalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dectalk.pdb" /machine:I386 /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
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
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"

OUTDIR=.\..\build\dectalk\uk\a32debug
INTDIR=.\..\build\dectalk\uk\a32debug\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\uk\a32debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


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
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
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

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "PRINTFDEBUG" /D "ENGLISH" /D "ENGLISH_UK" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\devdtk43.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /debug /debugtype:both /machine:IX86 /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
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
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

OUTDIR=.\..\alpha\dectalk\uk\release
INTDIR=.\..\alpha\dectalk\uk\release\link
# Begin Custom Macros
OutDir=.\..\alpha\dectalk\uk\release
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


CLEAN :
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dectalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=ole32.lib oleaut32.lib uuid.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain" /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dectalk.pdb" /machine:ALPHA /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
LINK32_OBJS= \
	

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

OUTDIR=.\..\alpha\dectalk\uk\debug
INTDIR=.\..\alpha\dectalk\uk\debug\link
# Begin Custom Macros
OutDir=.\..\alpha\dectalk\uk\debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


CLEAN :
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.ilk"
	-@erase "$(OUTDIR)\dectalk.lib"
	-@erase "$(OUTDIR)\dectalk.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\devdtk43.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain" /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /debug /debugtype:both /machine:ALPHA /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
LINK32_OBJS= \
	

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

OUTDIR=.\..\alpha\dectalk\uk\access32
INTDIR=.\..\alpha\dectalk\uk\access32\link
# Begin Custom Macros
OutDir=.\..\alpha\dectalk\uk\access32
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


CLEAN :
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\dectalk.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=ole32.lib oleaut32.lib uuid.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain" /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\dectalk.pdb" /machine:ALPHA /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
LINK32_OBJS= \
	

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

OUTDIR=.\..\alpha\dectalk\uk\a32debug
INTDIR=.\..\alpha\dectalk\uk\a32debug\link
# Begin Custom Macros
OutDir=.\..\alpha\dectalk\uk\a32debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


CLEAN :
	-@erase "$(OUTDIR)\dectalk.dll"
	-@erase "$(OUTDIR)\dectalk.exp"
	-@erase "$(OUTDIR)\dectalk.ilk"
	-@erase "$(OUTDIR)\dectalk.lib"
	-@erase "$(OUTDIR)\dectalk.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\devdtk43.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=ole32.lib oleaut32.lib uuid.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain" /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /debug /debugtype:both /machine:ALPHA /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
LINK32_OBJS= \
	

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"

OUTDIR=.\..\build\dectalk\nws_us\debug
INTDIR=.\..\build\dectalk\nws_us\debug\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\nws_us\debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


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
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
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

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "NWSNOAA" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\devdtk43.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /debug /debugtype:both /machine:IX86 /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
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
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"

OUTDIR=.\..\build\dectalk\nws_la\debug
INTDIR=.\..\build\dectalk\nws_la\debug\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\nws_la\debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


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
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
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

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "NWSNOAA" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\devdtk43.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\dectalk.pdb" /debug /debugtype:both /machine:IX86 /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
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
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("devdtk43.dep")
!INCLUDE "devdtk43.dep"
!ELSE 
!MESSAGE Warning: cannot find "devdtk43.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "devdtk43 - Win32 Release" || "$(CFG)" == "devdtk43 - Win32 Debug" || "$(CFG)" == "devdtk43 - Win32 Release Spanish" || "$(CFG)" == "devdtk43 - Win32 Release German" || "$(CFG)" == "devdtk43 - Win32 Release Latin American" || "$(CFG)" == "devdtk43 - Win32 Debug Spanish" || "$(CFG)" == "devdtk43 - Win32 Debug German" || "$(CFG)" == "devdtk43 - Win32 Debug Latin American" || "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API" || "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API" || "$(CFG)" == "devdtk43 - Win32 ALPHA Release" || "$(CFG)" == "devdtk43 - Win32 ALPHA Debug" || "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish" || "$(CFG)" == "devdtk43 - Win32 ALPHA Release German" || "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American" || "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish" || "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German" || "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American" || "$(CFG)" == "devdtk43 - Win32 Release Access32" || "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish" || "$(CFG)" == "devdtk43 - Win32 Release Access32 German" || "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American" || "$(CFG)" ==\
 "devdtk43 - Win32 Debug Access32" || "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish" || "$(CFG)" == "devdtk43 - Win32 Debug Access32 German" || "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American" || "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32" || "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish" || "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German" || "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American" || "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32" || "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish" || "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German" || "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American" || "$(CFG)" == "devdtk43 - Win32 Release United Kingdom" || "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom" || "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom" || "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom" || "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom" || "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom" || "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom" || "$(CFG)" ==\
 "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom" || "$(CFG)" == "devdtk43 - Win32 Debug NWS_US" || "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"
SOURCE=.\Cmd\cm_char.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\cm_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Cmd\cm_cmd.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\cm_cmd.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Cmd\cm_copt.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\cm_copt.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Cmd\cm_main.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\cm_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Cmd\cm_pars.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\cm_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Cmd\cm_phon.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\cm_phon.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Cmd\cm_text.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\cm_text.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Cmd\cm_util.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\cm_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Cmd\Cmd_init.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\Cmd_init.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Cmd\cmd_wav.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\cmd_wav.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\API\CRYPT2.C

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\CRYPT2.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Nt\dbgwins.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\api\DECSTD97.C

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\loaddict.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\loaddict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\ls_chari.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\ls_chari.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\ls_dict.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\ls_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\ls_homo.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\ls_homo.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\ls_math.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\ls_math.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\ls_proc.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\ls_proc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\ls_spel.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\ls_spel.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\ls_speli.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\ls_speli.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\ls_suff.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\ls_suff.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\ls_suffi.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\ls_suffi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_adju.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_coni.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\lsa_coni.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_fr.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\lsa_fr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_gr.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\lsa_gr.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_ir.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\lsa_ir.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_it.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\lsa_it.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_ja.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\lsa_ja.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_rtbi.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\lsa_rtbi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_rule.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\lsa_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_sl.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\lsa_sl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_sp.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\lsa_sp.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_task.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\lsa_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_us.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\lsa_us.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsa_util.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\lsa_util.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Lts\lsw_main.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\lsw_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\NT\mmalloc.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\NT\opthread.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Cmd\par_ambi.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Cmd\Par_char.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Cmd\Par_dict.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Cmd\Par_pars.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Cmd\par_rule.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\par_rule.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Ph\ph_aloph.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\ph_aloph.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Ph\ph_claus.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\ph_claus.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Ph\ph_draw.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\ph_draw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Ph\ph_drwt0.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\ph_drwt0.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Ph\ph_inton.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\ph_inton.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Ph\ph_main.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\ph_main.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Ph\ph_romi.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\ph_romi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Ph\ph_setar.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\ph_setar.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Ph\ph_sort.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\ph_sort.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Ph\ph_syl.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\ph_syl.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Ph\ph_syntx.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\ph_syntx.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Ph\ph_task.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\ph_task.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Ph\ph_timng.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\ph_timng.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Ph\ph_vdefi.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\ph_vdefi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Ph\ph_vset.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\ph_vset.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Ph\phinit.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\phinit.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Ph\phlog.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\phlog.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\nt\PIPE.C

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\NT\playaud.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\vtm\PLAYTONE.C

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\kernel\SERVICES.C

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\nt\SPC.C

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\vtm\SYNC.C

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\api\ttsapi.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\kernel\USA_INIT.C

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Vtm\vtm.c

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\vtm\VTMIONT.C

!IF  "$(CFG)" == "devdtk43 - Win32 Release"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Spanish"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release German"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Latin American"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Spanish"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug German"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Latin American"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 German"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 German"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Spanish"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 German"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 Latin American"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release United Kingdom"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Release Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 ALPHA Debug Access32 United Kingdom"

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_US"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA"


"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 


!ENDIF 

