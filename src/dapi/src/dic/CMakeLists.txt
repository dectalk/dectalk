add_executable(dict dic.c)

if (WIN32)
  list(APPEND DICT_DEFINES WIN32;NDEBUG;_CONSOLE;ENGLISH_US;ENGLISH;WINDIC)
  set(DICT_OUTPUT_FOLDER "")
  elseif (UNIX)
  list(APPEND DICT_DEFINES _REENTRANT NOMME LTSSIM TTSSIM ANSI BLD_DECTALK_DLL ENGLISH ENGLISH_US ACNA DECTALK_INSTALL_PREFIX="/opt/dectalk" ACCESS32 TYPING_MODE)
  set(DICT_OUTPUT_FOLDER "/dic")
endif()

target_compile_definitions(dict PRIVATE ${DICT_DEFINES})

target_include_directories(
  dict
  PRIVATE
  ../api
  ../cmd
  ../hlsyn
  ../include
  ../lts
  ../nt
  ../ph
  ../protos
  ../vtm
  ../../..
)

add_custom_command(TARGET dict POST_BUILD
  COMMAND ${CMAKE_COMMAND} -E make_directory "$<TARGET_FILE_DIR:dict>${DICT_OUTPUT_FOLDER}"
  COMMAND dict ${CMAKE_CURRENT_SOURCE_DIR}/Dic_us.txt "$<TARGET_FILE_DIR:dict>${DICT_OUTPUT_FOLDER}/dtalk_us.dic"
)
