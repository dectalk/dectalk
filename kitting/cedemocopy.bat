@echo off
set democopy_debug=0
rem ******************
rem File Name:   cedemocopy.bat
rem Written By:  Nathan LeStage
rem ***************************************************************
rem Revisions:
rem ***************************************************************
REM
REM WARNING!!!
REM     This *.BAT file assumes that all parts of PRODMAK
REM     have been built successfully.
rem ***************************************************************
rem COMMENTS
rem 001 08/29/00  CAB	Added variable ce_bld_path & removed extra set from if
rem 			Fixed file name typo & removed email.txt from wce200 

set dtlang=CLEAN
set ce_bld_path=cedemodata
goto clean

:BeginBuild

set CEtalkbldpath=samplece\CEtalk\build
set CEmailbldpath=samplece\Mailread\build\wce211\static

if "%democopy_debug%"=="1" pause

if defined setvar goto goodtogo
:nogood
echo WARNING: Using default machine build (x86).
set bld_mach=i386
if %democopy_debug%==1 pause
goto checkit

:goodtogo
if NOT defined setvar echo WARNING: Path %setvar% is not defined.
if NOT defined setvar goto nogood
if "%setvardone%"=="1" echo File setvar.bat has already been executed.
if "%setvardone%"=="1" goto checkit
if %democopy_debug%==1 pause
call %setvar%

:checkit
rem SETTING UP FOR i386 MACHINE
if "%bld_mach%"=="i386" set bld_path=build
if "%bld_mach%"=="i386" set arch_dir=swi95nt

rem default: in case something goes wrong
if "%bld_mach%"=="" echo BLD_MACH is undefined, defaulting to i386 machine
if "%bld_mach%"=="" set bld_path=build
if "%bld_mach%"=="" set arch_dir=swi95nt
if %democopy_debug%==1 pause

:START


if "%dtlang%"=="ALL" echo ALL combines all demos into one kit
if "%dtlang%"=="ALL" set langdir=all
if "%dtlang%"=="ALL" goto dtlangok
if "%dtlang%"=="ENGLISH_US" set langdir=us
if "%dtlang%"=="ENGLISH_US" goto dtlangok
if "%dtlang%"=="GERMAN" set langdir=gr
if "%dtlang%"=="GERMAN" goto dtlangok
if "%dtlang%"=="SPANISH" set  langdir=sp
if "%dtlang%"=="SPANISH" goto dtlangok
if "%dtlang%"=="SPANISH_LA" set  langdir=la
if "%dtlang%"=="SPANISH_LA" goto dtlangok
if "%dtlang%"=="ENGLISH_UK" set  langdir=uk
if "%dtlang%"=="ENGLISH_UK" goto dtlangok
if %democopy_debug%==1 pause
rem Error
echo Language parameter (%dtlang%) not recognized.
if %democopy_debug%==1 pause
goto ERROR

:dtlangok
echo Defined variables:
echo .
echo BLD_MACH = %bld_mach%
echo BLD_PATH = %bld_path%
echo CE_BLD_PATH = %ce_bld_path%
echo ARCH_DIR = %arch_dir%
echo LANGDIR  = %langdir%
echo DTLANG   = %dtlang%
echo .
if %democopy_debug%==1 pause

rem make up the directory tree..
md ..\%ce_bld_path%
md ..\%ce_bld_path%\wce200
md ..\%ce_bld_path%\wce211
if %democopy_debug%==1 pause

set CEver=wce200
set CEchip=mips

:CEloop

if "%CEver%"=="wce200" set ver=200
if "%CEver%"=="wce200" set shortver=00
if "%CEver%"=="wce200" goto goodVer
if "%CEver%"=="wce211" set ver=211
if "%CEver%"=="wce211" set shortver=11
if "%CEver%"=="wce211" goto goodVer
echo Bad Version number.
goto ERROR
:goodVer
if "%CEchip%"=="mips" set chip=mip
if "%CEchip%"=="mips" goto goodChip
if "%CEchip%"=="x86em" set chip=x86
if "%CEchip%"=="x86em" goto goodChip
if "%CEchip%"=="sh" set chip=sh
if "%CEchip%"=="sh" goto goodChip
if "%CEchip%"=="sh4" set chip=sh4
if "%CEchip%"=="sh4" goto goodChip
if "%CEchip%"=="arm" set chip=arm
if "%CEchip%"=="arm" goto goodChip
echo Bad Chipset Name
goto ERROR
:goodChip

if "%langdir%"=="all" goto MakeAll

md ..\%ce_bld_path%\%CEver%\%CEchip%
md ..\%ce_bld_path%\%CEver%\%CEchip%\%langdir%
md ..\%ce_bld_path%\%CEver%\%CEchip%\alldemo

REM *** Transfer BUILD files
copy ..\%CEtalkbldpath%\%CEver%\static\%CEchip%\%langdir%\release\dtalk_%langdir%.exe ..\%ce_bld_path%\%CEver%\%CEchip%\%langdir%\%langdir%%chip%%ver%.exe
copy ..\%CEtalkbldpath%\%CEver%\static\%CEchip%\%langdir%\release\dtalk_%langdir%.exe ..\%ce_bld_path%\%CEver%\%CEchip%\alldemo\%langdir%%chip%%ver%.exe

