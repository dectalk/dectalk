@echo on
set democopy_debug=0
if "%multi_lang%"=="" set multi_lang=0
goto skip_comment
rem ******************
rem File Name:   democopy.bat
rem Written By:  Steve Kaufman
rem modified On: January 30, 1997
rem modified By: Kevin Bruckert
rem modified On: February 20, 1997
rem modified By: Carl Leeber
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
REM     The demo executable is demo_xx.exe, where xx is the lang abv.
REM
rem ***************************************************************
rem COMMENTS
rem 001	31oct97 ncs    	Changed header revision style for comments.
rem                		Changed this whole file so that it actually works.
rem
rem 002	27jan98 cjl    	Fixed debug pause and deltree bugs.
rem
rem 003	03apr00 nal		Fixed demo naming ambiguity.
rem                		Added support to make one zip containing all demos
rem 004	30may00 nal    	Error in path for alldemo textfiles
rem 005	20nov00	cab	   	Added if exist to del and if not exist to md command
rem 006 09nov00	cab		Removed alpha from script
rem 007	27dec00 cab		1. Added label skip_comment
rem						2. Removed test for setvar done in dectalk32.bat
rem						3. Removed demodisk folders
rem						4. Moved demos to demos\windemos
rem 008					Added French
rem 009	08feb01 cab		Modified file to reduce overhead and run faster
rem	010 15feb01	cab		Changed  error to bug_end.
rem 011 21feb01 cab		Added test to check if setvar was run
rem 012 26feb01 cab		1. Added missing %
rem						2. Removed extra copy
rem 013 27feb01 cab		1. Created new file for file list to make demos
rem						3. Deleted extra goto and added missing %
rem 014 27mar01 cab		Added missing %win_dir% for ml deletion
rem 015 28mar01 cab		Added build_log for error area.
rem 016 29mar01 cab		Added demo* to file check
rem 017 05apr01 cab		Fixed check of del command
rem 018 26apr01 cab		1. Added new pkware for distribution
rem						2. Added foreign language german dictionary

:skip_comment
if not "%setvardone%"=="1" goto bug_setvar

set dtlang=%1
rem path of demos
set demo_dir=demos\windemos

rem SETTING UP FOR i386 MACHINE
if "%bld_mach%"=="i386" set bld_path=build
if "%bld_mach%"=="i386" set arch_dir=swi95nt
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

if "%dtlang%"=="ML" set langdir=ml
if "%dtlang%"=="ML" goto del_demo
if "%dtlang%"=="ENGLISH_US" set langdir=us
if "%dtlang%"=="ENGLISH_US" goto del_demo
if "%dtlang%"=="FRENCH" set langdir=fr
if "%dtlang%"=="FRENCH" goto del_demo
if "%dtlang%"=="GERMAN" set langdir=gr
if "%dtlang%"=="GERMAN" goto del_demo
if "%dtlang%"=="SPANISH" set  langdir=sp
if "%dtlang%"=="SPANISH" goto del_demo
if "%dtlang%"=="SPANISH_LA" set  langdir=la
if "%dtlang%"=="SPANISH_LA" goto del_demo
if "%dtlang%"=="ENGLISH_UK" set  langdir=uk
if "%dtlang%"=="ENGLISH_UK" goto del_demo
if %democopy_debug%==1 pause
rem bug
echo Error! Language parameter (%dtlang%) not recognized.
if %democopy_debug%==1 pause
goto bug_end

:del_demo
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
if exist ..\%arch_dir%\%demo_dir%\%langdir% deltree /y ..\%arch_dir%\%demo_dir%\%langdir%
if %democopy_debug%==1 pause
goto clndone

:clnNT
rem delete all files and start fresh
if exist ..\%arch_dir%\%demo_dir%\%langdir% del /s/q ..\%arch_dir%\%demo_dir%\%langdir%
if exist ..\%arch_dir%\%demo_dir%\%langdir%\demo*.* echo Files ..\%arch_dir%\%demo_dir%\%langdir%\demo*.* not deleted >> %blddrv%%bldpath%\build_log\errors\win%index%.log

if "%langdir%"=="ml" goto del_ml
goto clndone

:del_ml
if exist ..\%arch_dir%\%demo_dir%\alldemo del /q ..\%arch_dir%\%demo_dir%\alldemo
if exist ..\%arch_dir%\%demo_dir%\alldemo\demo*.* echo Files ..\%arch_dir%\%demo_dir%\alldemo\demo*.* not deleted >> %blddrv%%bldpath%\build_log\errors\win%index%.log
echo Done cleaning.
goto MakeAll

:clndone
echo Done cleaning.
if %democopy_debug%==1 pause

rem ****************************************************************
rem make up the directory tree..
if not exist ..\%arch_dir%\%demo_dir%\%langdir%		md ..\%arch_dir%\%demo_dir%\%langdir%
if not exist ..\%arch_dir%\%demo_dir%\alldemo		md ..\%arch_dir%\%demo_dir%\alldemo

if %democopy_debug%==1 pause

