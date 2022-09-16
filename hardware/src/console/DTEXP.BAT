@echo off

if "%1"=="" goto nolang
dt_driv -r > NUL
echo DECtalk Express in self-test, please wait.
echo.
dt_driv -c -i 4 -b 3F8 > NUL
dt_driv -c -i 4 -b 3F8 > NUL
debug < c1.dbg > NUL
start_%1 "DECtalk Express is connected running version 4.6. [:power interval 30]
if errorlevel 1 goto notsr                              
echo The DECtalk Express is connected.
goto end
:notsr
echo Please be sure the unit is turned ON and connected to your PC.
echo.
goto end
:nolang
echo The syntax is:  dtexp [lang]
echo where [lang] is the language abbreviation.
echo    e.g.  dtexp us

:end
