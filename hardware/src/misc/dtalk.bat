@echo off
rem copyright (c)1998 Digital Equipment Corporation all rights reserved.

rem ************INIT*******************
rem Usage dtalk [lang] [debug] [ioaddress]

rem LANGUAGES
if "%1" == "us"		goto go_on1
if "%1" == "sp"		goto go_on1
if "%1" == "la"		goto go_on1
if "%1" == "gr"		goto go_on1
if "%1" == "uk"		goto go_on1
if "%1" == "nws_us" goto go_on1
goto notlang

:go_on1
set lang=%1

rem IOADDRESS
set io = 350
if "%3" == "" goto good2
set io=%3
:good2

rem DEBUG
if "%2" == "y" goto debugversion 
if "%2" == "n" goto nodebugversion
if "%2" == "" goto nodebugversion
goto error2

:debugversion
if "%1" == "us"		goto usdebugversion
if "%1" == "sp"		goto spdebugversion
if "%1" == "la"		goto spdebugversion
if "%1" == "gr"		goto grdebugversion
if "%1" == "uk"		goto usdebugversion
if "%1" == "nws_us"     goto usdebugversion

:nodebugversion
if "%1" == "us"		goto usnodebugversion
if "%1" == "sp"		goto spnodebugversion
if "%1" == "la"		goto spnodebugversion
if "%1" == "gr"		goto grnodebugversion
if "%1" == "uk"		goto usnodebugversion
if "%1" == "nws_us"     goto usnodebugversion

:usdebugversion
cls
dt_driv -r
echo.
echo DECtalk module in self-test, please wait.
dt_driv -c -l -b %io%
if not errorlevel 1 goto usload
echo Self-test in progress
dt_driv -c -l -b %io%
if errorlevel 1 goto userror
goto usload

:usnodebugversion
cls
dt_driv -r > NUL
echo DECtalk module in self-test, please wait.
dt_driv -c -l -b %io% > NUL
if not errorlevel 1 goto usload
echo Self-test in progress
dt_driv -c -l -b %io% > NUL
if errorlevel 1 goto userror

:usload
echo.
echo DECtalk self-test OK.
echo.
echo Loading DECtalk files to onboard memory.
goto build

:spdebugversion
cls
dt_driv -r
echo.
echo M¢dulo DECtalk en estado de prueba propia, por favor espere.
dt_driv -c -l -b %io%
if not errorlevel 1 goto spload
echo Prueba propia en progreso.
dt_driv -c -l -b %io%
if errorlevel 1 goto sperror
goto spload

:spnodebugversion
cls
dt_driv -r > NUL
echo M¢dulo DECtalk en estado de prueba propia, por favor espere.
dt_driv -c -l -b %io% > NUL
if not errorlevel 1 goto spload
echo Prueba propia en progreso.
dt_driv -c -l -b %io% > NUL
if errorlevel 1 goto sperror

:spload
echo.
echo Prueba propia de DECtalk finalizo exitosamente.
echo.  
echo Cargando archivos de DECtalk a la memoria.  
goto build

:grdebugversion
cls
dt_driv -r
echo.
echo DECtalk Module im self-test, bithe warten.
dt_driv -c -l -b %io%
if not errorlevel 1 goto grload
echo Self-test lÑuft.
dt_driv -c -l -b %io%
if errorlevel 1 goto grerror
goto grload


:grdebugversion
cls
dt_driv -r > NUL
echo.
echo DECtalk Module im self-test, bithe warten.
dt_driv -c -l -b %io% > NUL
if not errorlevel 1 goto grload
echo Self-test lÑuft.
dt_driv -c -l -b %io% > NUL
if errorlevel 1 goto grerror

:grload
echo.
echo DECtalk self-test OK.
echo.
echo Loading DECtalk files to onboard memory.

:build
rem custom build settings 
if "%lang%" == "nws_us" goto nws_us_load

dt_load kernel.sys dic_%lang%.dic/%lang% lts_%lang%.exe ph_%lang%.exe cmd.exe dtpc_850.exe %lang%.exe > NUL
goto go_on3

:nws_us_load
set lang=us
dt_load kernel.sys nws_%lang%.dic/%lang% lts_%lang%.exe ph_%lang%.exe cmd.exe dtpc_850.exe %lang%.exe > NUL

:go_on3
if errorlevel 1 goto fail
echo.

start_%lang% > NUL
if "%1" == "us"		echo DECtalk successfully installed.
if "%1" == "sp"		echo Instalaci¢n exitosa de DECtalk PC. 
if "%1" == "la"		echo Instalaci¢n exitosa de DECtalk PC. 
if "%1" == "gr"		echo DECtalk PC erfolgreich imstelleir.
if "%1" == "uk"		echo DECtalk successfully installed.
if "%1" == "nws_us"     echo DECtalk successfully installed.
goto end


:userror
echo.
echo Module self-test failure.
echo.
echo Please check the module's I/O address setting and that it is
echo properly seated in the PC bus.
echo.
pause
goto end

:usfail
echo.
echo Load error.  Rerun the Install program.
echo.
pause
goto end

:usnotlang
echo.
echo You didn't type one of the languages we support.  
echo we support:  us sp la gr uk (nws_us for dtpc2 only)
goto usage

:userror2
echo.
echo You didn't type y or n for the debug switch
goto usage

:ususage
echo Usage is as follows:
echo dtalk [lang] [debug] [ioaddress]
echo where debug is y or n (n is default)
echo I/O address default is 350
goto end

:sperror
echo.
echo Falta en la prueba propia del m¢dulo DECtalk.  
echo.  
echo Por favor verifique la direcci¢n I-O del m¢dulo, y que el m¢dulo este  
echo sentado correctramente en el PC bus.  
echo.  
pause
goto end

:spfail
echo.
echo Error en el cargador.  Vuelva a marchar el programa de instalaci¢n.  
echo.  
pause
goto end

:spnotlang
echo.
echo You didn't type one of the languages we support.  
echo we support:  us sp la gr uk (nws_us for dtpc2 only)
goto spusage

:sperror2
echo.
echo You didn't type y or n for the debug switch
goto spusage

:spusage
echo Usage is as follows:
echo dtalk [lang] [debug] [ioaddress]
echo where debug is y or n (n is default)
echo I/O address default is 350
goto end

:grerror
echo.
echo Module self-test nicht erfolgreich.
echo.
echo Bitte Module I/O Addressen-Einstellung ÅberprÅfen
echo und prÅfen, de sie richtig im PC bus sitzt.
echo.
pause
goto end

:grfail
echo.
echo Auflade Irrtum.  Installierumgs programm wiederhoem.
echo.
pause
goto end

:grnotlang
echo.
echo You didn't type one of the languages we support.  
echo we support:  us sp la gr uk (nws_us for dtpc2 only)
goto grusage

:grerror2
echo.
echo You didn't type y or n for the debug switch
goto grusage

:grusage
echo Usage is as follows:
echo dtalk [lang] [debug] [ioaddress]
echo where debug is y or n (n is default)
echo I/O address default is 350

:end