if NOT "%langdir%"=="us" goto skipMailReader
if NOT "%CEver%"=="wce211" goto skipMailReader
copy ..\%CEmailbldpath%\%CEchip%\%langdir%\release\mailread.exe ..\%ce_bld_path%\%CEver%\%CEchip%\%langdir%\mr_%langdir%%chip%.exe
copy ..\%CEmailbldpath%\%CEchip%\%langdir%\release\mailread.exe ..\%ce_bld_path%\%CEver%\%CEchip%\alldemo\mr_%langdir%%chip%.exe
:skipMailReader

if %democopy_debug%==1 pause
if ERRORLEVEL 1 goto ERROR

REM *** Transfer Dictionary Files
copy ..\dapi\%bld_path%\dtalkdic\%langdir%\release\dectalk.dic ..\%ce_bld_path%\%CEver%\%CEchip%\%langdir%\dtalk_%langdir%.dic
copy ..\dapi\%bld_path%\dtalkdic\%langdir%\release\dectalk.dic ..\%ce_bld_path%\%CEver%\%CEchip%\alldemo\dtalk_%langdir%.dic
if %democopy_debug%==1 pause
if ERRORLEVEL 1 goto ERROR

REM *** Transfer Text Files
copy ..\samples\speak\text\order.txt     ..\%ce_bld_path%\%CEver%\%CEchip%\%langdir%
copy ..\samples\speak\text\command.txt   ..\%ce_bld_path%\%CEver%\%CEchip%\%langdir%
if "%CEver%"=="wce211" copy ..\samples\speak\text\email.txt ..\%ce_bld_path%\%CEver%\%CEchip%\%langdir%
copy ..\samples\speak\text\order.txt     ..\%ce_bld_path%\%CEver%\%CEchip%\alldemo
copy ..\samples\speak\text\command.txt   ..\%ce_bld_path%\%CEver%\%CEchip%\alldemo
if "%CEver%"=="wce211" copy ..\samples\speak\text\email.txt     ..\%ce_bld_path%\%CEver%\%CEchip%\alldemo
if %democopy_debug%==1 pause
if ERRORLEVEL 1 goto ERROR

REM *** Prepare to zip files
cd ..\%ce_bld_path%\%CEver%\%CEchip%\%langdir%

pkzip -ex d%langdir%%chip%%shortver%.zip
if %democopy_debug%==1 pause
zip2exe d%langdir%%chip%%shortver%.zip
if %democopy_debug%==1 pause
if ERRORLEVEL 1 goto ERROR
cd ..\..\..\..\kitting

if NOT "%langdir%"=="all" goto skipall
:MakeAll
cd ..\%ce_bld_path%\%CEver%\%CEchip%\alldemo
pkzip -ex all%chip%%shortver%%.zip
zip2exe all%chip%%shortver%.zip
cd ..\..\..\..\kitting
:skipall

REM *** CE var change
set chiptemp=%CEchip%

if "%CEver%"=="wce211" goto CE211

if "%chiptemp%"=="mips" set CEchip=sh
if "%chiptemp%"=="mips" goto CEloop
if "%chiptemp%"=="sh" set CEchip=x86em
if "%chiptemp%"=="sh" goto CEloop
if "%chiptemp%"=="x86em" set CEver=wce211
if "%chiptemp%"=="x86em" set CEchip=arm
goto CEloop

:CE211
if "%chiptemp%"=="arm"  set CEchip=mips
if "%chiptemp%"=="arm" goto CEloop
if "%chiptemp%"=="mips" set CEchip=sh
if "%chiptemp%"=="mips" goto CEloop
if "%chiptemp%"=="sh" set CEchip=sh4
if "%chiptemp%"=="sh" goto CEloop
if "%chiptemp%"=="sh4" set CEchip=x86em
if "%chiptemp%"=="sh4" goto CEloop
if "%chiptemp%"=="x86em" goto CEdone

echo ERROR
goto ERROR

rem ****************************************************************
:clean
echo Cleaning out the old crud.
if "%OS%"=="Windows_NT" goto clndone
deltree /y ..\%ce_bld_path%
if %democopy_debug%==1 pause
goto clndone

:clndone
del /s/q ..\%ce_bld_path%
echo Done cleaning.
if %democopy_debug%==1 pause

rem ****************************************************************



:CEdone
if "%dtlang%"=="ALL" goto msg
if "%dtlang%"=="GERMAN" set dtlang=ALL
if "%dtlang%"=="ALL" goto START
if "%dtlang%"=="SPANISH_LA" set dtlang=GERMAN
if "%dtlang%"=="GERMAN" goto START
if "%dtlang%"=="SPANISH" set dtlang=SPANISH_LA
if "%dtlang%"=="SPANISH_LA" goto START
if "%dtlang%"=="ENGLISH_UK" set dtlang=SPANISH
if "%dtlang%"=="SPANISH" goto START
if "%dtlang%"=="ENGLISH_US" set dtlang=ENGLISH_UK
if "%dtlang%"=="ENGLISH_UK" goto START
if "%dtlang%"=="CLEAN" set dtlang=ENGLISH_US
if "%dtlang%"=="ENGLISH_US" goto BeginBuild


:msg
echo CE Demo Kits Complete
goto end

:ERROR
echo There was an error creating the demo kits for CE
:end