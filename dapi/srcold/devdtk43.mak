# Microsoft Developer Studio Generated NMAKE File, Based on devdtk43.dsp
!IF "$(CFG)" == ""
CFG=devdtk43 - Win32 Debug Fuddish
!MESSAGE No configuration specified. Defaulting to devdtk43 - Win32 Debug Fuddish.
!ENDIF 

!IF "$(CFG)" != "devdtk43 - Win32 Release" && "$(CFG)" != "devdtk43 - Win32 Debug" && "$(CFG)" != "devdtk43 - Win32 Release Spanish" && "$(CFG)" != "devdtk43 - Win32 Release German" && "$(CFG)" != "devdtk43 - Win32 Release Latin American" && "$(CFG)" != "devdtk43 - Win32 Debug Spanish" && "$(CFG)" != "devdtk43 - Win32 Debug German" && "$(CFG)" != "devdtk43 - Win32 Debug Latin American" && "$(CFG)" != "devdtk43 - Win32 Debug DIGITAL API" && "$(CFG)" != "devdtk43 - Win32 Release DIGITAL API" && "$(CFG)" != "devdtk43 - Win32 Release Access32" && "$(CFG)" != "devdtk43 - Win32 Release Access32 Spanish" && "$(CFG)" != "devdtk43 - Win32 Release Access32 German" && "$(CFG)" != "devdtk43 - Win32 Release Access32 Latin American" && "$(CFG)" != "devdtk43 - Win32 Debug Access32" && "$(CFG)" != "devdtk43 - Win32 Debug Access32 Spanish" && "$(CFG)" != "devdtk43 - Win32 Debug Access32 German" && "$(CFG)" != "devdtk43 - Win32 Debug Access32 Latin American" && "$(CFG)" != "devdtk43 - Win32 Release United Kingdom" && "$(CFG)" != "devdtk43 - Win32 Debug United Kingdom" && "$(CFG)" != "devdtk43 - Win32 Release Access32 United Kingdom" && "$(CFG)" != "devdtk43 - Win32 Debug Access32 United Kingdom" &&\
 "$(CFG)" != "devdtk43 - Win32 Debug NWS_US" && "$(CFG)" != "devdtk43 - Win32 Debug NWS_LA" && "$(CFG)" != "devdtk43 - Win32 Debug French" && "$(CFG)" != "devdtk43 - Win32 Release French" && "$(CFG)" != "devdtk43 - Win32 Debug Access32 French" && "$(CFG)" != "devdtk43 - Win32 Release Access32 French" && "$(CFG)" != "devdtk43 - Win32 Debug Fuddish"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "devdtk43.mak" CFG="devdtk43 - Win32 Debug Fuddish"
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
!MESSAGE "devdtk43 - Win32 Release Access32" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Release Access32 Spanish" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Release Access32 German" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Release Access32 Latin American" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug Access32" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug Access32 Spanish" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug Access32 German" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug Access32 Latin American" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Release United Kingdom" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug United Kingdom" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Release Access32 United Kingdom" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug Access32 United Kingdom" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug NWS_US" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug NWS_LA" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug French" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Release French" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug Access32 French" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Release Access32 French" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "devdtk43 - Win32 Debug Fuddish" (based on "Win32 (x86) Dynamic-Link Library")
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
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\voice.obj"
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
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /base:"0x1c000000" /version:4.30 /entry:"LibMain@12" /subsystem:windows /dll /pdb:none /machine:I386 /def:".\DECTALK.DEF" /out:"$(OUTDIR)\dectalk.dll" /implib:"$(OUTDIR)\dectalk.lib" 
DEF_FILE= \
	".\DECTALK.DEF"
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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\voice.obj" \
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
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\voice.obj"
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
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD WARNINGS /c 

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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\voice.obj" \
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
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\voice.obj"
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
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "SPANISH_SP" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\voice.obj" \
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
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\voice.obj"
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
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "GERMAN" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /Zm200 /c 

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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\voice.obj" \
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
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\voice.obj"
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
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "SPANISH_LA" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\voice.obj" \
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
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\voice.obj"
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
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "SPANISH" /D "SPANISH_SP" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\voice.obj" \
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
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\voice.obj"
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
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "GERMAN" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /Zm200 /c 

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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\voice.obj" \
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
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\voice.obj"
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
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "SPANISH" /D "SPANISH_LA" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\voice.obj" \
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
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\voice.obj"
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
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "USE_CORE_DLL" /D "ACNA" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\voice.obj" \
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
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\voice.obj"
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
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /D "ENGLISH" /D "USE_CORE_DLL" /D "ACNA" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\voice.obj" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ"

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
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\voice.obj"
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
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "NDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /D "ACNA" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\voice.obj" \
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
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\voice.obj"
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
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "NDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\voice.obj" \
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
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\voice.obj"
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
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "NDEBUG" /D "GERMAN" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /Zm200 /c 

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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\voice.obj" \
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
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\voice.obj"
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
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "NDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\voice.obj" \
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
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\voice.obj"
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
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "_DEBUG" /D "PRINTFDEBUG" /D "ENGLISH" /D "ENGLISH_US" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /D "ACNA" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\voice.obj" \
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
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\voice.obj"
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
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "_DEBUG" /D "PRINTFDEBUG" /D "SPANISH" /D "SPANISH_SP" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\voice.obj" \
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
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\voice.obj"
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
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "_DEBUG" /D "PRINTFDEBUG" /D "GERMAN" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /Zm200 /c 

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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\voice.obj" \
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
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\voice.obj"
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
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "_DEBUG" /D "PRINTFDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\voice.obj" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ"

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
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\voice.obj"
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
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "ENGLISH_UK" /D "ENGLISH" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\voice.obj" \
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
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\voice.obj"
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
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "ENGLISH_UK" /D "ENGLISH" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\voice.obj" \
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
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\voice.obj"
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
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "NDEBUG" /D "ENGLISH_UK" /D "ENGLISH" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\voice.obj" \
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
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\voice.obj"
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
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "_DEBUG" /D "PRINTFDEBUG" /D "ENGLISH" /D "ENGLISH_UK" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\voice.obj" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ"

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
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\voice.obj"
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
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "NWSNOAA" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\voice.obj" \
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
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\voice.obj"
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
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "SPANISH" /D "SPANISH_LA" /D "NWSNOAA" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\voice.obj" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug French"

