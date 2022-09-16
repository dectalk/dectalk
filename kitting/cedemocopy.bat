@echo on
set democopy_debug=0
goto skip_comment
rem ******************
rem File Name:   cedemocopy.bat
rem Written By:  Nathan Lestage
rem ***************************************************************
rem Revisions:
rem ***************************************************************
REM
REM WARNING!!!
REM     This *.BAT file assumes that all parts of PRODMAK
REM     have been built successfully.
rem ***************************************************************
rem COMMENTS
rem 001 NAL 05/30/2000  Removed email.txt from demos, fixed filename mistake
rem 002 CAB 08/29/2000	Added variable ce_bld_path & removed extra set from if
rem 					Fixed file name typo & added email.txt for wce211 
rem 003 CAB	11/09/2000	1. Added mspro and palm directory for wce211 & wce300
rem						2. Changed shortver for wce200 to 20 and added for wce300 to 30
rem						3. Rewrote file for easier modification
rem	004 CAB 12/27/2000	1. Added label skip_comment
rem						2. Removed test for setvar done in dectalk32.bat
rem						3. move and renamed cedemodata to cedemo directory to %arch_dir%
rem						4. Added if exist to del and deltree command
rem 005	CAB	01/24/2001	Added French
rem 006	CAB	02/08/2001	Modified file to reduce overhead and run faster
rem 007	CAB	02/15/2001	Changed error to bug_end
rem 008 CAB 02/21/2001  1. Removed starting d for names of exe or zip files
rem						2. Added palm or pro to the filename's for the exe 
rem 009 CAB	03/27/2001	1. Fixed error in creating demos with new list file
rem 010 CAB	03/27/2001	2. Adapted to build_log error area
rem 011	CAB	03/29/2001	Added extra string for if file exist
rem 012	CAB	03/30/2001	Added test for us or not for build_log stuff
rem 013 26apr01 cab		1. Added new pkware for distribution
rem						2. Added foreign language german dictionary


:skip_comment

if not "%setvardone%"=="1" goto bug_setvar

rem SETTING UP FOR i386 MACHINE
if "%bld_mach%"=="i386" set bld_path=build
if "%bld_mach%"=="i386" set arch_dir=swi95nt

set dtlang=CLEAN
set ce_bld_path=demos\cedemos
goto clean

:begin_build
rem initials values
set CEver=wce200
rem wce211
rem set device=palm
set ver=200
rem 211
set shortver=20
rem 21
set CEchip=mips
rem arm
set chip=mip
rem arm
set copy_files=0

set CEtalkbldpath=samplece\CEtalk\build
set CEmailbldpath=samplece\Mailread\build

rem create all tree directories tree
if not exist ..\%arch_dir%\%ce_bld_path%\wce200			md ..\%arch_dir%\%ce_bld_path%\wce200
if not exist ..\%arch_dir%\%ce_bld_path%\wce211\mspro	md ..\%arch_dir%\%ce_bld_path%\wce211\mspro
if not exist ..\%arch_dir%\%ce_bld_path%\wce211\palm	md ..\%arch_dir%\%ce_bld_path%\wce211\palm
if not exist ..\%arch_dir%\%ce_bld_path%\wce300			md ..\%arch_dir%\%ce_bld_path%\wce300
if "%democopy_debug%"=="1" pause

:make_lang
if "%dtlang%"=="ALL" echo ALL combines all demos into one kit
if "%dtlang%"=="ALL" set langdir=all
if "%dtlang%"=="ALL" goto dtlangok
if "%dtlang%"=="ENGLISH_US" set langdir=us
if "%dtlang%"=="ENGLISH_US" goto dtlangok
if "%dtlang%"=="ENGLISH_UK" set  langdir=uk
if "%dtlang%"=="ENGLISH_UK" goto dtlangok
if "%dtlang%"=="FRENCH" set langdir=fr
if "%dtlang%"=="FRENCH" goto dtlangok
if "%dtlang%"=="GERMAN" set langdir=gr
if "%dtlang%"=="GERMAN" goto dtlangok
if "%dtlang%"=="SPANISH" set  langdir=sp
if "%dtlang%"=="SPANISH" goto dtlangok
if "%dtlang%"=="SPANISH_LA" set  langdir=la
if "%dtlang%"=="SPANISH_LA" goto dtlangok
if %democopy_debug%==1 pause

rem bug
echo Error! Language parameter (%dtlang%) not recognized.
if %democopy_debug%==1 pause
goto bug_end

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

