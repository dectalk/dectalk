rem This file will do the preprocessing.

rem TEMPLATE:
rem %preproc% -i file.c -o tempname %1 %2


set preproc=%blddrv%%bldpath%\3rdparty\aci\preproc.exe

REM ***********************************************************
rem FIRST DOING THE FRAME WORK CODE:***************************
REM ***********************************************************
echo Converting Frame Work Code *******************************

set target=%blddrv%%bldpath%\3rdparty\aci\frm_work\dapi\src\api
cd %target%
%preproc% -i decstd97.c %1 %2
%preproc% -i coop.h %1 %2
%preproc% -i tts.h %1 %2
%preproc% -i ttsapi.h %1 %2

set target=%blddrv%%bldpath%\3rdparty\aci\frm_work\dapi\src\cmd
cd %target%
%preproc% -i cm_char.c %1 %2
%preproc% -i cm_cmd.c %1 %2
%preproc% -i cm_copt.c %1 %2
%preproc% -i cm_main.c %1 %2
%preproc% -i cm_pars.c %1 %2
%preproc% -i cm_phon.c %1 %2
%preproc% -i cm_text.c %1 %2
%preproc% -i cm_util.c %1 %2
%preproc% -i par_ambi.c %1 %2
%preproc% -i par_char.c %1 %2
%preproc% -i par_dict.c %1 %2
%preproc% -i par_rule.c %1 %2
%preproc% -i cm_cdef.h %1 %2
%preproc% -i cm_copt.h %1 %2
%preproc% -i cm_data.h %1 %2
%preproc% -i cm_def.h %1 %2
%preproc% -i cm_defs.h %1 %2
%preproc% -i cm_prot.h %1 %2
%preproc% -i cm_util.h %1 %2
%preproc% -i c_us_cde.h %1 %2
%preproc% -i par_ambi.tab %1 %2
%preproc% -i par_def.h %1 %2
%preproc% -i par_rule.h %1 %2

set target=%blddrv%%bldpath%\3rdparty\aci\frm_work\dapi\src\include
cd %target%
%preproc% -i copyrite.c %1 %2
%preproc% -i 186.h %1 %2
%preproc% -i audioapi.h %1 %2
%preproc% -i audiodef.h %1 %2
%preproc% -i cmd.h %1 %2
%preproc% -i dectalk.h %1 %2
%preproc% -i defs.h %1 %2
%preproc% -i esc.h %1 %2
%preproc% -i ger_def.h %1 %2
%preproc% -i ger_err.tab %1 %2
%preproc% -i ger_phon.tab %1 %2
%preproc% -i ger_type.tab %1 %2
%preproc% -i hardw.h %1 %2
%preproc% -i iso_char.h %1 %2
%preproc% -i kernel.h %1 %2
%preproc% -i ls_lower.tab %1 %2
%preproc% -i ls_upper.tab %1 %2
%preproc% -i l_com_ph.h %1 %2
%preproc% -i l_gr_ph.h %1 %2
%preproc% -i l_sp_ph.h %1 %2
%preproc% -i l_us_ph.h %1 %2
%preproc% -i pcport.h %1 %2
%preproc% -i pipe.h %1 %2
%preproc% -i port.h %1 %2
%preproc% -i samprate.h %1 %2
%preproc% -i spa_def.h %1 %2
%preproc% -i spa_err.tab %1 %2
%preproc% -i spa_phon.tab %1 %2
%preproc% -i spa_type.tab %1 %2
%preproc% -i spc.h %1 %2
%preproc% -i usa_def.h %1 %2
%preproc% -i usa_err.tab %1 %2
%preproc% -i usa_phon.tab %1 %2
%preproc% -i usa_type.tab %1 %2
%preproc% -i version.h %1 %2

%preproc% -i cpapi.h %1 %2