OUTDIR=.\..\build\dectalk\fr\debug
INTDIR=.\..\build\dectalk\fr\debug\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\fr\debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


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
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\voice.obj"
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
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "FRENCH" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\voice.obj" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release French"

OUTDIR=.\..\build\dectalk\fr\release
INTDIR=.\..\build\dectalk\fr\release\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\fr\release
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


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
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\voice.obj"
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
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "FRENCH" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\voice.obj" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Access32 French"

OUTDIR=.\..\build\dectalk\fr\a32debug
INTDIR=.\..\build\dectalk\fr\a32debug\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\fr\a32debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


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
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\voice.obj"
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
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "_DEBUG" /D "PRINTFDEBUG" /D "FRENCH" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\voice.obj" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Release Access32 French"

OUTDIR=.\..\build\dectalk\fr\access32
INTDIR=.\..\build\dectalk\fr\access32\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\fr\access32
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


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
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\voice.obj"
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
CPP_PROJ=/nologo /MD /W3 /GX /Ox /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "NDEBUG" /D "FRENCH" /D "i386" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "TYPING_MODE" /D "SLOWTALK" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\voice.obj" \
	"$(INTDIR)\vtm.obj" \
	"$(INTDIR)\VTMIONT.OBJ"

"$(OUTDIR)\dectalk.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "devdtk43 - Win32 Debug Fuddish"

OUTDIR=.\..\build\dectalk\ef\debug
INTDIR=.\..\build\dectalk\ef\debug\link
# Begin Custom Macros
OutDir=.\..\build\dectalk\ef\debug
# End Custom Macros

ALL : "$(OUTDIR)\dectalk.dll"


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
	-@erase "$(INTDIR)\reson.obj"
	-@erase "$(INTDIR)\sample.obj"
	-@erase "$(INTDIR)\SERVICES.OBJ"
	-@erase "$(INTDIR)\SPC.OBJ"
	-@erase "$(INTDIR)\sqrttable.obj"
	-@erase "$(INTDIR)\SYNC.OBJ"
	-@erase "$(INTDIR)\ttsapi.obj"
	-@erase "$(INTDIR)\USA_INIT.OBJ"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\voice.obj"
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
CPP_PROJ=/nologo /MDd /W3 /GX /ZI /Od /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /I "..\hlsyn" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /D "FUDD" /Fp"$(INTDIR)\devdtk43.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
	"$(INTDIR)\reson.obj" \
	"$(INTDIR)\sample.obj" \
	"$(INTDIR)\SERVICES.OBJ" \
	"$(INTDIR)\SPC.OBJ" \
	"$(INTDIR)\sqrttable.obj" \
	"$(INTDIR)\SYNC.OBJ" \
	"$(INTDIR)\ttsapi.obj" \
	"$(INTDIR)\USA_INIT.OBJ" \
	"$(INTDIR)\voice.obj" \
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