if "%CEver%"=="wce200" goto wce200_loop
if "%CEver%"=="wce211" goto wce211_loop
if "%CEver%"=="wce300" goto wce200_loop
echo Bad Version number.
goto bug_end
if %democopy_debug%==1 pause


:wce200_loop
if not "%dtlang%"=="ALL" goto wce200_goodChip
if "%dtlang%"=="ALL" goto wce200_all

:wce200_goodChip
if "%langdir%"=="all" goto wce200_makeall
if not exist ..\%arch_dir%\%ce_bld_path%\%CEver%\%CEchip%				md ..\%arch_dir%\%ce_bld_path%\%CEver%\%CEchip%
if not exist ..\%arch_dir%\%ce_bld_path%\%CEver%\%CEchip%\%langdir%		md ..\%arch_dir%\%ce_bld_path%\%CEver%\%CEchip%\%langdir%
if not exist ..\%arch_dir%\%ce_bld_path%\%CEver%\%CEchip%\alldemo		md ..\%arch_dir%\%ce_bld_path%\%CEver%\%CEchip%\alldemo


REM *** Transfer BUILD files

rem cetalk
copy ..\%CEtalkbldpath%\%CEver%\static\%CEchip%\%langdir%\release\dtalk_%langdir%.exe ..\%arch_dir%\%ce_bld_path%\%CEver%\%langdir%%chip%%ver%.exe
if NOT exist ..\%arch_dir%\%ce_bld_path%\%CEver%\%langdir%%chip%%ver%.exe echo File ..\%arch_dir%\%ce_bld_path%\%CEver%\%langdir%%chip%%ver%.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

rem mailread
if NOT "%langdir%"=="us" goto skipMailReader_1
if "%CEver%"=="wce200" goto skipMailReader_1
copy ..\%CEmailbldpath%\%CEver%\static\%CEchip%\%langdir%\release\mailread.exe ..\%arch_dir%\%ce_bld_path%\%CEver%\mr_%langdir%%chip%.exe
if NOT exist ..\%arch_dir%\%ce_bld_path%\%CEver%\mr_%langdir%%chip%.exe echo File ..\%arch_dir%\%ce_bld_path%\%CEver%\mr_%langdir%%chip%.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

:skipMailReader_1
if %democopy_debug%==1 pause
if ERRORLEVEL 1 goto bug_end

if not "%copy_files%"=="0" goto skip_copy1
REM *** Transfer Dictionary Files
copy ..\dapi\%bld_path%\dtalkdic\us\release\dectalk.dic ..\%arch_dir%\%ce_bld_path%\%CEver%\dtalk_us.dic
if NOT exist ..\%arch_dir%\%ce_bld_path%\%CEver%\dtalk_us.dic echo File ..\%arch_dir%\%ce_bld_path%\%CEver%\dtalk_us.dic not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy ..\dapi\%bld_path%\dtalkdic\uk\release\dectalk.dic ..\%arch_dir%\%ce_bld_path%\%CEver%\dtalk_uk.dic
if NOT exist ..\%arch_dir%\%ce_bld_path%\%CEver%\dtalk_uk.dic echo File ..\%arch_dir%\%ce_bld_path%\%CEver%\dtalk_uk.dic not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy ..\dapi\%bld_path%\dtalkdic\gr\release\dectalk.dic ..\%arch_dir%\%ce_bld_path%\%CEver%\dtalk_gr.dic
if NOT exist ..\%arch_dir%\%ce_bld_path%\%CEver%\dtalk_gr.dic echo File ..\%arch_dir%\%ce_bld_path%\%CEver%\dtalk_gr.dic not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy ..\dapi\src\dic\dtalk_fl_gr.dic ..\%arch_dir%\%ce_bld_path%\%CEver%\dtalk_fl_gr.dic
if NOT exist ..\%arch_dir%\%ce_bld_path%\%CEver%\dtalk_fl_gr.dic echo File ..\%arch_dir%\%ce_bld_path%\%CEver%\dtalk_fl_gr.dic not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy ..\dapi\%bld_path%\dtalkdic\sp\release\dectalk.dic ..\%arch_dir%\%ce_bld_path%\%CEver%\dtalk_sp.dic
if NOT exist ..\%arch_dir%\%ce_bld_path%\%CEver%\dtalk_sp.dic echo File ..\%arch_dir%\%ce_bld_path%\%CEver%\dtalk_sp.dic not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy ..\dapi\%bld_path%\dtalkdic\la\release\dectalk.dic ..\%arch_dir%\%ce_bld_path%\%CEver%\dtalk_la.dic
if NOT exist ..\%arch_dir%\%ce_bld_path%\%CEver%\dtalk_la.dic echo File ..\%arch_dir%\%ce_bld_path%\%CEver%\dtalk_la.dic not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy ..\dapi\%bld_path%\dtalkdic\fr\release\dectalk.dic ..\%arch_dir%\%ce_bld_path%\%CEver%\dtalk_fr.dic
if NOT exist ..\%arch_dir%\%ce_bld_path%\%CEver%\dtalk_fr.dic echo File ..\%arch_dir%\%ce_bld_path%\%CEver%\dtalk_fr.dic not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log


