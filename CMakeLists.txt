cmake_minimum_required(VERSION 3.25.1)
project(dectalk)
set(CMAKE_C_STANDARD 99)
set(CMAKE_CXX_STANDARD 11)

# DECtalk API

set(
  DAPI_SOURCE_FILES
  src/dapi/src/dectalk.def
  src/dapi/src/api/crypt2.c
  src/dapi/src/api/decstd97.c
  src/dapi/src/api/ttsapi.c
  src/dapi/src/cmd/cmd_init.c
  src/dapi/src/cmd/cmd_wav.c
  src/dapi/src/cmd/cm_char.c
  src/dapi/src/cmd/cm_cmd.c
  src/dapi/src/cmd/cm_copt.c
  src/dapi/src/cmd/cm_main.c
  src/dapi/src/cmd/cm_pars.c
  src/dapi/src/cmd/cm_phon.c
  src/dapi/src/cmd/cm_text.c
  src/dapi/src/cmd/cm_util.c
  src/dapi/src/cmd/par_ambi.c
  src/dapi/src/cmd/par_char.c
  src/dapi/src/cmd/par_dict.c
  src/dapi/src/cmd/par_pars.c
  src/dapi/src/cmd/par_rule.c
  src/dapi/src/hlsyn/acxf1c.c
  src/dapi/src/hlsyn/brent.c
  src/dapi/src/hlsyn/circuit.c
  src/dapi/src/hlsyn/frame.c
  src/dapi/src/hlsyn/hlframe.c
  src/dapi/src/hlsyn/inithl.c
  src/dapi/src/hlsyn/llinit.c
  src/dapi/src/hlsyn/log10table.c
  src/dapi/src/hlsyn/nasalf1x.c
  src/dapi/src/hlsyn/reson.c
  src/dapi/src/hlsyn/sample.c
  src/dapi/src/hlsyn/sqrttable.c
  src/dapi/src/hlsyn/voice.c
  src/dapi/src/kernel/services.c
  src/dapi/src/kernel/usa_init.c
  src/dapi/src/lts/loaddict.c
  src/dapi/src/lts/lsa_adju.c
  src/dapi/src/lts/lsa_coni.c
  src/dapi/src/lts/lsa_fr.c
  src/dapi/src/lts/lsa_gr.c
  src/dapi/src/lts/lsa_ir.c
  src/dapi/src/lts/lsa_it.c
  src/dapi/src/lts/lsa_ja.c
  src/dapi/src/lts/lsa_rtbi.c
  src/dapi/src/lts/lsa_rule.c
  src/dapi/src/lts/lsa_sl.c
  src/dapi/src/lts/lsa_sp.c
  src/dapi/src/lts/lsa_task.c
  src/dapi/src/lts/lsa_us.c
  src/dapi/src/lts/lsa_util.c
  src/dapi/src/lts/lsw_main.c
  src/dapi/src/lts/ls_chari.c
  src/dapi/src/lts/ls_dict.c
  src/dapi/src/lts/ls_homo.c
  src/dapi/src/lts/ls_math.c
  src/dapi/src/lts/ls_proc.c
  src/dapi/src/lts/ls_spel.c
  src/dapi/src/lts/ls_speli.c
  src/dapi/src/lts/ls_suff.c
  src/dapi/src/lts/ls_suffi.c
  src/dapi/src/nt/dbgwins.c
  src/dapi/src/nt/mmalloc.c
  src/dapi/src/nt/opthread.c
  src/dapi/src/nt/pipe.c
  src/dapi/src/nt/playaud.c
  src/dapi/src/nt/spc.c
  src/dapi/src/ph/phinit.c
  src/dapi/src/ph/phlog.c
  src/dapi/src/ph/phprint.c
  src/dapi/src/ph/ph_aloph.c
  src/dapi/src/ph/ph_claus.c
  src/dapi/src/ph/ph_draw.c
  src/dapi/src/ph/ph_drwt0.c
  src/dapi/src/ph/ph_inton.c
  src/dapi/src/ph/ph_main.c
  src/dapi/src/ph/ph_romi.c
  src/dapi/src/ph/ph_setar.c
  src/dapi/src/ph/ph_sort.c
  src/dapi/src/ph/ph_syl.c
  src/dapi/src/ph/ph_syntx.c
  src/dapi/src/ph/ph_task.c
  src/dapi/src/ph/ph_timng.c
  src/dapi/src/ph/ph_vdefi.c
  src/dapi/src/ph/ph_vset.c
  src/dapi/src/vtm/playtone.c
  src/dapi/src/vtm/sync.c
  src/dapi/src/vtm/vtm.c
  src/dapi/src/vtm/vtmiont.c
)

add_library(dectalk SHARED
  ${DAPI_SOURCE_FILES}
)
target_include_directories(
  dectalk
  PRIVATE
  src/dapi/src/api
  src/dapi/src/cmd
  src/dapi/src/hlsyn
  src/dapi/src/include
  src/dapi/src/lts
  src/dapi/src/nt
  src/dapi/src/ph
  src/dapi/src/protos
  src/dapi/src/vtm
  src/dapi/src/kernel
  src
)

target_include_directories(
  dectalk
  PUBLIC
  src/dapi/src/api
)

target_compile_definitions(
  dectalk
  PRIVATE
  WIN32;DECTALKAPI_EXPORTS;_WINDOWS;_USRDLL;USE_CORE_DLL;ACNA;BLD_DECTALK_DLL;ENGLISH_US;ENGLISH;NDEBUG;AMD64
)


add_executable(
  speak WIN32
  src/samples/speak/speak.def
  src/samples/speak/speak.rc
  src/samples/speak/Speak.c
)

target_include_directories(
  speak
  PUBLIC
  src/dapi/src/api
  src/dapi/src/nt
  src/samples/speak
)

add_executable(
  dict
  src/dapi/src/dic/dic.c
)

target_include_directories(
  dict
  PRIVATE
  src/dapi/src/api
  src/dapi/src/cmd
  src/dapi/src/hlsyn
  src/dapi/src/include
  src/dapi/src/lts
  src/dapi/src/nt
  src/dapi/src/ph
  src/dapi/src/protos
  src/dapi/src/vtm
  src
)

target_link_libraries(dectalk winmm.lib ucrt.lib vcruntime.lib)
target_link_libraries(speak dectalk winmm.lib ucrt.lib vcruntime.lib)

target_compile_definitions(
  speak
  PUBLIC
  WIN32
  UNICODE
  NDEBUG
  _WINDOWS
  ENGLISH_US
  ENGLISH
)


target_compile_definitions(
  dict
  PUBLIC
  WIN32;NDEBUG;_CONSOLE;ENGLISH_US;ENGLISH;WINDIC
)

add_custom_command(TARGET dict POST_BUILD
  COMMAND dict ${CMAKE_CURRENT_SOURCE_DIR}/src/dapi/src/dic/Dic_us.txt $<TARGET_FILE_DIR:dict>/dtalk_us.dic /t:win32
)
