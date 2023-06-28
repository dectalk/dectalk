
add_executable(
  speak WIN32
  speak.def
  speak.rc
  Speak.c
)

target_include_directories(
  speak
  PUBLIC
  ../../dapi/src/api
  ../../dapi/src/nt
)

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
