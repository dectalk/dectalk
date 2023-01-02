add_executable(
  windic
  windic.c
  compile_dict.c
)

find_package(GTK2 2.0 REQUIRED gtk)

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

target_link_libraries(
  windic
  PRIVATE
  dectalk
  ${GTK2_LIBRARIES}
)

