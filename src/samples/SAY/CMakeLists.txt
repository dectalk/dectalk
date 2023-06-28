
add_executable(
  say
  say.c
)

target_include_directories(
  say
  PUBLIC
  ../../dapi/src/api
  ../../dapi/src/nt
)

target_link_libraries(say dectalk shell32.lib)

target_compile_definitions(
  say
  PUBLIC
  WIN32
  UNICODE
  NDEBUG
  _WINDOWS
  ENGLISH_US
  ENGLISH
)
