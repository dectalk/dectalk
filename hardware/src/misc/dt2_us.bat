rem copyright (c)1996,1998 Digital Equipment Corporation all rights reserved.
@echo off
cls
dt_driv -r > NUL
echo DECtalk module in self-test, please wait.
dt_driv -c -l -b 250 > NUL
if not errorlevel 1 goto load
echo Self-test in progress.
dt_driv -c -l -b 250 > NUL
if errorlevel 1 goto error
:load
echo DECtalk self-test OK
echo.
echo Loading DECtalk files to onboard memory.
dt_load kernel.sys dic_us.dic lts_us.exe ph_us.exe cmd.exe dtpc_850.exe us.exe 
if errorlevel 1 goto fail
echo.
start_us > NUL
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
:end
