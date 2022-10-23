call vcvars32.bat

cd src/dapi/src
  nmake /f devdtk43.mak CFG="devdtk43 - Win32 Release"
  if %errorlevel% neq 0 exit /b %errorlevel%
  nmake /f devdtk43.mak CFG="devdtk43 - Win32 Release Spanish"
  if %errorlevel% neq 0 exit /b %errorlevel%
  nmake /f devdtk43.mak CFG="devdtk43 - Win32 Release German"
  if %errorlevel% neq 0 exit /b %errorlevel%
  nmake /f devdtk43.mak CFG="devdtk43 - Win32 Release Latin American"
  if %errorlevel% neq 0 exit /b %errorlevel%
  nmake /f devdtk43.mak CFG="devdtk43 - Win32 Release United Kingdom"
  if %errorlevel% neq 0 exit /b %errorlevel%
  nmake /f devdtk43.mak CFG="devdtk43 - Win32 Release French"
  if %errorlevel% neq 0 exit /b %errorlevel%
cd ../../..

cd src/dtalkml/src
  nmake /f DTalkML.mak CFG="DTalkML - Win32 Release"
  if %errorlevel% neq 0 exit /b %errorlevel%
cd ../../..

cd src/dapi/src
  nmake /f dic.mak CFG="dic - Win32 Release"
  if %errorlevel% neq 0 exit /b %errorlevel%
  nmake /f dic.mak CFG="dic - Win32 Release Spanish"
  if %errorlevel% neq 0 exit /b %errorlevel%
  nmake /f dic.mak CFG="dic - Win32 Release German"
  if %errorlevel% neq 0 exit /b %errorlevel%
  nmake /f dic.mak CFG="dic - Win32 Release Latin American"
  if %errorlevel% neq 0 exit /b %errorlevel%
  nmake /f dic.mak CFG="dic - Win32 Release United Kingdom"
  if %errorlevel% neq 0 exit /b %errorlevel%
  nmake /f dic.mak CFG="dic - Win32 Release French"
  if %errorlevel% neq 0 exit /b %errorlevel%
cd ../../..

cd src/dapi/build/dtalkdic
  fr\Release\dic ..\..\src\dic\Dic_fr.txt fr\dtalk_fr.dic /t:win32
  if %errorlevel% neq 0 exit /b %errorlevel%
  gr\Release\dic ..\..\src\dic\Dic_gr.txt gr\dtalk_gr.dic /t:win32
  if %errorlevel% neq 0 exit /b %errorlevel%
  la\Release\dic ..\..\src\dic\Dic_la.txt la\dtalk_la.dic /t:win32
  if %errorlevel% neq 0 exit /b %errorlevel%
  sp\Release\dic ..\..\src\dic\Dic_sp.txt sp\dtalk_sp.dic /t:win32
  if %errorlevel% neq 0 exit /b %errorlevel%
  uk\Release\dic ..\..\src\dic\Dic_uk.txt uk\dtalk_uk.dic /t:win32
  if %errorlevel% neq 0 exit /b %errorlevel%
  us\Release\dic ..\..\src\dic\Dic_us.txt us\dtalk_us.dic /t:win32
  if %errorlevel% neq 0 exit /b %errorlevel%
cd ../../../..

cd src/samples/speak
  nmake /f speak.mak CFG="speak - Win32 Release"
  if %errorlevel% neq 0 exit /b %errorlevel%
cd ../../..

cd src/samples/say
  nmake /f say.mak CFG="say - Win32 Release"
  if %errorlevel% neq 0 exit /b %errorlevel%
cd ../../..

cd src/samples/windic
  nmake /f windic.mak CFG="windic - Win32 Release"
  if %errorlevel% neq 0 exit /b %errorlevel%
cd ../../..
