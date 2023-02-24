add_executable(say src/say.c)

set_target_properties(say PROPERTIES LINK_FLAGS "-g3 -s MAIN_MODULE=1 -s ALLOW_MEMORY_GROWTH=1 -s MODULARIZE=1 -s EXPORT_NAME=say -s INVOKE_RUN=0 -s EXPORTED_RUNTIME_METHODS=callMain,FS --embed-file \"${CMAKE_CURRENT_SOURCE_DIR}/fs@\"")
target_include_directories(say PRIVATE .. ../dapi/src/osf ../dapi/src/api)
target_link_libraries(say PRIVATE dectalk)

add_custom_target (
  npm-target ALL
  COMMAND npm ci
  COMMAND npm run build
  BYPRODUCTS index.css index.html index.js
  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
)
