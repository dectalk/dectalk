@echo off
rem *************************************************************************
rem Filename: dt_tune.bat
rem Created Arpil, 27, 2000 by Nathan LeStage
rem
rem Function: To allow tuning of dectalk with minimal knowledge on how to
rem           run the autotuner
rem
rem *************************************************************************
rem Usage:
rem	dt_tune [language] [version] [length] [concurrent]
rem OR
rem	dt_tune CLEAN
rem	
rem If you specify the second or third param, you must specify all params
rem before it and not rely on defaults.
rem
rem *************************************************************************
rem Modification History
rem 
rem 001	04/27/2000	nal	Inception
rem 002 08/17/2000	nal	Added french and ability to tune all langs either one at a time or
rem						all at once. Added clean option to remove txt and exe files copied
rem 003	04/02/2001  cab	1. Added \i for case insensitive compare
rem						2. Added missing "" and copy of dtalk_*.dic
rem ************************************************************************

set lang=%1
set ver=%2
set length_param=%3
set concurrent=%4

set TUNE_ALL=0
set CONCUR=0

if /i "%1"=="CLEAN" goto CLEANUP

rem ************************************************************************
rem *	Use either the longer tuning text files for more complete tune, 
rem * or the shorter files for a quicker tune (i.e. for beta release
rem * or tuning just for the hell of it)
rem *
rem *	Options:
rem *		s, short, l, long, t, tiny
rem *	Default:
rem *		short
rem ************************************************************************
if "%length_param%"=="" set length=short
if "%length_param%"=="" goto lengthgood
if "%length_param%"=="s" set length=short
if "%length_param%"=="s" goto lengthgood
if "%length_param%"=="short" set length=short
if "%length_param%"=="short" goto lengthgood
if "%length_param%"=="l" set length=main
if "%length_param%"=="l" goto lengthgood
if "%length_param%"=="long" set length=main
if "%length_param%"=="long" goto lengthgood
if "%length_param%"=="t" set length=tiny
if "%length_param%"=="t" goto lengthgood
if "%length_param%"=="tiny" set length=tiny
if "%length_param%"=="tiny" goto lengthgood
echo Invalid length!
goto nogood
:lengthgood

rem ************************************************************************
rem *	Tune either the release or the debug version of DECtalk
rem *
rem *	Options:
rem *		r, release, d, debug
rem *	Default:
rem *		release
rem ************************************************************************
if "%ver%"=="" (
	set version=release
	goto ver_good
)
if "%ver%"=="r" (
	set version=release
	goto ver_good
)
if "%ver%"=="release" (
	set version=release
	goto ver_good
)
if "%ver%"=="d" (
	set version=debug
	goto ver_good
)
if "%ver%"=="debug" (
	set version=debug
	goto ver_good
)
echo Invalid version!
goto nogood
:ver_good

rem ************************************************************************
rem *	Language to tune
rem *
rem *	Options:
rem *		us, uk, sp, la, gr, fr, all
rem *	Default:
rem *		us
rem ************************************************************************
if "%lang%"==""  set lang=us
if /i "%lang%"=="us"  goto langgood
if /i "%lang%"=="uk"  goto langgood
if /i "%lang%"=="sp"  goto langgood
if /i "%lang%"=="la"  goto langgood
if /i "%lang%"=="gr"  goto langgood
if /i "%lang%"=="fr"  goto langgood
if /i "%lang%"=="all" (
	set TUNE_ALL=1
	goto langgood
)
echo Invalid language!
goto nogood

:langgood
rem ************************************************************************
rem *	Do all languages at the same time. Matt said it would be neat, so here it is.
rem *	Options:
rem *		y, Y, yes, YES
rem *	If anything else, the tune will occur one language at a time.
rem ************************************************************************
if /i "%concurrent%"=="y" set CONCUR=1
if /i "%concurrent%"=="yes" set CONCUR=1
goto STARTTUNE

:nogood
echo .
echo **********************************************
echo Usage: dt_tune [language] [version] [length] [concurrent]
echo .
echo Language must be on of following:
echo          us,  uk,  sp,  la,  gr, fr, all
echo .
echo Version must be one of following:
echo     release, r, debug, d
echo     Default is release
echo .
echo Length must be one of the following:
echo     short, s, long, l, tiny, t
echo     Default is short
echo .
echo Concurrent must be one of the following:
echo		yes, YES, y, Y
echo		All else means not concurrent.
echo		Default is not concurrent.
echo **********************************************
goto end

:STARTTUNE
if "%lang%"=="all" goto tune_all
echo .
echo language:     %lang%
echo version:      %version%
echo file length:  %length%
echo .
echo If this is incorrect, press ctrl+c and terminate batch job to quit.
echo Otherwise,
rem  Press any key to continue (appears automatically when pause is called)
rem pause
goto TUNE_IT

:tune_all
if "%lang%"=="fr"	goto end
if "%lang%"=="gr" set lang=fr
if "%lang%"=="la" set lang=gr
if "%lang%"=="sp" set lang=la
if "%lang%"=="uk" set lang=sp
if "%lang%"=="us" set lang=uk
if "%lang%"=="all" set lang=us


:TUNE_IT
copy %length%tune_%lang%.txt ..\..\dapi\build\dectalk\%lang%\%version%\*
if exist ..\..\swi95nt\%lang%\install\data\as_is\dtalk_%lang%.dic copy ..\..\swi95nt\%lang%\install\data\as_is\dtalk_%lang%.dic ..\..\dapi\build\dectalk\%lang%\%version%
cd ..\..\dapi\build\dectalk\%lang%\%version%\
echo tunecheck -t %length%tune_%lang%.txt -l %lang%_

if %CONCUR%==1 (
	start "Tunecheck - Tuning!  %lang%,  Version: %version%,   %length%tune_%lang%.txt" tunecheck -t %length%tune_%lang%.txt -l %lang%_
	goto do_next
)

:single
tunecheck -t %length%tune_%lang%.txt -l %lang%_

:do_next
cd ..\..\..\..\..\tools\tunecheck

if "%CONCUR%"=="0" copy ..\..\dapi\build\dectalk\%lang%\%version%\res.txt log_%lang%.txt

if %TUNE_ALL%==1 goto tune_all
goto end


rem ****************************************************************************
rem ****************************************************************************
rem *****                         CLEANUP STUFF                            *****
rem This removes the tuning files (.txt) and the result files, as well as the 
rem tunecheck.exe files. It's just a brute-force remove-anything-it-could-be
rem little script, expect many "Bad directory or file name" warnings. 
rem
rem Careful - this removes the tunechecker itself, so you will have to build
rem a new one if you need to tune again.
rem ****************************************************************************
:CLEANUP

set lang=start

:cleanlang
set version=release

if "%lang%"=="fr"	goto end
if "%lang%"=="gr" set lang=fr
if "%lang%"=="la" set lang=gr
if "%lang%"=="sp" set lang=la
if "%lang%"=="uk" set lang=sp
if "%lang%"=="us" set lang=uk
if "%lang%"=="start" set lang=us

:cleanver
erase ..\..\dapi\build\dectalk\%lang%\%version%\res.txt
erase ..\..\dapi\build\dectalk\%lang%\%version%\tunecheck.exe
erase ..\..\dapi\build\dectalk\%lang%\%version%\maintune_%lang%.txt
erase ..\..\dapi\build\dectalk\%lang%\%version%\shorttune_%lang%.txt

if %version%==release (
	set version=debug
	goto cleanver
) else (
set version=release
goto cleanlang
)
rem *************************** END OF CLEANUP ************************************

:end