if %democopy_debug%==1 pause
if ERRORLEVEL 1 goto bug_end

REM *** Transfer Text Files
copy ..\samples\speak\text\command.txt		..\%arch_dir%\%ce_bld_path%\%CEver%
if NOT exist ..\%arch_dir%\%ce_bld_path%\%CEver%\command.txt echo File ..\%arch_dir%\%ce_bld_path%\%CEver%\command.txt not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
rem created file name list file from scratch
echo command.txt > ..\%arch_dir%\%ce_bld_path%\%CEver%\list.lst
copy ..\samples\speak\text\demo.wav			..\%arch_dir%\%ce_bld_path%\%CEver%
if NOT exist ..\%arch_dir%\%ce_bld_path%\%CEver%\demo.wav echo File ..\%arch_dir%\%ce_bld_path%\%CEver%\demo.wav not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
echo demo.wav >> ..\%arch_dir%\%ce_bld_path%\%CEver%\list.lst
copy ..\samples\speak\text\email.txt		..\%arch_dir%\%ce_bld_path%\%CEver%
if NOT exist ..\%arch_dir%\%ce_bld_path%\%CEver%\email.txt echo File ..\%arch_dir%\%ce_bld_path%\%CEver%\email.txt not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
echo email.txt >> ..\%arch_dir%\%ce_bld_path%\%CEver%\list.lst
copy ..\samples\speak\text\order.txt		..\%arch_dir%\%ce_bld_path%\%CEver%
if NOT exist ..\%arch_dir%\%ce_bld_path%\%CEver%\order.txt echo File ..\%arch_dir%\%ce_bld_path%\%CEver%\order.txt not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
echo order.txt >> ..\%arch_dir%\%ce_bld_path%\%CEver%\list.lst
copy ..\samples\speak\text\readme.txt		..\%arch_dir%\%ce_bld_path%\%CEver%
if NOT exist ..\%arch_dir%\%ce_bld_path%\%CEver%\readme.txt echo File ..\%arch_dir%\%ce_bld_path%\%CEver%\readme.txt not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
echo readme.txt >> ..\%arch_dir%\%ce_bld_path%\%CEver%\list.lst

set copy_files=1

rem copy demo.xx files
if "%langdir%"=="us" copy ..\samples\speak\text\demo.en	..\%arch_dir%\%ce_bld_path%\%CEver%
if "%langdir%"=="us" if NOT exist ..\%arch_dir%\%ce_bld_path%\%CEver%\demo.en echo File ..\%arch_dir%\%ce_bld_path%\%CEver%\demo.en not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
if "%langdir%"=="us" echo demo.en >> ..\%arch_dir%\%ce_bld_path%\%CEver%\list.lst
if NOT "%langdir%"=="us" copy ..\samples\speak\text\demo.%langdir%	..\%arch_dir%\%ce_bld_path%\%CEver%
if NOT "%langdir%"=="us" if NOT exist ..\%arch_dir%\%ce_bld_path%\%CEver%\demo.%langdir% echo File ..\%arch_dir%\%ce_bld_path%\%CEver%\demo.%langdir% not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
if NOT "%langdir%"=="us" echo demo.%langdir% >> ..\%arch_dir%\%ce_bld_path%\%CEver%\list.lst

:skip_copy1
if %democopy_debug%==1 pause
if ERRORLEVEL 1 goto bug_end

REM *** Prepare to zip files
cd ..\%arch_dir%\%ce_bld_path%\%CEver%

if "%CEver%"=="wce200" goto skip_mail_1
goto zip_wce300

:skip_mail_1
if NOT "%langdir%"=="gr" goto skip_gr1
pkzipc -add .\%CEchip%\%langdir%\%langdir%%chip%%shortver%.zip @list.lst dtalk_%langdir%.dic dtalk_fl_%langdir%.dic %langdir%%chip%%ver%.exe
if NOT exist .\%CEchip%\%langdir%\%langdir%%chip%%shortver%.zip echo File .\%CEchip%\%langdir%\%langdir%%chip%%shortver%.zip not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
:skip_gr1

