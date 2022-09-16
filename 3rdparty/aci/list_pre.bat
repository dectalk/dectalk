rem This file will set up the files to be preprocessed
rem by copying them to the proper location.

rem TARGET will be the area where the files will be stripped.
rem BASEDIR will keep copies of all of the files in FRAME WORK and CORE CODE
rem 	in their original state (before running PREPROC).

rem TEMPLATE:
rem set strippath=%blddrv%%bldpath%\
rem set target=%blddrv%%bldpath%\3rdparty\aci\frm_work\
rem set basedir=%blddrv%%bldpath%\3rdparty\aci\frm_work\
rem copy %strippath%\ %target%\


REM ***********************************************************
rem FIRST DOING THE FRAME WORK CODE:***************************
REM ***********************************************************
echo COPYING FRAME WORK CODES: ********************************


set strippath=%blddrv%%bldpath%\dapi\src\api
set target=%blddrv%%bldpath%\3rdparty\aci\frm_work\dapi\src\api
set basedir=%blddrv%%bldpath%\3rdparty\aci\frm_work\dapi\src\api
copy %strippath%\decstd97.c %target%\decstd97.c
copy %strippath%\decstd97.c %basedir%\decstd97.c
copy %strippath%\coop.h %target%\coop.h
copy %strippath%\coop.h %basedir%\coop.h
copy %strippath%\tts.h %target%\tts.h
copy %strippath%\tts.h %basedir%\tts.h
copy %strippath%\ttsapi.h %target%\ttsapi.h
copy %strippath%\ttsapi.h %basedir%\ttsapi.h


set strippath=%blddrv%%bldpath%\dapi\src\cmd
set target=%blddrv%%bldpath%\3rdparty\aci\frm_work\dapi\src\cmd
set basedir=%blddrv%%bldpath%\3rdparty\aci\frm_work\dapi\src\cmd
copy %strippath%\cm_char.c %target%\cm_char.c
copy %strippath%\cm_char.c %basedir%\cm_char.c
copy %strippath%\cm_cmd.c %target%\cm_cmd.c
copy %strippath%\cm_cmd.c %basedir%\cm_cmd.c
copy %strippath%\cm_copt.c %target%\cm_copt.c
copy %strippath%\cm_copt.c %basedir%\cm_copt.c
copy %strippath%\cm_main.c %target%\cm_main.c
copy %strippath%\cm_main.c %basedir%\cm_main.c
copy %strippath%\cm_pars.c %target%\cm_pars.c
copy %strippath%\cm_pars.c %basedir%\cm_pars.c
copy %strippath%\cm_phon.c %target%\cm_phon.c
copy %strippath%\cm_phon.c %basedir%\cm_phon.c
copy %strippath%\cm_text.c %target%\cm_text.c
copy %strippath%\cm_text.c %basedir%\cm_text.c
copy %strippath%\cm_util.c %target%\cm_util.c
copy %strippath%\cm_util.c %basedir%\cm_util.c
copy %strippath%\par_ambi.c %target%\par_ambi.c
copy %strippath%\par_ambi.c %basedir%\par_ambi.c
copy %strippath%\par_char.c %target%\par_char.c
copy %strippath%\par_char.c %basedir%\par_char.c
copy %strippath%\par_dict.c %target%\par_dict.c
copy %strippath%\par_dict.c %basedir%\par_dict.c
copy %strippath%\par_rule.c %target%\par_rule.c
copy %strippath%\par_rule.c %basedir%\par_rule.c
copy %strippath%\cm_cdef.h %target%\cm_cdef.h
copy %strippath%\cm_cdef.h %basedir%\cm_cdef.h
copy %strippath%\cm_copt.h %target%\cm_copt.h
copy %strippath%\cm_copt.h %basedir%\cm_copt.h
copy %strippath%\cm_data.h %target%\cm_data.h
copy %strippath%\cm_data.h %basedir%\cm_data.h
copy %strippath%\cm_def.h %target%\cm_def.h
copy %strippath%\cm_def.h %basedir%\cm_def.h
copy %strippath%\cm_defs.h %target%\cm_defs.h
copy %strippath%\cm_defs.h %basedir%\cm_defs.h
copy %strippath%\cm_prot.h %target%\cm_prot.h
copy %strippath%\cm_prot.h %basedir%\cm_prot.h
copy %strippath%\cm_util.h %target%\cm_util.h
copy %strippath%\cm_util.h %basedir%\cm_util.h
copy %strippath%\c_us_cde.h %target%\c_us_cde.h
copy %strippath%\c_us_cde.h %basedir%\c_us_cde.h
copy %strippath%\par_ambi.tab %target%\par_ambi.tab
copy %strippath%\par_ambi.tab %basedir%\par_ambi.tab
copy %strippath%\par_def.h %target%\par_def.h
copy %strippath%\par_def.h %basedir%\par_def.h
copy %strippath%\par_rule.h %target%\par_rule.h
copy %strippath%\par_rule.h %basedir%\par_rule.h