set target=%blddrv%%bldpath%\3rdparty\aci\frm_work\dapi\src\kernel
cd %target%
%preproc% -i isa.c %1 %2
%preproc% -i isa_dma.c %1 %2
%preproc% -i iso_char.c %1 %2
%preproc% -i main.c %1 %2
%preproc% -i services.c %1 %2
%preproc% -i spc_driv.c %1 %2
%preproc% -i usa_init.c %1 %2

set target=%blddrv%%bldpath%\3rdparty\aci\frm_work\dapi\src\nt
cd %target%
%preproc% -i audqueue.c %1 %2
%preproc% -i mmalloc.c %1 %2
%preproc% -i opthread.c %1 %2
%preproc% -i pipe.c %1 %2
%preproc% -i spc.c %1 %2
%preproc% -i dbgwins.h %1 %2
%preproc% -i mmalloc.h %1 %2
%preproc% -i opatype.h %1 %2
%preproc% -i opmmsys.h %1 %2
%preproc% -i opthread.h %1 %2
%preproc% -i pipe.h %1 %2
%preproc% -i playaud.h %1 %2

set target=%blddrv%%bldpath%\3rdparty\aci\frm_work\dapi\src\ph
cd %target%
%preproc% -i ph_data.h %1 %2
%preproc% -i ph_def.h %1 %2
%preproc% -i ph_defs.h %1 %2
%preproc% -i ph_prot.h %1 %2

set target=%blddrv%%bldpath%\3rdparty\aci\frm_work\dapi\src\protos
cd %target%
%preproc% -i kernp.h %1 %2
%preproc% -i libp.h %1 %2

set target=%blddrv%%bldpath%\3rdparty\aci\frm_work\dapi\src\vtm
cd %target%
%preproc% -i playtone.c %1 %2
%preproc% -i sync.c %1 %2
%preproc% -i vtmiont.c %1 %2
%preproc% -i samprate.h %1 %2
%preproc% -i sinetab.h %1 %2
%preproc% -i vtminst.h %1 %2

set target=%blddrv%%bldpath%\3rdparty\aci\frm_work\hardware\src\lib
cd %target%
%preproc% -i adjallo.c %1 %2
%preproc% -i adjind.c %1 %2
%preproc% -i chkind.c %1 %2
%preproc% -i deflang.c %1 %2
%preproc% -i donef.c %1 %2
%preproc% -i getc.c %1 %2
%preproc% -i gpio.c %1 %2
%preproc% -i indal.c %1 %2
%preproc% -i indph.c %1 %2
%preproc% -i kdisable.c %1 %2
%preproc% -i kenable.c %1 %2
%preproc% -i phlog.c %1 %2
%preproc% -i printf.c %1 %2
%preproc% -i putc.c %1 %2
%preproc% -i puthex.c %1 %2
%preproc% -i putn.c %1 %2
%preproc% -i putseq.c %1 %2
%preproc% -i putstr.c %1 %2
%preproc% -i resetspc.c %1 %2
%preproc% -i saveind.c %1 %2
%preproc% -i sendind.c %1 %2
%preproc% -i serialu.c %1 %2
%preproc% -i spcget.c %1 %2
%preproc% -i spcwrite.c %1 %2
%preproc% -i startf.c %1 %2
%preproc% -i statabs.c %1 %2
%preproc% -i statabsu.c %1 %2
%preproc% -i statclr.c %1 %2
%preproc% -i statclru.c %1 %2
%preproc% -i statset.c %1 %2
%preproc% -i statsetu.c %1 %2
%preproc% -i stattog.c %1 %2
%preproc% -i stattogu.c %1 %2
%preproc% -i voldown.c %1 %2
%preproc% -i volset.c %1 %2
%preproc% -i volup.c %1 %2

set target=%blddrv%%bldpath%\3rdparty\aci\frm_work\hardware\src\misc
cd %target%
%preproc% -i ger_main.c %1 %2
%preproc% -i spa_main.c %1 %2
%preproc% -i udic_gr.c %1 %2
%preproc% -i udic_sp.c %1 %2
%preproc% -i udic_us.c %1 %2
%preproc% -i usa_main.c %1 %2
%preproc% -i l_com_ph.h %1 %2
%preproc% -i l_us_ph.h %1 %2
%preproc% -i udic_us.c %1 %2
%preproc% -i userdic.h %1 %2

