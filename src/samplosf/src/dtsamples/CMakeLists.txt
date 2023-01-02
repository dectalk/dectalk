list(APPEND DTSAMPLES_DEFINES _REENTRANT NOMME LTSSIM TTSSIM ANSI BLD_DECTALK_DLL ENGLISH ENGLISH_US ACNA DECTALK_INSTALL_PREFIX="/opt/dectalk" PACKAGE_URL="https://github.com/dectalk/dectalk" PACKAGE_VERSION="6.0" ACCESS32 TYPING_MODE USE_PULSEAUDIO)


find_package(PkgConfig REQUIRED libpulse-simple)
pkg_check_modules(PULSEAUDIO REQUIRED IMPORTED_TARGET libpulse-simple)

add_executable(say say.c)
target_include_directories(say PRIVATE ../../.. ${HEADER_OUTPUT_DIRECTORY})
target_compile_definitions(say PUBLIC ${DTSAMPLES_DEFINES})
target_link_libraries(say PRIVATE dectalk PkgConfig::PULSEAUDIO)
add_executable(aclock aclock.c)
target_include_directories(aclock PRIVATE ../../.. ${HEADER_OUTPUT_DIRECTORY})
target_compile_definitions(aclock PUBLIC ${DTSAMPLES_DEFINES})
target_link_libraries(aclock PRIVATE dectalk PkgConfig::PULSEAUDIO)
add_executable(dtmemory dtmemory.c)
target_include_directories(dtmemory PRIVATE ../../.. ${HEADER_OUTPUT_DIRECTORY})
target_compile_definitions(dtmemory PUBLIC ${DTSAMPLES_DEFINES})
target_link_libraries(dtmemory PRIVATE dectalk PkgConfig::PULSEAUDIO)