set strippath=%blddrv%%bldpath%\dapi\src\include
set target=%blddrv%%bldpath%\3rdparty\aci\frm_work\dapi\src\include
set basedir=%blddrv%%bldpath%\3rdparty\aci\frm_work\dapi\src\include
copy %strippath%\copyrite.c %target%\copyrite.c
copy %strippath%\copyrite.c %basedir%\copyrite.c
copy %strippath%\186.h %target%\186.h
copy %strippath%\186.h %basedir%\186.h
copy %strippath%\audioapi.h %target%\audioapi.h
copy %strippath%\audioapi.h %basedir%\audioapi.h
copy %strippath%\audiodef.h %target%\audiodef.h
copy %strippath%\audiodef.h %basedir%\audiodef.h
copy %strippath%\cmd.h %target%\cmd.h
copy %strippath%\cmd.h %basedir%\cmd.h
copy %strippath%\dectalk.h %target%\dectalk.h
copy %strippath%\dectalk.h %basedir%\dectalk.h
copy %strippath%\defs.h %target%\defs.h
copy %strippath%\defs.h %basedir%\defs.h
copy %strippath%\esc.h %target%\esc.h
copy %strippath%\esc.h %basedir%\esc.h
copy %strippath%\ger_def.h %target%\ger_def.h
copy %strippath%\ger_def.h %basedir%\ger_def.h
copy %strippath%\ger_err.tab %target%\ger_err.tab
copy %strippath%\ger_err.tab %basedir%\ger_err.tab
copy %strippath%\ger_phon.tab %target%\ger_phon.tab
copy %strippath%\ger_phon.tab %basedir%\ger_phon.tab
copy %strippath%\ger_type.tab %target%\ger_type.tab
copy %strippath%\ger_type.tab %basedir%\ger_type.tab
copy %strippath%\hardw.h %target%\hardw.h
copy %strippath%\hardw.h %basedir%\hardw.h
copy %strippath%\iso_char.h %target%\iso_char.h
copy %strippath%\iso_char.h %basedir%\iso_char.h
copy %strippath%\kernel.h %target%\kernel.h
copy %strippath%\kernel.h %basedir%\kernel.h
copy %strippath%\ls_lower.tab %target%\ls_lower.tab
copy %strippath%\ls_lower.tab %basedir%\ls_lower.tab
copy %strippath%\ls_upper.tab %target%\ls_upper.tab
copy %strippath%\ls_upper.tab %basedir%\ls_upper.tab
copy %strippath%\l_com_ph.h %target%\l_com_ph.h
copy %strippath%\l_com_ph.h %basedir%\l_com_ph.h
copy %strippath%\l_gr_ph.h %target%\l_gr_ph.h
copy %strippath%\l_gr_ph.h %basedir%\l_gr_ph.h
copy %strippath%\l_sp_ph.h %target%\l_sp_ph.h
copy %strippath%\l_sp_ph.h %basedir%\l_sp_ph.h
copy %strippath%\l_us_ph.h %target%\l_us_ph.h
copy %strippath%\l_us_ph.h %basedir%\l_us_ph.h
copy %strippath%\pcport.h %target%\pcport.h
copy %strippath%\pcport.h %basedir%\pcport.h
copy %strippath%\pipe.h %target%\pipe.h
copy %strippath%\pipe.h %basedir%\pipe.h
copy %strippath%\port.h %target%\port.h
copy %strippath%\port.h %basedir%\port.h
copy %strippath%\samprate.h %target%\samprate.h
copy %strippath%\samprate.h %basedir%\samprate.h
copy %strippath%\spa_def.h %target%\spa_def.h
copy %strippath%\spa_def.h %basedir%\spa_def.h
copy %strippath%\spa_err.tab %target%\spa_err.tab
copy %strippath%\spa_err.tab %basedir%\spa_err.tab
copy %strippath%\spa_phon.tab %target%\spa_phon.tab
copy %strippath%\spa_phon.tab %basedir%\spa_phon.tab
copy %strippath%\spa_type.tab %target%\spa_type.tab
copy %strippath%\spa_type.tab %basedir%\spa_type.tab
copy %strippath%\spc.h %target%\spc.h
copy %strippath%\spc.h %basedir%\spc.h
copy %strippath%\usa_def.h %target%\usa_def.h
copy %strippath%\usa_def.h %basedir%\usa_def.h
copy %strippath%\usa_err.tab %target%\usa_err.tab
copy %strippath%\usa_err.tab %basedir%\usa_err.tab
copy %strippath%\usa_phon.tab %target%\usa_phon.tab
copy %strippath%\usa_phon.tab %basedir%\usa_phon.tab
copy %strippath%\usa_type.tab %target%\usa_type.tab
copy %strippath%\usa_type.tab %basedir%\usa_type.tab
copy %strippath%\version.h %target%\version.h
copy %strippath%\version.h %basedir%\version.h


set strippath=%blddrv%%bldpath%\cpanel\src
copy %strippath%\cpapi.h %target%\cpapi.h
copy %strippath%\cpapi.h %basedir%\cpapi.h


set strippath=%blddrv%%bldpath%\dapi\src\kernel
set target=%blddrv%%bldpath%\3rdparty\aci\frm_work\dapi\src\kernel
set basedir=%blddrv%%bldpath%\3rdparty\aci\frm_work\dapi\src\kernel
copy %strippath%\isa.c %target%\isa.c
copy %strippath%\isa.c %basedir%\isa.c
copy %strippath%\isa_dma.c %target%\isa_dma.c
copy %strippath%\isa_dma.c %basedir%\isa_dma.c
copy %strippath%\iso_char.c %target%\iso_char.c
copy %strippath%\iso_char.c %basedir%\iso_char.c
copy %strippath%\main.c %target%\main.c
copy %strippath%\main.c %basedir%\main.c
copy %strippath%\services.c %target%\services.c
copy %strippath%\services.c %basedir%\services.c
copy %strippath%\spc_driv.c %target%\spc_driv.c
copy %strippath%\spc_driv.c %basedir%\spc_driv.c
copy %strippath%\usa_init.c %target%\usa_init.c
copy %strippath%\usa_init.c %basedir%\usa_init.c


set strippath=%blddrv%%bldpath%\dapi\src\nt
set target=%blddrv%%bldpath%\3rdparty\aci\frm_work\dapi\src\nt
set basedir=%blddrv%%bldpath%\3rdparty\aci\frm_work\dapi\src\nt
copy %strippath%\audqueue.c %target%\audqueue.c
copy %strippath%\audqueue.c %basedir%\audqueue.c
copy %strippath%\mmalloc.c %target%\mmalloc.c
copy %strippath%\mmalloc.c %basedir%\mmalloc.c
copy %strippath%\opthread.c %target%\opthread.c
copy %strippath%\opthread.c %basedir%\opthread.c
copy %strippath%\pipe.c %target%\pipe.c
copy %strippath%\pipe.c %basedir%\pipe.c
copy %strippath%\spc.c %target%\spc.c
copy %strippath%\spc.c %basedir%\spc.c
copy %strippath%\dbgwins.h %target%\dbgwins.h
copy %strippath%\dbgwins.h %basedir%\dbgwins.h
copy %strippath%\mmalloc.h %target%\mmalloc.h
copy %strippath%\mmalloc.h %basedir%\mmalloc.h
copy %strippath%\opatype.h %target%\opatype.h
copy %strippath%\opatype.h %basedir%\opatype.h
copy %strippath%\opmmsys.h %target%\opmmsys.h
copy %strippath%\opmmsys.h %basedir%\opmmsys.h
copy %strippath%\opthread.h %target%\opthread.h
copy %strippath%\opthread.h %basedir%\opthread.h
copy %strippath%\pipe.h %target%\pipe.h
copy %strippath%\pipe.h %basedir%\pipe.h
copy %strippath%\playaud.h %target%\playaud.h
copy %strippath%\playaud.h %basedir%\playaud.h


