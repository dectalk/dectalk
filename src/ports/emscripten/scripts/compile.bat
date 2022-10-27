emcc -Wall -fPIC ^
  "../../dapi/src/api/crypt2.c" ^
  "../../dapi/src/api/decstd97.c" ^
  "../../dapi/src/api/ttsapi.c" ^
  "../../dapi/src/cmd/cmd_init.c" ^
  "../../dapi/src/cmd/cmd_wav.c" ^
  "../../dapi/src/cmd/cm_char.c" ^
  "../../dapi/src/cmd/cm_cmd.c" ^
  "../../dapi/src/cmd/cm_copt.c" ^
  "../../dapi/src/cmd/cm_main.c" ^
  "../../dapi/src/cmd/cm_pars.c" ^
  "../../dapi/src/cmd/cm_phon.c" ^
  "../../dapi/src/cmd/cm_text.c" ^
  "../../dapi/src/cmd/cm_util.c" ^
  "../../dapi/src/cmd/par_ambi.c" ^
  "../../dapi/src/cmd/par_char.c" ^
  "../../dapi/src/cmd/par_dict.c" ^
  "../../dapi/src/cmd/par_pars.c" ^
  "../../dapi/src/cmd/par_rule.c" ^
  "../../dapi/src/hlsyn/acxf1c.c" ^
  "../../dapi/src/hlsyn/brent.c" ^
  "../../dapi/src/hlsyn/circuit.c" ^
  "../../dapi/src/hlsyn/frame.c" ^
  "../../dapi/src/hlsyn/hlframe.c" ^
  "../../dapi/src/hlsyn/inithl.c" ^
  "../../dapi/src/hlsyn/llinit.c" ^
  "../../dapi/src/hlsyn/log10table.c" ^
  "../../dapi/src/hlsyn/nasalf1x.c" ^
  "../../dapi/src/hlsyn/reson.c" ^
  "../../dapi/src/hlsyn/sample.c" ^
  "../../dapi/src/hlsyn/sqrttable.c" ^
  "../../dapi/src/hlsyn/voice.c" ^
  "../../dapi/src/kernel/services.c" ^
  "../../dapi/src/kernel/usa_init.c" ^
  "../../dapi/src/lts/loaddict.c" ^
  "../../dapi/src/lts/lsa_adju.c" ^
  "../../dapi/src/lts/lsa_coni.c" ^
  "../../dapi/src/lts/lsa_fr.c" ^
  "../../dapi/src/lts/lsa_gr.c" ^
  "../../dapi/src/lts/lsa_ir.c" ^
  "../../dapi/src/lts/lsa_it.c" ^
  "../../dapi/src/lts/lsa_ja.c" ^
  "../../dapi/src/lts/lsa_rtbi.c" ^
  "../../dapi/src/lts/lsa_rule.c" ^
  "../../dapi/src/lts/lsa_sl.c" ^
  "../../dapi/src/lts/lsa_sp.c" ^
  "../../dapi/src/lts/lsa_task.c" ^
  "../../dapi/src/lts/lsa_us.c" ^
  "../../dapi/src/lts/lsa_util.c" ^
  "../../dapi/src/lts/lsw_main.c" ^
  "../../dapi/src/lts/ls_chari.c" ^
  "../../dapi/src/lts/ls_dict.c" ^
  "../../dapi/src/lts/ls_homo.c" ^
  "../../dapi/src/lts/ls_math.c" ^
  "../../dapi/src/lts/ls_proc.c" ^
  "../../dapi/src/lts/ls_spel.c" ^
  "../../dapi/src/lts/ls_speli.c" ^
  "../../dapi/src/lts/ls_suff.c" ^
  "../../dapi/src/lts/ls_suffi.c" ^
  "../../dapi/src/osf/dtmmio.c" ^
  "../../dapi/src/osf/loadable.c" ^
  "../../dapi/src/osf/playstub.c" ^
  "../../dapi/src/nt/dbgwins.c" ^
  "../../dapi/src/nt/disable_audio.c" ^
  "../../dapi/src/nt/mmalloc.c" ^
  "../../dapi/src/nt/opthread.c" ^
  "../../dapi/src/nt/pipe.c" ^
  "../../dapi/src/nt/spc.c" ^
  "../../dapi/src/ph/phinit.c" ^
  "../../dapi/src/ph/phlog.c" ^
  "../../dapi/src/ph/phprint.c" ^
  "../../dapi/src/ph/ph_aloph.c" ^
  "../../dapi/src/ph/ph_claus.c" ^
  "../../dapi/src/ph/ph_draw.c" ^
  "../../dapi/src/ph/ph_drwt0.c" ^
  "../../dapi/src/ph/ph_inton.c" ^
  "../../dapi/src/ph/ph_main.c" ^
  "../../dapi/src/ph/ph_romi.c" ^
  "../../dapi/src/ph/ph_setar.c" ^
  "../../dapi/src/ph/ph_sort.c" ^
  "../../dapi/src/ph/ph_syl.c" ^
  "../../dapi/src/ph/ph_syntx.c" ^
  "../../dapi/src/ph/ph_task.c" ^
  "../../dapi/src/ph/ph_timng.c" ^
  "../../dapi/src/ph/ph_vdefi.c" ^
  "../../dapi/src/ph/ph_vset.c" ^
  "../../dapi/src/vtm/playtone.c" ^
  "../../dapi/src/vtm/sync.c" ^
  "../../dapi/src/vtm/vtm.c" ^
  "../../dapi/src/vtm/vtmiont.c" ^
  -I "./src" ^
  -I "../.." ^
  -I "../../dapi/src" ^
  -I "../../dapi/src/api" ^
  -I "../../dapi/src/cmd" ^
  -I "../../dapi/src/dic" ^
  -I "../../dapi/src/include" ^
  -I "../../dapi/src/kernel" ^
  -I "../../dapi/src/lts" ^
  -I "../../dapi/src/osf" ^
  -I "../../dapi/src/ph" ^
  -I "../../dapi/src/protos" ^
  -I "../../dapi/src/vtm" ^
  -I "../../dapi/src/nt" ^
  -D _REENTRANT ^
  -D NOMME ^
  -D LTSSIM ^
  -D TTSSIM ^
  -D ANSI ^
  -D BLD_DECTALK_DLL ^
  -D ENGLISH ^
  -D ENGLISH_US ^
  -D ACCESS32 ^
  -D TYPING_MODE ^
  -D USE_SDL ^
  -D OS_SIXTY_FOUR_BIT ^
  -D ACNA ^
  -D DISABLE_AUDIO ^
  -s SIDE_MODULE=1 ^
  -s LINKABLE=1 ^
  -s EXPORT_ALL=1 ^
  -pthread ^
  -gsource-map ^
  --source-map-base http://127.0.0.1:8080/ ^
  --emit-symbol-map ^
  -g4 ^
  -o ../../dapi.wasm