pkzipc -add .\%CEchip%\%langdir%\%langdir%%chip%%shortver%.zip @list.lst dtalk_%langdir%.dic %langdir%%chip%%ver%.exe
if NOT exist .\%CEchip%\%langdir%\%langdir%%chip%%shortver%.zip echo File .\%CEchip%\%langdir%\%langdir%%chip%%shortver%.zip not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

goto next_zip2exe_1

:zip_wce300
if NOT "%langdir%"=="gr" goto skip_gr2
pkzipc -add .\%CEchip%\%langdir%\%langdir%%chip%%shortver%.zip @list.lst dtalk_%langdir%.dic dtalk_fl_%langdir%.dic dtalk_fl_%langdir%.dic %langdir%%chip%%ver%.exe
if NOT exist .\%CEchip%\%langdir%\%langdir%%chip%%shortver%.zip echo File .\%CEchip%\%langdir%\%langdir%%chip%%shortver%.zip not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
:skip_gr2

pkzipc -add .\%CEchip%\%langdir%\%langdir%%chip%%shortver%.zip @list.lst dtalk_%langdir%.dic %langdir%%chip%%ver%.exe mr_%langdir%%chip%.exe
if NOT exist .\%CEchip%\%langdir%\%langdir%%chip%%shortver%.zip echo File .\%CEchip%\%langdir%\%langdir%%chip%%shortver%.zip not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

:next_zip2exe_1
if %democopy_debug%==1 pause
cd .\%CEchip%\%langdir%
pkzipc -sfx %langdir%%chip%%shortver%.zip
if NOT exist %langdir%%chip%%shortver%.exe echo File %langdir%%chip%%shortver%.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
if %democopy_debug%==1 pause
if ERRORLEVEL 1 goto bug_end
cd ..\..\..\..\..\..\kitting

:wce200_all
if NOT "%langdir%"=="all" goto wce200_skipall
:wce200_makeall
cd ..\%arch_dir%\%ce_bld_path%\%CEver%
pkzipc -add -exclude=list.lst .\%CEchip%\alldemo\all%chip%%shortver%.zip 
if NOT exist .\%CEchip%\alldemo\all%chip%%shortver%.zip echo File .\%CEchip%\alldemo\all%chip%%shortver%.zip not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
cd .\%CEchip%\alldemo
pkzipc -sfx all%chip%%shortver%.zip
if NOT exist all%chip%%shortver%.exe echo File all%chip%%shortver%.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
del /q ..\..\..\%CEver%\*.exe
if exist ..\..\..\%CEver%\*.exe echo Files ..\..\..\%CEver%\*.exe not deleted >> %blddrv%%bldpath%\build_log\errors\win%index%.log
cd ..\..\..\..\..\..\kitting
if %democopy_debug%==1 pause
if not "%CEchip%"=="x86em" goto wce200_switch
if not "%CEver%"=="wce300" goto wce200_change_device
if "%CEchip%"=="x86em" goto wce211

rem change device
:wce200_change_device
if "%CEchip%"=="x86em" goto wce300
:wce200_skipall


:wce200_switch
REM *** CE var change
set temp_lang=%dtlang%
if "%temp_lang%"=="ALL" goto wce200_change_chip
if not "%temp_lang%"=="ALL" goto CEdone

:wce200_change_chip
set temp_chip=%CEchip%
if "%temp_chip%"=="arm" set CEchip=mips
if "%temp_chip%"=="arm" set chip=mip
if "%temp_chip%"=="arm" goto CEdone
if "%temp_chip%"=="mips" set CEchip=sh
if "%temp_chip%"=="mips" set chip=sh
if "%temp_chip%"=="mips" goto CEdone
if "%temp_chip%"=="sh" set CEchip=x86em
if "%temp_chip%"=="sh" set chip=x86
if "%temp_chip%"=="sh" goto CEdone
if "%temp_chip%"=="x86em" goto CEdone
echo Bad Chipset Name
goto bug_end

:wce300
set CEver=wce300
set ver=300
set shortver=30
set CEchip=arm
set chip=arm
set copy_files=0
goto CEdone

rem wce211 for MS HPC Pro
:wce211
set CEver=wce211
set ver=211
set shortver=21
set device=mspro
set CEchip=arm
set chip=arm
set copy_files=0
goto CEdone

:wce211_loop
if not "%dtlang%"=="ALL" goto wce211_goodChip
if "%dtlang%"=="ALL" goto wce211_all

