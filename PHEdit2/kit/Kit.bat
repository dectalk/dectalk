@echo off
echo Kit Builder for PHEdit(2)  v1.0
echo -------------------------------
if NOT "%ComSpec%" == "C:\4nt\4nt.exe" goto need4NT
on error goto Error
cd \work\tools\phedit2
if exist build goto havebuild
md build
:havebuild
cd build
echo Cleaning directory...
deltree /Y *.*
echo Directory clean
md testing
md release
md full
md testing\us
md testing\uk
md testing\gr
md testing\sp
md testing\la
md release\us
md release\uk
md release\gr
md release\sp
md release\la
md full\us
md full\uk
md full\gr
md full\sp
md full\la
echo Copying PHEdit2
copy /Q ..\phedit2\release\demo\phedit2.exe release
copy /Q ..\phedit2\release\full\phedit2.exe full
copy /Q ..\phedit2\debug\phedit2.exe testing
echo Copying PHC
copy /Q ..\phc\release\phc.exe release
copy /Q ..\phc\release\phc.exe full
copy /Q ..\phc\debug\phc.exe testing
echo Copying Scope
copy /Q ..\scope2\release\scope.dll release\scope.pgi
copy /Q ..\scope2\release\scope.dll full\scope.pgi
copy /Q ..\scope2\debug\scope.dll testing\scope.pgi
echo Copying SGram
copy /Q ..\sgram\release\sgram.dll release\sgram.pgi
copy /Q ..\sgram\release\sgram.dll full\sgram.pgi
copy /Q ..\sgram\debug\sgram.dll testing\sgram.pgi
echo Copying Player
copy /Q ..\player\release\player.dll release\player.pgi
copy /Q ..\player\release\player.dll full\player.pgi
copy /Q ..\player\debug\player.dll testing\player.pgi
echo Copying TarSlide
copy /Q ..\tarslide\release\tarslide.dll release\tarslide.pdi
copy /Q ..\tarslide\release\tarslide.dll full\tarslide.pdi
copy /Q ..\tarslide\debug\tarslide.dll testing\tarslide.pdi

REM *** Language Dependent Components ***
REM     *** US ***
echo Copying US files...
echo Copying KLSyn
copy /Q ..\klsyn\release\us\klsyn.dll release\us_syn.pgi
copy /Q ..\klsyn\release\us\klsyn.dll full\us_syn.pgi
copy /Q ..\klsyn\debug\us\klsyn.dll testing\us_syn.pgi
echo Copying Port
copy /Q ..\port\release\us\port.exe release\us
copy /Q ..\port\release\us\port.exe full\us
copy /Q ..\port\debug\us\port.exe testing\us

REM     *** UK ***
echo Copying UK files...
echo Copying KLSyn
copy /Q ..\klsyn\release\uk\klsyn.dll release\uk_syn.pgi
copy /Q ..\klsyn\release\uk\klsyn.dll full\uk_syn.pgi
copy /Q ..\klsyn\debug\uk\klsyn.dll testing\uk_syn.pgi
echo Copying Port
copy /Q ..\port\release\uk\port.exe release\uk
copy /Q ..\port\release\uk\port.exe full\uk
copy /Q ..\port\debug\uk\port.exe testing\uk

REM     *** GR ***
echo Copying GR files...
echo Copying KLSyn
copy /Q ..\klsyn\release\gr\klsyn.dll release\gr_syn.pgi
copy /Q ..\klsyn\release\gr\klsyn.dll full\gr_syn.pgi
copy /Q ..\klsyn\debug\gr\klsyn.dll testing\gr_syn.pgi
echo Copying Port
copy /Q ..\port\release\gr\port.exe release\gr
copy /Q ..\port\release\gr\port.exe full\gr
copy /Q ..\port\debug\gr\port.exe testing\gr

echo Copying SP files...
echo Copying KLSyn
copy /Q ..\klsyn\release\sp\klsyn.dll release\sp_syn.pgi
copy /Q ..\klsyn\release\sp\klsyn.dll full\sp_syn.pgi
copy /Q ..\klsyn\debug\sp\klsyn.dll testing\sp_syn.pgi
echo Copying Port
copy /Q ..\port\release\sp\port.exe release\sp
copy /Q ..\port\release\sp\port.exe full\sp
copy /Q ..\port\debug\sp\port.exe testing\sp

echo Copying LA files...
echo Copying KLSyn
copy /Q ..\klsyn\release\la\klsyn.dll release\la_syn.pgi
copy /Q ..\klsyn\release\la\klsyn.dll full\la_syn.pgi
copy /Q ..\klsyn\debug\la\klsyn.dll testing\la_syn.pgi
echo Copying Port
copy /Q ..\port\release\la\port.exe release\la
copy /Q ..\port\release\la\port.exe full\la
copy /Q ..\port\debug\la\port.exe testing\la


REM *** Build PHD files ***
echo Executing PORT tool
cd release\us
port
move /Q male.phd ..\us_mal.phd
move /Q female.phd ..\us_fem.phd
cd ..\..
cd release\uk
port
move /Q male.phd ..\uk_mal.phd
move /Q female.phd ..\uk_fem.phd
cd ..\..
cd release\gr
port
move /Q male.phd ..\gr_mal.phd
move /Q female.phd ..\gr_fem.phd
cd ..\..
cd release\sp
port
move /Q male.phd ..\sp_mal.phd
move /Q female.phd ..\sp_fem.phd
cd ..\..
cd release\la
port
move /Q male.phd ..\la_mal.phd
move /Q female.phd ..\la_fem.phd
cd ..\..
cd testing\us
port
move /Q male.phd ..\us_mal.phd
move /Q female.phd ..\us_fem.phd
cd ..\..
cd testing\uk
port
move /Q male.phd ..\uk_mal.phd
move /Q female.phd ..\uk_fem.phd
cd ..\..
cd testing\gr
port
move /Q male.phd ..\gr_mal.phd
move /Q female.phd ..\gr_fem.phd
cd ..\..
cd testing\sp
port
move /Q male.phd ..\sp_mal.phd
move /Q female.phd ..sp_fem.phd
cd ..\..
cd testing\la
port
move /Q male.phd ..\la_mal.phd
move /Q female.phd ..\la_fem.phd
cd ..\..
cd full\us
port
move /Q male.phd ..\us_mal.phd
move /Q female.phd ..\us_fem.phd
cd ..\..
cd full\uk
port
move /Q male.phd ..\uk_mal.phd
move /Q female.phd ..\uk_fem.phd
cd ..\..
cd full\gr
port
move /Q male.phd ..\gr_mal.phd
move /Q female.phd ..\gr_fem.phd
cd ..\..
cd full\sp
port
move /Q male.phd ..\sp_mal.phd
move /Q female.phd ..\sp_fem.phd
cd ..\..
cd full\la
port
move /Q male.phd ..\la_mal.phd
move /Q female.phd ..\la_fem.phd
cd ..\..

echo Build completed successfully...
goto end

:need4NT
echo This build file will only run under 4NT
goto Error

:Error
echo Build did not complete successfully...
goto end

:end
