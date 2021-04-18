<html>
<body>
<pre>
<h1>Build Log</h1>
<h3>
--------------------Configuration: cedll - Win32 (WCE ARM) Release--------------------
</h3>
<h3>Command Lines</h3>
Creating temporary file "C:\DOCUME~1\berrios\LOCALS~1\Temp\RSP4E6.tmp" with contents
[
/nologo /W3 /I ".\ce" /I ".\acna" /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "(CEConfigName)" /D "ACNA" /D "NDEBUG" /D "ARM" /D "_ARM_" /D "ENGLISH" /D "ENGLISH_US" /D "WIN32" /D UNDER_CE=300 /D _WIN32_WCE=300 /D "UNICODE" /D "_USRDLL" /D "BLD_DECTALK_DLL" /D "WIN32_PLATFORM_HPC2000" /D "_UNICODE" /Fp".\..\build\cedll\arm\us\release\link/cedll.pch" /YX /Fo".\..\build\cedll\arm\us\release\link/" /MC /c 
"D:\work\ad\dapi\src\hlsyn\acxf1c.c"
"D:\work\ad\dapi\src\hlsyn\brent.c"
"D:\work\ad\dapi\src\hlsyn\circuit.c"
"D:\work\ad\dapi\src\CMD\cm_char.c"
"D:\work\ad\dapi\src\CMD\cm_cmd.c"
"D:\work\ad\dapi\src\CMD\cm_copt.c"
"D:\work\ad\dapi\src\CMD\cm_main.c"
"D:\work\ad\dapi\src\CMD\cm_pars.c"
"D:\work\ad\dapi\src\CMD\cm_phon.c"
"D:\work\ad\dapi\src\CMD\cm_text.c"
"D:\work\ad\dapi\src\CMD\cm_util.c"
"D:\work\ad\dapi\src\CMD\Cmd_init.c"
"D:\work\ad\dapi\src\CMD\cmd_wav.c"
"D:\work\ad\dapi\src\API\CRYPT2.C"
"D:\work\ad\dapi\src\NT\dbgwins.c"
"D:\work\ad\dapi\src\API\DECSTD97.C"
"D:\work\ad\dapi\src\hlsyn\diffuse.c"
"D:\work\ad\dapi\src\hlsyn\frame.c"
"D:\work\ad\dapi\src\hlsyn\hlframe.c"
"D:\work\ad\dapi\src\hlsyn\inithl.c"
"D:\work\ad\dapi\src\hlsyn\llinit.c"
"D:\work\ad\dapi\src\LTS\loaddict.c"
"D:\work\ad\dapi\src\hlsyn\log10table.c"
"D:\work\ad\dapi\src\LTS\ls_chari.c"
"D:\work\ad\dapi\src\LTS\ls_dict.c"
"D:\work\ad\dapi\src\LTS\ls_homo.c"
"D:\work\ad\dapi\src\LTS\ls_math.c"
"D:\work\ad\dapi\src\LTS\ls_proc.c"
"D:\work\ad\dapi\src\LTS\ls_spel.c"
"D:\work\ad\dapi\src\LTS\ls_speli.c"
"D:\work\ad\dapi\src\LTS\ls_suff.c"
"D:\work\ad\dapi\src\LTS\ls_suffi.c"
"D:\work\ad\dapi\src\LTS\LSA_ADJU.C"
"D:\work\ad\dapi\src\LTS\lsa_coni.c"
"D:\work\ad\dapi\src\LTS\lsa_fr.c"
"D:\work\ad\dapi\src\LTS\lsa_gr.c"
"D:\work\ad\dapi\src\LTS\lsa_ir.c"
"D:\work\ad\dapi\src\LTS\lsa_it.c"
"D:\work\ad\dapi\src\LTS\lsa_ja.c"
"D:\work\ad\dapi\src\LTS\lsa_rtbi.c"
"D:\work\ad\dapi\src\LTS\lsa_rule.c"
"D:\work\ad\dapi\src\LTS\lsa_sl.c"
"D:\work\ad\dapi\src\LTS\lsa_sp.c"
"D:\work\ad\dapi\src\LTS\lsa_task.c"
"D:\work\ad\dapi\src\LTS\lsa_us.c"
"D:\work\ad\dapi\src\LTS\lsa_util.c"
"D:\work\ad\dapi\src\LTS\lsw_main.c"
"D:\work\ad\dapi\src\NT\mmalloc.c"
"D:\work\ad\dapi\src\hlsyn\nasalf1x.c"
"D:\work\ad\dapi\src\NT\opthread.c"
"D:\work\ad\dapi\src\CMD\par_ambi.c"
"D:\work\ad\dapi\src\CMD\par_char.c"
"D:\work\ad\dapi\src\CMD\par_dict.c"
"D:\work\ad\dapi\src\CMD\par_pars.c"
"D:\work\ad\dapi\src\CMD\par_rule.c"
"D:\work\ad\dapi\src\PH\ph_aloph.c"
"D:\work\ad\dapi\src\PH\ph_claus.c"
"D:\work\ad\dapi\src\PH\ph_draw.c"
"D:\work\ad\dapi\src\PH\ph_drwt0.c"
"D:\work\ad\dapi\src\PH\ph_inton.c"
"D:\work\ad\dapi\src\PH\ph_main.c"
"D:\work\ad\dapi\src\PH\ph_romi.c"
"D:\work\ad\dapi\src\PH\ph_setar.c"
"D:\work\ad\dapi\src\PH\ph_sort.c"
"D:\work\ad\dapi\src\PH\ph_syl.c"
"D:\work\ad\dapi\src\PH\ph_syntx.c"
"D:\work\ad\dapi\src\PH\ph_task.c"
"D:\work\ad\dapi\src\PH\ph_timng.c"
"D:\work\ad\dapi\src\PH\ph_vdefi.c"
"D:\work\ad\dapi\src\PH\ph_vset.c"
"D:\work\ad\dapi\src\PH\phinit.c"
"D:\work\ad\dapi\src\PH\phlog.c"
"D:\work\ad\dapi\src\NT\pipe.c"
"D:\work\ad\dapi\src\NT\playaud.c"
"D:\work\ad\dapi\src\VTM\playtone.c"
"D:\work\ad\dapi\src\hlsyn\reson.c"
"D:\work\ad\dapi\src\hlsyn\sample.c"
"D:\work\ad\dapi\src\KERNEL\services.c"
"D:\work\ad\dapi\src\NT\spc.c"
"D:\work\ad\dapi\src\hlsyn\sqrttable.c"
"D:\work\ad\dapi\src\VTM\sync.c"
"D:\work\ad\dapi\src\API\ttsapi.c"
"D:\work\ad\dapi\src\KERNEL\Usa_init.c"
"D:\work\ad\dapi\src\hlsyn\voice.c"
"D:\work\ad\dapi\src\VTM\vtm.c"
"D:\work\ad\dapi\src\VTM\vtmiont.c"
"D:\work\ad\dapi\src\ce\wince.c"
]
Creating command line "clarm.exe @C:\DOCUME~1\berrios\LOCALS~1\Temp\RSP4E6.tmp" 
Creating temporary file "C:\DOCUME~1\berrios\LOCALS~1\Temp\RSP4E7.tmp" with contents
[
coredll.lib commctrl.lib /nologo /dll /incremental:no /pdb:".\..\build\cedll\arm\us\release/dectalk.pdb" /nodefaultlib:"libc.lib /nodefaultlib:libcd.lib /nodefaultlib:libcmt.lib /nodefaultlib:libcmtd.lib /nodefaultlib:msvcrt.lib /nodefaultlib:msvcrtd.lib /nodefaultlib:oldnames.lib" /def:".\dectalk.def" /out:".\..\build\cedll\arm\us\release/dectalk.dll" /implib:".\..\build\cedll\arm\us\release/dectalk.lib" /machine:ARM /subsystem:windowsce,3.00 
\work\ad\dapi\build\cedll\arm\us\release\link\acxf1c.obj
\work\ad\dapi\build\cedll\arm\us\release\link\brent.obj
\work\ad\dapi\build\cedll\arm\us\release\link\circuit.obj
\work\ad\dapi\build\cedll\arm\us\release\link\cm_char.obj
\work\ad\dapi\build\cedll\arm\us\release\link\cm_cmd.obj
\work\ad\dapi\build\cedll\arm\us\release\link\cm_copt.obj
\work\ad\dapi\build\cedll\arm\us\release\link\cm_main.obj
\work\ad\dapi\build\cedll\arm\us\release\link\cm_pars.obj
\work\ad\dapi\build\cedll\arm\us\release\link\cm_phon.obj
\work\ad\dapi\build\cedll\arm\us\release\link\cm_text.obj
\work\ad\dapi\build\cedll\arm\us\release\link\cm_util.obj
\work\ad\dapi\build\cedll\arm\us\release\link\Cmd_init.obj
\work\ad\dapi\build\cedll\arm\us\release\link\cmd_wav.obj
\work\ad\dapi\build\cedll\arm\us\release\link\CRYPT2.OBJ
\work\ad\dapi\build\cedll\arm\us\release\link\dbgwins.obj
\work\ad\dapi\build\cedll\arm\us\release\link\DECSTD97.OBJ
\work\ad\dapi\build\cedll\arm\us\release\link\diffuse.obj
\work\ad\dapi\build\cedll\arm\us\release\link\frame.obj
\work\ad\dapi\build\cedll\arm\us\release\link\hlframe.obj
\work\ad\dapi\build\cedll\arm\us\release\link\inithl.obj
\work\ad\dapi\build\cedll\arm\us\release\link\llinit.obj
\work\ad\dapi\build\cedll\arm\us\release\link\loaddict.obj
\work\ad\dapi\build\cedll\arm\us\release\link\log10table.obj
\work\ad\dapi\build\cedll\arm\us\release\link\ls_chari.obj
\work\ad\dapi\build\cedll\arm\us\release\link\ls_dict.obj
\work\ad\dapi\build\cedll\arm\us\release\link\ls_homo.obj
\work\ad\dapi\build\cedll\arm\us\release\link\ls_math.obj
\work\ad\dapi\build\cedll\arm\us\release\link\ls_proc.obj
\work\ad\dapi\build\cedll\arm\us\release\link\ls_spel.obj
\work\ad\dapi\build\cedll\arm\us\release\link\ls_speli.obj
\work\ad\dapi\build\cedll\arm\us\release\link\ls_suff.obj
\work\ad\dapi\build\cedll\arm\us\release\link\ls_suffi.obj
\work\ad\dapi\build\cedll\arm\us\release\link\LSA_ADJU.OBJ
\work\ad\dapi\build\cedll\arm\us\release\link\lsa_coni.obj
\work\ad\dapi\build\cedll\arm\us\release\link\lsa_fr.obj
\work\ad\dapi\build\cedll\arm\us\release\link\lsa_gr.obj
\work\ad\dapi\build\cedll\arm\us\release\link\lsa_ir.obj
\work\ad\dapi\build\cedll\arm\us\release\link\lsa_it.obj
\work\ad\dapi\build\cedll\arm\us\release\link\lsa_ja.obj
\work\ad\dapi\build\cedll\arm\us\release\link\lsa_rtbi.obj
\work\ad\dapi\build\cedll\arm\us\release\link\lsa_rule.obj
\work\ad\dapi\build\cedll\arm\us\release\link\lsa_sl.obj
\work\ad\dapi\build\cedll\arm\us\release\link\lsa_sp.obj
\work\ad\dapi\build\cedll\arm\us\release\link\lsa_task.obj
\work\ad\dapi\build\cedll\arm\us\release\link\lsa_us.obj
\work\ad\dapi\build\cedll\arm\us\release\link\lsa_util.obj
\work\ad\dapi\build\cedll\arm\us\release\link\lsw_main.obj
\work\ad\dapi\build\cedll\arm\us\release\link\mmalloc.obj
\work\ad\dapi\build\cedll\arm\us\release\link\nasalf1x.obj
\work\ad\dapi\build\cedll\arm\us\release\link\opthread.obj
\work\ad\dapi\build\cedll\arm\us\release\link\par_ambi.obj
\work\ad\dapi\build\cedll\arm\us\release\link\par_char.obj
\work\ad\dapi\build\cedll\arm\us\release\link\par_dict.obj
\work\ad\dapi\build\cedll\arm\us\release\link\par_pars.obj
\work\ad\dapi\build\cedll\arm\us\release\link\par_rule.obj
\work\ad\dapi\build\cedll\arm\us\release\link\ph_aloph.obj
\work\ad\dapi\build\cedll\arm\us\release\link\ph_claus.obj
\work\ad\dapi\build\cedll\arm\us\release\link\ph_draw.obj
\work\ad\dapi\build\cedll\arm\us\release\link\ph_drwt0.obj
\work\ad\dapi\build\cedll\arm\us\release\link\ph_inton.obj
\work\ad\dapi\build\cedll\arm\us\release\link\ph_main.obj
\work\ad\dapi\build\cedll\arm\us\release\link\ph_romi.obj
\work\ad\dapi\build\cedll\arm\us\release\link\ph_setar.obj
\work\ad\dapi\build\cedll\arm\us\release\link\ph_sort.obj
\work\ad\dapi\build\cedll\arm\us\release\link\ph_syl.obj
\work\ad\dapi\build\cedll\arm\us\release\link\ph_syntx.obj
\work\ad\dapi\build\cedll\arm\us\release\link\ph_task.obj
\work\ad\dapi\build\cedll\arm\us\release\link\ph_timng.obj
\work\ad\dapi\build\cedll\arm\us\release\link\ph_vdefi.obj
\work\ad\dapi\build\cedll\arm\us\release\link\ph_vset.obj
\work\ad\dapi\build\cedll\arm\us\release\link\phinit.obj
\work\ad\dapi\build\cedll\arm\us\release\link\phlog.obj
\work\ad\dapi\build\cedll\arm\us\release\link\pipe.obj
\work\ad\dapi\build\cedll\arm\us\release\link\playaud.obj
\work\ad\dapi\build\cedll\arm\us\release\link\playtone.obj
\work\ad\dapi\build\cedll\arm\us\release\link\reson.obj
\work\ad\dapi\build\cedll\arm\us\release\link\sample.obj
\work\ad\dapi\build\cedll\arm\us\release\link\services.obj
\work\ad\dapi\build\cedll\arm\us\release\link\spc.obj
\work\ad\dapi\build\cedll\arm\us\release\link\sqrttable.obj
\work\ad\dapi\build\cedll\arm\us\release\link\sync.obj
\work\ad\dapi\build\cedll\arm\us\release\link\ttsapi.obj
\work\ad\dapi\build\cedll\arm\us\release\link\Usa_init.obj
\work\ad\dapi\build\cedll\arm\us\release\link\voice.obj
\work\ad\dapi\build\cedll\arm\us\release\link\vtm.obj
\work\ad\dapi\build\cedll\arm\us\release\link\vtmiont.obj
\work\ad\dapi\build\cedll\arm\us\release\link\wince.obj
]
Creating command line "link.exe @C:\DOCUME~1\berrios\LOCALS~1\Temp\RSP4E7.tmp"
<h3>Output Window</h3>
Compiling...
acxf1c.c
brent.c
circuit.c
D:\work\ad\dapi\src\hlsyn\circuit.c(303) : warning C4244: 'function' : conversion from 'double ' to 'float ', possible loss of data
D:\work\ad\dapi\src\hlsyn\circuit.c(307) : warning C4244: 'function' : conversion from 'double ' to 'float ', possible loss of data
D:\work\ad\dapi\src\hlsyn\circuit.c(308) : warning C4244: 'function' : conversion from 'double ' to 'float ', possible loss of data
cm_char.c
cm_cmd.c
cm_copt.c
cm_main.c
cm_pars.c
cm_phon.c
cm_text.c
cm_util.c
D:\work\ad\dapi\src\CMD\cm_util.c(780) : warning C4090: '=' : different 'const' qualifiers
Cmd_init.c
cmd_wav.c
D:\work\ad\dapi\src\CMD\cmd_wav.c(260) : warning C4047: 'function' : 'unsigned short *' differs in levels of indirection from 'unsigned short (*)[128]'
D:\work\ad\dapi\src\CMD\cmd_wav.c(260) : warning C4024: 'MultiByteToWideChar' : different types for formal and actual parameter 5
D:\work\ad\dapi\src\CMD\cmd_wav.c(265) : warning C4047: 'function' : 'const unsigned short *' differs in levels of indirection from 'unsigned short (*)[128]'
D:\work\ad\dapi\src\CMD\cmd_wav.c(265) : warning C4024: 'sndPlaySoundW' : different types for formal and actual parameter 1
CRYPT2.C
dbgwins.c
DECSTD97.C
diffuse.c
frame.c
hlframe.c
D:\work\ad\dapi\src\hlsyn\hlframe.c(422) : warning C4244: 'function' : conversion from 'double ' to 'float ', possible loss of data
D:\work\ad\dapi\src\hlsyn\hlframe.c(671) : warning C4244: 'function' : conversion from 'double ' to 'float ', possible loss of data
D:\work\ad\dapi\src\hlsyn\hlframe.c(677) : warning C4244: 'function' : conversion from 'const double ' to 'float ', possible loss of data
inithl.c
llinit.c
loaddict.c
log10table.c
ls_chari.c
ls_dict.c
ls_homo.c
ls_math.c
ls_proc.c
ls_spel.c
ls_speli.c
ls_suff.c
ls_suffi.c
LSA_ADJU.C
lsa_coni.c
lsa_fr.c
lsa_gr.c
lsa_ir.c
lsa_it.c
lsa_ja.c
lsa_rtbi.c
lsa_rule.c
lsa_sl.c
lsa_sp.c
lsa_task.c
D:\work\ad\dapi\src\LTS\ls_task.c(359) : warning C4101: 'i' : unreferenced local variable
lsa_us.c
lsa_util.c
.\ph\ph_prot.h(102) : warning C4028: formal parameter 1 different from declaration
.\ph\ph_prot.h(106) : warning C4028: formal parameter 1 different from declaration
lsw_main.c
mmalloc.c
nasalf1x.c
D:\work\ad\dapi\src\hlsyn\nasalf1x.c(159) : warning C4244: 'function' : conversion from 'double ' to 'float ', possible loss of data
D:\work\ad\dapi\src\hlsyn\nasalf1x.c(186) : warning C4244: '=' : conversion from 'double ' to 'float ', possible loss of data
D:\work\ad\dapi\src\hlsyn\nasalf1x.c(296) : warning C4244: '=' : conversion from 'double ' to 'float ', possible loss of data
D:\work\ad\dapi\src\hlsyn\nasalf1x.c(385) : warning C4244: '=' : conversion from 'double ' to 'float ', possible loss of data
opthread.c
par_ambi.c
par_char.c
par_dict.c
par_pars.c
par_rule.c
ph_aloph.c
ph_claus.c
D:\work\ad\dapi\src\PH\ph_claus.c(278) : warning C4013: 'fr_phalloph' undefined; assuming extern returning int
D:\work\ad\dapi\src\PH\ph_claus.c(307) : warning C4013: 'us_phtiming' undefined; assuming extern returning int
D:\work\ad\dapi\src\PH\ph_claus.c(311) : warning C4013: 'sp_phtiming' undefined; assuming extern returning int
D:\work\ad\dapi\src\PH\ph_claus.c(329) : warning C4013: 'fr_phinton' undefined; assuming extern returning int
ph_draw.c
ph_drwt0.c
ph_inton.c
D:\work\ad\dapi\src\PH\ph_inton2.c(1394) : warning C4761: integral size mismatch in argument; conversion supplied
D:\work\ad\dapi\src\PH\ph_inton2.c(1445) : warning C4761: integral size mismatch in argument; conversion supplied
ph_main.c
ph_romi.c
ph_setar.c
ph_sort.c
ph_syl.c
ph_syntx.c
ph_task.c
ph_timng.c
ph_vdefi.c
ph_vset.c
D:\work\ad\dapi\src\PH\ph_vset.c(410) : warning C4013: 'changeSpeakerValues' undefined; assuming extern returning int
D:\work\ad\dapi\src\PH\ph_vset.c(635) : warning C4018: '>' : signed/unsigned mismatch
phinit.c
phlog.c
pipe.c
playaud.c
playtone.c
reson.c
sample.c
services.c
spc.c
sqrttable.c
sync.c
D:\work\ad\dapi\src\VTM\sync.c(337) : warning C4244: '=' : conversion from 'unsigned long ' to 'unsigned short ', possible loss of data
D:\work\ad\dapi\src\VTM\sync.c(338) : warning C4244: '=' : conversion from 'unsigned long ' to 'unsigned short ', possible loss of data
ttsapi.c
D:\work\ad\dapi\src\API\ttsapi.c(5112) : warning C4133: 'function' : incompatible types - from 'unsigned short *' to 'const char *'
D:\work\ad\dapi\src\API\ttsapi.c(5112) : warning C4133: 'function' : incompatible types - from 'unsigned short *' to 'const char *'
This is NOT a USERDIC_COMPILE
D:\work\ad\dapi\src\API\ttsapi.c(11625) : warning C4133: 'function' : incompatible types - from 'unsigned short *' to 'char *'
D:\work\ad\dapi\src\API\ttsapi.c(10964) : warning C4700: local variable 'sdef' used without having been initialized
Usa_init.c
D:\work\ad\dapi\src\KERNEL\Usa_init.c(249) : warning C4090: '=' : different 'const' qualifiers
D:\work\ad\dapi\src\KERNEL\Usa_init.c(250) : warning C4090: '=' : different 'const' qualifiers
voice.c
vtm.c
D:\work\ad\dapi\src\VTM\vtm3.c(895) : warning C4244: '=' : conversion from 'double ' to 'short ', possible loss of data
D:\work\ad\dapi\src\VTM\vtm3.c(1209) : warning C4133: 'function' : incompatible types - from 'int *' to 'short *'
D:\work\ad\dapi\src\VTM\vtm3.c(406) : warning C4101: 'rtzout' : unreferenced local variable
D:\work\ad\dapi\src\VTM\vtm3.c(1889) : warning C4018: '>' : signed/unsigned mismatch
D:\work\ad\dapi\src\VTM\vtm3.c(1902) : warning C4018: '>' : signed/unsigned mismatch
vtmiont.c
D:\work\ad\dapi\src\VTM\vtmiont.c(668) : warning C4244: '=' : conversion from 'double ' to 'float ', possible loss of data
D:\work\ad\dapi\src\VTM\vtmiont.c(673) : warning C4244: '=' : conversion from 'float ' to 'int ', possible loss of data
D:\work\ad\dapi\src\VTM\vtmiont.c(530) : warning C4101: 'tmp' : unreferenced local variable
wince.c
Linking...
.\dectalk.def : warning LNK4017: DESCRIPTION statement not supported for the target platform; ignored
   Creating library .\..\build\cedll\arm\us\release/dectalk.lib and object .\..\build\cedll\arm\us\release/dectalk.exp



<h3>Results</h3>
dectalk.dll - 0 error(s), 43 warning(s)
</pre>
</body>
</html>