:wce211_goodChip
if "%langdir%"=="all" goto wce211_makeall
if not exist ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\%CEchip%				md ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\%CEchip%
if not exist ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\%CEchip%\%langdir%	md ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\%CEchip%\%langdir%
if not exist ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\%CEchip%\alldemo		md ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\%CEchip%\alldemo


REM *** Transfer BUILD files
copy ..\%CEtalkbldpath%\%CEver%\%device%\static\%CEchip%\%langdir%\release\dtalk_%langdir%.exe ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\%langdir%%chip%%ver%.exe
if NOT exist ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\%langdir%%chip%%ver%.exe echo File ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\%langdir%%chip%%ver%.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

if "%device%"=="palm" goto skipMailReader_2
if NOT "%langdir%"=="us" goto skipMailReader_2
copy ..\%CEmailbldpath%\%CEver%\%device%\static\%CEchip%\%langdir%\release\mailread.exe ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\mr_%langdir%%chip%.exe
if NOT exist ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\mr_%langdir%%chip%.exe echo File ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\mr_%langdir%%chip%.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

:skipMailReader_2
if %democopy_debug%==1 pause
if ERRORLEVEL 1 goto bug_end

if not "%copy_files%"=="0" goto skip_copy2
rem *** Transfer Dictionary Files
copy ..\dapi\%bld_path%\dtalkdic\us\release\dectalk.dic ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\dtalk_us.dic
if NOT exist ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\dtalk_us.dic echo File ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\dtalk_us.dic not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy ..\dapi\%bld_path%\dtalkdic\uk\release\dectalk.dic ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\dtalk_uk.dic
if NOT exist ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\dtalk_uk.dic echo File ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\dtalk_uk.dic not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy ..\dapi\%bld_path%\dtalkdic\gr\release\dectalk.dic ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\dtalk_gr.dic
if NOT exist ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\dtalk_gr.dic echo File ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\dtalk_gr.dic not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy ..\dapi\src\dic\dtalk_fl_gr.dic ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\dtalk_fl_gr.dic
if NOT exist ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\dtalk_fl_gr.dic echo File ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\dtalk_fl_gr.dic not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy ..\dapi\%bld_path%\dtalkdic\sp\release\dectalk.dic ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\dtalk_sp.dic
if NOT exist ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\dtalk_sp.dic echo File ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\dtalk_sp.dic not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy ..\dapi\%bld_path%\dtalkdic\la\release\dectalk.dic ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\dtalk_la.dic
if NOT exist ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\dtalk_la.dic echo File ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\dtalk_la.dic not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy ..\dapi\%bld_path%\dtalkdic\fr\release\dectalk.dic ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\dtalk_fr.dic
if NOT exist ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\dtalk_fr.dic echo File ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\dtalk_fr.dic not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

if %democopy_debug%==1 pause
if ERRORLEVEL 1 goto bug_end

REM *** Transfer Text Files
copy ..\samples\speak\text\command.txt     ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%
if NOT exist ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\command.txt echo File ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\command.txt not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
rem created file name list file from scratch
echo command.txt > ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\list.lst
copy ..\samples\speak\text\demo.wav   ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%
if NOT exist ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\demo.wav echo File ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\demo.wav not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
echo demo.wav >> ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\list.lst
copy ..\samples\speak\text\email.txt   ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%
if NOT exist ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\email.txt echo File ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\email.txt not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
echo email.txt >> ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\list.lst
copy ..\samples\speak\text\order.txt   ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%
if NOT exist ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\order.txt echo File ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\order.txt not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
echo order.txt >> ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\list.lst
copy ..\samples\speak\text\readme.txt   ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%
if NOT exist ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\readme.txt echo File ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\readme.txt not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
echo readme.txt >> ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\list.lst

set copy_files=1
:skip_copy2
if %democopy_debug%==1 pause
if ERRORLEVEL 1 goto bug_end

rem copy demo.xx files
if "%langdir%"=="us" copy ..\samples\speak\text\demo.en	..\%arch_dir%\%ce_bld_path%\%CEver%\%device%
if "%langdir%"=="us" if NOT exist ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\demo.en echo File ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\demo.en not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
if "%langdir%"=="us" echo demo.en >> ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\list.lst
if NOT "%langdir%"=="us" copy ..\samples\speak\text\demo.%langdir%	..\%arch_dir%\%ce_bld_path%\%CEver%\%device%
if NOT "%langdir%"=="us" if NOT exist ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\demo.%langdir% echo File ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\demo.%langdir% not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
if NOT "%langdir%"=="us" echo demo.%langdir% >> ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%\list.lst

