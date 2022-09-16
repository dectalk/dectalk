@echo off
if NOT %1 = "" goto dt_start
echo .
echo Where would you like to install this demo?
echo (NOTE: please type in your response in the following manner):
echo .
echo install c:\dtdemo
echo .
goto end

:dt_start
echo. 
echo Digital Equipment Corporation, all rights reserved.
echo.
echo Installing DECtalk Software demonstration program.

md %1
dtdemo.exe -o %1

echo. 
echo DECtalk multi-language demonstration program installed.
echo.
echo To run the DECtalk demonstration program,  select one of
echo the four available language programs from the file manager
echo located in the %1 directory.
echo (Note: you will need to install all of the demo kits to
echo get all of the available languages.)
echo.    
echo    dtdem_us.exe  for U.S. English,
echo    dtdem_uk.exe  for U.K. English,
echo    dtdem_gr.exe  for German,
echo    dtdem_sp.exe  for Castilian Spanish,
echo    dtdem_la.exe  for Latin-American Spanish.
echo.

:end