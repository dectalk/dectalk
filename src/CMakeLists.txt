configure_file(
  ${PROJECT_SOURCE_DIR}/src/config.h.cmakedefine
  ${PROJECT_SOURCE_DIR}/src/config.h
)

add_subdirectory(dapi/src)
add_subdirectory(dapi/src/dic)

if (WIN32)
  add_subdirectory(samples/speak)
  add_subdirectory(samples/say)
elseif (UNIX)
  add_subdirectory(samplosf/src/speak)
  add_subdirectory(samplosf/src/dtsamples)
endif()

file(
  WRITE ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/DECtalk.conf
  "licenses:YV808w008IQ0\n"
  "licensepassword:kw60P7Y0bGRNB1@W3L@\n"
  "US_dict:dic/dtalk_us.dic\n"
  "UK_dict:dic/dtalk_uk.dic\n"
  "SP_dict:dic/dtalk_sp.dic\n"
  "GR_dict:dic/dtalk_gr.dic\n"
  "LA_dict:dic/dtalk_la.dic\n"
  "FR_dict:dic/dtalk_fr.dic\n"
  "US_udict:udict_us.dic\n"
  "UK_udict:udict_uk.dic\n"
  "SP_udict:udict_sp.dic\n"
  "GR_udict:udict_gr.dic\n"
  "LA_udict:udict_la.dic\n"
  "FR_udict:udict_fr.dic\n"
  "GR_fdict:dic/dtalk_fl_gr.dic\n"
  "Speak_xpm_dir:bitmaps/\n"
  "Default_lang:us\n"
  "LANG:us,US English\n"
  "LANG:uk,UK English\n"
  "LANG:sp,Spanish\n"
  "LANG:gr,German\n"
  "LANG:la,Latin American\n"
  "LANG:fr,French\n"
)

