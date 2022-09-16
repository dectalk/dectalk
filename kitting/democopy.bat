@echo off
set democopy_debug=0
rem ******************
rem File Name:   democopy.bat
rem Written By:  Steve Kaufman
rem modified On: January 30, 1997
rem modified By: Kevin Bruckert
rem modified On: February 20, 1997
rem modified By: Carl Leeber
rem ***************************************************************
rem Revisions:
rem 31oct97 ncs    Changed header revision style for comments.
rem                Changed this whole file so that it actually works.
rem
rem 27jan98 cjl    Fixed debug pause and deltree bugs.
rem
rem 03apr00 nal    Fixed demo naming ambiguity.
rem                Added support to make one zip containing all demos
rem
rem ***************************************************************
REM
REM WARNING!!!
REM     This *.BAT file assumes that all parts of PRODMAK
REM     have been built successfully.
REM     Also, this file will NOT put all of the demo programs into
REM     one installation kit because the resulting ZIP file is
REM     1.6 Megs for ENGLISH_US, SPANISH, GERMAN, and SPANISH_LA only.
REM
REM     What happened? You ask - think what happens if you put
REM     4 dictionaries in - OK, so Castilian and Latin American Spanish's
REM     dic files are tiny.  Then think about how the DAPI functions
REM     are copied 4 times - remember - all demo.exe files are static.
REM
REM     Therefore 4+ Megs of stuff compressed down to 1.5 Megs will
REM     not fit on a 1.44 Meg floppy.
REM
REM     Self extracting zips are named demo_xx.exe
REM     The demo executable is dtdem_xx.exe, where xx is the lang abv.
REM
rem ***************************************************************
rem Comments
rem 001	08/29/2000	CAB	Removed typo of extra lang folders in makeall label
rem

set dtlang=%1
if "%democopy_debug%"=="1" pause

if NOT "%setvar%"=="" goto goodtogo
:nogood
echo WARNING: Using default machine build (x86).
set bld_mach=i386
if %democopy_debug%==1 pause
goto checkit

:goodtogo
if  NOT EXIST %setvar% echo WARNING: Path %setvar% is not defined.
if  NOT EXIST %setvar% goto nogood
if "%setvardone%"=="1" echo File setvar.bat has already been executed.
if "%setvardone%"=="1" goto checkit
if %democopy_debug%==1 pause
call %setvar%

:checkit
rem SETTING UP FOR i386 MACHINE
if "%bld_mach%"=="i386" set bld_path=build
if "%bld_mach%"=="i386" set arch_dir=swi95nt

rem SETTING UP FOR ALPHA MACHINE
if "%bld_mach%"=="ALPHA" set bld_path=alpha
if "%bld_mach%"=="ALPHA" set arch_dir=sw_a_nt

rem default: in case something goes wrong
if "%bld_mach%"=="" echo BLD_MACH is undefined, defaulting to i386 machine
if "%bld_mach%"=="" set bld_path=build
if "%bld_mach%"=="" set arch_dir=swi95nt
if %democopy_debug%==1 pause

rem ***************************************************************
rem     Support build of multi-language kit building from a
rem     choice of several.
rem     Currently supporting:
rem             ENGLISH_US, GERMAN, SPANISH, SPANISH_LA (Latin American),
rem             ENGLISH_UK
rem
rem ***************************************************************
rem defaulting to US if no lang parameter is passed in:
if "%dtlang%"=="" set dtlang=ENGLISH_US
rem ***************************************************************

if "%dtlang%"=="ML" echo The ML tag is not supported yet
if "%dtlang%"=="ML" echo Instead this makes one zip with all the demos
if "%dtlang%"=="ML" goto MakeAll
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
echo ARCH_DIR = %arch_dir%
echo LANGDIR  = %langdir%
echo DTLANG   = %dtlang%
echo .
if %democopy_debug%==1 pause

rem ****************************************************************
echo Cleaning out the old crud.
if "%OS%"=="Windows_NT" goto clnNT
deltree /y ..\%arch_dir%\%langdir%\install\demodata
deltree /y ..\%arch_dir%\%langdir%\install\demodisk
if %democopy_debug%==1 pause
goto clndone
:clnNT
del /s/q ..\%arch_dir%\%langdir%\install\demodata
del /s/q ..\%arch_dir%\%langdir%\install\demodisk
:clndone
echo Done cleaning.
if %democopy_debug%==1 pause

rem ****************************************************************
rem make up the directory tree..
md ..\%arch_dir%
md ..\%arch_dir%\%langdir%
md ..\%arch_dir%\%langdir%\install
md ..\%arch_dir%\%langdir%\install\demodata
md ..\%arch_dir%\%langdir%\install\demodisk
if %democopy_debug%==1 pause

REM *** Transfer BUILD files
echo ..\dapi\%bld_path%\dtdemo\%langdir%\release\dtdemo.exe ..\%arch_dir%\%langdir%\install\demodata\dtdem_%langdir%.exe
copy ..\dapi\%bld_path%\dtdemo\%langdir%\release\dtdemo.exe ..\%arch_dir%\%langdir%\install\demodata\dtdem_%langdir%.exe
if %democopy_debug%==1 pause
if ERRORLEVEL 1 goto ERROR

