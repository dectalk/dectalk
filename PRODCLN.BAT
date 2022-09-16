echo off       
set prodmak_debug=0
rem ***************************************************************
rem File Name:          PRODCLN.BAT
rem File Created:       24-FEB-1997
rem File Author:        Nick Shin
rem File Purpose:       Call the mak files with CLEAN only.
rem ***************************************************************
rem Revisions:
rem     02/24/97 ncs    Fix file to clean out the Debug directory also.
rem     04/18/97 ncs    Fixed file for quick call to prodmak.bat.
rem                     Eliminated the means for maintaining this file.
rem
rem ***************************************************************
rem     This file will call the mak files with the CLEAN parameter on.
rem     This is intended only for cleaning out your hard drive to
rem     free up some space.  This will call the language of your
rem     choice so that you may leave a particular language builds
rem     alone.
rem     For example, you are working on GERMAN -- you can get rid
rem     of the other language builds ONE AT A TIME so that you may
rem     continue to work on GERMAN.
rem
rem     Use this file to ensure that proper directories are cleaned
rem     out and ensuring that proper files are deleted.
rem     This file will delete all the *.obj *.exe ...(etc)...
rem     build files.
rem
rem ***************************************************************
rem Known Bugs:
rem     1)
rem ***************************************************************
REM The only input parameters allowed is the Language.

set dtlang=%1

if "%dtlang%"=="" set dtlang=ENGLISH_US
call prodmak %dtlang% y 1