set strippath=%blddrv%%bldpath%\dapi\src\ph
set target=%blddrv%%bldpath%\3rdparty\aci\frm_work\dapi\src\ph
set basedir=%blddrv%%bldpath%\3rdparty\aci\frm_work\dapi\src\ph
copy %strippath%\ph_data.h %target%\ph_data.h
copy %strippath%\ph_data.h %basedir%\ph_data.h
copy %strippath%\ph_def.h %target%\ph_def.h
copy %strippath%\ph_def.h %basedir%\ph_def.h
copy %strippath%\ph_defs.h %target%\ph_defs.h
copy %strippath%\ph_defs.h %basedir%\ph_defs.h
copy %strippath%\ph_prot.h %target%\ph_prot.h
copy %strippath%\ph_prot.h %basedir%\ph_prot.h


set strippath=%blddrv%%bldpath%\dapi\src\protos
set target=%blddrv%%bldpath%\3rdparty\aci\frm_work\dapi\src\protos
set basedir=%blddrv%%bldpath%\3rdparty\aci\frm_work\dapi\src\protos
copy %strippath%\kernp.h %target%\kernp.h
copy %strippath%\kernp.h %basedir%\kernp.h
copy %strippath%\libp.h %target%\libp.h
copy %strippath%\libp.h %basedir%\libp.h


set strippath=%blddrv%%bldpath%\dapi\src\vtm
set target=%blddrv%%bldpath%\3rdparty\aci\frm_work\dapi\src\vtm
set basedir=%blddrv%%bldpath%\3rdparty\aci\frm_work\dapi\src\vtm
copy %strippath%\playtone.c %target%\playtone.c
copy %strippath%\playtone.c %basedir%\playtone.c
copy %strippath%\sync.c %target%\sync.c
copy %strippath%\sync.c %basedir%\sync.c
copy %strippath%\vtmiont.c %target%\vtmiont.c
copy %strippath%\vtmiont.c %basedir%\vtmiont.c
copy %strippath%\samprate.h %target%\samprate.h
copy %strippath%\samprate.h %basedir%\samprate.h
copy %strippath%\sinetab.h %target%\sinetab.h
copy %strippath%\sinetab.h %basedir%\sinetab.h
copy %strippath%\vtminst.h %target%\vtminst.h
copy %strippath%\vtminst.h %basedir%\vtminst.h


set strippath=%blddrv%%bldpath%\hardware\src\lib
set target=%blddrv%%bldpath%\3rdparty\aci\frm_work\hardware\src\lib
set basedir=%blddrv%%bldpath%\3rdparty\aci\frm_work\hardware\src\lib
copy %strippath%\adjallo.c %target%\adjallo.c
copy %strippath%\adjallo.c %basedir%\adjallo.c
copy %strippath%\adjind.c %target%\adjind.c
copy %strippath%\adjind.c %basedir%\adjind.c
copy %strippath%\chkind.c %target%\chkind.c
copy %strippath%\chkind.c %basedir%\chkind.c
copy %strippath%\deflang.c %target%\deflang.c
copy %strippath%\deflang.c %basedir%\deflang.c
copy %strippath%\donef.c %target%\donef.c
copy %strippath%\donef.c %basedir%\donef.c
copy %strippath%\getc.c %target%\getc.c
copy %strippath%\getc.c %basedir%\getc.c
copy %strippath%\gpio.c %target%\gpio.c
copy %strippath%\gpio.c %basedir%\gpio.c
copy %strippath%\indal.c %target%\indal.c
copy %strippath%\indal.c %basedir%\indal.c
copy %strippath%\indph.c %target%\indph.c
copy %strippath%\indph.c %basedir%\indph.c
copy %strippath%\kdisable.c %target%\kdisable.c
copy %strippath%\kdisable.c %basedir%\kdisable.c
copy %strippath%\kenable.c %target%\kenable.c
copy %strippath%\kenable.c %basedir%\kenable.c
copy %strippath%\phlog.c %target%\phlog.c
copy %strippath%\phlog.c %basedir%\phlog.c
copy %strippath%\printf.c %target%\printf.c
copy %strippath%\printf.c %basedir%\printf.c
copy %strippath%\putc.c %target%\putc.c
copy %strippath%\putc.c %basedir%\putc.c
copy %strippath%\puthex.c %target%\puthex.c
copy %strippath%\puthex.c %basedir%\puthex.c
copy %strippath%\putn.c %target%\putn.c
copy %strippath%\putn.c %basedir%\putn.c
copy %strippath%\putseq.c %target%\putseq.c
copy %strippath%\putseq.c %basedir%\putseq.c
copy %strippath%\putstr.c %target%\putstr.c
copy %strippath%\putstr.c %basedir%\putstr.c
copy %strippath%\resetspc.c %target%\resetspc.c
copy %strippath%\resetspc.c %basedir%\resetspc.c
copy %strippath%\saveind.c %target%\saveind.c
copy %strippath%\saveind.c %basedir%\saveind.c
copy %strippath%\sendind.c %target%\sendind.c
copy %strippath%\sendind.c %basedir%\sendind.c
copy %strippath%\serialu.c %target%\serialu.c
copy %strippath%\serialu.c %basedir%\serialu.c
copy %strippath%\spcget.c %target%\spcget.c
copy %strippath%\spcget.c %basedir%\spcget.c
copy %strippath%\spcwrite.c %target%\spcwrite.c
copy %strippath%\spcwrite.c %basedir%\spcwrite.c
copy %strippath%\startf.c %target%\startf.c
copy %strippath%\startf.c %basedir%\startf.c
copy %strippath%\statabs.c %target%\statabs.c
copy %strippath%\statabs.c %basedir%\statabs.c
copy %strippath%\statabsu.c %target%\statabsu.c
copy %strippath%\statabsu.c %basedir%\statabsu.c
copy %strippath%\statclr.c %target%\statclr.c
copy %strippath%\statclr.c %basedir%\statclr.c
copy %strippath%\statclru.c %target%\statclru.c
copy %strippath%\statclru.c %basedir%\statclru.c
copy %strippath%\statset.c %target%\statset.c
copy %strippath%\statset.c %basedir%\statset.c
copy %strippath%\statsetu.c %target%\statsetu.c
copy %strippath%\statsetu.c %basedir%\statsetu.c
copy %strippath%\stattog.c %target%\stattog.c
copy %strippath%\stattog.c %basedir%\stattog.c
copy %strippath%\stattogu.c %target%\stattogu.c
copy %strippath%\stattogu.c %basedir%\stattogu.c
copy %strippath%\voldown.c %target%\voldown.c
copy %strippath%\voldown.c %basedir%\voldown.c
copy %strippath%\volset.c %target%\volset.c
copy %strippath%\volset.c %basedir%\volset.c
copy %strippath%\volup.c %target%\volup.c
copy %strippath%\volup.c %basedir%\volup.c


