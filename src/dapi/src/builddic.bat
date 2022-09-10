@echo off
cd ..\build\dtalkdic
us\release\dic ..\..\src\dic\Dic_us.txt us\dtalk_us.dic /t:win32
uk\release\dic ..\..\src\dic\Dic_uk.txt uk\dtalk_uk.dic /t:win32
sp\release\dic ..\..\src\dic\Dic_sp.txt sp\dtalk_sp.dic /t:win32
la\release\dic ..\..\src\dic\Dic_la.txt la\dtalk_la.dic /t:win32
gr\release\dic ..\..\src\dic\Dic_gr.txt gr\dtalk_gr.dic /t:win32
fr\release\dic ..\..\src\dic\Dic_fr.txt fr\dtalk_fr.dic /t:win32
cd ..\..\src
