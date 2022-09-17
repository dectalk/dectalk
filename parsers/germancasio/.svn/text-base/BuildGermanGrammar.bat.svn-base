cd lexemes
del *pho~
call catfiles.bat
..\Debug\casiobachus.exe casio_new.ger
copy *.pho ..\..\..\..\casio\dapi\src\dic\German /y
copy bachusi.h ..\..\..\..\casio\dapi\src\include /y
cd ..\..\..\..\casio\dapi\src\dic\BuildFileSystemDic
call  BuildCasioDicts.bat
cd ..\..\..\..\..\tools\parsers\germancasio

