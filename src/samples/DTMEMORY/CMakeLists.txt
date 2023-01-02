
add_executable(
  dtmemory WIN32
  dtmemory.c
  dtmemory.rc
)

target_include_directories(
  dtmemory
  PUBLIC
  ../../dapi/src/api
  ../../dapi/src/nt
)

target_link_libraries(dtmemory dectalk kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib)

target_compile_definitions(
  dtmemory
  PUBLIC
  WIN32
  UNICODE
  NDEBUG
  _WINDOWS
  ENGLISH_US
  ENGLISH
)
