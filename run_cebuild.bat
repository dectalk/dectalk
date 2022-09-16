@goto skip_comment
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
rem 006 cab	03/20/2002	Added redo option
:skip_comment

@if /i NOT "%blddrv%%bldpath%"=="d:\work\product" goto bug_invalid_folder
@if /i "%1"=="all" goto skip_options
@if /i "%1"=="ce" goto skip_options
@if /i "%1"=="redo" goto check_ce_redo
@if /i "%1"=="debug" goto skip_options
goto display_options

:check_ce_redo
@if /i "%2"=="all" goto skip_options
@if /i "%2"=="ce" goto skip_options
@if /i "%2"=="debug" goto skip_options
goto display_options

:display_options
@echo Builds the windows CE software as well as the kits.
@echo off	
@echo run_cebuild [ce] [debug]
@echo all   - Building all of Windows CE
@echo ce    - Building cebuild.bat only
@echo debug - Debugging Windows CE build.
@echo redo  - For rebuilding errors or modification to tree
@echo         Requires %%2 parameter: all, ce, and debug
goto error
:skip_options

rem check if file already exist
if exist %blddrv%%bldpath%\build_log\log\ce_build%index%.log goto bug_exist

if "%1"=="redo" goto skip_folder_check
if "%1"=="debug" goto skip_folder_check
rem Check if previous nonscipts builds of ce exist
if exist %blddrv%%bldpath%\dapi\build\cestatic				goto bug_end
if exist %blddrv%%bldpath%\dapi\build\cedll					goto bug_end
if exist %blddrv%%bldpath%\dtalkml\build\ce					goto bug_end
if exist %blddrv%%bldpath%\samplece\cetalk\build\dll		goto bug_end
if exist %blddrv%%bldpath%\samplece\cetalk\build\static		goto bug_end
if exist %blddrv%%bldpath%\samplece\dtsample\build\dll 		goto bug_end
if exist %blddrv%%bldpath%\samplece\dtsample\build\static 	goto bug_end
if exist %blddrv%%bldpath%\samplece\mailread\build\dll		goto bug_end
if exist %blddrv%%bldpath%\samplece\mailread\build\static	goto bug_end
if exist %blddrv%%bldpath%\samplece\windic\build\dll		goto bug_end
if exist %blddrv%%bldpath%\samplece\windic\build\static		goto bug_end
:skip_folder_check

rem Setup error log counter
set /a index-=1
echo index:=%index%

echo Command use to build version %index% > %blddrv%%bldpath%\build_log\log\ce_build%index%.log
date /t >> %blddrv%%bldpath%\build_log\log\ce_build%index%.log
time /t >> %blddrv%%bldpath%\build_log\log\ce_build%index%.log
echo run_cebuild.bat %1 >> %blddrv%%bldpath%\build_log\log\ce_build%index%.log

rem Change prompt for more info display
prompt $D$S$T$S$P$G

@echo ***** Error file for cebuild.bat **** > %blddrv%%bldpath%\build_log\errors\win_ce%index%.log

if /i "%1"=="debug" call cebuild.bat >> %blddrv%%bldpath%\build_log\log\ce_build%index%.log 2>&1
call cebuild.bat >> %blddrv%%bldpath%\build_log\log\ce_build%index%.log 2>%blddrv%%bldpath%\build_log\errors\output_ce%index%.log
if /i "%1"=="all" call dectalk32 kitting >> %blddrv%%bldpath%\build_log\log\ce_build%index%.log 2>%blddrv%%bldpath%\build_log\errors\output_ce%index%.log
if /i "%1"=="redo" (
	if /i "%2"=="all" call dectalk32 kitting >> %blddrv%%bldpath%\build_log\log\ce_build%index%.log 2>%blddrv%%bldpath%\build_log\errors\output_ce%index%.log
)
goto end

:bug_end
echo There already exist a build directory in %blddrv%%bldpath%\dapi\build for Windows ce
echo Error. Check all directory to remove these folders.
goto error

:bug_exist
echo File %blddrv%%bldpath%\build_log\errors\win_ce%index%.log already exists
goto error

:bug_invalid_folder
echo Error! You are not in the same path as in d:\work\setavar.bat
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