REM *** Transfer Dictionary Files
copy ..\dapi\%bld_path%\dtalkdic\%langdir%\release\dectalk.dic ..\%arch_dir%\%langdir%\install\demodata\dtalk_%langdir%.dic
if %democopy_debug%==1 pause
if ERRORLEVEL 1 goto ERROR

REM *** Transfer Text Files
copy ..\samples\speak\text\order.txt ..\%arch_dir%\%langdir%\install\demodata
copy ..\samples\speak\text\command.txt ..\%arch_dir%\%langdir%\install\demodata
copy ..\samples\speak\text\email.txt ..\%arch_dir%\%langdir%\install\demodata
copy ..\samples\speak\text\demo.wav ..\%arch_dir%\%langdir%\install\demodata

if %democopy_debug%==1 pause
if ERRORLEVEL 1 goto ERROR
copy ..\samples\speak\text\readme.txt ..\%arch_dir%\%langdir%\install\demodisk
if %democopy_debug%==1 pause
if ERRORLEVEL 1 goto ERROR
rem ****************************************************************
rem Someone decided to use "en" for ENGLISH_US for the demo text file
rem (demo.en) when everything else in the world followed some
rem convention that is used almost everywhere where where language
rem components are built.  So just take the following with faith.
rem ****************************************************************
if NOT "%dtlang%"=="ENGLISH_US" goto textcnt1
copy ..\samples\speak\text\*.en ..\%arch_dir%\%langdir%\install\demodata
if %democopy_debug%==1 pause
if ERRORLEVEL 1 goto ERROR
goto textdone
:textcnt1
copy ..\samples\speak\text\*.%langdir% ..\%arch_dir%\%langdir%\install\demodata
if %democopy_debug%==1 pause
if ERRORLEVEL 1 goto ERROR
:textdone
rem ****************************************************************

REM ** Transfer install program
copy ..\install\src\dtdemo\install.bat ..\%arch_dir%\%langdir%\install\demodisk
if %democopy_debug%==1 pause
if ERRORLEVEL 1 goto ERROR

REM *** Prepare to zip files
cd  ..\%arch_dir%\%langdir%\install\demodata
pkzip -ex demo_%langdir%.zip
if %democopy_debug%==1 pause
zip2exe demo_%langdir%.zip
if %democopy_debug%==1 pause

copy demo_%langdir%.exe ..\demodisk\demo_%langdir%.exe
if %democopy_debug%==1 pause
if ERRORLEVEL 1 goto ERROR

cd ..\..\..\..\kitting
goto skipAll
:MakeAll
md ..\%arch_dir%\alldemo
copy ..\samples\speak\text\command.txt ..\%arch_dir%\alldemo
copy ..\samples\speak\text\order.txt   ..\%arch_dir%\alldemo
copy ..\samples\speak\text\email.txt   ..\%arch_dir%\alldemo
copy ..\samples\speak\text\demo.wav    ..\%arch_dir%\alldemo
copy ..\dapi\%bld_path%\dtdemo\us\release\dtdemo.exe ..\%arch_dir%\alldemo\dtdem_us.exe
copy ..\dapi\%bld_path%\dtdemo\uk\release\dtdemo.exe ..\%arch_dir%\alldemo\dtdem_uk.exe
copy ..\dapi\%bld_path%\dtdemo\sp\release\dtdemo.exe ..\%arch_dir%\alldemo\dtdem_sp.exe
copy ..\dapi\%bld_path%\dtdemo\la\release\dtdemo.exe ..\%arch_dir%\alldemo\dtdem_la.exe
copy ..\dapi\%bld_path%\dtdemo\gr\release\dtdemo.exe ..\%arch_dir%\alldemo\dtdem_gr.exe
copy ..\dapi\%bld_path%\dtalkdic\us\release\dectalk.dic ..\%arch_dir%\alldemo\dtalk_us.dic
copy ..\dapi\%bld_path%\dtalkdic\uk\release\dectalk.dic ..\%arch_dir%\alldemo\dtalk_uk.dic
copy ..\dapi\%bld_path%\dtalkdic\sp\release\dectalk.dic ..\%arch_dir%\alldemo\dtalk_sp.dic
copy ..\dapi\%bld_path%\dtalkdic\la\release\dectalk.dic ..\%arch_dir%\alldemo\dtalk_la.dic
copy ..\dapi\%bld_path%\dtalkdic\gr\release\dectalk.dic ..\%arch_dir%\alldemo\dtalk_gr.dic
copy ..\samples\speak\text\demo.en ..\%arch_dir%\alldemo
copy ..\samples\speak\text\demo.uk ..\%arch_dir%\alldemo
copy ..\samples\speak\text\demo.sp ..\%arch_dir%\alldemo
copy ..\samples\speak\text\demo.la ..\%arch_dir%\alldemo
copy ..\samples\speak\text\demo.gr ..\%arch_dir%\alldemo
cd ..\%arch_dir%\alldemo
pkzip -ex demo_all.zip
zip2exe demo_all.zip
cd ..\..\kitting

:skipAll
goto end

:ERROR
echo An error has occurred creating the demo kit

:end