REM *** Prepare to zip files
cd ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%

if "%device%"=="palm" goto skip_mail_2
goto zip_pro

:skip_mail_2
if NOT "%langdir%"=="gr" goto skip_gr3
pkzipc -add .\%CEchip%\%langdir%\%langdir%%chip%%shortver%.zip @list.lst dtalk_%langdir%.dic dtalk_fl_%langdir%.dic %langdir%%chip%%ver%.exe
if NOT exist .\%CEchip%\%langdir%\%langdir%%chip%%shortver%.zip echo File .\%CEchip%\%langdir%\%langdir%%chip%%shortver%.zip not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
:skip_gr3

pkzipc -add .\%CEchip%\%langdir%\%langdir%%chip%%shortver%.zip @list.lst dtalk_%langdir%.dic %langdir%%chip%%ver%.exe
if NOT exist .\%CEchip%\%langdir%\%langdir%%chip%%shortver%.zip echo File .\%CEchip%\%langdir%\%langdir%%chip%%shortver%.zip not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
goto next_zip2exe_2

:zip_pro
if NOT "%langdir%"=="gr" goto skip_gr4
pkzipc -add .\%CEchip%\%langdir%\%langdir%%chip%%shortver%.zip @list.lst dtalk_%langdir%.dic dtalk_fl_%langdir%.dic %langdir%%chip%%ver%.exe
if NOT exist .\%CEchip%\%langdir%\%langdir%%chip%%shortver%.zip echo File .\%CEchip%\%langdir%\%langdir%%chip%%shortver%.zip not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
:skip_gr4

pkzipc -add .\%CEchip%\%langdir%\%langdir%%chip%%shortver%.zip @list.lst dtalk_%langdir%.dic %langdir%%chip%%ver%.exe mr_%langdir%%chip%.exe
if NOT exist .\%CEchip%\%langdir%\%langdir%%chip%%shortver%.zip echo File .\%CEchip%\%langdir%\%langdir%%chip%%shortver%.zip not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

:next_zip2exe_2
if %democopy_debug%==1 pause
cd .\%CEchip%\%langdir%
pkzipc -sfx %langdir%%chip%%shortver%.zip 
if NOT exist %langdir%%chip%%shortver%.exe echo File %langdir%%chip%%shortver%.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

rem rename files
if "%device%"=="palm" set ce_plat=palm
if "%device%"=="mspro" set ce_plat=pro
rename %langdir%%chip%%shortver%.exe %langdir%%chip%%shortver%%ce_plat%.exe
if NOT exist %langdir%%chip%%shortver%%ce_plat%.exe echo File %langdir%%chip%%shortver%%ce_plat%.exe not renamed >> %blddrv%%bldpath%\build_log\errors\win%index%.log

if %democopy_debug%==1 pause
if ERRORLEVEL 1 goto bug_end
cd ..\..\..\..\..\..\..\kitting
:wce211_all
if NOT "%langdir%"=="all" goto wce211_skipall
:wce211_makeall
cd ..\%arch_dir%\%ce_bld_path%\%CEver%\%device%

pkzipc -add -exclude=list.lst .\%CEchip%\alldemo\all%chip%%shortver%.zip 
if NOT exist .\%CEchip%\alldemo\all%chip%%shortver%.zip echo File .\%CEchip%\alldemo\all%chip%%shortver%.zip not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
cd .\%CEchip%\alldemo
pkzipc -sfx all%chip%%shortver%.zip
if NOT exist all%chip%%shortver%.exe echo File all%chip%%shortver%.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

rem rename files
if "%device%"=="palm" set ce_plat=palm
if "%device%"=="mspro" set ce_plat=pro
rename all%chip%%shortver%.exe all%chip%%shortver%%ce_plat%.exe   
if NOT exist all%chip%%shortver%%ce_plat%.exe echo File all%chip%%shortver%%ce_plat%.exe not renamed >> %blddrv%%bldpath%\build_log\errors\win%index%.log

del /q ..\..\..\%device%\*.exe
if exist ..\..\..\%device%\*.exe echo File ..\..\..\%device%\*.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
cd ..\..\..\..\..\..\..\kitting
if not "%CEchip%"=="x86em" goto wce211_switch
if not "%device%"=="palm" goto wce211_change_device
if "%CEchip%"=="x86em" goto msg

rem change device
:wce211_change_device
if "%CEchip%"=="x86em" goto wce211_palm
:wce211_skipall


