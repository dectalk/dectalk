list(APPEND WINDIC_DEFINES
  _REENTRANT
  NOMME
  LTSSIM
  TTSSIM
  ANSI
  BLD_DECTALK_DLL
  ENGLISH
  ENGLISH_US
  ACNA
  DECTALK_INSTALL_PREFIX="/opt/dectalk"
  PACKAGE_URL="https://github.com/dectalk/dectalk"
  PACKAGE_VERSION="6.0"
  ACCESS32
  TYPING_MODE 
  USE_PULSEAUDIO
)

add_executable(
  windic
  windic.c
  compile_dict.c
)

find_package(GTK2 2.0 REQUIRED gtk)
find_package(PkgConfig REQUIRED libpulse-simple)
pkg_check_modules(PULSEAUDIO REQUIRED IMPORTED_TARGET libpulse-simple)

target_include_directories(
  windic
  PRIVATE
  ../../..
  ../../../dapi/src/osf
  ../../../dapi/src/api
  ../../../dapi/src/nt
  ../../../dapi/src/include
  ${HEADER_OUTPUT_DIRECTORY}
  ${GTK2_INCLUDE_DIRS}
)

target_compile_definitions(
  windic
  PUBLIC
  ${WINDIC_DEFINES}
)
target_link_libraries(
  windic
  PRIVATE
  dectalk
  ${GTK2_LIBRARIES}
  PkgConfig::PULSEAUDIO
)

