mkdir dist
mkdir dist\lib
mkdir dist\tools
mkdir dist\dic
mkdir dist\bitmaps

@REM Copy over dapi/dectalk libraries
copy /y src\dapi\build\dectalk\fr\release\dectalk.dll dist\lib\dectalk.dll.fr
copy /y src\dapi\build\dectalk\gr\release\dectalk.dll dist\lib\dectalk.dll.gr
copy /y src\dapi\build\dectalk\la\release\dectalk.dll dist\lib\dectalk.dll.la
copy /y src\dapi\build\dectalk\sp\release\dectalk.dll dist\lib\dectalk.dll.sp
copy /y src\dapi\build\dectalk\uk\release\dectalk.dll dist\lib\dectalk.dll.uk
copy /y src\dapi\build\dectalk\us\release\dectalk.dll dist\lib\dectalk.dll.us
copy /y src\dapi\build\dectalk\us\release\dectalk.dll dist\

@REM Copy over dapi/dic binaries
copy /y src\dapi\build\dtalkdic\fr\release\dic.exe dist\tools\dic_fr.exe
copy /y src\dapi\build\dtalkdic\gr\release\dic.exe dist\tools\dic_gr.exe
copy /y src\dapi\build\dtalkdic\la\release\dic.exe dist\tools\dic_la.exe
copy /y src\dapi\build\dtalkdic\sp\release\dic.exe dist\tools\dic_sp.exe
copy /y src\dapi\build\dtalkdic\uk\release\dic.exe dist\tools\dic_uk.exe
copy /y src\dapi\build\dtalkdic\us\release\dic.exe dist\tools\dic_us.exe

@REM Copy over built dictionary files
copy /y src\dapi\build\dtalkdic\fr\dtalk_fr.dic dist\dic
copy /y src\dapi\build\dtalkdic\gr\dtalk_gr.dic dist\dic
copy /y src\dapi\build\dtalkdic\la\dtalk_la.dic dist\dic
copy /y src\dapi\build\dtalkdic\sp\dtalk_sp.dic dist\dic
copy /y src\dapi\build\dtalkdic\uk\dtalk_uk.dic dist\dic
copy /y src\dapi\build\dtalkdic\us\dtalk_us.dic dist\dic
copy /y src\dapi\build\dtalkdic\fr\dtalk_fr.dic dist
copy /y src\dapi\build\dtalkdic\gr\dtalk_gr.dic dist
copy /y src\dapi\build\dtalkdic\la\dtalk_la.dic dist
copy /y src\dapi\build\dtalkdic\sp\dtalk_sp.dic dist
copy /y src\dapi\build\dtalkdic\uk\dtalk_uk.dic dist
copy /y src\dapi\build\dtalkdic\us\dtalk_us.dic dist

@REM Copy over speak window binaries
copy /y src\samples\speak\build\fr\release\speak.exe dist\speak_fr.exe
copy /y src\samples\speak\build\gr\release\speak.exe dist\speak_gr.exe
copy /y src\samples\speak\build\la\release\speak.exe dist\speak_la.exe
copy /y src\samples\speak\build\sp\release\speak.exe dist\speak_sp.exe
copy /y src\samples\speak\build\uk\release\speak.exe dist\speak_uk.exe
copy /y src\samples\speak\build\us\release\speak.exe dist\speak_us.exe

@REM Copy over speak window binaries
copy /y src\samples\say\build\fr\release\say.exe dist\say_fr.exe
copy /y src\samples\say\build\gr\release\say.exe dist\say_gr.exe
copy /y src\samples\say\build\la\release\say.exe dist\say_la.exe
copy /y src\samples\say\build\sp\release\say.exe dist\say_sp.exe
copy /y src\samples\say\build\uk\release\say.exe dist\say_uk.exe
copy /y src\samples\say\build\us\release\say.exe dist\say_us.exe

@REM Exit with exit code 0.
exit /b 0
