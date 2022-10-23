mkdir dist
mkdir dist\IA32
mkdir dist\AMD64
mkdir dist\AMD64\lib
mkdir dist\AMD64\tools
mkdir dist\AMD64\dic
mkdir dist\AMD64\bitmaps
mkdir dist\IA32\lib
mkdir dist\IA32\tools
mkdir dist\IA32\dic
mkdir dist\IA32\bitmaps

@REM Copy over dapi/dectalk libraries
copy /y "src\dapi\build\dectalk\x64\Release - ENGLISH_US\DECtalk.dll" "dist\AMD64\lib\dtalk_us.dll"
copy /y "src\dapi\build\dectalk\x64\Release - ENGLISH_US\DECtalk.dll" "dist\AMD64\DECtalk.dll"
copy /y "src\dapi\build\dectalk\Win32\Release - ENGLISH_US\DECtalk.dll" "dist\IA32\lib\dtalk_us.dll"
copy /y "src\dapi\build\dectalk\Win32\Release - ENGLISH_US\DECtalk.dll" "dist\IA32\DECtalk.dll"

@REM Copy over dapi/dic binaries
copy /y "src\dapi\build\dic\x64\Release - ENGLISH_US\Internal Dictionary Compiler.exe" "dist\AMD64\tools\dic_us.exe"
copy /y "src\dapi\build\dic\Win32\Release - ENGLISH_US\Internal Dictionary Compiler.exe" "dist\IA32\tools\dic_us.exe"

@REM Copy over built dictionary files
copy /y "src\dapi\build\dic\x64\Release - ENGLISH_US\dtalk_us.dic" "dist\AMD64\dic"
copy /y "src\dapi\build\dic\x64\Release - ENGLISH_US\dtalk_us.dic" "dist\AMD64"
copy /y "src\dapi\build\dic\Win32\Release - ENGLISH_US\dtalk_us.dic" "dist\IA32\dic"
copy /y "src\dapi\build\dic\Win32\Release - ENGLISH_US\dtalk_us.dic" "dist\IA32"

@REM Copy over speak window binaries
copy /y "src\build\speak\x64\Release - ENGLISH_US\Sample Speak Window.exe" "dist\AMD64\speak.exe"
copy /y "src\build\speak\Win32\Release - ENGLISH_US\Sample Speak Window.exe" "dist\IA32\speak.exe"

@REM Exit with exit code 0.
exit /b 0