if "%multi_lang%"=="0" goto do_copy 
if not "%langdir%"=="us" goto skip_copy

:do_copy
rem *** Transfer All files needed
copy ..\samples\speak\text\command.txt ..\%arch_dir%\%demo_dir%
rem may require to change demo.en to demo.us to conform to all
copy ..\samples\speak\text\demo.*  ..\%arch_dir%\%demo_dir%
if NOT exist ..\%arch_dir%\%demo_dir%\demo.* echo File ..\%arch_dir%\%demo_dir%\demo.* not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy ..\samples\speak\text\email.txt ..\%arch_dir%\%demo_dir%
if NOT exist ..\%arch_dir%\%demo_dir%\email.txt echo File ..\%arch_dir%\%demo_dir%\email.txt not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy ..\samples\speak\text\order.txt ..\%arch_dir%\%demo_dir%
if NOT exist ..\%arch_dir%\%demo_dir%\order.txt echo File ..\%arch_dir%\%demo_dir%\order.txt not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy ..\samples\speak\text\readme.txt ..\%arch_dir%\%demo_dir%
if NOT exist ..\%arch_dir%\%demo_dir%\readme.txt echo File ..\%arch_dir%\%demo_dir%\readme.txt not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

rem create list of files to copy
rem :> overwrites file :>> appends
echo command.txt > ..\%arch_dir%\%demo_dir%\filelist.lst
echo demo.wav >> ..\%arch_dir%\%demo_dir%\filelist.lst
echo email.txt >> ..\%arch_dir%\%demo_dir%\filelist.lst
echo order.txt >> ..\%arch_dir%\%demo_dir%\filelist.lst
echo readme.txt >> ..\%arch_dir%\%demo_dir%\filelist.lst

rem dtdemo files
if "%multi_lang%"=="0" copy ..\dapi\%bld_path%\dtdemo\%langdir%\release\dtdemo.exe ..\%arch_dir%\%demo_dir%\dtdem_%langdir%.exe
if "%multi_lang%"=="0" if NOT exist ..\%arch_dir%\%demo_dir%\dtdem_%langdir%.exe echo File ..\%arch_dir%\%demo_dir%\dtdem_%langdir%.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
if "%multi_lang%"=="0" skip_dtdemo
copy ..\dapi\%bld_path%\dtdemo\us\release\dtdemo.exe ..\%arch_dir%\%demo_dir%\dtdem_us.exe
if NOT exist ..\%arch_dir%\%demo_dir%\dtdem_us.exe echo File ..\%arch_dir%\%demo_dir%\dtdem_us.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy ..\dapi\%bld_path%\dtdemo\uk\release\dtdemo.exe ..\%arch_dir%\%demo_dir%\dtdem_uk.exe
if NOT exist ..\%arch_dir%\%demo_dir%\dtdem_uk.exe echo File ..\%arch_dir%\%demo_dir%\dtdem_uk.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy ..\dapi\%bld_path%\dtdemo\sp\release\dtdemo.exe ..\%arch_dir%\%demo_dir%\dtdem_sp.exe
if NOT exist ..\%arch_dir%\%demo_dir%\dtdem_sp.exe echo File ..\%arch_dir%\%demo_dir%\dtdem_sp.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy ..\dapi\%bld_path%\dtdemo\la\release\dtdemo.exe ..\%arch_dir%\%demo_dir%\dtdem_la.exe
if NOT exist ..\%arch_dir%\%demo_dir%\dtdem_la.exe echo File ..\%arch_dir%\%demo_dir%\dtdem_la.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy ..\dapi\%bld_path%\dtdemo\gr\release\dtdemo.exe ..\%arch_dir%\%demo_dir%\dtdem_gr.exe
if NOT exist ..\%arch_dir%\%demo_dir%\dtdem_gr.exe echo File ..\%arch_dir%\%demo_dir%\dtdem_gr.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy ..\dapi\%bld_path%\dtdemo\fr\release\dtdemo.exe ..\%arch_dir%\%demo_dir%\dtdem_fr.exe
if NOT exist ..\%arch_dir%\%demo_dir%\dtdem_fr.exe echo File ..\%arch_dir%\%demo_dir%\dtdem_fr.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
:skip_dtdemo

