mkdir dist
mkdir dist\ARM64
mkdir dist\ARM64\lib
mkdir dist\ARM64\tools
mkdir dist\ARM64\dic
mkdir dist\ARM64\bitmaps

@REM Copy over dapi/dectalk libraries
copy /y "src\dapi\build\dectalk\x64\Release - ENGLISH_US\DECtalk.dll" "dist\ARM64\lib\dtalk_us.dll"
copy /y "src\dapi\build\dectalk\x64\Release - ENGLISH_US\DECtalk.dll" "dist\ARM64\DECtalk.dll"

@REM Copy over dapi/dic binaries
copy /y "src\dapi\build\dic\x64\Release - ENGLISH_US\Internal Dictionary Compiler.exe" "dist\ARM64\tools\dic_us.exe"

@REM Copy over built dictionary files
copy /y "src\dapi\build\dic\x64\Release - ENGLISH_US\dtalk_us.dic" "dist\ARM64\dic"
copy /y "src\dapi\build\dic\x64\Release - ENGLISH_US\dtalk_us.dic" "dist\ARM64"

@REM Copy over speak window binaries
copy /y "src\build\speak\x64\Release - ENGLISH_US\Sample Speak Window.exe" "dist\ARM64\speak.exe"

@REM Exit with exit code 0.
exit /b 0
