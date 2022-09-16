rem *******************************
rem Name:       testload.bat
rem Created:    January 27, 1998
rem By:         Carl Leeber
rem *******************************
rem       Modification History
rem *******************************
rem 03/19/99 cjl Add NWSNOAA SPANISH_LA.
rem
rem *******************************

rem ET 06/22/1998 save the various paths:
set tempath=%path%
set tempincl=%INCLUDE%
set templib=%LIB%

rem If the setvar variable isn't set, set defaults for msvcdrv and msvcpath.
if NOT "%setvar%"=="" goto goodtogo
echo WARNING: Setvar not defined.
echo WARNING: Using default path(s).
set MSVC_PATH=c:\msvc
set WATCOM_PATH=c:\watcom
set PHAR_PATH=c:\phar386
set MASM_PATH=C:\masm611
set PKZIP_PATH=c:\pkzip
set MSDDRV=c:
set MSDPATH=\progra~1\devstu~1
goto skipset

:goodtogo
rem If setvar.bat was already run, don't run it again.  This causes environment problems.
if "%setvardone%"=="1" goto skipset
call %setvar%
if NOT "%setvardone%"=="1" goto seterror

:skipset
rem Set working directory.
rem cd \WORK\ad\hardware\src\DTPC2\uk\release
%blddrv%
cd %bldpath%\hardware\src\DTPC2\uk\release
call dt2_uk
wait 5

rem cd \WORK\ad\hardware\src\DTPC2\sp\release
%blddrv%
cd %bldpath%\hardware\src\DTPC2\sp\release
call dt2_sp
wait 5

rem cd \WORK\ad\hardware\src\DTPC2\la\release
%blddrv%
cd %bldpath%\hardware\src\DTPC2\la\release
call dt2_la
wait 5

rem cd \WORK\ad\hardware\src\DTPC2\gr\release
%blddrv%
cd %bldpath%\hardware\src\DTPC2\gr\release
call dt2_gr
wait 5

rem cd \WORK\ad\hardware\src\DTPC2\nws_us\release
%blddrv%
cd %bldpath%\hardware\src\DTPC2\nws_us\release
call dt2_nws
wait 5

rem cd \WORK\ad\hardware\src\DTPC2\nws_la\release
%blddrv%
cd %bldpath%\hardware\src\DTPC2\nws_la\release
call dt2_nwl
wait 5

rem cd \WORK\ad\hardware\src\DTPC2\us\release
%blddrv%
cd %bldpath%\hardware\src\DTPC2\us\release
call dt2_us
wait 5

:dtpc1
rem cd \WORK\ad\hardware\src\DTPC1\uk\release
%blddrv%
cd %bldpath%\hardware\src\DTPC1\uk\release
call dt_uk
wait 5

rem cd \WORK\ad\hardware\src\DTPC1\sp\release
%blddrv%
cd %bldpath%\hardware\src\DTPC1\sp\release
call dt_sp
wait 5

rem cd \WORK\ad\hardware\src\DTPC1\la\release
%blddrv%
cd %bldpath%\hardware\src\DTPC1\la\release
call dt_la
wait 5

rem cd \WORK\ad\hardware\src\DTPC1\gr\release
%blddrv%
cd %bldpath%\hardware\src\DTPC1\gr\release
call dt_gr
wait 5

rem cd \WORK\ad\hardware\src\DTPC1\us\release
%blddrv%
cd %bldpath%\hardware\src\DTPC1\us\release
call dt_us
wait 5

:dtexp
rem cd \WORK\ad\hardware\src\DTEX\uk\release
%blddrv%
cd %bldpath%\hardware\src\DTEX\uk\release
call load 1
pause
call dtexp
wait 5

rem cd \WORK\ad\hardware\src\DTEX\sp\release
%blddrv%
cd %bldpath%\hardware\src\DTEX\sp\release
call load 1
pause
call dtexp
wait 5

rem cd \WORK\ad\hardware\src\DTEX\la\release
%blddrv%
cd %bldpath%\hardware\src\DTEX\la\release
call load 1
pause
call dtexp
wait 5

rem cd \WORK\ad\hardware\src\DTEX\gr\release
%blddrv%
cd %bldpath%\hardware\src\DTEX\gr\release
call load 1
pause
call dtexp
wait 5

rem cd \WORK\ad\hardware\src\DTEX\us\release
%blddrv%
cd %bldpath%\hardware\src\DTEX\us\release
call load 1
pause
call dtexp
wait 5

rem cd \WORK\ad\hardware\src\DTEX\ussp\release
%blddrv%
cd %bldpath%\hardware\src\DTEX\ussp\release
call load 1
pause
call dtexp
wait 5

rem cd \WORK\ad\hardware\src\DTEX\spus\release
%blddrv%
cd %bldpath%\hardware\src\DTEX\spus\release
call load 1
pause
call dtexp
wait 5

:end

rem Return to 'home' directory
rem cd ..\..\..
%blddrv%
cd %bldpath%\hardware\src

rem *******************EOF************************