rem Dictionary files
if "%multi_lang%"=="0" copy ..\dapi\%bld_path%\dtalkdic\%langdir%\release\dectalk.dic ..\%arch_dir%\%demo_dir%\dtalk_%langdir%.dic
if "%multi_lang%"=="0" if NOT exist ..\%arch_dir%\%demo_dir%\dtalk_%langdir%.dic echo File ..\%arch_dir%\%demo_dir%\dtalk_%langdir%.dic not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
if "%multi_lang%"=="0" skip_dic
copy ..\dapi\%bld_path%\dtalkdic\us\release\dectalk.dic ..\%arch_dir%\%demo_dir%\dtalk_us.dic
if NOT exist ..\%arch_dir%\%demo_dir%\dtalk_us.dic echo File ..\%arch_dir%\%demo_dir%\dtalk_us.dic not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy ..\dapi\%bld_path%\dtalkdic\uk\release\dectalk.dic ..\%arch_dir%\%demo_dir%\dtalk_uk.dic
if NOT exist ..\%arch_dir%\%demo_dir%\dtalk_uk.dic echo File ..\%arch_dir%\%demo_dir%\dtalk_uk.dic not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy ..\dapi\%bld_path%\dtalkdic\sp\release\dectalk.dic ..\%arch_dir%\%demo_dir%\dtalk_sp.dic
if NOT exist ..\%arch_dir%\%demo_dir%\dtalk_sp.dic echo File ..\%arch_dir%\%demo_dir%\dtalk_sp.dic not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy ..\dapi\%bld_path%\dtalkdic\la\release\dectalk.dic ..\%arch_dir%\%demo_dir%\dtalk_la.dic
if NOT exist ..\%arch_dir%\%demo_dir%\dtalk_la.dic echo File ..\%arch_dir%\%demo_dir%\dtalk_la.dic not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy ..\dapi\%bld_path%\dtalkdic\gr\release\dectalk.dic ..\%arch_dir%\%demo_dir%\dtalk_gr.dic
if NOT exist ..\%arch_dir%\%demo_dir%\dtalk_gr.dic echo File ..\%arch_dir%\%demo_dir%\dtalk_gr.dic not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy ..\dapi\src\dic\dtalk_fl_gr.dic ..\%arch_dir%\%demo_dir%\dtalk_fl_gr.dic
if NOT exist ..\%arch_dir%\%demo_dir%\dtalk_fl_gr.dic echo File ..\%arch_dir%\%demo_dir%\dtalk_fl_gr.dic not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy ..\dapi\%bld_path%\dtalkdic\fr\release\dectalk.dic ..\%arch_dir%\%demo_dir%\dtalk_fr.dic
if NOT exist ..\%arch_dir%\%demo_dir%\dtalk_fr.dic echo File ..\%arch_dir%\%demo_dir%\dtalk_fr.dic not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
:skip_dic
:skip_copy
if %democopy_debug%==1 pause

rem *** Prepare to zip files
cd  ..\%arch_dir%\%demo_dir%

if "%langdir%"=="us" goto zip_us
goto skip_us

:zip_us
pkzipc -add .\%langdir%\demo_%langdir%.zip @filelist.lst demo.en dtdem_%langdir%.exe dtalk_%langdir%.dic
if NOT exist .\%langdir%\demo_%langdir%.zip echo File .\%langdir%\demo_%langdir%.zip not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
goto next

:skip_us
if NOT "%langdir%"=="gr" goto skip_gr
pkzipc -add .\%langdir%\demo_%langdir%.zip @filelist.lst demo.%langdir% dtdem_%langdir%.exe dtalk_%langdir%.dic dtalk_fl_%langdir%.dic
if NOT exist .\%langdir%\demo_%langdir%.zip echo File .\%langdir%\demo_%langdir%.zip not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
:skip_gr

pkzipc -add .\%langdir%\demo_%langdir%.zip @filelist.lst demo.%langdir% dtdem_%langdir%.exe dtalk_%langdir%.dic
if NOT exist .\%langdir%\demo_%langdir%.zip echo File .\%langdir%\demo_%langdir%.zip not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

:next
cd .\%langdir%
pkzipc -sfx demo_%langdir%.zip
if NOT exist demo_%langdir%.exe echo File demo_%langdir%.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
if %democopy_debug%==1 pause

cd ..\..\..\..\kitting
goto skipAll

:MakeAll
if not exist ..\%arch_dir%\%demo_dir%\alldemo md ..\%arch_dir%\%demo_dir%\alldemo

cd ..\%arch_dir%\%demo_dir%
pkzipc -add -exclude=filelist.lst .\alldemo\demo_all.zip 
if NOT exist .\alldemo\demo_all.zip echo File .\alldemo\demo_all.zip not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

cd .\alldemo
pkzipc -sfx demo_all.zip
if NOT exist demo_all.exe echo File demo_all.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
cd ..\..\..\..\kitting

rem delete files use for zip files
if "%dtlang%"=="ML" del /q ..\%arch_dir%\%demo_dir%
if NOT exist ..\%arch_dir%\%demo_dir%\*.* echo ..\%arch_dir%\%demo_dir%\*.* not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

:skipAll
goto end

:bug_setvar
echo Error! Setvar was not run
goto end

:end
rem delete files use for zip files
if "%multi_lang%"=="0" del /q ..\%arch_dir%\%demo_dir%
if NOT exist ..\%arch_dir%\%demo_dir%\*.* echo ..\%arch_dir%\%demo_dir%\*.* not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

rem if ERRORLEVEL 1 goto bug_end
rem works for previous command only get reset after next command
echo done building demo for %dtlang%
goto exit

:bug_end
echo An error occurred creating the demo kit >> %blddrv%%bldpath%\build_log\errors\win%index%.log

:exit