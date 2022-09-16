@echo off
set setvar_debug=0
rem ****************************************************************
rem File Name:          SETVAR.BAT
rem File Created:       15-JAN-1997
rem File Author:        Nick Shin
rem File Purpose:       Environment Setup
rem ***************************************************************
rem Revisions:
rem     01/15/97 ncs    Set up the variables for makefiles.
rem     01/21/97 ncs    Add platform
rem     02/17/97 ncs    Add 16-bit compiler (MSVC) drive and path
rem     11/13/97 DR     Added a HARDWARE section along with a little tidbit on what is needed for a hardware build.
rem     06/02/98 cjl    Added tool_path to build.
rem		09/12/00 cab	Removed alpha from script
rem 	12/12/00 cab	Added call to setup envirnoment for Platform SDK for Sapi5
rem		02/14/01 cab	Edited names of script that use this file
rem
rem ***************************************************************
rem This file holds all the neat little variables that get used
rem in the make files of PRODMAK.BAT, KITCOPY.BAT, DEMOCOPY.BAT AND CEDEMOCOPY.BAT
rem
rem     NOTE: In order for this file to work, you MUST have the
rem following line in the autoexec.bat file:
rem
rem     SET SETVAR=DRIVE:\PATH\setvar.bat
rem     ie.     SET SETVAR=D:\setvar.bat
rem             SET SETVAR=C:\FooFoo\setvar.bat
rem
rem Where drive and path is the location of where you put YOUR OWN COPY
rem of setvar.bat.
rem
rem     BE AWARE!!!
rem Do NOT leave your copy where your build path is defined.
rem This will be copied on to the Star Team Server destroying the Default file.
rem     OR!!!
rem Your OWN copy can be OVERWRITTEN when checking files out of the Server.
rem
rem     You can pretty much guess what needs to be edited in order to
rem figure out how to configure the setups below.
rem     EDIT ONLY THE STUFF AFTER THE = SIGN.  Or else all of the
rem BAT and makefiles will puke on you. (Oh, and make sure it is correct.
rem Pay attention to the : and \   --these can break things too.)
rem
rem ***************************************************************
rem Known Bugs:
rem     1)
rem ***************************************************************

rem Setting Evirnment Variable to say that this file has been executed.
SET setvardone=1

rem ***************************************************************
rem                     32 BIT SETUP
rem ***************************************************************
rem Build Drive
set blddrv=d:

rem Build Path
rem IF you want it where you run it -- LEAVE THE SET EQUAL TO BLANK.
rem ie. {set bldpath=}	NOTE: There is no whitespace or quotes
rem                                   after the equal sign.
set bldpath=\work\ad

set tool_path=\work\tools

echo build path is set to %blddrv%%bldpath%

rem MSDEV Drive
set msddrv=c:
rem MSDEV PATH
set msdpath=\Progra~1\Micros~1\vc98

rem set msdpath=\msvc\bin

rem Install Shield Drive
set is3drv=c:

rem Install Shield Path
set is3path=\progra~1\instal~1\is3int~1

rem Platform - what machine we are building for.
rem     ie. set bld_mach=i386
set bld_mach=i386


call "c:\Program Files\Microsoft Visual Studio\VC98\Bin\vcvars32.bat"
call "c:\Program Files\Microsoft Platform SDK\setenv.bat

rem ***************************************************************
rem                     16 BIT SETUP
rem ***************************************************************

:hardware
rem -DR 11/13/97not needed or used....
rem MSVC Drive
set msvcdrv=c:
rem MSVC PATH
set msvcpath=\msvc


rem PATHS 
set MSVC_PATH=c:\msvc
set WATCOM_PATH=c:\watcom
set PHAR_PATH=c:\phar386
set MASM_PATH=c:\masm61
set PKZIP_PATH=c:\WINDOWS\COMMAND

goto end

rem a must for hardware build to run unless already set
set path=%path%;c:\phar386\bin;C:\WIN95\COMMAND;
rem 		phar uses a linker; for the choice command;
:end
echo Build path is set to %blddrv%%bldpath%

