
add_executable(
  windic WIN32
  windic.def
  windic.rc
  windic.c
  usedic.c
)

target_include_directories(
  windic
  PUBLIC
  ../../dapi/src/api
  ../../dapi/src/include
  ../..
  ../../dapi/src/nt
)

target_link_libraries(windic dectalk winmm.lib ucrt.lib vcruntime.lib)

target_compile_definitions(
  windic
  PUBLIC
  WIN32
  UNICODE
  NDEBUG
  _WINDOWS
  ENGLISH_US
  ENGLISH
)