!IF "$(CFG)" == "devdtk43 - Win32 Release" || "$(CFG)" == "devdtk43 - Win32 Debug" || "$(CFG)" == "devdtk43 - Win32 Release Spanish" || "$(CFG)" == "devdtk43 - Win32 Release German" || "$(CFG)" == "devdtk43 - Win32 Release Latin American" || "$(CFG)" == "devdtk43 - Win32 Debug Spanish" || "$(CFG)" == "devdtk43 - Win32 Debug German" || "$(CFG)" == "devdtk43 - Win32 Debug Latin American" || "$(CFG)" == "devdtk43 - Win32 Debug DIGITAL API" || "$(CFG)" == "devdtk43 - Win32 Release DIGITAL API" || "$(CFG)" == "devdtk43 - Win32 Release Access32" || "$(CFG)" == "devdtk43 - Win32 Release Access32 Spanish" || "$(CFG)" == "devdtk43 - Win32 Release Access32 German" || "$(CFG)" == "devdtk43 - Win32 Release Access32 Latin American" || "$(CFG)" == "devdtk43 - Win32 Debug Access32" || "$(CFG)" == "devdtk43 - Win32 Debug Access32 Spanish" || "$(CFG)" == "devdtk43 - Win32 Debug Access32 German" || "$(CFG)" == "devdtk43 - Win32 Debug Access32 Latin American" || "$(CFG)" == "devdtk43 - Win32 Release United Kingdom" || "$(CFG)" == "devdtk43 - Win32 Debug United Kingdom" || "$(CFG)" == "devdtk43 - Win32 Release Access32 United Kingdom" || "$(CFG)" == "devdtk43 - Win32 Debug Access32 United Kingdom" ||\
 "$(CFG)" == "devdtk43 - Win32 Debug NWS_US" || "$(CFG)" == "devdtk43 - Win32 Debug NWS_LA" || "$(CFG)" == "devdtk43 - Win32 Debug French" || "$(CFG)" == "devdtk43 - Win32 Release French" || "$(CFG)" == "devdtk43 - Win32 Debug Access32 French" || "$(CFG)" == "devdtk43 - Win32 Release Access32 French" || "$(CFG)" == "devdtk43 - Win32 Debug Fuddish"
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


SOURCE=.\Nt\dbgwins.c

"$(INTDIR)\dbgwins.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\api\DECSTD97.C

"$(INTDIR)\DECSTD97.OBJ" : $(SOURCE) "$(INTDIR)"
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


SOURCE=.\Lts\lsa_adju.c

"$(INTDIR)\lsa_adju.obj" : $(SOURCE) "$(INTDIR)"
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


SOURCE=.\NT\mmalloc.c

"$(INTDIR)\mmalloc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\hlsyn\nasalf1x.c

"$(INTDIR)\nasalf1x.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\NT\opthread.c

"$(INTDIR)\opthread.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Cmd\par_ambi.c

"$(INTDIR)\par_ambi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Cmd\Par_char.c

"$(INTDIR)\Par_char.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Cmd\Par_dict.c

"$(INTDIR)\Par_dict.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Cmd\Par_pars.c

"$(INTDIR)\Par_pars.obj" : $(SOURCE) "$(INTDIR)"
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


SOURCE=.\nt\PIPE.C

"$(INTDIR)\PIPE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\NT\playaud.c

"$(INTDIR)\playaud.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\vtm\PLAYTONE.C

"$(INTDIR)\PLAYTONE.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\hlsyn\reson.c

"$(INTDIR)\reson.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\hlsyn\sample.c

"$(INTDIR)\sample.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\kernel\SERVICES.C

"$(INTDIR)\SERVICES.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\nt\SPC.C

"$(INTDIR)\SPC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\hlsyn\sqrttable.c

"$(INTDIR)\sqrttable.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\vtm\SYNC.C

"$(INTDIR)\SYNC.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\api\ttsapi.c

"$(INTDIR)\ttsapi.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\kernel\USA_INIT.C

"$(INTDIR)\USA_INIT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\hlsyn\voice.c

"$(INTDIR)\voice.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\Vtm\vtm.c

"$(INTDIR)\vtm.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\vtm\VTMIONT.C

"$(INTDIR)\VTMIONT.OBJ" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)



!ENDIF 