set strippath=%blddrv%%bldpath%\hardware\src\misc
set target=%blddrv%%bldpath%\3rdparty\aci\frm_work\hardware\src\misc
set basedir=%blddrv%%bldpath%\3rdparty\aci\frm_work\hardware\src\misc
copy %strippath%\ger_main.c %target%\ger_main.c
copy %strippath%\ger_main.c %basedir%\ger_main.c
copy %strippath%\spa_main.c %target%\spa_main.c
copy %strippath%\spa_main.c %basedir%\spa_main.c
copy %strippath%\udic_gr.c %target%\udic_gr.c
copy %strippath%\udic_gr.c %basedir%\udic_gr.c
copy %strippath%\udic_sp.c %target%\udic_sp.c
copy %strippath%\udic_sp.c %basedir%\udic_sp.c
copy %strippath%\udic_us.c %target%\udic_us.c
copy %strippath%\udic_us.c %basedir%\udic_us.c
copy %strippath%\usa_main.c %target%\usa_main.c
copy %strippath%\usa_main.c %basedir%\usa_main.c
copy %strippath%\l_com_ph.h %target%\l_com_ph.h
copy %strippath%\l_com_ph.h %basedir%\l_com_ph.h
copy %strippath%\l_us_ph.h %target%\l_us_ph.h
copy %strippath%\l_us_ph.h %basedir%\l_us_ph.h
copy %strippath%\udic_us.c %target%\udic_us.c
copy %strippath%\udic_us.c %basedir%\udic_us.c
copy %strippath%\userdic.h %target%\userdic.h
copy %strippath%\userdic.h %basedir%\userdic.h


set strippath=%blddrv%%bldpath%\sapi\src\api
set target=%blddrv%%bldpath%\3rdparty\aci\frm_work\sapi\src\api
set basedir=%blddrv%%bldpath%\3rdparty\aci\frm_work\sapi\src\api
copy %strippath%\auddest.cpp %target%\auddest.cpp
copy %strippath%\auddest.cpp %basedir%\auddest.cpp
copy %strippath%\audioact.cpp %target%\audioact.cpp
copy %strippath%\audioact.cpp %basedir%\audioact.cpp
copy %strippath%\ctools.cpp %target%\ctools.cpp
copy %strippath%\ctools.cpp %basedir%\ctools.cpp
copy %strippath%\dtlktts.cpp %target%\dtlktts.cpp
copy %strippath%\dtlktts.cpp %basedir%\dtlktts.cpp
copy %strippath%\dtlkttsc.cpp %target%\dtlkttsc.cpp
copy %strippath%\dtlkttsc.cpp %basedir%\dtlkttsc.cpp
copy %strippath%\dtlkttse.cpp %target%\dtlkttse.cpp
copy %strippath%\dtlkttse.cpp %basedir%\dtlkttse.cpp
copy %strippath%\guidseg.cpp %target%\guidseg.cpp
copy %strippath%\guidseg.cpp %basedir%\guidseg.cpp
copy %strippath%\ctools.h %target%\ctools.h
copy %strippath%\ctools.h %basedir%\ctools.h
copy %strippath%\dtlktts.h %target%\dtlktts.h
copy %strippath%\dtlktts.h %basedir%\dtlktts.h
copy %strippath%\dtlkttse.h %target%\dtlkttse.h
copy %strippath%\dtlkttse.h %basedir%\dtlkttse.h


REM ***********************************************************
rem NOW DOING THE CORE CODE:        ***************************
REM ***********************************************************
echo COPYING CORE CODES: **************************************


set strippath=%blddrv%%bldpath%\dapi\src
set target=%blddrv%%bldpath%\3rdparty\aci\corecode\dapi\src
set basedir=%blddrv%%bldpath%\3rdparty\aci\corecode\dapi\src
copy %strippath%\dectalk.def %target%\dectalk.def
copy %strippath%\dectalk.def %basedir%\dectalk.def


set strippath=%blddrv%%bldpath%\dapi\src\api
set target=%blddrv%%bldpath%\3rdparty\aci\corecode\dapi\src\api
set basedir=%blddrv%%bldpath%\3rdparty\aci\corecode\dapi\src\api
copy %strippath%\crypt2.c %target%\crypt2.c
copy %strippath%\crypt2.c %basedir%\crypt2.c
copy %strippath%\decstd97.c %target%\decstd97.c
copy %strippath%\decstd97.c %basedir%\decstd97.c
copy %strippath%\ttsapi.c %target%\ttsapi.c
copy %strippath%\ttsapi.c %basedir%\ttsapi.c
copy %strippath%\coop.h %target%\coop.h
copy %strippath%\coop.h %basedir%\coop.h
copy %strippath%\tts.h %target%\tts.h
copy %strippath%\tts.h %basedir%\tts.h
copy %strippath%\ttsapi.h %target%\ttsapi.h
copy %strippath%\ttsapi.h %basedir%\ttsapi.h
copy %strippath%\ttserr.h %target%\ttserr.h
copy %strippath%\ttserr.h %basedir%\ttserr.h


set strippath=%blddrv%%bldpath%\dapi\src\cmd
set target=%blddrv%%bldpath%\3rdparty\aci\corecode\dapi\src\cmd
set basedir=%blddrv%%bldpath%\3rdparty\aci\corecode\dapi\src\cmd
copy %strippath%\cm_text.c %target%\cm_text.c
copy %strippath%\cm_text.c %basedir%\cm_text.c
copy %strippath%\par_pars.c %target%\par_pars.c
copy %strippath%\par_pars.c %basedir%\par_pars.c
copy %strippath%\cm_data.h %target%\cm_data.h
copy %strippath%\cm_data.h %basedir%\cm_data.h
copy %strippath%\cm_def.h %target%\cm_def.h
copy %strippath%\cm_def.h %basedir%\cm_def.h
copy %strippath%\cm_defs.h %target%\cm_defs.h
copy %strippath%\cm_defs.h %basedir%\cm_defs.h
copy %strippath%\cm_prot.h %target%\cm_prot.h
copy %strippath%\cm_prot.h %basedir%\cm_prot.h
copy %strippath%\par_def.h %target%\par_def.h
copy %strippath%\par_def.h %basedir%\par_def.h


