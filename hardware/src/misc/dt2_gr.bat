rem copyright (c)1996,1998 Digital Equipment Corporation all rights reserved.
@echo off
cls
@echo off
dt_driv -r > NUL
echo DECtalk Module im self-test, bithe warten.
dt_driv -c -l -b 250 > NUL
if not errorlevel 1 goto load
echo Self-test lÑuft.
dt_driv -c -l -b 250 > NUL
if errorlevel 1 goto error
:load
echo DECtalk self-test im OK
echo.
echo DECtalk Files werden aufgleden.
dt_load kernel.sys dic_gr.dic/gr lts_gr.exe ph_gr.exe cmd.exe gr.exe dtpc_850.exe
if errorlevel 1 goto fail
echo.
start_gr > NUL
echo DECtalk PC2 erfolgreich imstelleir.
goto end
:error
echo.
echo Module self-test nicht erfolgreich.
echo.
echo Bitte Module I/O Addressen-Einstellung ÅberprÅfen
echo und prÅfen, de sie richtig im PC bus sitzt.
echo.
pause
goto end
:fail
echo.
echo Auflade Irrtum.  Installierumgs programm wiederhoem.
echo.
pause
:end


