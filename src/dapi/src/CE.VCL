<html>
<body>
<pre>
<h1>Build Log</h1>
<h3>
--------------------Configuration: CE - Win32 (WCE ARM) Release--------------------
</h3>
<h3>Command Lines</h3>
Creating temporary file "C:\DOCUME~1\berrios\LOCALS~1\Temp\RSP72F.tmp" with contents
[
/nologo /W3 /I ".\ce" /I ".\acna" /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "ARM" /D "_ARM_" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /D _WIN32_WCE=300 /D UNDER_CE=300 /D "UNICODE" /D "WIN32" /D "BLD_DECTALK_DLL" /D "STATIC_BUILD" /D "WIN32_PLATFORM_PSPC" /D "_UNICODE" /Fp"..\.\build\cestatic\arm\us\release\link/CE.pch" /YX /Fo"..\.\build\cestatic\arm\us\release\link/" /MC /c 
"D:\work\rnd\dapi\src\hlsyn\acxf1c.c"
"D:\work\rnd\dapi\src\hlsyn\brent.c"
"D:\work\rnd\dapi\src\hlsyn\circuit.c"
"D:\work\rnd\dapi\src\CMD\cm_char.c"
"D:\work\rnd\dapi\src\CMD\cm_cmd.c"
"D:\work\rnd\dapi\src\CMD\cm_copt.c"
"D:\work\rnd\dapi\src\CMD\cm_main.c"
"D:\work\rnd\dapi\src\CMD\cm_pars.c"
"D:\work\rnd\dapi\src\CMD\cm_phon.c"
"D:\work\rnd\dapi\src\CMD\cm_text.c"
"D:\work\rnd\dapi\src\CMD\cm_util.c"
"D:\work\rnd\dapi\src\CMD\Cmd_init.c"
"D:\work\rnd\dapi\src\CMD\cmd_wav.c"
"D:\work\rnd\dapi\src\API\CRYPT2.C"
"D:\work\rnd\dapi\src\NT\dbgwins.c"
"D:\work\rnd\dapi\src\API\DECSTD97.C"
"D:\work\rnd\dapi\src\hlsyn\diffuse.c"
"D:\work\rnd\dapi\src\hlsyn\frame.c"
"D:\work\rnd\dapi\src\hlsyn\hlframe.c"
"D:\work\rnd\dapi\src\hlsyn\inithl.c"
"D:\work\rnd\dapi\src\hlsyn\llinit.c"
"D:\work\rnd\dapi\src\LTS\loaddict.c"
"D:\work\rnd\dapi\src\hlsyn\log10table.c"
"D:\work\rnd\dapi\src\LTS\ls_chari.c"
"D:\work\rnd\dapi\src\LTS\ls_dict.c"
"D:\work\rnd\dapi\src\LTS\ls_homo.c"
"D:\work\rnd\dapi\src\LTS\ls_math.c"
"D:\work\rnd\dapi\src\LTS\ls_proc.c"
"D:\work\rnd\dapi\src\LTS\ls_spel.c"
"D:\work\rnd\dapi\src\LTS\ls_speli.c"
"D:\work\rnd\dapi\src\LTS\ls_suff.c"
"D:\work\rnd\dapi\src\LTS\ls_suffi.c"
"D:\work\rnd\dapi\src\LTS\LSA_ADJU.C"
"D:\work\rnd\dapi\src\LTS\lsa_coni.c"
"D:\work\rnd\dapi\src\LTS\lsa_fr.c"
"D:\work\rnd\dapi\src\LTS\lsa_gr.c"
"D:\work\rnd\dapi\src\LTS\lsa_ir.c"
"D:\work\rnd\dapi\src\LTS\lsa_it.c"
"D:\work\rnd\dapi\src\LTS\lsa_ja.c"
"D:\work\rnd\dapi\src\LTS\lsa_rtbi.c"
"D:\work\rnd\dapi\src\LTS\lsa_rule.c"
"D:\work\rnd\dapi\src\LTS\lsa_sl.c"
"D:\work\rnd\dapi\src\LTS\lsa_sp.c"
"D:\work\rnd\dapi\src\LTS\lsa_task.c"
"D:\work\rnd\dapi\src\LTS\lsa_us.c"
"D:\work\rnd\dapi\src\LTS\lsa_util.c"
"D:\work\rnd\dapi\src\LTS\lsw_main.c"
"D:\work\rnd\dapi\src\NT\mmalloc.c"
"D:\work\rnd\dapi\src\hlsyn\nasalf1x.c"
"D:\work\rnd\dapi\src\NT\opthread.c"
"D:\work\rnd\dapi\src\CMD\par_ambi.c"
"D:\work\rnd\dapi\src\CMD\par_char.c"
"D:\work\rnd\dapi\src\CMD\par_dict.c"
"D:\work\rnd\dapi\src\CMD\par_pars.c"
"D:\work\rnd\dapi\src\CMD\par_rule.c"
"D:\work\rnd\dapi\src\PH\ph_aloph.c"
"D:\work\rnd\dapi\src\PH\ph_claus.c"
"D:\work\rnd\dapi\src\PH\ph_draw.c"
"D:\work\rnd\dapi\src\PH\ph_drwt0.c"
"D:\work\rnd\dapi\src\PH\ph_inton.c"
"D:\work\rnd\dapi\src\PH\ph_main.c"
"D:\work\rnd\dapi\src\PH\ph_romi.c"
"D:\work\rnd\dapi\src\PH\ph_setar.c"
"D:\work\rnd\dapi\src\PH\ph_sort.c"
"D:\work\rnd\dapi\src\PH\ph_syl.c"
"D:\work\rnd\dapi\src\PH\ph_syntx.c"
"D:\work\rnd\dapi\src\PH\ph_task.c"
"D:\work\rnd\dapi\src\PH\ph_timng.c"
"D:\work\rnd\dapi\src\PH\ph_vdefi.c"
"D:\work\rnd\dapi\src\PH\ph_vset.c"
"D:\work\rnd\dapi\src\PH\phinit.c"
"D:\work\rnd\dapi\src\PH\phlog.c"
"D:\work\rnd\dapi\src\NT\pipe.c"
"D:\work\rnd\dapi\src\NT\playaud.c"
"D:\work\rnd\dapi\src\VTM\playtone.c"
"D:\work\rnd\dapi\src\hlsyn\reson.c"
"D:\work\rnd\dapi\src\hlsyn\sample.c"
"D:\work\rnd\dapi\src\KERNEL\services.c"
"D:\work\rnd\dapi\src\NT\spc.c"
"D:\work\rnd\dapi\src\hlsyn\sqrttable.c"
"D:\work\rnd\dapi\src\VTM\sync.c"
"D:\work\rnd\dapi\src\API\ttsapi.c"
"D:\work\rnd\dapi\src\KERNEL\Usa_init.c"
"D:\work\rnd\dapi\src\hlsyn\voice.c"
"D:\work\rnd\dapi\src\VTM\vtm.c"
"D:\work\rnd\dapi\src\VTM\vtmiont.c"
"D:\work\rnd\dapi\src\ce\wince.c"
]
Creating command line "clarm.exe @C:\DOCUME~1\berrios\LOCALS~1\Temp\RSP72F.tmp" 
Creating temporary file "C:\DOCUME~1\berrios\LOCALS~1\Temp\RSP730.tmp" with contents
[
/nologo /out:".\..\build\cestatic\arm\us\release\dtstatic.lib" 
\work\rnd\dapi\build\cestatic\arm\us\release\link\acxf1c.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\brent.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\circuit.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\cm_char.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\cm_cmd.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\cm_copt.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\cm_main.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\cm_pars.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\cm_phon.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\cm_text.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\cm_util.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\Cmd_init.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\cmd_wav.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\CRYPT2.OBJ
\work\rnd\dapi\build\cestatic\arm\us\release\link\dbgwins.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\DECSTD97.OBJ
\work\rnd\dapi\build\cestatic\arm\us\release\link\diffuse.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\frame.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\hlframe.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\inithl.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\llinit.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\loaddict.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\log10table.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\ls_chari.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\ls_dict.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\ls_homo.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\ls_math.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\ls_proc.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\ls_spel.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\ls_speli.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\ls_suff.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\ls_suffi.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\LSA_ADJU.OBJ
\work\rnd\dapi\build\cestatic\arm\us\release\link\lsa_coni.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\lsa_fr.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\lsa_gr.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\lsa_ir.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\lsa_it.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\lsa_ja.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\lsa_rtbi.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\lsa_rule.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\lsa_sl.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\lsa_sp.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\lsa_task.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\lsa_us.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\lsa_util.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\lsw_main.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\mmalloc.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\nasalf1x.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\opthread.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\par_ambi.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\par_char.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\par_dict.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\par_pars.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\par_rule.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\ph_aloph.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\ph_claus.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\ph_draw.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\ph_drwt0.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\ph_inton.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\ph_main.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\ph_romi.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\ph_setar.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\ph_sort.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\ph_syl.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\ph_syntx.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\ph_task.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\ph_timng.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\ph_vdefi.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\ph_vset.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\phinit.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\phlog.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\pipe.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\playaud.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\playtone.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\reson.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\sample.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\services.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\spc.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\sqrttable.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\sync.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\ttsapi.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\Usa_init.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\voice.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\vtm.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\vtmiont.obj
\work\rnd\dapi\build\cestatic\arm\us\release\link\wince.obj
]
Creating command line "link.exe -lib @C:\DOCUME~1\berrios\LOCALS~1\Temp\RSP730.tmp"
<h3>Output Window</h3>
Compiling...
acxf1c.c
brent.c
circuit.c
cm_char.c
cm_cmd.c
cm_copt.c
cm_main.c
cm_pars.c
cm_phon.c
cm_text.c
cm_util.c
D:\work\rnd\dapi\src\CMD\cm_util.c(780) : warning C4090: '=' : different 'const' qualifiers
Cmd_init.c
cmd_wav.c
D:\work\rnd\dapi\src\CMD\cmd_wav.c(260) : warning C4047: 'function' : 'unsigned short *' differs in levels of indirection from 'unsigned short (*)[128]'
D:\work\rnd\dapi\src\CMD\cmd_wav.c(260) : warning C4024: 'MultiByteToWideChar' : different types for formal and actual parameter 5
D:\work\rnd\dapi\src\CMD\cmd_wav.c(265) : warning C4047: 'function' : 'const unsigned short *' differs in levels of indirection from 'unsigned short (*)[128]'
D:\work\rnd\dapi\src\CMD\cmd_wav.c(265) : warning C4024: 'sndPlaySoundW' : different types for formal and actual parameter 1
CRYPT2.C
dbgwins.c
DECSTD97.C
diffuse.c
frame.c
hlframe.c
inithl.c
llinit.c
loaddict.c
log10table.c
ls_chari.c
ls_dict.c
ls_homo.c
ls_math.c
D:\work\rnd\dapi\src\LTS\ls_math.c(93) : warning C4090: '=' : different 'const' qualifiers
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
lsa_us.c
lsa_util.c
.\ph\ph_prot.h(103) : warning C4028: formal parameter 1 different from declaration
.\ph\ph_prot.h(107) : warning C4028: formal parameter 1 different from declaration
lsw_main.c
mmalloc.c
nasalf1x.c
opthread.c
par_ambi.c
par_char.c
par_dict.c
par_pars.c
par_rule.c
ph_aloph.c
ph_claus.c
ph_draw.c
ph_drwt0.c
ph_inton.c
D:\work\rnd\dapi\src\PH\ph_inton2.c(1399) : warning C4761: integral size mismatch in argument; conversion supplied
D:\work\rnd\dapi\src\PH\ph_inton2.c(1450) : warning C4761: integral size mismatch in argument; conversion supplied
ph_main.c
ph_romi.c
ph_setar.c
ph_sort.c
D:\work\rnd\dapi\src\PH\ph_sort.c(1146) : warning C4102: 'stzapped' : unreferenced label
ph_syl.c
ph_syntx.c
ph_task.c
ph_timng.c
D:\work\rnd\dapi\src\PH\p_us_tim.c(136) : warning C4101: 'tmp' : unreferenced local variable
ph_vdefi.c
ph_vset.c
D:\work\rnd\dapi\src\PH\ph_vset.c(197) : warning C4090: '=' : different 'const' qualifiers
D:\work\rnd\dapi\src\PH\ph_vset.c(411) : warning C4013: 'changeSpeakerValues' undefined; assuming extern returning int
D:\work\rnd\dapi\src\PH\ph_vset.c(636) : warning C4018: '>' : signed/unsigned mismatch
phinit.c
phlog.c
pipe.c
playaud.c
D:\work\rnd\dapi\src\NT\playaud.c(4796) : warning C4133: 'function' : incompatible types - from 'char [33]' to 'const unsigned short *'
D:\work\rnd\dapi\src\NT\playaud.c(4805) : warning C4133: 'function' : incompatible types - from 'char [33]' to 'const unsigned short *'
playtone.c
reson.c
sample.c
D:\work\rnd\dapi\src\hlsyn\sample.c(45) : warning C4013: 'next_voice_sample' undefined; assuming extern returning int
D:\work\rnd\dapi\src\hlsyn\sample.c(45) : warning C4244: '=' : conversion from 'int ' to 'float ', possible loss of data
services.c
spc.c
sqrttable.c
sync.c
D:\work\rnd\dapi\src\VTM\sync.c(337) : warning C4244: '=' : conversion from 'unsigned long ' to 'unsigned short ', possible loss of data
D:\work\rnd\dapi\src\VTM\sync.c(338) : warning C4244: '=' : conversion from 'unsigned long ' to 'unsigned short ', possible loss of data
ttsapi.c
D:\work\rnd\dapi\src\API\ttsapi.c(1981) : warning C4047: '==' : 'unsigned int ' differs in levels of indirection from 'void *'
D:\work\rnd\dapi\src\API\ttsapi.c(5136) : warning C4133: 'function' : incompatible types - from 'unsigned short *' to 'const char *'
D:\work\rnd\dapi\src\API\ttsapi.c(5136) : warning C4133: 'function' : incompatible types - from 'unsigned short *' to 'const char *'
D:\work\rnd\dapi\src\API\ttsapi.c(8049) : warning C4047: '==' : 'unsigned long ' differs in levels of indirection from 'void *'
This is NOT a USERDIC_COMPILE
D:\work\rnd\dapi\src\API\ttsapi.c(11685) : warning C4133: 'function' : incompatible types - from 'unsigned short *' to 'char *'
D:\work\rnd\dapi\src\API\ttsapi.c(11017) : warning C4700: local variable 'sdef' used without having been initialized
D:\work\rnd\dapi\src\API\ttsapi.c(12062) : warning C4716: 'TextToSpeechReserved5' : must return a value
Usa_init.c
D:\work\rnd\dapi\src\KERNEL\Usa_init.c(250) : warning C4090: '=' : different 'const' qualifiers
D:\work\rnd\dapi\src\KERNEL\Usa_init.c(251) : warning C4090: '=' : different 'const' qualifiers
D:\work\rnd\dapi\src\KERNEL\Usa_init.c(265) : warning C4090: '=' : different 'const' qualifiers
D:\work\rnd\dapi\src\KERNEL\Usa_init.c(266) : warning C4090: '=' : different 'const' qualifiers
D:\work\rnd\dapi\src\KERNEL\Usa_init.c(280) : warning C4090: '=' : different 'const' qualifiers
D:\work\rnd\dapi\src\KERNEL\Usa_init.c(281) : warning C4090: '=' : different 'const' qualifiers
D:\work\rnd\dapi\src\KERNEL\Usa_init.c(295) : warning C4090: '=' : different 'const' qualifiers
D:\work\rnd\dapi\src\KERNEL\Usa_init.c(296) : warning C4090: '=' : different 'const' qualifiers
D:\work\rnd\dapi\src\KERNEL\Usa_init.c(310) : warning C4090: '=' : different 'const' qualifiers
D:\work\rnd\dapi\src\KERNEL\Usa_init.c(311) : warning C4090: '=' : different 'const' qualifiers
D:\work\rnd\dapi\src\KERNEL\Usa_init.c(325) : warning C4090: '=' : different 'const' qualifiers
D:\work\rnd\dapi\src\KERNEL\Usa_init.c(326) : warning C4090: '=' : different 'const' qualifiers
voice.c
vtm.c
D:\work\rnd\dapi\src\VTM\vtm3.c(888) : warning C4244: '=' : conversion from 'float ' to 'short ', possible loss of data
D:\work\rnd\dapi\src\VTM\vtm3.c(1227) : warning C4133: 'function' : incompatible types - from 'int *' to 'short *'
D:\work\rnd\dapi\src\VTM\vtm3.c(1922) : warning C4018: '>' : signed/unsigned mismatch
D:\work\rnd\dapi\src\VTM\vtm3.c(1935) : warning C4018: '>' : signed/unsigned mismatch
vtmiont.c
D:\work\rnd\dapi\src\VTM\vtmiont.c(525) : warning C4101: 'tmp' : unreferenced local variable
wince.c
Creating library...



<h3>Results</h3>
dtstatic.lib - 0 error(s), 45 warning(s)
</pre>
</body>
</html>