:wce211_switch
REM *** CE var change
set temp_lang=%dtlang%
if "%temp_lang%"=="ALL" goto wce211_change_device
if not "%temp_lang%"=="ALL" goto CEdone

:wce211_change_device
set temp_chip=%CEchip%
if "%temp_chip%"=="arm" set CEchip=mips
if "%temp_chip%"=="arm" set chip=mip
if "%temp_chip%"=="arm" goto CEdone
if "%temp_chip%"=="mips" set CEchip=sh
if "%temp_chip%"=="mips" set chip=sh
if "%temp_chip%"=="mips" goto CEdone
if "%device%"=="palm" set temp_chip=x86em
if "%temp_chip%"=="sh" set CEchip=sh4
if "%temp_chip%"=="sh" set chip=sh4
if "%temp_chip%"=="sh" goto CEdone
if "%temp_chip%"=="sh4" set CEchip=x86em
if "%temp_chip%"=="sh4" set chip=x86
if "%temp_chip%"=="sh4" goto CEdone
if "%temp_chip%"=="x86em" set CEchip=x86em
if "%temp_chip%"=="x86em" set chip=x86
if "%temp_chip%"=="x86em" goto CEdone
echo Error!
goto bug_end

:wce211_palm
set CEchip=mips
set chip=mip
set device=palm
set copy_files=0
goto CEdone

rem ****************************************************************
:clean
echo Cleaning out the old crud.
if "%OS%"=="Windows_NT" goto clndone
if exit ..\%arch_dir%\%ce_bld_path% deltree /y ..\%arch_dir%\%ce_bld_path%
if %democopy_debug%==1 pause
goto clndone

:clndone
if exist ..\%arch_dir%\%ce_bld_path% del /s/q ..\%arch_dir%\%ce_bld_path%
if exist ..\%arch_dir%\%ce_bld_path%\demo*.* echo File ..\%arch_dir%\%ce_bld_path%\demo*.* not deleted >> %blddrv%%bldpath%\build_log\errors\win%index%.log
if exist ..\%arch_dir%\%ce_bld_path%\*.dic echo File ..\%arch_dir%\%ce_bld_path%\*.dic not deleted >> %blddrv%%bldpath%\build_log\errors\win%index%.log
if exist ..\%arch_dir%\%ce_bld_path%\*.exe echo File ..\%arch_dir%\%ce_bld_path%\*.exe not deleted >> %blddrv%%bldpath%\build_log\errors\win%index%.log
if exist ..\%arch_dir%\%ce_bld_path%\*.txt echo File ..\%arch_dir%\%ce_bld_path%\*.txt not deleted >> %blddrv%%bldpath%\build_log\errors\win%index%.log

echo Done cleaning.
if %democopy_debug%==1 pause

rem ****************************************************************


:CEdone
set lang_temp=%dtlang%
if "%lang_temp%"=="CLEAN" set dtlang=ENGLISH_US
if "%lang_temp%"=="CLEAN" goto begin_build
if "%lang_temp%"=="ENGLISH_US" set dtlang=ENGLISH_UK
if "%lang_temp%"=="ENGLISH_US" goto lang_go
if "%lang_temp%"=="ENGLISH_UK" set dtlang=FRENCH
if "%lang_temp%"=="ENGLISH_UK" goto lang_go
if "%lang_temp%"=="FRENCH" set dtlang=GERMAN
if "%lang_temp%"=="FRENCH" goto lang_go
if "%lang_temp%"=="GERMAN" set dtlang=SPANISH
if "%lang_temp%"=="GERMAN" goto lang_go
if "%lang_temp%"=="SPANISH" set dtlang=SPANISH_LA
if "%lang_temp%"=="SPANISH" goto lang_go
if "%lang_temp%"=="SPANISH_LA" set dtlang=ALL
if "%lang_temp%"=="SPANISH_LA" goto lang_go
if "%lang_temp%"=="ALL" set dtlang=ENGLISH_US
if "%lang_temp%"=="ALL" goto lang_go

:lang_go
if "%dtlang%"=="ENGLISH_US" goto make_lang
if "%dtlang%"=="ENGLISH_UK" goto make_lang
if "%dtlang%"=="FRENCH" goto make_lang
if "%dtlang%"=="GERMAN" goto make_lang
if "%dtlang%"=="SPANISH" goto make_lang
if "%dtlang%"=="SPANISH_LA" goto make_lang
if "%dtlang%"=="ALL" goto make_lang
goto bug_end

:msg
echo CE Demo Kits Complete
goto end