set strippath=%blddrv%%bldpath%\dapi\src\include
set target=%blddrv%%bldpath%\3rdparty\aci\corecode\dapi\src\include
set basedir=%blddrv%%bldpath%\3rdparty\aci\corecode\dapi\src\include
copy %strippath%\copyrite.c %target%\copyrite.c
copy %strippath%\copyrite.c %basedir%\copyrite.c
copy %strippath%\audioapi.h %target%\audioapi.h
copy %strippath%\audioapi.h %basedir%\audioapi.h
copy %strippath%\audiodef.h %target%\audiodef.h
copy %strippath%\audiodef.h %basedir%\audiodef.h
copy %strippath%\cmd.h %target%\cmd.h
copy %strippath%\cmd.h %basedir%\cmd.h
copy %strippath%\dectalk.h %target%\dectalk.h
copy %strippath%\dectalk.h %basedir%\dectalk.h
copy %strippath%\defs.h %target%\defs.h
copy %strippath%\defs.h %basedir%\defs.h
copy %strippath%\esc.h %target%\esc.h
copy %strippath%\esc.h %basedir%\esc.h
copy %strippath%\iso_char.h %target%\iso_char.h
copy %strippath%\iso_char.h %basedir%\iso_char.h
copy %strippath%\kernel.h %target%\kernel.h
copy %strippath%\kernel.h %basedir%\kernel.h
copy %strippath%\ls_feat.tab %target%\ls_feat.tab
copy %strippath%\ls_feat.tab %basedir%\ls_feat.tab
copy %strippath%\ls_fold.tab %target%\ls_fold.tab
copy %strippath%\ls_fold.tab %basedir%\ls_fold.tab
copy %strippath%\ls_lower.tab %target%\ls_lower.tab
copy %strippath%\ls_lower.tab %basedir%\ls_lower.tab
copy %strippath%\ls_upper.tab %target%\ls_upper.tab
copy %strippath%\ls_upper.tab %basedir%\ls_upper.tab
copy %strippath%\l_com_ph.h %target%\l_com_ph.h
copy %strippath%\l_com_ph.h %basedir%\l_com_ph.h
copy %strippath%\l_gr_ph.h %target%\l_gr_ph.h
copy %strippath%\l_gr_ph.h %basedir%\l_gr_ph.h
copy %strippath%\l_sp_ph.h %target%\l_sp_ph.h
copy %strippath%\l_sp_ph.h %basedir%\l_sp_ph.h
copy %strippath%\l_us_ph.h %target%\l_us_ph.h
copy %strippath%\l_us_ph.h %basedir%\l_us_ph.h
copy %strippath%\mn_char.h %target%\mn_char.h
copy %strippath%\mn_char.h %basedir%\mn_char.h
copy %strippath%\pipe.h %target%\pipe.h
copy %strippath%\pipe.h %basedir%\pipe.h
copy %strippath%\port.h %target%\port.h
copy %strippath%\port.h %basedir%\port.h
copy %strippath%\samprate.h %target%\samprate.h
copy %strippath%\samprate.h %basedir%\samprate.h
copy %strippath%\spa_def.h %target%\spa_def.h
copy %strippath%\spa_def.h %basedir%\spa_def.h
copy %strippath%\usa_def.h %target%\usa_def.h
copy %strippath%\usa_def.h %basedir%\usa_def.h

copy %strippath%\dt_abort.h %basedir%\dt_abort.h
copy %strippath%\fc_def.tab %basedir%\fc_def.tab


set strippath=%blddrv%%bldpath%\cpanel\src
copy %strippath%\cpapi.h %target%\cpapi.h
copy %strippath%\cpapi.h %basedir%\cpapi.h


set strippath=%blddrv%%bldpath%\dapi\src\kernel
set target=%blddrv%%bldpath%\3rdparty\aci\corecode\dapi\src\kernel
set basedir=%blddrv%%bldpath%\3rdparty\aci\corecode\dapi\src\kernel
copy %strippath%\services.c %target%\services.c
copy %strippath%\services.c %basedir%\services.c


