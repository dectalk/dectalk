echo on
goto skip_comment
rem Created by: Christian Berrios
rem Date: 03/09/2001
rem Comment
rem 001 cab	03/09/2001	Created file
rem 002 cab	03/27/2001	Added check for previous nonscipt builds
rem 003	cab	03/29/2001	1. Add ce option
rem						2. Added modified prompt
rem						3. Moved down index decrease
rem 004 cab	04/02/2001	Removed all option
rem 005 cab	04/11/2001	Added check if file already exist to prevent overwrite
rem 006 cab 06/07/2001  Fixed options for running
rem 007 cab	07/09/2001	Fixed log filename to ce
rem 008 cab	07/26/2001	1. Moved log file to new log directory
rem						2. Move previous logs to archive folders
rem 009 cab	07/27/2001	Logged all warning for build
rem 010 cab	07/30/2001	Fixed mv error
rem	011	cab	08/28/2001	Added comment for build logs
rem 012 cab 09/12/2001	Added call to re_index.bat
rem 013 cab	09/24/2001  1. Fixed error of reindex.bat to re_index.bat
rem						2. Fixed numbering of log files
rem 014 cab	09/25/2001	1. Added check for path first
rem						2. Fixed bug for :display_options
rem	015 cab 10/02/2002	Fix path to re_index to
:skip_comment

@if /i NOT "%blddrv%%bldpath%"=="d:\work\product" goto bug_invalid_folder
@if /i "%1"=="all" goto skip_options
@if /i "%1"=="ce" goto skip_options
@if /i "%1"=="debug" goto skip_options
goto display_options

:display_options
@echo Builds the windows CE software as well as the kits.
@echo off	
@echo run_cebuild [ce] [debug]
@echo all   - Building all of Windows CE
@echo ce    - Building cebuild.bat only 
@echo debug - Debugging Windows CE build.
goto error

:skip_options

rem Setup error log counter
set /a index-=1
echo index:=%index%

rem check if file already exist
if exist %blddrv%%bldpath%\build_log\log\ce_build%index%.log goto bug_exist

echo Command use to build version %index% > %blddrv%%bldpath%\build_log\log\ce_build%index%.log
date /t >> %blddrv%%bldpath%\build_log\log\ce_build%index%.log
time /t >> %blddrv%%bldpath%\build_log\log\ce_build%index%.log
echo run_cebuild.bat %1 >> %blddrv%%bldpath%\build_log\log\ce_build%index%.log

rem Change prompt for more info display
prompt $D$S$T$S$P$G
 
@echo ***** Error file for cebuild.bat **** > %blddrv%%bldpath%\build_log\errors\win_ce%index%.log
if /i "%1"=="ce" call cebuild.bat >> %blddrv%%bldpath%\build_log\log\ce_build%index%.log 2>%blddrv%%bldpath%\build_log\errors\output_ce%index%.log
if /i "%1"=="all" (
	call cebuild.bat >> %blddrv%%bldpath%\build_log\log\ce_build%index%.log 2>%blddrv%%bldpath%\build_log\errors\output_ce%index%.log
	call dectalk32 kitting >> %blddrv%%bldpath%\build_log\log\ce_build%index%.log 2>%blddrv%%bldpath%\build_log\errors\output_ce%index%.log
)
if /i "%1"=="debug" call cebuild.bat >> %blddrv%%bldpath%\build_log\log\ce_build%index%.log 2>&1
goto end

:bug_end
@echo There already exist a build directory in %blddrv%%bldpath%\dapi\build for Windows ce
@echo Error. Check all directory to remove these folders.
goto error

:bug_exist
@echo File %blddrv%%bldpath%\build_log\errors\win_ce%index%.log already exists
goto error

:bug_invalid_folder
@echo Error! You are not in the same path as in d:\work\setavar.bat
goto error

:end

@rem Log all the warning found during build process
echo The number of warning found is found below > %blddrv%%bldpath%\build_log\warning\ce_warning%index%.log
find /c "warning" %blddrv%%bldpath%\build_log\log\ce_build%index%.log >> %blddrv%%bldpath%\build_log\warning\ce_warning%index%.log
find /n "warning" %blddrv%%bldpath%\build_log\log\ce_build%index%.log >> %blddrv%%bldpath%\build_log\warning\ce_warning%index%.log

rem reindex files in archive
call .\scripts\re_index.bat

rem return prompt to original state
prompt

:error