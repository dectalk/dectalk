@echo off
rem ****************************************************************
rem File Name:          VCVARS32.BAT
rem File Created:       20-FEB-1997
rem File Author:        Nick Shin
rem File Purpose:       Warning people not to use this file under
rem                     the work\rnd directory anymore.
echo *****************************************************************
echo         WARNING!!!     -- VCVARS32.BAT --     WARNING!!!
echo *****************************************************************
echo This file is now obsolete!!!
echo This file is left here for historical reasons only.
echo If for some reason you need to use this file for some old builds
echo    -- check earlier versions of vcvars32.bat on the server.
echo But, it would be most benifical for you to read this file before
echo    doing so.
rem
echo *****************************************************************
pause

rem This section of code from the original vcvars32.bat file under the
rem   msdev\bin directory asks for the location of the Visual C++ cd-rom.
rem   PLEASE set the environment vcsource as indicated below.
rem   -OR- just rem out the line.
rem   NO ONE SHOULD BE USING THIS FILE -- USE THE ORIGINAL VCVARS32.BAT file.

rem Root of Visual C++ files on cd-rom.
rem Remove "set vcsource=" if you don't want include cdrom in Visual C++ environment.
rem set vcsource=\\ATGSERV\CDROM\MSDEV

echo *****************************************************************
