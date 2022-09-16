@echo on
goto skip_comment
rem ********************************************************************
rem DECTALK.BAT
rem Created on:         21-FEB-1997
rem Created by:         Carl Leeber
rem
rem Purpose:            Build all of DECtalk from a common root.
rem
rem Dependencies:       Uses prodmak.bat, kitcopy.bat, democopy.bat and
rem						cedemocopy.bat
rem
rem assumes we start at root of \work\ad or \work\rnd or \work\product.
rem
rem ********************************************************************
rem MODIFICATION HISTORY
rem
rem 27jan98 cjl  	Build ALL versons of the demo package.
rem              	Add 16 bit versus 32bit build section flags.
rem 02feb98 cjl  	Change version to V4.50.03.
rem 13mar98 cjl  	Change version to V4.50.04.
rem 13mar98 cjl  	Change version to V4.50.05.
rem 22may98 cjl  	Change version to V4.51.06.
rem 20aug98 cjl  	Change version to V4.51.07.
rem 27oct98 gl		Add ENGSPAN, SPANENG dual language DTEX build
rem 29oct98 cjl 	Change version to V4.60.00 B001.
rem 27jan99 cjl 	Change version to V4.60.01 B002.
rem 18feb99 cjl 	Change version to V4.60.02 B002.
rem 18mar99 cjl 	Add NWSNOAA LatinAmerican Spanish to build.
rem 31mar99 cjl 	Change version to V4.60.03 R003.
rem 31mar99 cjl 	Change version to V4.60.04 R003.
rem 15jun99 cjl 	Change version to V4.60.05 R004.
rem 02jul99 cjl 	Change version to V4.60.06 R005.
rem 22oct99 mgs 	Change version to V4.60.10 R006.
rem 13mar00 mgs 	Change version to V4.60.13 B009.
rem 18apr00 mfg 	Change version to V4.60.14 R010.
rem 09sep00 cab		Change version to V4.60.15 R011.
rem             	Removed hardware from build and added test if setvar was run
rem					Added call to cedemocopy and democopy ML
rem 04oct00 cab 	Added command line argument kitcopy to create folder swi95nt without
rem					need of rebuilding files.
rem 19oct00	cab		Added test to check if setvar was run
rem 20oct00	cab		Change version to V4.61.01 B002.
rem 27oct00	cab		Added french
rem 06nov00	cab		Added CAB kitcopy call and rem out french and alphabatized languages
rem 09nov00 cab		Added call to open another dos prompt to run windows\windows ce at sametime
rem 20nov00	cab		Added call for democopy and cedemocopy
rem 14dec00 cab		Changed version to V4.61.02 R002
rem	21dec00 cab		Added label skip_comment
rem 27dec00 cab		Added new option to run kitcopy,democopy and cedemocopy.
rem 24jan01 cab		Added French
rem 26feb01 cab		Added case insensistive option for if
rem 01mar01 cab		Added error directory and log files
rem 16mar01 cab		Fixed error added ENGLISH_US
rem 28mar01 cab		Added comment to build_log for kitcopy, democpy, and cedemocopy.
rem 29mar01 cab		Added kitting option
rem 02apr01 cab		Added tune_languages option
rem ********************************************************************
:skip_comment

rem variable to indicate run within script
set multi_lang=1

rem check if setvar was run
if not "%setvardone%"=="1" goto bug_setvar

rem create swi95nt folder without rebuilding files
if {%1}=={} goto prod_mak
if /i "%1"=="prodmak" goto prod_mak
if /i "%1"=="kitcopy" goto kit_copy
if /i "%1"=="democopy" cd kitting
if /i "%1"=="democopy" goto demo_copy
if /i "%1"=="cedemocopy" cd kitting
if /i "%1"=="cedemocopy" goto cedemo_copy
if /i "%1"=="kitting" goto kit_copy
if /i "%1"=="tune" goto tune_languages
if not {%1}=={} echo you must enter: The option kitcopy, democopy or cedemocopy
if not {%1}=={} echo example:  dectalk32 kitcopy
if not {%1}=={} goto end

:prod_mak
@echo ***** Error log for prodmak.bat ******* > %blddrv%%bldpath%\build_log\errors\win%index%.log
call prodmak ENGLISH_US n
call prodmak ENGLISH_UK n
call prodmak FRENCH n
call prodmak GERMAN n
call prodmak SPANISH n
call prodmak SPANISH_LA n

rem build only after checking build process for errors
if /i "%1"=="prodmak" goto end

rem ********************************************************************
:tune_languages
@echo ***** Error log for dt_tune.bat **** >> %blddrv%%bldpath%\build_log\errors\win%index%.log
cd tools\tunecheck

call dt_tune us release s n
call dt_tune uk release s n
call dt_tune fr release s n
call dt_tune gr release s n
call dt_tune sp release s n
call dt_tune la release s n

rem call dt_dtune %langdir% 
rem call dt_dtune all release s n
cd ..\..
goto end

rem ********************************************************************
:kit_copy
@echo ***** Error log for kitcopy.bat **** >> %blddrv%%bldpath%\build_log\errors\win%index%.log
cd kitting
call kitcopy V4.61.02 cab
call kitcopy V4.61.02 cab ENGLISH_UK
call kitcopy V4.61.02 cab FRENCH
call kitcopy V4.61.02 cab GERMAN
call kitcopy V4.61.02 cab SPANISH
call kitcopy V4.61.02 cab SPANISH_LA
call kitcopy V4.61.02 cab ML
if /i "%1"=="kitcopy" goto end

rem ********************************************************************
:demo_copy
@echo ***** Error log for democopy.bat **** >> %blddrv%%bldpath%\build_log\errors\win%index%.log
call democopy
call democopy ENGLISH_UK
call democopy FRENCH
call democopy GERMAN
call democopy SPANISH
call democopy SPANISH_LA
rem Leave ML for last
call democopy ML
if /i "%1"=="democopy" goto end

rem *******************************************************************
:cedemo_copy
@echo ***** Error log for cedemocopy.bat **** >> %blddrv%%bldpath%\build_log\errors\win%index%.log
call cedemocopy
cd ..

rem ********************************************************************
echo **** DECTALK SoftWare IS DONE!!!! ****
rem ********************************************************************
goto end

:bug_setvar
echo Error! You did not run setvar!
goto end

:end
echo end of DECtalk32.bat