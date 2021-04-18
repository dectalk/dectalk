@echo off
cls
echo.
echo DECtalk Express loader.
if %1!==! goto nocom
echo.
dt_driv -r >NUL
mfg_load %1 mon.hex fastload.hxo out.flr
goto beep
:nocom
echo 
echo The command to upload the firmware is: Load "N", where "N" is the
echo comm port the DECtalk Express is connected to.
echo.
echo For example, to upload on comm 1 the command is: 
echo.
echo            Load 1 (press Enter)
echo.
goto end
:beep
echo   
echo.
:end