:bug_setvar
echo Error! Setvar was not run
goto end

:bug_end
echo There was an error creating the demo kits for CE

:end
rem delete files use for zip files
del /q ..\%arch_dir%\%ce_bld_path%\wce200
if exist ..\%arch_dir%\%ce_bld_path%\wce200\*.exe echo File ..\%arch_dir%\%ce_bld_path%\wce200\*.exe not deleted >> %blddrv%%bldpath%\build_log\errors\win%index%.log
if exist ..\%arch_dir%\%ce_bld_path%\wce200\demo*.* echo File ..\%arch_dir%\%ce_bld_path%\wce200\demo*.* not deleted >> %blddrv%%bldpath%\build_log\errors\win%index%.log
if exist ..\%arch_dir%\%ce_bld_path%\wce200\*.dic echo File ..\%arch_dir%\%ce_bld_path%\wce200\*.dic not deleted >> %blddrv%%bldpath%\build_log\errors\win%index%.log
if exist ..\%arch_dir%\%ce_bld_path%\wce200\*.txt echo File ..\%arch_dir%\%ce_bld_path%\wce200\*.txt not deleted >> %blddrv%%bldpath%\build_log\errors\win%index%.log

del /q ..\%arch_dir%\%ce_bld_path%\wce211\mspro
if exist ..\%arch_dir%\%ce_bld_path%\wce211\mspro\*.exe echo File ..\%arch_dir%\%ce_bld_path%\wce211\mspro\*.exe not deleted >> %blddrv%%bldpath%\build_log\errors\win%index%.log
if exist ..\%arch_dir%\%ce_bld_path%\wce211\mspro\demo*.* echo File ..\%arch_dir%\%ce_bld_path%\wce211\mspro\demo*.* not deleted >> %blddrv%%bldpath%\build_log\errors\win%index%.log
if exist ..\%arch_dir%\%ce_bld_path%\wce211\mspro\*.dic echo File ..\%arch_dir%\%ce_bld_path%\wce211\mspro\*.dic not deleted >> %blddrv%%bldpath%\build_log\errors\win%index%.log
if exist ..\%arch_dir%\%ce_bld_path%\wce211\mspro\*.txt echo File ..\%arch_dir%\%ce_bld_path%\wce211\mspro\*.txt not deleted >> %blddrv%%bldpath%\build_log\errors\win%index%.log

del /q ..\%arch_dir%\%ce_bld_path%\wce211\palm
if exist ..\%arch_dir%\%ce_bld_path%\wce211\palm\*.exe echo File ..\%arch_dir%\%ce_bld_path%\wce211\palm\*.exe not deleted >> %blddrv%%bldpath%\build_log\errors\win%index%.log
if exist ..\%arch_dir%\%ce_bld_path%\wce211\palm\demo*.* echo File ..\%arch_dir%\%ce_bld_path%\wce211\palm\demo*.* not deleted >> %blddrv%%bldpath%\build_log\errors\win%index%.log
if exist ..\%arch_dir%\%ce_bld_path%\wce211\palm\*.dic echo File ..\%arch_dir%\%ce_bld_path%\wce211\palm\*.dic not deleted >> %blddrv%%bldpath%\build_log\errors\win%index%.log
if exist ..\%arch_dir%\%ce_bld_path%\wce211\palm\*.txt echo File ..\%arch_dir%\%ce_bld_path%\wce211\palm\*.txt not deleted >> %blddrv%%bldpath%\build_log\errors\win%index%.log

del /q ..\%arch_dir%\%ce_bld_path%\wce300
if exist ..\%arch_dir%\%ce_bld_path%\wce300\*.exe echo File ..\%arch_dir%\%ce_bld_path%\wce300\*.exe not deleted >> %blddrv%%bldpath%\build_log\errors\win%index%.log
if exist ..\%arch_dir%\%ce_bld_path%\wce300\demo*.* echo File ..\%arch_dir%\%ce_bld_path%\wce300\demo*.* not deleted >> %blddrv%%bldpath%\build_log\errors\win%index%.log
if exist ..\%arch_dir%\%ce_bld_path%\wce300\*.dic echo File ..\%arch_dir%\%ce_bld_path%\wce300\*.dic not deleted >> %blddrv%%bldpath%\build_log\errors\win%index%.log
if exist ..\%arch_dir%\%ce_bld_path%\wce300\*.txt echo File ..\%arch_dir%\%ce_bld_path%\wce300\*.txt not deleted >> %blddrv%%bldpath%\build_log\errors\win%index%.log


echo Finished Windows Ce demos 