set strippath=%blddrv%%bldpath%\dapi\src\lts
set target=%blddrv%%bldpath%\3rdparty\aci\corecode\dapi\src\lts
set basedir=%blddrv%%bldpath%\3rdparty\aci\corecode\dapi\src\lts
copy %strippath%\loaddict.c %target%\loaddict.c
copy %strippath%\loaddict.c %basedir%\loaddict.c
copy %strippath%\ls_adju.c %target%\ls_adju.c
copy %strippath%\ls_adju.c %basedir%\ls_adju.c
copy %strippath%\ls_chari.c %target%\ls_chari.c
copy %strippath%\ls_chari.c %basedir%\ls_chari.c
copy %strippath%\ls_consi.c %target%\ls_consi.c
copy %strippath%\ls_consi.c %basedir%\ls_consi.c
copy %strippath%\ls_dict.c %target%\ls_dict.c
copy %strippath%\ls_dict.c %basedir%\ls_dict.c
copy %strippath%\ls_homo.c %target%\ls_homo.c
copy %strippath%\ls_homo.c %basedir%\ls_homo.c
copy %strippath%\ls_main.c %target%\ls_main.c
copy %strippath%\ls_main.c %basedir%\ls_main.c
copy %strippath%\ls_math.c %target%\ls_math.c
copy %strippath%\ls_math.c %basedir%\ls_math.c
copy %strippath%\ls_proc.c %target%\ls_proc.c
copy %strippath%\ls_proc.c %basedir%\ls_proc.c
copy %strippath%\ls_rtabi.c %target%\ls_rtabi.c
copy %strippath%\ls_rtabi.c %basedir%\ls_rtabi.c
copy %strippath%\ls_rule.c %target%\ls_rule.c
copy %strippath%\ls_rule.c %basedir%\ls_rule.c
copy %strippath%\ls_spel.c %target%\ls_spel.c
copy %strippath%\ls_spel.c %basedir%\ls_spel.c
copy %strippath%\ls_speli.c %target%\ls_speli.c
copy %strippath%\ls_speli.c %basedir%\ls_speli.c
copy %strippath%\ls_suff.c %target%\ls_suff.c
copy %strippath%\ls_suff.c %basedir%\ls_suff.c
copy %strippath%\ls_suffi.c %target%\ls_suffi.c
copy %strippath%\ls_suffi.c %basedir%\ls_suffi.c
copy %strippath%\ls_task.c %target%\ls_task.c
copy %strippath%\ls_task.c %basedir%\ls_task.c
copy %strippath%\ls_util.c %target%\ls_util.c
copy %strippath%\ls_util.c %basedir%\ls_util.c
copy %strippath%\lsa_cons.h %target%\lsa_cons.h
copy %strippath%\lsa_cons.h %basedir%\lsa_cons.h
copy %strippath%\lsa_prot.h %target%\lsa_prot.h
copy %strippath%\lsa_prot.h %basedir%\lsa_prot.h
copy %strippath%\lsa_rta.c %target%\lsa_rta.c
copy %strippath%\lsa_rta.c %basedir%\lsa_rta.c
copy %strippath%\ls_acna.h %target%\ls_acna.h
copy %strippath%\ls_acna.h %basedir%\ls_acna.h
copy %strippath%\ls_adju1.c %target%\ls_adju1.c
copy %strippath%\ls_adju1.c %basedir%\ls_adju1.c
copy %strippath%\ls_char.h %target%\ls_char.h
copy %strippath%\ls_char.h %basedir%\ls_char.h
copy %strippath%\ls_cons.h %target%\ls_cons.h
copy %strippath%\ls_cons.h %basedir%\ls_cons.h
copy %strippath%\ls_data.h %target%\ls_data.h
copy %strippath%\ls_data.h %basedir%\ls_data.h
copy %strippath%\ls_def.h %target%\ls_def.h
copy %strippath%\ls_def.h %basedir%\ls_def.h
copy %strippath%\ls_defs.h %target%\ls_defs.h
copy %strippath%\ls_defs.h %basedir%\ls_defs.h
copy %strippath%\ls_dict.h %target%\ls_dict.h
copy %strippath%\ls_dict.h %basedir%\ls_dict.h
copy %strippath%\ls_homo.h %target%\ls_homo.h
copy %strippath%\ls_homo.h %basedir%\ls_homo.h
copy %strippath%\ls_math1.c %target%\ls_math1.c
copy %strippath%\ls_math1.c %basedir%\ls_math1.c
copy %strippath%\ls_prot.h %target%\ls_prot.h
copy %strippath%\ls_prot.h %basedir%\ls_prot.h
copy %strippath%\ls_rule1.c %target%\ls_rule1.c
copy %strippath%\ls_rule1.c %basedir%\ls_rule1.c
copy %strippath%\ls_rule2.c %target%\ls_rule2.c
copy %strippath%\ls_rule2.c %basedir%\ls_rule2.c
copy %strippath%\ls_spel1.c %target%\ls_spel1.c
copy %strippath%\ls_spel1.c %basedir%\ls_spel1.c
copy %strippath%\l_ac_con.c %target%\l_ac_con.c
copy %strippath%\l_ac_con.c %basedir%\l_ac_con.c
copy %strippath%\l_com_ph.h %target%\l_com_ph.h
copy %strippath%\l_com_ph.h %basedir%\l_com_ph.h
copy %strippath%\l_gr_ad1.c %target%\l_gr_ad1.c
copy %strippath%\l_gr_ad1.c %basedir%\l_gr_ad1.c
copy %strippath%\l_gr_con.c %target%\l_gr_con.c
copy %strippath%\l_gr_con.c %basedir%\l_gr_con.c
copy %strippath%\l_gr_ma1.c %target%\l_gr_ma1.c
copy %strippath%\l_gr_ma1.c %basedir%\l_gr_ma1.c
copy %strippath%\l_gr_pr1.c %target%\l_gr_pr1.c
copy %strippath%\l_gr_pr1.c %basedir%\l_gr_pr1.c
copy %strippath%\l_gr_rta.c %target%\l_gr_rta.c
copy %strippath%\l_gr_rta.c %basedir%\l_gr_rta.c
copy %strippath%\l_gr_ru1.c %target%\l_gr_ru1.c
copy %strippath%\l_gr_ru1.c %basedir%\l_gr_ru1.c
copy %strippath%\l_gr_sp1.c %target%\l_gr_sp1.c
copy %strippath%\l_gr_sp1.c %basedir%\l_gr_sp1.c
copy %strippath%\l_gr_suf.c %target%\l_gr_suf.c
copy %strippath%\l_gr_suf.c %basedir%\l_gr_suf.c
copy %strippath%\l_sp_ad1.c %target%\l_sp_ad1.c
copy %strippath%\l_sp_ad1.c %basedir%\l_sp_ad1.c
copy %strippath%\l_sp_con.c %target%\l_sp_con.c
copy %strippath%\l_sp_con.c %basedir%\l_sp_con.c
copy %strippath%\l_sp_ma1.c %target%\l_sp_ma1.c
copy %strippath%\l_sp_ma1.c %basedir%\l_sp_ma1.c
copy %strippath%\l_sp_pr1.c %target%\l_sp_pr1.c
copy %strippath%\l_sp_pr1.c %basedir%\l_sp_pr1.c
copy %strippath%\l_sp_ru1.c %target%\l_sp_ru1.c
copy %strippath%\l_sp_ru1.c %basedir%\l_sp_ru1.c
copy %strippath%\l_sp_sp1.c %target%\l_sp_sp1.c
copy %strippath%\l_sp_sp1.c %basedir%\l_sp_sp1.c
copy %strippath%\l_us_ad1.c %target%\l_us_ad1.c
copy %strippath%\l_us_ad1.c %basedir%\l_us_ad1.c
copy %strippath%\l_us_cha.c %target%\l_us_cha.c
copy %strippath%\l_us_cha.c %basedir%\l_us_cha.c
copy %strippath%\l_us_con.c %target%\l_us_con.c
copy %strippath%\l_us_con.c %basedir%\l_us_con.c
copy %strippath%\l_us_ma1.c %target%\l_us_ma1.c
copy %strippath%\l_us_ma1.c %basedir%\l_us_ma1.c
copy %strippath%\l_us_pr1.c %target%\l_us_pr1.c
copy %strippath%\l_us_pr1.c %basedir%\l_us_pr1.c
copy %strippath%\l_us_rta.c %target%\l_us_rta.c
copy %strippath%\l_us_rta.c %basedir%\l_us_rta.c
copy %strippath%\l_us_ru1.c %target%\l_us_ru1.c
copy %strippath%\l_us_ru1.c %basedir%\l_us_ru1.c
copy %strippath%\l_us_sp1.c %target%\l_us_sp1.c
copy %strippath%\l_us_sp1.c %basedir%\l_us_sp1.c
copy %strippath%\l_us_spe.c %target%\l_us_spe.c
copy %strippath%\l_us_spe.c %basedir%\l_us_spe.c
copy %strippath%\l_us_suf.c %target%\l_us_suf.c
copy %strippath%\l_us_suf.c %basedir%\l_us_suf.c


