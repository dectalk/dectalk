@echo off
rem copyright (c)1996 Digital Equipment Corporation all rights reserved.

rem ************INIT*******************
rem Usage dt2 [lang] [debug]

rem LANGUAGES
if "%1" == "us"		goto go_on1
if "%1" == "sp"		goto go_on1
if "%1" == "la"		goto go_on1
if "%1" == "gr"		goto go_on1
if "%1" == "us"		goto go_on1
if "%1" == "uk"		goto go_on1
if "%1" == "nws_us" goto go_on1
goto error1

:go_on1
set lang=%1

rem DEBUG
set debug=> NUL
if "%2" == "y"	goto good
goto go_on2
:good
set debug=
:go_on2

cls

rem the -r removes any previous dectalk tsr in memory
dt_driv -r %debug%

 							
echo DECtalk module in self-test, please wait.
dt_driv -c -l -b 250 %debug%
if not errorlevel 1 goto load
echo Self-test in progress.
dt_driv -c -l -b 250 %debug%
if errorlevel 1 goto error

:load
echo DECtalk self-test OK
echo.
echo Loading DECtalk files to onboard memory.

rem custom build settings 
if "%lang%" == "nws_us" goto nws_us_load

dt_load kernel.sys dic_%lang%.dic/%lang% lts_%lang%.exe ph_%lang%.exe cmd.exe dtpc_850.exe %lang%.exe 
goto go_on3

:nws_us_load
set lang=us
dt_load kernel.sys nws_%lang%.dic/%lang% lts_%lang%.exe ph_%lang%.exe cmd.exe dtpc_850.exe %lang%.exe 

:go_on3
if errorlevel 1 goto fail
echo.
start_%lang% %debug%
echo DECtalk PC2 successfully installed.
goto end

:error
echo.
echo Module self-test failure.
echo.
echo Please check the module's I/O address setting and that it is
echo properly seated in the PC bus.
echo.
pause
goto end
:fail
echo.
echo Load error.  Rerun the Install program.
echo.
pause
goto end

:error1
echo.
echo You didn't type one of the languages we support.  
echo we support:  us sp la gr nws_us
goto usage

:usage
echo Usage is as follows:
echo dt2 [lang] [debug] [ioaddress]
echo where debug is y or n


:end
