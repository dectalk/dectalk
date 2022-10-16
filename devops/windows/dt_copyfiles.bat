mkdir dist
mkdir dist\lib
mkdir dist\tools
mkdir dist\dic
mkdir dist\bitmaps

@REM Copy over dapi/dectalk libraries
copy /y src\dapi\build\dectalk\fr\release\dectalk.dll dist\lib\dtalk_fr.dll
copy /y src\dapi\build\dectalk\gr\release\dectalk.dll dist\lib\dtalk_gr.dll
copy /y src\dapi\build\dectalk\la\release\dectalk.dll dist\lib\dtalk_la.dll
copy /y src\dapi\build\dectalk\sp\release\dectalk.dll dist\lib\dtalk_sp.dll
copy /y src\dapi\build\dectalk\uk\release\dectalk.dll dist\lib\dtalk_uk.dll
copy /y src\dapi\build\dectalk\us\release\dectalk.dll dist\lib\dtalk_us.dll

@REM Copy over dapi/dtalkml libraries
copy /y src\dtalkml\build\release\dectalk.dll dist\

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

@REM Copy over speak window binaries
copy /y src\samples\speak\build\us\release\speak.exe dist\speak.exe

@REM Copy over speak window binaries
copy /y src\samples\say\build\us\release\say.exe dist\say.exe

@REM Copy over windic window binary
copy /y src\samples\windic\build\ml\release\windic.exe dist\windic.exe

@REM Exit with exit code 0.
exit /b 0