set strippath=%blddrv%%bldpath%\dapi\src\nt
set target=%blddrv%%bldpath%\3rdparty\aci\corecode\dapi\src\nt
set basedir=%blddrv%%bldpath%\3rdparty\aci\corecode\dapi\src\nt
copy %strippath%\mmalloc.c %target%\mmalloc.c
copy %strippath%\mmalloc.c %basedir%\mmalloc.c
copy %strippath%\opthread.c %target%\opthread.c
copy %strippath%\opthread.c %basedir%\opthread.c
copy %strippath%\playaud.c %target%\playaud.c
copy %strippath%\playaud.c %basedir%\playaud.c
copy %strippath%\dbgwins.h %target%\dbgwins.h
copy %strippath%\dbgwins.h %basedir%\dbgwins.h
copy %strippath%\mmalloc.h %target%\mmalloc.h
copy %strippath%\mmalloc.h %basedir%\mmalloc.h
copy %strippath%\opatype.h %target%\opatype.h
copy %strippath%\opatype.h %basedir%\opatype.h
copy %strippath%\opmmsys.h %target%\opmmsys.h
copy %strippath%\opmmsys.h %basedir%\opmmsys.h
copy %strippath%\opthread.h %target%\opthread.h
copy %strippath%\opthread.h %basedir%\opthread.h
copy %strippath%\playaud.h %target%\playaud.h
copy %strippath%\playaud.h %basedir%\playaud.h
copy %strippath%\playaudd.h %target%\playaudd.h
copy %strippath%\playaudd.h %basedir%\playaudd.h


set strippath=%blddrv%%bldpath%\dapi\src\ph
set target=%blddrv%%bldpath%\3rdparty\aci\corecode\dapi\src\ph
set basedir=%blddrv%%bldpath%\3rdparty\aci\corecode\dapi\src\ph
copy %strippath%\ph_aloph.c %target%\ph_aloph.c
copy %strippath%\ph_aloph.c %basedir%\ph_aloph.c
copy %strippath%\ph_claus.c %target%\ph_claus.c
copy %strippath%\ph_claus.c %basedir%\ph_claus.c
copy %strippath%\ph_draw.c %target%\ph_draw.c
copy %strippath%\ph_draw.c %basedir%\ph_draw.c
copy %strippath%\ph_drwt0.c %target%\ph_drwt0.c
copy %strippath%\ph_drwt0.c %basedir%\ph_drwt0.c
copy %strippath%\ph_inton.c %target%\ph_inton.c
copy %strippath%\ph_inton.c %basedir%\ph_inton.c
copy %strippath%\ph_main.c %target%\ph_main.c
copy %strippath%\ph_main.c %basedir%\ph_main.c
copy %strippath%\ph_romi.c %target%\ph_romi.c
copy %strippath%\ph_romi.c %basedir%\ph_romi.c
copy %strippath%\ph_setar.c %target%\ph_setar.c
copy %strippath%\ph_setar.c %basedir%\ph_setar.c
copy %strippath%\ph_sort.c %target%\ph_sort.c
copy %strippath%\ph_sort.c %basedir%\ph_sort.c
copy %strippath%\ph_syl.c %target%\ph_syl.c
copy %strippath%\ph_syl.c %basedir%\ph_syl.c
copy %strippath%\ph_syntx.c %target%\ph_syntx.c
copy %strippath%\ph_syntx.c %basedir%\ph_syntx.c
copy %strippath%\ph_task.c %target%\ph_task.c
copy %strippath%\ph_task.c %basedir%\ph_task.c
copy %strippath%\ph_timng.c %target%\ph_timng.c
copy %strippath%\ph_timng.c %basedir%\ph_timng.c
copy %strippath%\ph_vdefi.c %target%\ph_vdefi.c
copy %strippath%\ph_vdefi.c %basedir%\ph_vdefi.c
copy %strippath%\ph_vset.c %target%\ph_vset.c
copy %strippath%\ph_vset.c %basedir%\ph_vset.c
copy %strippath%\ph_data.h %target%\ph_data.h
copy %strippath%\ph_data.h %basedir%\ph_data.h
copy %strippath%\ph_def.h %target%\ph_def.h
copy %strippath%\ph_def.h %basedir%\ph_def.h
copy %strippath%\ph_defs.h %target%\ph_defs.h
copy %strippath%\ph_defs.h %basedir%\ph_defs.h
copy %strippath%\ph_draw1.c %target%\ph_draw1.c
copy %strippath%\ph_draw1.c %basedir%\ph_draw1.c
copy %strippath%\ph_prot.h %target%\ph_prot.h
copy %strippath%\ph_prot.h %basedir%\ph_prot.h
copy %strippath%\ph_sort1.c %target%\ph_sort1.c
copy %strippath%\ph_sort1.c %basedir%\ph_sort1.c
copy %strippath%\ph_sort2.c %target%\ph_sort2.c
copy %strippath%\ph_sort2.c %basedir%\ph_sort2.c
copy %strippath%\ph_sttr1.c %target%\ph_sttr1.c
copy %strippath%\ph_sttr1.c %basedir%\ph_sttr1.c
copy %strippath%\ph_sttr2.c %target%\ph_sttr2.c
copy %strippath%\ph_sttr2.c %basedir%\ph_sttr2.c
copy %strippath%\ph_syl1.c %target%\ph_syl1.c
copy %strippath%\ph_syl1.c %basedir%\ph_syl1.c
copy %strippath%\ph_time1.c %target%\ph_time1.c
copy %strippath%\ph_time1.c %basedir%\ph_time1.c
copy %strippath%\p_gr_dr1.c %target%\p_gr_dr1.c
copy %strippath%\p_gr_dr1.c %basedir%\p_gr_dr1.c
copy %strippath%\p_gr_rom.c %target%\p_gr_rom.c
copy %strippath%\p_gr_rom.c %basedir%\p_gr_rom.c
copy %strippath%\p_gr_sr1.c %target%\p_gr_sr1.c
copy %strippath%\p_gr_sr1.c %basedir%\p_gr_sr1.c
copy %strippath%\p_gr_st1.c %target%\p_gr_st1.c
copy %strippath%\p_gr_st1.c %basedir%\p_gr_st1.c
copy %strippath%\p_gr_tim.c %target%\p_gr_tim.c
copy %strippath%\p_gr_tim.c %basedir%\p_gr_tim.c
copy %strippath%\p_gr_vdf.c %target%\p_gr_vdf.c
copy %strippath%\p_gr_vdf.c %basedir%\p_gr_vdf.c
copy %strippath%\p_sp_rom.c %target%\p_sp_rom.c
copy %strippath%\p_sp_rom.c %basedir%\p_sp_rom.c
copy %strippath%\p_sp_sr1.c %target%\p_sp_sr1.c
copy %strippath%\p_sp_sr1.c %basedir%\p_sp_sr1.c
copy %strippath%\p_sp_st1.c %target%\p_sp_st1.c
copy %strippath%\p_sp_st1.c %basedir%\p_sp_st1.c
copy %strippath%\p_sp_sy1.c %target%\p_sp_sy1.c
copy %strippath%\p_sp_sy1.c %basedir%\p_sp_sy1.c
copy %strippath%\p_sp_tim.c %target%\p_sp_tim.c
copy %strippath%\p_sp_tim.c %basedir%\p_sp_tim.c
copy %strippath%\p_sp_vdf.c %target%\p_sp_vdf.c
copy %strippath%\p_sp_vdf.c %basedir%\p_sp_vdf.c
copy %strippath%\p_us_rom.c %target%\p_us_rom.c
copy %strippath%\p_us_rom.c %basedir%\p_us_rom.c
copy %strippath%\p_us_sr1.c %target%\p_us_sr1.c
copy %strippath%\p_us_sr1.c %basedir%\p_us_sr1.c
copy %strippath%\p_us_st1.c %target%\p_us_st1.c
copy %strippath%\p_us_st1.c %basedir%\p_us_st1.c
copy %strippath%\p_us_sy1.c %target%\p_us_sy1.c
copy %strippath%\p_us_sy1.c %basedir%\p_us_sy1.c
copy %strippath%\p_us_tim.c %target%\p_us_tim.c
copy %strippath%\p_us_tim.c %basedir%\p_us_tim.c
copy %strippath%\p_us_vdf.c %target%\p_us_vdf.c
copy %strippath%\p_us_vdf.c %basedir%\p_us_vdf.c

