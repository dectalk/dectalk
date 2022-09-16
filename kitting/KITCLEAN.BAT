echo off       
set prodmak_debug=0
rem ***************************************************************
rem File Name:          KITCLEAN.BAT
rem File Created:       26-FEB-1997
rem File Author:        Nick Shin
rem File Purpose:       To clean out some directories for disk space.
rem ***************************************************************
rem Revisions:
rem     02/24/97 ncs    Start Here
rem
rem ***************************************************************
rem This file is just for those who don't feel like using deltree
rem    by themselves.
rem This file is pritty much self explanatory.
rem
rem ***************************************************************
rem Known Bugs:
rem     1)
rem ***************************************************************
REM The only input parameters allowed is the Language.

set dtlang=%1

if NOT "%setvar%"=="" goto goodtogo
:nogood
echo WARNING: Setvar not defined.
echo WARNING: Using default build drive (d:).
set blddrv=d:
echo WARNING: Using current path as default build path (.)
echo WARNING: Using default MSDEV drive (c:).
set msddrv=c:
echo WARNING: Using default MSDEV path (\msdev).
set msdpath=\msdev
echo WARNING: Using default machine build (x86).
rem There must be a space after the = sign for (x86) builds.
set platform= 
goto checkdef

:goodtogo
if NOT EXIST %setvar% echo WARNING: Path %setvar% is not defined.
if NOT EXIST %setvar% goto nogood
if "%setvardone%"=="1" echo SETVAR.BAT already done.
if "%setvardone%"=="1" goto checkdef
call %setvar%

:checkdef
rem check for arguments
if "%dtlang%"=="" goto deflang
if "%dtlang%"=="""" goto deflang
goto cont1

:deflang
echo NOTE:
echo ------------------------------------------------------------------------
echo    "Usage: kitclean Language"
echo ------------------------------------------------------------------------
echo WARNING: Using default language (ENGLISH_US)
set dtlang=ENGLISH_US
goto checkdef

:cont1
if %prodmak_debug%==1 pause
rem ***************************************************************
rem Support build of single language at a time from a choice of several.
rem     Current support for ENGLISH_US, GERMAN, SPANISH, SPANISH_LA
rem
rem NEW: internal variables:
rem     lang_long (NOTE: there is a WHITESPACE in the beginning and
rem     lang_short		a double quote at the end.
rem                             This is needed because NMAKE is very
rem                             picky.)
rem ***************************************************************
if "%dtlang%"=="ENGLISH_US" set lang_long="
if "%dtlang%"=="ENGLISH_US" set lang_short=us
if "%dtlang%"=="ENGLISH_US" goto dtlangok
if "%dtlang%"=="GERMAN" set lang_long= German"
if "%dtlang%"=="GERMAN" set lang_short=gr
if "%dtlang%"=="GERMAN" goto dtlangok
if "%dtlang%"=="SPANISH" set lang_long= Spanish"
if "%dtlang%"=="SPANISH" set lang_short=sp
if "%dtlang%"=="SPANISH" goto dtlangok
if "%dtlang%"=="SPANISH_LA" set lang_long= Latin American"
if "%dtlang%"=="SPANISH_LA" set lang_short=la
if "%dtlang%"=="SPANISH_LA" goto dtlangok
rem <INSERT HERE new Language> (Follow the convention above)

rem Error
echo KITCLEAN.BAT Language parameter (%dtlang%) not recognized.
echo NOTE: Language parameter must be in caps.
echo -------------------------------------------------------------------
echo Choices are:
echo    ENGLISH_US      GERMAN          SPANISH         SPANISH_LA
rem INSERT MORE LANGUAGES HERE!!!
echo ___________________________________________________________________
goto error_end
:dtlangok

echo Defined variables:
echo .
echo blddrv   = %blddrv%
echo bldpath  = %bldpath%
echo Language = %dtlang%
echo PLATFORM = %platform%
echo .


if %prodmak_debug%==1 pause
deltree /y ..\swi95nt\%lang_short%\*.*

REM DONE!!!
goto end

:error_end
echo Error in BUILD Process: PRODMAK.BAT ************

:end
