call vcvars32.bat

cd src/dapi/src
  nmake devdtk43.mak CFG="devdtk43 - Win32 Release"
  nmake devdtk43.mak CFG="devdtk43 - Win32 Release Spanish"
  nmake devdtk43.mak CFG="devdtk43 - Win32 Release German"
  nmake devdtk43.mak CFG="devdtk43 - Win32 Release Latin American"
  nmake devdtk43.mak CFG="devdtk43 - Win32 Release United Kingdom"
  nmake devdtk43.mak CFG="devdtk43 - Win32 Release French"
cd ../../..

cd src/dapi/src
  nmake dic.mak CFG="dic - Win32 Release"
  nmake dic.mak CFG="dic - Win32 Release Spanish"
  nmake dic.mak CFG="dic - Win32 Release German"
  nmake dic.mak CFG="dic - Win32 Release Latin American"
  nmake dic.mak CFG="dic - Win32 Release United Kingdom"
  nmake dic.mak CFG="dic - Win32 Release French"
cd ../../..

cd src/dapi/build/dtalkdic
  fr\Release\dic ..\..\src\dic\Dic_fr.txt fr\dtalk_fr.dic /t:win32
  gr\Release\dic ..\..\src\dic\Dic_gr.txt gr\dtalk_gr.dic /t:win32
  la\Release\dic ..\..\src\dic\Dic_la.txt la\dtalk_la.dic /t:win32
  sp\Release\dic ..\..\src\dic\Dic_sp.txt sp\dtalk_sp.dic /t:win32
  uk\Release\dic ..\..\src\dic\Dic_uk.txt uk\dtalk_uk.dic /t:win32
  us\Release\dic ..\..\src\dic\Dic_us.txt us\dtalk_us.dic /t:win32
cd ../../../..

cd src/samples/speak
  nmake speak.mak CFG="speak - Win32 Release"
  nmake speak.mak CFG="speak - Win32 Release Spanish"
  nmake speak.mak CFG="speak - Win32 Release German"
  nmake speak.mak CFG="speak - Win32 Release Latin American"
  nmake speak.mak CFG="speak - Win32 Release United Kingdom"
  nmake speak.mak CFG="speak - Win32 Release French"
cd ../../..