set target=%blddrv%%bldpath%\3rdparty\aci\frm_work\sapi\src\api
cd %target%
%preproc% -i auddest.cpp %1 %2
%preproc% -i audioact.cpp %1 %2
%preproc% -i ctools.cpp %1 %2
%preproc% -i dtlktts.cpp %1 %2
%preproc% -i dtlkttsc.cpp %1 %2
%preproc% -i dtlkttse.cpp %1 %2
%preproc% -i guidseg.cpp %1 %2
%preproc% -i ctools.h %1 %2
%preproc% -i dtlktts.h %1 %2
%preproc% -i dtlkttse.h %1 %2


if "%2"=="VOCAL" goto end

REM ***********************************************************
rem NOW DOING THE CORE CODE:        ***************************
REM ***********************************************************
echo Converting Core Code *************************************

set target=%blddrv%%bldpath%\3rdparty\aci\corecode\dapi\src
cd %target%
%preproc% -i dectalk.def %1 %2

set target=%blddrv%%bldpath%\3rdparty\aci\corecode\dapi\src\api
cd %target%
%preproc% -i crypt2.c %1 %2
%preproc% -i decstd97.c %1 %2
%preproc% -i ttsapi.c %1 %2
%preproc% -i coop.h %1 %2
%preproc% -i tts.h %1 %2
%preproc% -i ttsapi.h %1 %2
%preproc% -i ttserr.h %1 %2

set target=%blddrv%%bldpath%\3rdparty\aci\corecode\dapi\src\cmd
cd %target%
%preproc% -i cm_text.c %1 %2
%preproc% -i par_pars.c %1 %2
%preproc% -i cm_data.h %1 %2
%preproc% -i cm_def.h %1 %2
%preproc% -i cm_defs.h %1 %2
%preproc% -i cm_prot.h %1 %2
%preproc% -i par_def.h %1 %2

set target=%blddrv%%bldpath%\3rdparty\aci\corecode\dapi\src\include
cd %target%
%preproc% -i copyrite.c %1 %2
%preproc% -i audioapi.h %1 %2
%preproc% -i audiodef.h %1 %2
%preproc% -i cmd.h %1 %2
%preproc% -i dectalk.h %1 %2
%preproc% -i defs.h %1 %2
%preproc% -i esc.h %1 %2
%preproc% -i iso_char.h %1 %2
%preproc% -i kernel.h %1 %2
%preproc% -i ls_feat.tab %1 %2
%preproc% -i ls_fold.tab %1 %2
%preproc% -i ls_lower.tab %1 %2
%preproc% -i ls_upper.tab %1 %2
%preproc% -i l_com_ph.h %1 %2
%preproc% -i l_gr_ph.h %1 %2
%preproc% -i l_sp_ph.h %1 %2
%preproc% -i l_us_ph.h %1 %2
%preproc% -i mn_char.h %1 %2
%preproc% -i pipe.h %1 %2
%preproc% -i port.h %1 %2
%preproc% -i samprate.h %1 %2
%preproc% -i spa_def.h %1 %2
%preproc% -i usa_def.h %1 %2

%preproc% -i dt_abort.h %1 %2
%preproc% -i fc_def.tab %1 %2

%preproc% -i cpapi.h %1 %2

set target=%blddrv%%bldpath%\3rdparty\aci\corecode\dapi\src\kernel
cd %target%
%preproc% -i services.c %1 %2

