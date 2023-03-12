list(
  APPEND DAPI_SOURCE_FILES
  
  dectalk.def

  api/crypt2.c        api/decstd97.c      api/ttsapi.c

  cmd/cmd_init.c      cmd/cmd_wav.c       cmd/cm_char.c
  cmd/cm_cmd.c        cmd/cm_copt.c       cmd/cm_main.c
  cmd/cm_pars.c       cmd/cm_phon.c       cmd/cm_text.c
  cmd/cm_util.c       cmd/par_ambi.c      cmd/par_char.c
  cmd/par_dict.c      cmd/par_pars.c      cmd/par_rule.c

  hlsyn/acxf1c.c      hlsyn/brent.c       hlsyn/circuit.c
  hlsyn/frame.c       hlsyn/hlframe.c     hlsyn/inithl.c
  hlsyn/llinit.c      hlsyn/log10table.c  hlsyn/nasalf1x.c
  hlsyn/reson.c       hlsyn/sample.c      hlsyn/sqrttable.c
  hlsyn/voice.c

  kernel/services.c   kernel/usa_init.c

  lts/loaddict.c      lts/lsa_adju.c    lts/lsa_coni.c
  lts/lsa_fr.c        lts/lsa_gr.c      lts/lsa_ir.c
  lts/lsa_it.c        lts/lsa_ja.c      lts/lsa_rtbi.c
  lts/lsa_rule.c      lts/lsa_sl.c      lts/lsa_sp.c
  lts/lsa_task.c      lts/lsa_us.c      lts/lsa_util.c
  lts/lsw_main.c      lts/ls_chari.c    lts/ls_dict.c
  lts/ls_homo.c       lts/ls_math.c     lts/ls_proc.c
  lts/ls_spel.c       lts/ls_speli.c    lts/ls_suff.c
  lts/ls_suffi.c

  nt/mmalloc.c        nt/opthread.c     nt/pipe.c
  nt/playaud.c        nt/spc.c

  ph/phinit.c         ph/phlog.c        ph/phprint.c
  ph/ph_aloph.c       ph/ph_claus.c     ph/ph_draw.c
  ph/ph_drwt0.c       ph/ph_inton.c     ph/ph_main.c
  ph/ph_romi.c        ph/ph_setar.c     ph/ph_sort.c
  ph/ph_syl.c         ph/ph_syntx.c     ph/ph_task.c
  ph/ph_timng.c       ph/ph_vdefi.c     ph/ph_vset.c

  vtm/playtone.c      vtm/sync.c        vtm/vtm.c
  vtm/vtmiont.c
)

# Check between Win32 and UNIX compliant machines.
if (EMSCRIPTEN)
  list(APPEND DAPI_SOURCE_FILES nt/disable_audio.c api/init.c osf/loadable.c osf/dtmmio.c)
  list(APPEND DAPI_LINK_LIBS m)
  list(APPEND DAPI_DEFINES
    _REENTRANT
    NOMME
    LTSSIM
    TTSSIM
    ANSI
    BLD_DECTALK_DLL
    ENGLISH
    ENGLISH_US
    ACNA
    ACCESS32
    TYPING_MODE
    DISABLE_AUDIO
    OS_SIXTY_FOUR_BIT
  )
elseif (WIN32)
  list(APPEND DAPI_SOURCE_FILES nt/dbgwins.c)
  list(APPEND DAPI_LINK_LIBS winmm.lib ucrt.lib vcruntime.lib)
  list(APPEND DAPI_DEFINES WIN32 DECTALKAPI_EXPORTS _WINDOWS _USRDLL USE_CORE_DLL ACNA BLD_DECTALK_DLL ENGLISH_US ENGLISH NDEBUG AMD64)
elseif (UNIX)
  if (APPLE)
    list(APPEND DAPI_LINK_LIBS portaudio "-framework CoreAudio" "-framework AudioToolbox")
  else()
    find_package(OpenAL REQUIRED)
    
    # Assume that non-Apple machines are Linux.
    list(APPEND DAPI_LINK_LIBS pulse-simple pulse ${OPENAL_LIBRARY})
    list(APPEND DAPI_DEFINES USE_PULSEAUDIO)
    list(APPEND DAPI_INCLUDES ${OPENAL_INCLUDE_DIR})
  endif()

  list(APPEND DAPI_SOURCE_FILES nt/linux_audio.c api/init.c osf/loadable.c osf/dtmmio.c)
  list(APPEND DAPI_LINK_LIBS pthread c m)
  list(APPEND DAPI_DEFINES
    _REENTRANT
    NOMME
    LTSSIM
    TTSSIM
    ANSI
    BLD_DECTALK_DLL
    ENGLISH
    ENGLISH_US
    ACNA
    ACCESS32
    TYPING_MODE
  )
endif()


add_library(dectalk SHARED ${DAPI_SOURCE_FILES})
target_link_libraries(dectalk PUBLIC ${DAPI_LINK_LIBS})
target_compile_definitions(dectalk PUBLIC ${DAPI_DEFINES})

if (EMSCRIPTEN)
  set_target_properties(dectalk PROPERTIES LINK_FLAGS "-g3 -pthread -sPROXY_TO_PTHREAD -gsource-map --source-map-base http://localhost:8080/ --disable-shared -s SIDE_MODULE=1 -s LINKABLE=1 -s EXPORT_ALL=1 -s ALLOW_MEMORY_GROWTH=1")
elseif(APPLE)
  set_target_properties(
    dectalk
    PROPERTIES
    LINK_FLAGS "-W1, -F/Library/Frameworks"
  )
endif()

target_include_directories(
  dectalk PRIVATE
  api cmd hlsyn include lts nt ph protos vtm kernel osf ../.. ${DAPI_INCLUDES}
)

file(
  COPY osf/dtmmedefs.h
  DESTINATION ${HEADER_OUTPUT_DIRECTORY}/dtk
)
file(
  COPY api/ttsapi.h
  DESTINATION ${HEADER_OUTPUT_DIRECTORY}/dtk
)