copy %strippath%\ph_drwt01.c %basedir%\ph_drwt01.c
copy %strippath%\ph_inton1.c %basedir%\ph_inton1.c


set strippath=%blddrv%%bldpath%\dapi\src\protos
set target=%blddrv%%bldpath%\3rdparty\aci\corecode\dapi\src\protos
set basedir=%blddrv%%bldpath%\3rdparty\aci\corecode\dapi\src\protos
copy %strippath%\kernp.h %target%\kernp.h
copy %strippath%\kernp.h %basedir%\kernp.h
copy %strippath%\libp.h %target%\libp.h
copy %strippath%\libp.h %basedir%\libp.h
copy %strippath%\vtm_fp.h %target%\vtm_fp.h
copy %strippath%\vtm_fp.h %basedir%\vtm_fp.h
copy %strippath%\vtm_ip.h %target%\vtm_ip.h
copy %strippath%\vtm_ip.h %basedir%\vtm_ip.h


set strippath=%blddrv%%bldpath%\dapi\src\vtm
set target=%blddrv%%bldpath%\3rdparty\aci\corecode\dapi\src\vtm
set basedir=%blddrv%%bldpath%\3rdparty\aci\corecode\dapi\src\vtm
copy %strippath%\decvoc_f.c %target%\decvoc_f.c
copy %strippath%\decvoc_f.c %basedir%\decvoc_f.c
copy %strippath%\decvoc_i.c %target%\decvoc_i.c
copy %strippath%\decvoc_i.c %basedir%\decvoc_i.c
copy %strippath%\playtone.c %target%\playtone.c
copy %strippath%\playtone.c %basedir%\playtone.c
copy %strippath%\sync.c %target%\sync.c
copy %strippath%\sync.c %basedir%\sync.c
copy %strippath%\vtm.c %target%\vtm.c
copy %strippath%\vtm.c %basedir%\vtm.c
copy %strippath%\vtmiont.c %target%\vtmiont.c
copy %strippath%\vtmiont.c %basedir%\vtmiont.c
copy %strippath%\vtm_f.c %target%\vtm_f.c
copy %strippath%\vtm_f.c %basedir%\vtm_f.c
copy %strippath%\vtm_fman.c %target%\vtm_fman.c
copy %strippath%\vtm_fman.c %basedir%\vtm_fman.c
copy %strippath%\vtm_i.c %target%\vtm_i.c
copy %strippath%\vtm_i.c %basedir%\vtm_i.c
copy %strippath%\vtm_iman.c %target%\vtm_iman.c
copy %strippath%\vtm_iman.c %basedir%\vtm_iman.c
copy %strippath%\samprate.h %target%\samprate.h
copy %strippath%\samprate.h %basedir%\samprate.h
copy %strippath%\sinetab.h %target%\sinetab.h
copy %strippath%\sinetab.h %basedir%\sinetab.h
copy %strippath%\vfmd2pol.h %target%\vfmd2pol.h
copy %strippath%\vfmd2pol.h %basedir%\vfmd2pol.h
copy %strippath%\vfmfiltr.h %target%\vfmfiltr.h
copy %strippath%\vfmfiltr.h %basedir%\vfmfiltr.h
copy %strippath%\vfphdefs.h %target%\vfphdefs.h
copy %strippath%\vfphdefs.h %basedir%\vfphdefs.h
copy %strippath%\vfport.h %target%\vfport.h
copy %strippath%\vfport.h %basedir%\vfport.h
copy %strippath%\viphdefs.h %target%\viphdefs.h
copy %strippath%\viphdefs.h %basedir%\viphdefs.h
copy %strippath%\viport.h %target%\viport.h
copy %strippath%\viport.h %basedir%\viport.h
copy %strippath%\vismprat.h %target%\vismprat.h
copy %strippath%\vismprat.h %basedir%\vismprat.h
copy %strippath%\vtm.h %target%\vtm.h
copy %strippath%\vtm.h %basedir%\vtm.h
copy %strippath%\vtmfunc.h %target%\vtmfunc.h
copy %strippath%\vtmfunc.h %basedir%\vtmfunc.h
copy %strippath%\vtmfunci.h %target%\vtmfunci.h
copy %strippath%\vtmfunci.h %basedir%\vtmfunci.h
copy %strippath%\vtminst.h %target%\vtminst.h
copy %strippath%\vtminst.h %basedir%\vtminst.h
copy %strippath%\vtmtabf.h %target%\vtmtabf.h
copy %strippath%\vtmtabf.h %basedir%\vtmtabf.h
copy %strippath%\vtmtable.h %target%\vtmtable.h
copy %strippath%\vtmtable.h %basedir%\vtmtable.h
copy %strippath%\vtmtabli.h %target%\vtmtabli.h
copy %strippath%\vtmtabli.h %basedir%\vtmtabli.h
copy %strippath%\vtm_f.h %target%\vtm_f.h
copy %strippath%\vtm_f.h %basedir%\vtm_f.h
copy %strippath%\vtm_fdef.h %target%\vtm_fdef.h
copy %strippath%\vtm_fdef.h %basedir%\vtm_fdef.h
copy %strippath%\vtm_i.h %target%\vtm_i.h
copy %strippath%\vtm_i.h %basedir%\vtm_i.h
copy %strippath%\vtm_idef.h %target%\vtm_idef.h
copy %strippath%\vtm_idef.h %basedir%\vtm_idef.h
