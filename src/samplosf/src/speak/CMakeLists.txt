add_executable(
  gspeak
  gspeak.c
)

find_package(GTK2 2.0 REQUIRED gtk)

target_include_directories(
  gspeak
  PRIVATE
  ../../..
  ${HEADER_OUTPUT_DIRECTORY}
  ${GTK2_INCLUDE_DIRS}
)

target_link_libraries(
  gspeak
  PRIVATE
  dectalk
  ${GTK2_LIBRARIES}
)

file(
  COPY bitmaps
  DESTINATION ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
)