set target=%blddrv%%bldpath%\3rdparty\aci\corecode\dapi\src\lts
cd %target%
%preproc% -i loaddict.c %1 %2
%preproc% -i ls_adju.c %1 %2
%preproc% -i ls_chari.c %1 %2
%preproc% -i ls_consi.c %1 %2
%preproc% -i ls_dict.c %1 %2
%preproc% -i ls_homo.c %1 %2
%preproc% -i ls_main.c %1 %2
%preproc% -i ls_math.c %1 %2
%preproc% -i ls_proc.c %1 %2
%preproc% -i ls_rtabi.c %1 %2
%preproc% -i ls_rule.c %1 %2
%preproc% -i ls_spel.c %1 %2
%preproc% -i ls_speli.c %1 %2
%preproc% -i ls_suff.c %1 %2
%preproc% -i ls_suffi.c %1 %2
%preproc% -i ls_task.c %1 %2
%preproc% -i ls_util.c %1 %2
%preproc% -i lsa_cons.h %1 %2
%preproc% -i lsa_prot.h %1 %2
%preproc% -i lsa_rta.c %1 %2
%preproc% -i ls_acna.h %1 %2
%preproc% -i ls_adju1.c %1 %2
%preproc% -i ls_char.h %1 %2
%preproc% -i ls_cons.h %1 %2
%preproc% -i ls_data.h %1 %2
%preproc% -i ls_def.h %1 %2
%preproc% -i ls_defs.h %1 %2
%preproc% -i ls_dict.h %1 %2
%preproc% -i ls_homo.h %1 %2
%preproc% -i ls_math1.c %1 %2
%preproc% -i ls_prot.h %1 %2
%preproc% -i ls_rule1.c %1 %2
%preproc% -i ls_rule2.c %1 %2
%preproc% -i ls_spel1.c %1 %2
%preproc% -i l_ac_con.c %1 %2
%preproc% -i l_com_ph.h %1 %2
%preproc% -i l_gr_ad1.c %1 %2
%preproc% -i l_gr_con.c %1 %2
%preproc% -i l_gr_ma1.c %1 %2
%preproc% -i l_gr_pr1.c %1 %2
%preproc% -i l_gr_rta.c %1 %2
%preproc% -i l_gr_ru1.c %1 %2
%preproc% -i l_gr_sp1.c %1 %2
%preproc% -i l_gr_suf.c %1 %2
%preproc% -i l_sp_ad1.c %1 %2
%preproc% -i l_sp_con.c %1 %2
%preproc% -i l_sp_ma1.c %1 %2
%preproc% -i l_sp_pr1.c %1 %2
%preproc% -i l_sp_ru1.c %1 %2
%preproc% -i l_sp_sp1.c %1 %2
%preproc% -i l_us_ad1.c %1 %2
%preproc% -i l_us_cha.c %1 %2
%preproc% -i l_us_con.c %1 %2
%preproc% -i l_us_ma1.c %1 %2
%preproc% -i l_us_pr1.c %1 %2
%preproc% -i l_us_rta.c %1 %2
%preproc% -i l_us_ru1.c %1 %2
%preproc% -i l_us_sp1.c %1 %2
%preproc% -i l_us_spe.c %1 %2
%preproc% -i l_us_suf.c %1 %2

set target=%blddrv%%bldpath%\3rdparty\aci\corecode\dapi\src\nt
cd %target%
%preproc% -i mmalloc.c %1 %2
%preproc% -i opthread.c %1 %2
%preproc% -i playaud.c %1 %2
%preproc% -i dbgwins.h %1 %2
%preproc% -i mmalloc.h %1 %2
%preproc% -i opatype.h %1 %2
%preproc% -i opmmsys.h %1 %2
%preproc% -i opthread.h %1 %2
%preproc% -i playaud.h %1 %2
%preproc% -i playaudd.h %1 %2

