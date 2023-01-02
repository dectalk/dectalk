list(APPEND SAY_DEFINES _REENTRANT NOMME LTSSIM TTSSIM ANSI BLD_DECTALK_DLL ENGLISH ENGLISH_US ACNA DECTALK_INSTALL_PREFIX="/opt/dectalk" PACKAGE_URL="https://github.com/dectalk/dectalk" PACKAGE_VERSION="6.0" ACCESS32 TYPING_MODE USE_PULSEAUDIO)

add_executable(
  say
  say.c
)

find_package(PkgConfig REQUIRED libpulse-simple)
pkg_check_modules(PULSEAUDIO REQUIRED IMPORTED_TARGET libpulse-simple)

target_include_directories(
  say
  PRIVATE
  ../../..
  ${HEADER_OUTPUT_DIRECTORY}
)

target_compile_definitions(
  say
  PUBLIC
  ${SAY_DEFINES}
)
target_link_libraries(
  say
  PRIVATE
  dectalk
  PkgConfig::PULSEAUDIO
)
