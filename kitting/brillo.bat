rem ************************************************
rem File Name:          Brillo.bat
rem File Created:       Februray 9, 1998
rem File Author:        Carl Leeber
rem File Purpose:       Clean ALL of DECtalk(tm) Software off a system.
rem                     Does not include regedit calls (yet).
rem ************************************************
rem Arguments:
rem %1 => dtdrive       Is the drive letter for cleaning.
rem                     Default: c:
rem %2 => dtdir         Is the directory path to the DECtalk root.
rem                     Default: \"program files"\   (W95 specific)
rem
rem ************************************************
rem Modifcation History
rem ************************************************
rem 
rem ************************************************
set dtdrive=%1
set dtdir=%2

if "%dtdrive%"=="" set dtdrive=c:
if "%dtdir%"=="" set dtdir=\"Program Files"
rem ************************************************

deltree /y %dtdrive%%dtdir%\dectalk
del %winbootdir%\speech\dtlkttse.dll
del %winbootdir%\system\dectalk.dll
del %winbootdir%\system\dtalk_*.dll
call regedit
rem ************************************************