set target=%blddrv%%bldpath%\3rdparty\aci\corecode\dapi\src\ph
cd %target%
%preproc% -i ph_aloph.c %1 %2
%preproc% -i ph_claus.c %1 %2
%preproc% -i ph_draw.c %1 %2
%preproc% -i ph_drwt0.c %1 %2
%preproc% -i ph_inton.c %1 %2
%preproc% -i ph_main.c %1 %2
%preproc% -i ph_romi.c %1 %2
%preproc% -i ph_setar.c %1 %2
%preproc% -i ph_sort.c %1 %2
%preproc% -i ph_syl.c %1 %2
%preproc% -i ph_syntx.c %1 %2
%preproc% -i ph_task.c %1 %2
%preproc% -i ph_timng.c %1 %2
%preproc% -i ph_vdefi.c %1 %2
%preproc% -i ph_vset.c %1 %2
%preproc% -i ph_data.h %1 %2
%preproc% -i ph_def.h %1 %2
%preproc% -i ph_defs.h %1 %2
%preproc% -i ph_draw1.c %1 %2
%preproc% -i ph_prot.h %1 %2
%preproc% -i ph_sort1.c %1 %2
%preproc% -i ph_sort2.c %1 %2
%preproc% -i ph_sttr1.c %1 %2
%preproc% -i ph_sttr2.c %1 %2
%preproc% -i ph_syl1.c %1 %2
%preproc% -i ph_time1.c %1 %2
%preproc% -i p_gr_dr1.c %1 %2
%preproc% -i p_gr_rom.c %1 %2
%preproc% -i p_gr_sr1.c %1 %2
%preproc% -i p_gr_st1.c %1 %2
%preproc% -i p_gr_tim.c %1 %2
%preproc% -i p_gr_vdf.c %1 %2
%preproc% -i p_sp_rom.c %1 %2
%preproc% -i p_sp_sr1.c %1 %2
%preproc% -i p_sp_st1.c %1 %2
%preproc% -i p_sp_sy1.c %1 %2
%preproc% -i p_sp_tim.c %1 %2
%preproc% -i p_sp_vdf.c %1 %2
%preproc% -i p_us_rom.c %1 %2
%preproc% -i p_us_sr1.c %1 %2
%preproc% -i p_us_st1.c %1 %2
%preproc% -i p_us_sy1.c %1 %2
%preproc% -i p_us_tim.c %1 %2
%preproc% -i p_us_vdf.c %1 %2

%preproc% -i ph_drwt01.c %1 %2
%preproc% -i ph_inton1.c %1 %2

set target=%blddrv%%bldpath%\3rdparty\aci\corecode\dapi\src\protos
cd %target%
%preproc% -i kernp.h %1 %2
%preproc% -i libp.h %1 %2
%preproc% -i vtm_fp.h %1 %2
%preproc% -i vtm_ip.h %1 %2

set target=%blddrv%%bldpath%\3rdparty\aci\corecode\dapi\src\vtm
cd %target%
%preproc% -i decvoc_f.c %1 %2
%preproc% -i decvoc_i.c %1 %2
%preproc% -i playtone.c %1 %2
%preproc% -i sync.c %1 %2
%preproc% -i vtm.c %1 %2
%preproc% -i vtmiont.c %1 %2
%preproc% -i vtm_f.c %1 %2
%preproc% -i vtm_fman.c %1 %2
%preproc% -i vtm_i.c %1 %2
%preproc% -i vtm_iman.c %1 %2
%preproc% -i samprate.h %1 %2
%preproc% -i sinetab.h %1 %2
%preproc% -i vfmd2pol.h %1 %2
%preproc% -i vfmfiltr.h %1 %2
%preproc% -i vfphdefs.h %1 %2
%preproc% -i vfport.h %1 %2
%preproc% -i viphdefs.h %1 %2
%preproc% -i viport.h %1 %2
%preproc% -i vismprat.h %1 %2
%preproc% -i vtm.h %1 %2
%preproc% -i vtmfunc.h %1 %2
%preproc% -i vtmfunci.h %1 %2
%preproc% -i vtminst.h %1 %2
%preproc% -i vtmtabf.h %1 %2
%preproc% -i vtmtable.h %1 %2
%preproc% -i vtmtabli.h %1 %2
%preproc% -i vtm_f.h %1 %2
%preproc% -i vtm_fdef.h %1 %2
%preproc% -i vtm_i.h %1 %2
%preproc% -i vtm_idef.h %1 %2


:end
