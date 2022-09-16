rem *******************************
rem Name:       nswcopy.bat
rem Created:    October, 29, 1997
rem By:         Carl Leeber
rem *******************************
rem       Modification History
rem *******************************
rem     11/12/97 cjl Change name of dictionary file.
rem     03/18/99 cjl Change names for LA file.
rem     03/30/99 cjl Make all path specifications use setvar.bat settings.
rem
rem *******************************

rem ********** INITIALIZE SECTION START **********

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
rem Make directory on disk.
a:
md \nws_us

rem Set working directory.
rem cd \WORK\ad\hardware\src\DTPC2\nws_us\release
%blddrv%
cd %bldpath%\hardware\src\DTPC2\nws_us\release

rem Copy and rename executables as need to floppy.
copy ph_us.exe a:\nws_us\ph.exe
copy lts_us.exe a:\nws_us\lts.exe
copy cmd.exe a:\nws_us\cmd.exe
copy us.exe a:\nws_us\usa.exe

rem Copy and rename main dictionary to floppy.
copy nws_us.dic a:\nws_us\dtpc.dic

rem Copy DTPC2 OS to floppy.
copy kernel.sys a:\nws_us\kernel.sys

rem Return to 'home' directory
rem cd \WORK\ad\hardware\src
%blddrv%
cd %bldpath%\hardware\src

rem *******************************

rem Make directory on disk.
a:
md \nws_la

rem Set working directory.
rem cd \WORK\ad\hardware\src\DTPC2\nws_la\release
%blddrv%
cd %bldpath%\hardware\src\DTPC2\nws_la\release

rem Copy and rename executables as need to floppy.
copy ph_la.exe a:\nws_la\ph.exe
copy lts_la.exe a:\nws_la\lts.exe
copy cmd.exe a:\nws_la\cmd.exe
copy la.exe a:\nws_la\usa.exe

rem Copy and rename main dictionary to floppy.
copy nws_la.dic a:\nws_la\dtpc.dic

rem Copy DTPC2 OS to floppy.
copy kernel.sys a:\nws_la\kernel.sys

rem Return to 'home' directory
rem cd \WORK\ad\hardware\src
%blddrv%
cd %bldpath%\hardware\src

rem *******************EOF************************

