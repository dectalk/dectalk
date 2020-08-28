@echo off
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
rem 28mar01 cab		Added comment to build_log for kitcopy, democopy, and cedemocopy.
rem 29mar01 cab		Added kitting option
rem 02apr01 cab		Added tune_languages option
rem 21jun01 cab		Added options for tune and clean
rem 27jun01 cab		Modified message with no arguments
rem 17jul01 cab		Changed version to V5.00.01 B001
rem 31aug01 cab		Added all option
rem 08oct01 cab		Added comment of language in log file and created new kit log file
rem 12jan02 cab		Added return to root for kitting section
rem 23jan02	cab		Added skip demos if trial_sdk
rem	23sep02	cab		Added setvardone check
rem ********************************************************************
:skip_comment

rem variable to indicate run within script
set multi_lang=1

rem check if setvar was run
if not "%setvardone%"=="1" goto bug_setvar

if {%1}=={} goto display_options
if /i "%1"=="prodmak" goto prod_mak
if /i "%1"=="kitcopy" goto kit_copy
if /i "%1"=="democopy" (
	cd kitting
	goto demo_copy
)
if /i "%1"=="cedemocopy" (
	cd kitting
	goto cedemo_copy
)
if /i "%1"=="kitting" goto kit_copy
if /i "%1"=="tune" goto tune_languages
if /i "%1"=="clean" goto prod_mak
if /i "%1"=="all" goto prod_mak
if /i NOT {%1}=={} goto display_options

:display_options
echo You must run the script file full_build.bat to run this file
goto bug_end


:prod_mak
echo ***** Error log for prodmak.bat ******* >> %blddrv%%bldpath%\build_log\errors\win%index%.log
if /i NOT "%1"=="clean" goto skip_prod_mak_clean
call prodmak ENGLISH_US y
call prodmak ENGLISH_UK y
call prodmak FRENCH y
call prodmak GERMAN y
call prodmak SPANISH y
call prodmak SPANISH_LA y
:skip_prod_mak_clean

echo ***** ENGLISH US ******* >> %blddrv%%bldpath%\build_log\errors\win%index%.log
call prodmak ENGLISH_US n
echo ***** ENGLISH UK ******* >> %blddrv%%bldpath%\build_log\errors\win%index%.log
call prodmak ENGLISH_UK n
echo ***** FRENCH ******* >> %blddrv%%bldpath%\build_log\errors\win%index%.log
call prodmak FRENCH n
echo ***** GERMAN ******* >> %blddrv%%bldpath%\build_log\errors\win%index%.log
call prodmak GERMAN n
echo ***** CASTILIAN SPANISH ******* >> %blddrv%%bldpath%\build_log\errors\win%index%.log
call prodmak SPANISH n
echo ***** LATIN AMERICAN SPANISH ******* >> %blddrv%%bldpath%\build_log\errors\win%index%.log
call prodmak SPANISH_LA n

rem build only after checking build process for errors
if /i "%1"=="prodmak" goto end
if /i "%1"=="clean" goto end

rem ********************************************************************
if /i NOT "%1"=="tune" goto skip_tune
:tune_languages
echo ***** Error log for dt_tune.bat **** >> %blddrv%%bldpath%\build_log\errors\win%index%.log
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
:skip_tune

rem ********************************************************************
:kit_copy
echo ***** Error log for kitcopy.bat **** >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
cd kitting

echo ***** ENGLISH US **** >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
call kitcopy V5.00.01 cab
echo ***** ENGLISH UK **** >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
call kitcopy V5.00.01 cab ENGLISH_UK
echo ***** FRENCH **** >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
call kitcopy V5.00.01 cab FRENCH
echo ***** GERMAN **** >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
call kitcopy V5.00.01 cab GERMAN
echo ***** CASTILIAN SPANISH **** >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
call kitcopy V5.00.01 cab SPANISH
echo ***** LATIN AMERICAN SPANISH **** >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
call kitcopy V5.00.01 cab SPANISH_LA
echo ***** MULTI LANGUAGE **** >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
call kitcopy V5.00.01 cab ML
if /i "%1"=="kitcopy" (
	cd .\..
	goto end
)

rem ********************************************************************
:demo_copy
if /i "%dectalk_sdk%"=="trial" (
	cd .\..
	goto skip_demos
)
echo ***** Error log for democopy.bat **** >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

echo ***** ENGLISH US **** >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
call democopy
echo ***** ENGLISH UK **** >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
call democopy ENGLISH_UK
echo ***** FRENCH **** >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
call democopy FRENCH
echo ***** GERMAN **** >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
call democopy GERMAN
echo ***** CASTILIAN SPANISH **** >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
call democopy SPANISH
echo ***** LATIN AMERICAN SPANISH **** >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
call democopy SPANISH_LA
rem Leave ML for last
echo ***** MULTI LANGUAGE **** >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
call democopy ML
if /i "%1"=="democopy" (
	cd .\..
	goto end
)

rem *******************************************************************
:cedemo_copy
echo ***** Error log for cedemocopy.bat **** >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
call cedemocopy
:skip_demos
cd .\..

rem ********************************************************************
echo **** DECTALK SoftWare IS DONE!!!! ****
rem ********************************************************************
goto end

:bug_setvar
echo Error! You did not run setvar!
goto end

:end
@echo end of DECtalk32.bat

