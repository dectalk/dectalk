@echo off
set setvar_debug=0
goto skip_comment
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
rem		06/06/01 cab	1. Move echo for index to end
rem						2. Removed set setvar call
rem		06/26/01 cab	1. Removed variable %bld_mach%	
rem						2. Removed hardware built stuff
rem		07/03/01 cab	Added variable increment	
rem		09/13/01 cab	Added changes to index value 
rem		09/24/01 cab	Added skip_comment label
rem		09/25/01 cab	Fixed count for index
rem		10/02/01 cab	Simplified count of index
rem		10/11/01 cab	Added dectalk_sdk and archivepath variables
rem		02/14/02 cab	Check for existance of directory
rem	
rem ***************************************************************
rem This file holds all the neat little variables that get used
rem in the make files of PRODMAK.BAT, KITCOPY.BAT, DEMOCOPY.BAT AND CEDEMOCOPY.BAT
rem
rem NOTE: In order for this file to work, you MUST have the
rem following line in the autoexec.bat file:
rem
rem     SET SETVAR=DRIVE:\PATH\setvar.bat
rem     ie.     SET SETVAR=D:\setvar.bat
rem             SET SETVAR=C:\FooFoo\setvar.bat
rem
rem Where drive and path is the location of where you put YOUR OWN COPY
rem of setvar.bat.
rem
rem BE AWARE!!!
rem Do NOT leave your copy where your build path is defined.
rem This will be copied on to the Star Team Server destroying the Default file.
rem OR!!!
rem Your OWN copy can be OVERWRITTEN when checking files out of the Server.
rem
rem You can pretty much guess what needs to be edited in order to
rem figure out how to configure the setups below.
rem EDIT ONLY THE STUFF AFTER THE = SIGN.  Or else all of the
rem BAT and makefiles will puke on you. (Oh, and make sure it is correct.
rem Pay attention to the : and \   --these can break things too.)
rem
rem ***************************************************************
rem Known Bugs:
rem     1)
rem ***************************************************************
:skip_comment

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
rem                           after the equal sign.

set bldpath=\work\rnd
rem set bldpath=\work\product

if NOT exist %bldrv%%bldpath% goto error
rem set archivepath=\work\archive\product041601
set tool_path=\work\tools
rem Which SDK is being built: sdk, trial or DSP
set dectalk_sdk=sdk

rem MSDEV Drive
set msddrv=c:
rem MSDEV PATH
set msdpath=\Progra~1\Micros~1\vc98

rem set msdpath=\msvc\bin

rem Install Shield Drive
set is3drv=c:

rem Install Shield Path
rem set is3path=\progra~1\instal~1\is3int~1

set is3path=\"program files"\InstallShield\


rem setup Visual Studio Setting
call "c:\Program Files\Microsoft Visual Studio\VC98\Bin\vcvars32.bat"

rem Setup Microsoft Platform SDK for Sapi 5.0
call "c:\Program Files\Microsoft Platform SDK\setenv.bat

rem increment log files
FOR /L %%i IN (1,1,99) do if exist %blddrv%%bldpath%\build_log\log\win_build%%i.log set index=%%i
rem increment variable index
set /a index+=1

rem for rerunning file without calling setvar
set increment=0
goto end

:error
echo path %blddrv%%bldpath% doesn't exist!
goto bug_end

:end
echo bldpath:=%blddrv%%bldpath%
rem echo archivepath:=%blddrv%%archivepath%
echo Index:=%index%
echo dectalk_sdk:=%dectalk_sdk%

rem echo on
rem cd %blddrv%%bldpath%
rem call full_build.bat test

:bug_end