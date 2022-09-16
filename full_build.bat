@goto skip_comment
rem created March 1, 2001
rem by: Christian Berrios
rem *********************
rem 001	cab	03/02/2001	1. Added build log for cebuild.bat
rem						2. Added automatic log file increment
rem						3. Added parameter ce and win option
rem 002	cab	03/26/2001	1. Added dif file of files
rem 003 cab	03/28/2001	1. Added renaming ability for all build folders
rem						2. Added test for setvar
rem 004	cab	03/29/2001	1. Fixed missing goto end
rem						2. Added swi95nt move
rem						3. Added display of options and win\ce option
rem						4. Added modified prompt
rem 005 cab	03/30/2001	1. Added redo option
rem 006 cab	04/02/2001	1. Removed all option
rem						2. Added tune choice
rem 007	cab	04/11/2001	Set rename value to previous built
rem 008 cab	04/12/2001	Add rename build lang folders
rem 009 cab	04/17/2001	Moved & of langdir for rename to other line
rem 021 cab 08/31/2001	Added all option
rem 029	cab	10/11/2001	Added ce to redo command
rem 031 cab 11/12/2001	Added test option
rem 010 cab	01/07/2002	Fixed overwrite of log files
rem 032 cab	01/10/2002	Fixed typo for scripts
rem 033 cab	01/11/2002	Eliminated win_warning_.log for kitcopy option
rem 034 cab	02/20/2002	Added echo off for display options
rem 035 cab	03/20/2002	1. Fixed missing ce build with redo all
rem 036 cab				2. Run win and wince separately to save output in msdos.
rem	037 cab	03/21/2002	1. Changed label to skip_check
rem						2. Added test option
:skip_comment

if not "%setvardone%"=="1" goto bug_setvar
if /i NOT "%blddrv%%bldpath%"=="d:\work\product" goto bug_invalid_folder

if {%1}=={} goto display_options
if /i "%dectalk_sdk%"=="trial" (
	echo Make sure that DEMO_NOISE is define in %blddrv%%bldpath%\dectalkf.h
	pause
)
if /i "%dectalk_sdk%"=="sdk" (
	echo Building SDk version of DECtalk
	pause
)
if /i "%1"=="all" (
	set run_ce=1
	goto skip_check
)
if /i "%1"=="prodmak" goto skip_check
if /i "%1"=="kitcopy" (
	set option=pack
	goto skip_check
)
if /i "%1"=="democopy" (
	set option=pack
	goto skip_check
)
if /i "%1"=="cedemocopy" (
	set option=pack
	goto skip_check
)
if /i "%1"=="kitting" (
	set option=pack
	goto skip_check
)
if /i "%1"=="clean" goto skip_check
if /i "%1"=="win" (
	set option=debug
	goto check_win_redo
)
if /i "%1"=="ce" (
	set option=debug
	set run_ce=1
	goto skip_check
)
if /i "%1"=="redo" (
	set option=debug
	goto check_win_redo
)
if /i "%1"=="tune" (
	set option=debug
	goto skip_check
)
if /i "%1"=="rename" (
	set option=debug
	goto check_rename
)
if /i "%1"=="test" (
	set option=debug
	goto skip_check
)
goto display_options

:display_options
@echo off
echo Runs the full build for DECtalk software.
echo full_build [all] [win %%2] [ce] [prodmak] [kitcopy] [democopy] [cedemocopy] [kitting]
echo full_build [rename] [tune] [test]
echo all         - Builds all of dectalk
echo prodmak     - Builds the workspaces and source files for windows
echo               ( optional %2 parameter clean)
echo kitcopy     - Run kitcopy.bat
echo democopy    - Runs democopy.bat
echo cedemocopy  - Runs cedemocopy.bat
echo kitting     - Runs kitcopy.bat, democopy.bat and cedemocopy.bat
echo               (for use only with "win" option)
echo Win         - For debugging errors found in Windows outputs log
echo               Has %%2 parameter option for partial build which are
echo               kitcopy, democopy, cedemocopy or kitting.
echo Ce          - For debugging errors found in Windows CE outputs log
echo redo        - For rebuilding errors or modification to tree
echo               Requires %%2 parameter: all, prodmak, kitcopy, democopy, cedemocopy or kitting
echo Other options:
echo tune        - Tunes DECtalk languages.
echo rename      - For renaming language specific folders
echo               Requires %%2 parameter which are la,sp,fr,gr,uk or us.
echo clean       - For cleaning prodmak.bat
echo Test        - For testing the contains of the build tree
echo examples:   full_build win          - For debugging errors found in windows outputs log
echo             full_build ce           - For debugging errors found in Windows CE outputs log
echo             full_build tune         - Runs tuning
echo             full_build redo prodmak - Use to rebuild errors found in prodmak.bat
echo             full_build test         - Test the applications and dll's
goto bug_end

rem for win and redo
:check_win_redo
if /i "%2"=="all" (
	set run_ce=1
	goto skip_check
)
if /i "%2"=="prodmak" goto skip_check
if /i "%2"=="kitcopy" goto skip_check
if /i "%2"=="democopy" goto skip_check
if /i "%2"=="cedemocopy" goto skip_check
if /i "%2"=="kitting" goto skip_check
if /i "%2"=="tune" goto skip_check
if /i "%2"=="ce" (
	set run_ce=1
	goto skip_check
)
goto display_options

rem rename
:check_rename
if /i "%2"=="la" (
	set langdir=%2
	goto skip_check
)
if /i "%2"=="sp" (
	set langdir=%2
	goto skip_check
)
if /i "%2"=="fr" (
	set langdir=%2
	goto skip_check
)
if /i "%2"=="gr" (
	set langdir=%2
	goto skip_check
)
if /i "%2"=="uk" (
	set langdir=%2
	goto skip_check
)
if /i "%2"=="us" (
	set langdir=%2
	goto skip_check
)
if /i "%2"=="tune" goto skip_check
goto display_options
:skip_check

rem Create archive folders
if not exist %blddrv%%bldpath%\build_log\errors\archive		md %blddrv%%bldpath%\build_log\errors\archive
if not exist %blddrv%%bldpath%\build_log\files\archive		md %blddrv%%bldpath%\build_log\files\archive
if not exist %blddrv%%bldpath%\build_log\log\archive		md %blddrv%%bldpath%\build_log\log\archive
if not exist %blddrv%%bldpath%\build_log\warning\archive	md %blddrv%%bldpath%\build_log\warning\archive

rem increment count
if NOT "%increment%"=="1" goto skip_increment
set /a index+=1
:skip_increment

if exist %blddrv%%bldpath%\build_log\log\win_build%index%.log echo File %blddrv%%bldpath%\build_log\log\win_build%index%.log already exist please check script for errors & goto finish
date /t > %blddrv%%bldpath%\build_log\log\win_build%index%.log
time /t >> %blddrv%%bldpath%\build_log\log\win_build%index%.log
echo Command use to build version %index% >> %blddrv%%bldpath%\build_log\log\win_build%index%.log
echo full_build.bat %1 %2 >> %blddrv%%bldpath%\build_log\log\win_build%index%.log

rem Change prompt for more info display
prompt $D$S$T$S$P$G
@echo on

rem Rename build directories for a specfic language
if /i NOT "%1"=="rename" goto skip_rename_lang
set /a index-=1
if exist %blddrv%%bldpath%\dapi\build\dectalk\%langdir%		move %blddrv%%bldpath%\dapi\build\dectalk\%langdir%		%blddrv%%bldpath%\dapi\build\dectalk\%langdir%_%index%
if exist %blddrv%%bldpath%\dapi\build\dtalkdic\%langdir%	move %blddrv%%bldpath%\dapi\build\dtalkdic\%langdir%	%blddrv%%bldpath%\dapi\build\dtalkdic\%langdir%_%index%
if exist %blddrv%%bldpath%\dapi\build\dtdemo\%langdir%		move %blddrv%%bldpath%\dapi\build\dtdemo\%langdir%		%blddrv%%bldpath%\dapi\build\dtdemo\%langdir%_%index%
if exist %blddrv%%bldpath%\dapi\build\dtlkstat\%langdir%	move %blddrv%%bldpath%\dapi\build\dtlkstat\%langdir%	%blddrv%%bldpath%\dapi\build\dtlkstat\%langdir%_%index%
if exist %blddrv%%bldpath%\dapi\build\dtstatic\%langdir%	move %blddrv%%bldpath%\dapi\build\dtstatic\%langdir%	%blddrv%%bldpath%\dapi\build\dtstatic\%langdir%_%index%
if exist %blddrv%%bldpath%\dapi\build\dtstatics\%langdir%	move %blddrv%%bldpath%\dapi\build\dtstatics\%langdir%	%blddrv%%bldpath%\dapi\build\dtstatics\%langdir%_%index%

if exist %blddrv%%bldpath%\dapi\build\wce200\cedll\mips\%langdir%		move %blddrv%%bldpath%\dapi\build\wce200\cedll\mips\%langdir%		%blddrv%%bldpath%\dapi\build\wce200\cedll\mips\%langdir%_%index%
if exist %blddrv%%bldpath%\dapi\build\wce200\cedll\sh\%langdir%			move %blddrv%%bldpath%\dapi\build\wce200\cedll\sh\%langdir%			%blddrv%%bldpath%\dapi\build\wce200\cedll\sh\%langdir%_%index%
if exist %blddrv%%bldpath%\dapi\build\wce200\cedll\x86em\%langdir%		move %blddrv%%bldpath%\dapi\build\wce200\cedll\x86em\%langdir%		%blddrv%%bldpath%\dapi\build\wce200\cedll\x86em\%langdir%_%index%
if exist %blddrv%%bldpath%\dapi\build\wce200\cestatic\mips\%langdir%	move %blddrv%%bldpath%\dapi\build\wce200\cestatic\mips\%langdir%	%blddrv%%bldpath%\dapi\build\wce200\cestatic\mips\%langdir%_%index%
if exist %blddrv%%bldpath%\dapi\build\wce200\cestatic\sh\%langdir%		move %blddrv%%bldpath%\dapi\build\wce200\cestatic\sh\%langdir%		%blddrv%%bldpath%\dapi\build\wce200\cestatic\sh\%langdir%_%index%
if exist %blddrv%%bldpath%\dapi\build\wce200\cestatic\x86em\%langdir%	move %blddrv%%bldpath%\dapi\build\wce200\cestatic\x86em\%langdir%	%blddrv%%bldpath%\dapi\build\wce200\cestatic\x86em\%langdir%_%index%

if exist %blddrv%%bldpath%\dapi\build\wce211\mspro\cedll\arm\%langdir%		move %blddrv%%bldpath%\dapi\build\wce211\mspro\cedll\arm\%langdir%		%blddrv%%bldpath%\dapi\build\wce211\mspro\cedll\arm\%langdir%_%index%
if exist %blddrv%%bldpath%\dapi\build\wce211\mspro\cedll\mips\%langdir%		move %blddrv%%bldpath%\dapi\build\wce211\mspro\cedll\mips\%langdir%		%blddrv%%bldpath%\dapi\build\wce211\mspro\cedll\mips\%langdir%_%index%
if exist %blddrv%%bldpath%\dapi\build\wce211\mspro\cedll\sh\%langdir%		move %blddrv%%bldpath%\dapi\build\wce211\mspro\cedll\sh\%langdir%		%blddrv%%bldpath%\dapi\build\wce211\mspro\cedll\sh\%langdir%_%index%
if exist %blddrv%%bldpath%\dapi\build\wce211\mspro\cedll\sh4\%langdir%		move %blddrv%%bldpath%\dapi\build\wce211\mspro\cedll\sh4\%langdir%		%blddrv%%bldpath%\dapi\build\wce211\mspro\cedll\sh4\%langdir%_%index%
if exist %blddrv%%bldpath%\dapi\build\wce211\mspro\cedll\x86em\%langdir%	move %blddrv%%bldpath%\dapi\build\wce211\mspro\cedll\x86em\%langdir%	%blddrv%%bldpath%\dapi\build\wce211\mspro\cedll\x86em\%langdir%_%index%
if exist %blddrv%%bldpath%\dapi\build\wce211\mspro\cestatic\arm\%langdir%	move %blddrv%%bldpath%\dapi\build\wce211\mspro\cestatic\arm\%langdir%	%blddrv%%bldpath%\dapi\build\wce211\mspro\cestatic\arm\%langdir%_%index%
if exist %blddrv%%bldpath%\dapi\build\wce211\mspro\cestatic\mips\%langdir%	move %blddrv%%bldpath%\dapi\build\wce211\mspro\cestatic\mips\%langdir%	%blddrv%%bldpath%\dapi\build\wce211\mspro\cestatic\mips\%langdir%_%index%
if exist %blddrv%%bldpath%\dapi\build\wce211\mspro\cestatic\sh\%langdir%	move %blddrv%%bldpath%\dapi\build\wce211\mspro\cestatic\sh\%langdir%	%blddrv%%bldpath%\dapi\build\wce211\mspro\cestatic\sh\%langdir%_%index%
if exist %blddrv%%bldpath%\dapi\build\wce211\mspro\cestatic\sh4\%langdir%	move %blddrv%%bldpath%\dapi\build\wce211\mspro\cestatic\sh4\%langdir%	%blddrv%%bldpath%\dapi\build\wce211\mspro\cestatic\sh4\%langdir%_%index%
if exist %blddrv%%bldpath%\dapi\build\wce211\mspro\cestatic\x86em\%langdir%	move %blddrv%%bldpath%\dapi\build\wce211\mspro\cestatic\x86em\%langdir%	%blddrv%%bldpath%\dapi\build\wce211\mspro\cestatic\x86em\%langdir%_%index%

if exist %blddrv%%bldpath%\dapi\build\wce211\palm\cedll\mips\%langdir%		move %blddrv%%bldpath%\dapi\build\wce211\palm\cedll\mips\%langdir%		%blddrv%%bldpath%\dapi\build\wce211\palm\cedll\mips\%langdir%_%index%
if exist %blddrv%%bldpath%\dapi\build\wce211\palm\cedll\sh\%langdir%		move %blddrv%%bldpath%\dapi\build\wce211\palm\cedll\sh\%langdir%		%blddrv%%bldpath%\dapi\build\wce211\palm\cedll\sh\%langdir%_%index%
if exist %blddrv%%bldpath%\dapi\build\wce211\palm\cedll\x86em\%langdir%		move %blddrv%%bldpath%\dapi\build\wce211\palm\cedll\x86em\%langdir%		%blddrv%%bldpath%\dapi\build\wce211\palm\cedll\x86em\%langdir%_%index%
if exist %blddrv%%bldpath%\dapi\build\wce211\palm\cestatic\mips\%langdir%	move %blddrv%%bldpath%\dapi\build\wce211\palm\cestatic\mips\%langdir%	%blddrv%%bldpath%\dapi\build\wce211\palm\cestatic\mips\%langdir%_%index%
if exist %blddrv%%bldpath%\dapi\build\wce211\palm\cestatic\sh\%langdir%		move %blddrv%%bldpath%\dapi\build\wce211\palm\cestatic\sh\%langdir%		%blddrv%%bldpath%\dapi\build\wce211\palm\cestatic\sh\%langdir%_%index%
if exist %blddrv%%bldpath%\dapi\build\wce211\palm\cestatic\x86em\%langdir%	move %blddrv%%bldpath%\dapi\build\wce211\palm\cestatic\x86em\%langdir%	%blddrv%%bldpath%\dapi\build\wce211\palm\cestatic\x86em\%langdir%_%index%

if exist %blddrv%%bldpath%\dapi\build\wce300\cedll\arm\%langdir%		move %blddrv%%bldpath%\dapi\build\wce300\cedll\arm\%langdir%		%blddrv%%bldpath%\dapi\build\wce300\cedll\arm\%langdir%_%index%
if exist %blddrv%%bldpath%\dapi\build\wce300\cedll\mips\%langdir%		move %blddrv%%bldpath%\dapi\build\wce300\cedll\mips\%langdir%		%blddrv%%bldpath%\dapi\build\wce300\cedll\mips\%langdir%_%index%
if exist %blddrv%%bldpath%\dapi\build\wce300\cedll\sh\%langdir%			move %blddrv%%bldpath%\dapi\build\wce300\cedll\sh\%langdir%			%blddrv%%bldpath%\dapi\build\wce300\cedll\sh\%langdir%_%index%
if exist %blddrv%%bldpath%\dapi\build\wce300\cedll\x86em\%langdir%		move %blddrv%%bldpath%\dapi\build\wce300\cedll\x86em\%langdir%		%blddrv%%bldpath%\dapi\build\wce300\cedll\x86em\%langdir%_%index%
if exist %blddrv%%bldpath%\dapi\build\wce300\cestatic\arm\%langdir%		move %blddrv%%bldpath%\dapi\build\wce300\cestatic\arm\%langdir%		%blddrv%%bldpath%\dapi\build\wce300\cestatic\arm\%langdir%_%index%
if exist %blddrv%%bldpath%\dapi\build\wce300\cestatic\mips\%langdir%	move %blddrv%%bldpath%\dapi\build\wce300\cestatic\mips\%langdir%	%blddrv%%bldpath%\dapi\build\wce300\cestatic\mips\%langdir%_%index%
if exist %blddrv%%bldpath%\dapi\build\wce300\cestatic\sh\%langdir%		move %blddrv%%bldpath%\dapi\build\wce300\cestatic\sh\%langdir%		%blddrv%%bldpath%\dapi\build\wce300\cestatic\sh\%langdir%_%index%
if exist %blddrv%%bldpath%\dapi\build\wce300\cestatic\x86em\%langdir%	move %blddrv%%bldpath%\dapi\build\wce300\cestatic\x86em\%langdir%	%blddrv%%bldpath%\dapi\build\wce300\cestatic\x86em\%langdir%_%index%

if exist %blddrv%%bldpath%\dapi\build\wtlkstat\%langdir%		move %blddrv%%bldpath%\dapi\build\wtlkstat\%langdir%		%blddrv%%bldpath%\dapi\build\wtlkstat\%langdir%_%index%

if exist %blddrv%%bldpath%\samplece\cetalk\build\wce200\dll\mips\%langdir%		move %blddrv%%bldpath%\samplece\cetalk\build\wce200\dll\mips\%langdir%		%blddrv%%bldpath%\samplece\cetalk\build\wce200\dll\mips\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\cetalk\build\wce200\dll\sh\%langdir%		move %blddrv%%bldpath%\samplece\cetalk\build\wce200\dll\sh\%langdir%		%blddrv%%bldpath%\samplece\cetalk\build\wce200\dll\sh\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\cetalk\build\wce200\dll\x86em\%langdir%		move %blddrv%%bldpath%\samplece\cetalk\build\wce200\dll\x86em\%langdir%		%blddrv%%bldpath%\samplece\cetalk\build\wce200\dll\x86em\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\cetalk\build\wce200\static\mips\%langdir%	move %blddrv%%bldpath%\samplece\cetalk\build\wce200\static\mips\%langdir%	%blddrv%%bldpath%\samplece\cetalk\build\wce200\static\mips\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\cetalk\build\wce200\static\sh\%langdir%		move %blddrv%%bldpath%\samplece\cetalk\build\wce200\static\sh\%langdir%		%blddrv%%bldpath%\samplece\cetalk\build\wce200\static\sh\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\cetalk\build\wce200\static\x86em\%langdir%	move %blddrv%%bldpath%\samplece\cetalk\build\wce200\static\x86em\%langdir%	%blddrv%%bldpath%\samplece\cetalk\build\wce200\static\x86em\%langdir%_%index%

if exist %blddrv%%bldpath%\samplece\cetalk\build\wce211\mspro\dll\arm\%langdir%			move %blddrv%%bldpath%\samplece\cetalk\build\wce211\mspro\dll\arm\%langdir%			%blddrv%%bldpath%\samplece\cetalk\build\wce211\mspro\dll\arm\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\cetalk\build\wce211\mspro\dll\mips\%langdir%		move %blddrv%%bldpath%\samplece\cetalk\build\wce211\mspro\dll\mips\%langdir%		%blddrv%%bldpath%\samplece\cetalk\build\wce211\mspro\dll\mips\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\cetalk\build\wce211\mspro\dll\sh\%langdir%			move %blddrv%%bldpath%\samplece\cetalk\build\wce211\mspro\dll\sh\%langdir%			%blddrv%%bldpath%\samplece\cetalk\build\wce211\mspro\dll\sh\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\cetalk\build\wce211\mspro\dll\sh4\%langdir%			move %blddrv%%bldpath%\samplece\cetalk\build\wce211\mspro\dll\sh4\%langdir%			%blddrv%%bldpath%\samplece\cetalk\build\wce211\mspro\dll\sh4\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\cetalk\build\wce211\mspro\dll\x86em\%langdir%		move %blddrv%%bldpath%\samplece\cetalk\build\wce211\mspro\dll\x86em\%langdir%		%blddrv%%bldpath%\samplece\cetalk\build\wce211\mspro\dll\x86em\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\cetalk\build\wce211\mspro\static\arm\%langdir%		move %blddrv%%bldpath%\samplece\cetalk\build\wce211\mspro\static\arm\%langdir%		%blddrv%%bldpath%\samplece\cetalk\build\wce211\mspro\static\arm\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\cetalk\build\wce211\mspro\static\mips\%langdir%		move %blddrv%%bldpath%\samplece\cetalk\build\wce211\mspro\static\mips\%langdir%		%blddrv%%bldpath%\samplece\cetalk\build\wce211\mspro\static\mips\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\cetalk\build\wce211\mspro\static\sh\%langdir%		move %blddrv%%bldpath%\samplece\cetalk\build\wce211\mspro\static\sh\%langdir%		%blddrv%%bldpath%\samplece\cetalk\build\wce211\mspro\static\sh\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\cetalk\build\wce211\mspro\static\sh4\%langdir%		move %blddrv%%bldpath%\samplece\cetalk\build\wce211\mspro\static\sh4\%langdir%		%blddrv%%bldpath%\samplece\cetalk\build\wce211\mspro\static\sh4\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\cetalk\build\wce211\mspro\static\x86em\%langdir%	move %blddrv%%bldpath%\samplece\cetalk\build\wce211\mspro\static\x86em\%langdir%	%blddrv%%bldpath%\samplece\cetalk\build\wce211\mspro\static\x86em\%langdir%_%index%

if exist %blddrv%%bldpath%\samplece\cetalk\build\wce211\palm\dll\mips\%langdir%			move %blddrv%%bldpath%\samplece\cetalk\build\wce211\palm\dll\mips\%langdir%			%blddrv%%bldpath%\samplece\cetalk\build\wce211\palm\dll\mips\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\cetalk\build\wce211\palm\dll\sh\%langdir%			move %blddrv%%bldpath%\samplece\cetalk\build\wce211\palm\dll\sh\%langdir%			%blddrv%%bldpath%\samplece\cetalk\build\wce211\palm\dll\sh\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\cetalk\build\wce211\palm\dll\x86em\%langdir%		move %blddrv%%bldpath%\samplece\cetalk\build\wce211\palm\dll\x86em\%langdir%		%blddrv%%bldpath%\samplece\cetalk\build\wce211\palm\dll\x86em\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\cetalk\build\wce211\palm\static\mips\%langdir%		move %blddrv%%bldpath%\samplece\cetalk\build\wce211\palm\static\mips\%langdir%		%blddrv%%bldpath%\samplece\cetalk\build\wce211\palm\static\mips\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\cetalk\build\wce211\palm\static\sh\%langdir%		move %blddrv%%bldpath%\samplece\cetalk\build\wce211\palm\static\sh\%langdir%		%blddrv%%bldpath%\samplece\cetalk\build\wce211\palm\static\sh\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\cetalk\build\wce211\palm\static\x86em\%langdir%		move %blddrv%%bldpath%\samplece\cetalk\build\wce211\palm\static\x86em\%langdir%		%blddrv%%bldpath%\samplece\cetalk\build\wce211\palm\static\x86em\%langdir%_%index%

if exist %blddrv%%bldpath%\samplece\cetalk\build\wce300\dll\arm\%langdir%		move %blddrv%%bldpath%\samplece\cetalk\build\wce300\dll\arm\%langdir%		%blddrv%%bldpath%\samplece\cetalk\build\wce300\dll\arm\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\cetalk\build\wce300\dll\mips\%langdir%		move %blddrv%%bldpath%\samplece\cetalk\build\wce300\dll\mips\%langdir%		%blddrv%%bldpath%\samplece\cetalk\build\wce300\dll\mips\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\cetalk\build\wce300\dll\sh\%langdir%		move %blddrv%%bldpath%\samplece\cetalk\build\wce300\dll\sh\%langdir%		%blddrv%%bldpath%\samplece\cetalk\build\wce300\dll\sh\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\cetalk\build\wce300\dll\x86em\%langdir%		move %blddrv%%bldpath%\samplece\cetalk\build\wce300\dll\x86em\%langdir%		%blddrv%%bldpath%\samplece\cetalk\build\wce300\dll\x86em\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\cetalk\build\wce300\static\arm\%langdir%	move %blddrv%%bldpath%\samplece\cetalk\build\wce300\static\arm\%langdir%	%blddrv%%bldpath%\samplece\cetalk\build\wce300\static\arm\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\cetalk\build\wce300\static\mips\%langdir%	move %blddrv%%bldpath%\samplece\cetalk\build\wce300\static\mips\%langdir%	%blddrv%%bldpath%\samplece\cetalk\build\wce300\static\mips\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\cetalk\build\wce300\static\sh\%langdir%		move %blddrv%%bldpath%\samplece\cetalk\build\wce300\static\sh\%langdir%		%blddrv%%bldpath%\samplece\cetalk\build\wce300\static\sh\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\cetalk\build\wce300\static\x86em\%langdir%	move %blddrv%%bldpath%\samplece\cetalk\build\wce300\static\x86em\%langdir%	%blddrv%%bldpath%\samplece\cetalk\build\wce300\static\x86em\%langdir%_%index%

if exist %blddrv%%bldpath%\samplece\dtsample\build\wce200\dll\mips\%langdir%		move %blddrv%%bldpath%\samplece\dtsample\build\wce200\dll\mips\%langdir%		%blddrv%%bldpath%\samplece\dtsample\build\wce200\dll\mips\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\dtsample\build\wce200\dll\sh\%langdir%			move %blddrv%%bldpath%\samplece\dtsample\build\wce200\dll\sh\%langdir%			%blddrv%%bldpath%\samplece\dtsample\build\wce200\dll\sh\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\dtsample\build\wce200\dll\x86em\%langdir%		move %blddrv%%bldpath%\samplece\dtsample\build\wce200\dll\x86em\%langdir%		%blddrv%%bldpath%\samplece\dtsample\build\wce200\dll\x86em\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\dtsample\build\wce200\static\mips\%langdir%		move %blddrv%%bldpath%\samplece\dtsample\build\wce200\static\mips\%langdir%		%blddrv%%bldpath%\samplece\dtsample\build\wce200\static\mips\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\dtsample\build\wce200\static\sh\%langdir%		move %blddrv%%bldpath%\samplece\dtsample\build\wce200\static\sh\%langdir%		%blddrv%%bldpath%\samplece\dtsample\build\wce200\static\sh\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\dtsample\build\wce200\static\x86em\%langdir%	move %blddrv%%bldpath%\samplece\dtsample\build\wce200\static\x86em\%langdir%	%blddrv%%bldpath%\samplece\dtsample\build\wce200\static\x86em\%langdir%_%index%

if exist %blddrv%%bldpath%\samplece\dtsample\build\wce211\mspro\dll\arm\%langdir%		move %blddrv%%bldpath%\samplece\dtsample\build\wce211\mspro\dll\arm\%langdir%		%blddrv%%bldpath%\samplece\dtsample\build\wce211\mspro\dll\arm\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\dtsample\build\wce211\mspro\dll\mips\%langdir%		move %blddrv%%bldpath%\samplece\dtsample\build\wce211\mspro\dll\mips\%langdir%		%blddrv%%bldpath%\samplece\dtsample\build\wce211\mspro\dll\mips\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\dtsample\build\wce211\mspro\dll\sh\%langdir%		move %blddrv%%bldpath%\samplece\dtsample\build\wce211\mspro\dll\sh\%langdir%		%blddrv%%bldpath%\samplece\dtsample\build\wce211\mspro\dll\sh\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\dtsample\build\wce211\mspro\dll\sh4\%langdir%		move %blddrv%%bldpath%\samplece\dtsample\build\wce211\mspro\dll\sh4\%langdir%		%blddrv%%bldpath%\samplece\dtsample\build\wce211\mspro\dll\sh4\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\dtsample\build\wce211\mspro\dll\x86em\%langdir%		move %blddrv%%bldpath%\samplece\dtsample\build\wce211\mspro\dll\x86em\%langdir%		%blddrv%%bldpath%\samplece\dtsample\build\wce211\mspro\dll\x86em\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\dtsample\build\wce211\mspro\static\arm\%langdir%	move %blddrv%%bldpath%\samplece\dtsample\build\wce211\mspro\static\arm\%langdir%	%blddrv%%bldpath%\samplece\dtsample\build\wce211\mspro\static\arm\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\dtsample\build\wce211\mspro\static\mips\%langdir%	move %blddrv%%bldpath%\samplece\dtsample\build\wce211\mspro\static\mips\%langdir%	%blddrv%%bldpath%\samplece\dtsample\build\wce211\mspro\static\mips\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\dtsample\build\wce211\mspro\static\sh\%langdir%		move %blddrv%%bldpath%\samplece\dtsample\build\wce211\mspro\static\sh\%langdir%		%blddrv%%bldpath%\samplece\dtsample\build\wce211\mspro\static\sh\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\dtsample\build\wce211\mspro\static\sh4\%langdir%	move %blddrv%%bldpath%\samplece\dtsample\build\wce211\mspro\static\sh4\%langdir%	%blddrv%%bldpath%\samplece\dtsample\build\wce211\mspro\static\sh4\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\dtsample\build\wce211\mspro\static\x86em\%langdir%	move %blddrv%%bldpath%\samplece\dtsample\build\wce211\mspro\static\x86em\%langdir%	%blddrv%%bldpath%\samplece\dtsample\build\wce211\mspro\static\x86em\%langdir%_%index%

if exist %blddrv%%bldpath%\samplece\dtsample\build\wce211\palm\dll\mips\%langdir%		move %blddrv%%bldpath%\samplece\dtsample\build\wce211\palm\dll\mips\%langdir%		%blddrv%%bldpath%\samplece\dtsample\build\wce211\palm\dll\mips\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\dtsample\build\wce211\palm\dll\sh\%langdir%			move %blddrv%%bldpath%\samplece\dtsample\build\wce211\palm\dll\sh\%langdir%			%blddrv%%bldpath%\samplece\dtsample\build\wce211\palm\dll\sh\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\dtsample\build\wce211\palm\dll\x86em\%langdir%		move %blddrv%%bldpath%\samplece\dtsample\build\wce211\palm\dll\x86em\%langdir%		%blddrv%%bldpath%\samplece\dtsample\build\wce211\palm\dll\x86em\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\dtsample\build\wce211\palm\static\mips\%langdir%	move %blddrv%%bldpath%\samplece\dtsample\build\wce211\palm\static\mips\%langdir%	%blddrv%%bldpath%\samplece\dtsample\build\wce211\palm\static\mips\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\dtsample\build\wce211\palm\static\sh\%langdir%		move %blddrv%%bldpath%\samplece\dtsample\build\wce211\palm\static\sh\%langdir%		%blddrv%%bldpath%\samplece\dtsample\build\wce211\palm\static\sh\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\dtsample\build\wce211\palm\static\x86em\%langdir%	move %blddrv%%bldpath%\samplece\dtsample\build\wce211\palm\static\x86em\%langdir%	%blddrv%%bldpath%\samplece\dtsample\build\wce211\palm\static\x86em\%langdir%_%index%

if exist %blddrv%%bldpath%\samplece\dtsample\build\wce300\dll\arm\%langdir%			move %blddrv%%bldpath%\samplece\dtsample\build\wce300\dll\arm\%langdir%			%blddrv%%bldpath%\samplece\dtsample\build\wce300\dll\arm\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\dtsample\build\wce300\dll\mips\%langdir%		move %blddrv%%bldpath%\samplece\dtsample\build\wce300\dll\mips\%langdir%		%blddrv%%bldpath%\samplece\dtsample\build\wce300\dll\mips\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\dtsample\build\wce300\dll\sh\%langdir%			move %blddrv%%bldpath%\samplece\dtsample\build\wce300\dll\sh\%langdir%			%blddrv%%bldpath%\samplece\dtsample\build\wce300\dll\sh\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\dtsample\build\wce300\dll\x86em\%langdir%		move %blddrv%%bldpath%\samplece\dtsample\build\wce300\dll\x86em\%langdir%		%blddrv%%bldpath%\samplece\dtsample\build\wce300\dll\x86em\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\dtsample\build\wce300\static\arm\%langdir%		move %blddrv%%bldpath%\samplece\dtsample\build\wce300\static\arm\%langdir%		%blddrv%%bldpath%\samplece\dtsample\build\wce300\static\arm\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\dtsample\build\wce300\static\mips\%langdir%		move %blddrv%%bldpath%\samplece\dtsample\build\wce300\static\mips\%langdir%		%blddrv%%bldpath%\samplece\dtsample\build\wce300\static\mips\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\dtsample\build\wce300\static\sh\%langdir%		move %blddrv%%bldpath%\samplece\dtsample\build\wce300\static\sh\%langdir%		%blddrv%%bldpath%\samplece\dtsample\build\wce300\static\sh\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\dtsample\build\wce300\static\x86em\%langdir%	move %blddrv%%bldpath%\samplece\dtsample\build\wce300\static\x86em\%langdir%	%blddrv%%bldpath%\samplece\dtsample\build\wce300\static\x86em\%langdir%_%index%

if exist %blddrv%%bldpath%\samplece\mailread\build\wce211\mspro\dll\arm\%langdir%		move %blddrv%%bldpath%\samplece\mailread\build\wce211\mspro\dll\arm\%langdir%		%blddrv%%bldpath%\samplece\mailread\build\wce211\mspro\dll\arm\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\mailread\build\wce211\mspro\dll\mips\%langdir%		move %blddrv%%bldpath%\samplece\mailread\build\wce211\mspro\dll\mips\%langdir%		%blddrv%%bldpath%\samplece\mailread\build\wce211\mspro\dll\mips\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\mailread\build\wce211\mspro\dll\sh\%langdir%		move %blddrv%%bldpath%\samplece\mailread\build\wce211\mspro\dll\sh\%langdir%		%blddrv%%bldpath%\samplece\mailread\build\wce211\mspro\dll\sh\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\mailread\build\wce211\mspro\dll\sh4\%langdir%		move %blddrv%%bldpath%\samplece\mailread\build\wce211\mspro\dll\sh4\%langdir%		%blddrv%%bldpath%\samplece\mailread\build\wce211\mspro\dll\sh4\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\mailread\build\wce211\mspro\dll\x86em\%langdir%		move %blddrv%%bldpath%\samplece\mailread\build\wce211\mspro\dll\x86em\%langdir%		%blddrv%%bldpath%\samplece\mailread\build\wce211\mspro\dll\x86em\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\mailread\build\wce211\mspro\static\arm\%langdir%	move %blddrv%%bldpath%\samplece\mailread\build\wce211\mspro\static\arm\%langdir%	%blddrv%%bldpath%\samplece\mailread\build\wce211\mspro\static\arm\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\mailread\build\wce211\mspro\static\mips\%langdir%	move %blddrv%%bldpath%\samplece\mailread\build\wce211\mspro\static\mips\%langdir%	%blddrv%%bldpath%\samplece\mailread\build\wce211\mspro\static\mips\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\mailread\build\wce211\mspro\static\sh\%langdir%		move %blddrv%%bldpath%\samplece\mailread\build\wce211\mspro\static\sh\%langdir%		%blddrv%%bldpath%\samplece\mailread\build\wce211\mspro\static\sh\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\mailread\build\wce211\mspro\static\sh4\%langdir%	move %blddrv%%bldpath%\samplece\mailread\build\wce211\mspro\static\sh4\%langdir%	%blddrv%%bldpath%\samplece\mailread\build\wce211\mspro\static\sh4\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\mailread\build\wce211\mspro\static\x86em\%langdir%	move %blddrv%%bldpath%\samplece\mailread\build\wce211\mspro\static\x86em\%langdir%	%blddrv%%bldpath%\samplece\mailread\build\wce211\mspro\static\x86em\%langdir%_%index%

if exist %blddrv%%bldpath%\samplece\mailread\build\wce300\dll\arm\%langdir%			move %blddrv%%bldpath%\samplece\mailread\build\wce300\dll\arm\%langdir%			%blddrv%%bldpath%\samplece\mailread\build\wce300\dll\arm\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\mailread\build\wce300\dll\mips\%langdir%		move %blddrv%%bldpath%\samplece\mailread\build\wce300\dll\mips\%langdir%		%blddrv%%bldpath%\samplece\mailread\build\wce300\dll\mips\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\mailread\build\wce300\dll\sh\%langdir%			move %blddrv%%bldpath%\samplece\mailread\build\wce300\dll\sh\%langdir%			%blddrv%%bldpath%\samplece\mailread\build\wce300\dll\sh\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\mailread\build\wce300\dll\x86em\%langdir%		move %blddrv%%bldpath%\samplece\mailread\build\wce300\dll\x86em\%langdir%		%blddrv%%bldpath%\samplece\mailread\build\wce300\dll\x86em\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\mailread\build\wce300\static\arm\%langdir%		move %blddrv%%bldpath%\samplece\mailread\build\wce300\static\arm\%langdir%		%blddrv%%bldpath%\samplece\mailread\build\wce300\static\arm\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\mailread\build\wce300\static\mips\%langdir%		move %blddrv%%bldpath%\samplece\mailread\build\wce300\static\mips\%langdir%		%blddrv%%bldpath%\samplece\mailread\build\wce300\static\mips\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\mailread\build\wce300\static\sh\%langdir%		move %blddrv%%bldpath%\samplece\mailread\build\wce300\static\sh\%langdir%		%blddrv%%bldpath%\samplece\mailread\build\wce300\static\sh\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\mailread\build\wce300\static\x86em\%langdir%	move %blddrv%%bldpath%\samplece\mailread\build\wce300\static\x86em\%langdir%	%blddrv%%bldpath%\samplece\mailread\build\wce300\static\x86em\%langdir%_%index%

if exist %blddrv%%bldpath%\samplece\windic\build\wce211\mspro\dll\arm\%langdir%			move %blddrv%%bldpath%\samplece\windic\build\wce211\mspro\dll\arm\%langdir%			%blddrv%%bldpath%\samplece\windic\build\wce211\mspro\dll\arm\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\windic\build\wce211\mspro\dll\mips\%langdir%		move %blddrv%%bldpath%\samplece\windic\build\wce211\mspro\dll\mips\%langdir%		%blddrv%%bldpath%\samplece\windic\build\wce211\mspro\dll\mips\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\windic\build\wce211\mspro\dll\sh\%langdir%			move %blddrv%%bldpath%\samplece\windic\build\wce211\mspro\dll\sh\%langdir%			%blddrv%%bldpath%\samplece\windic\build\wce211\mspro\dll\sh\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\windic\build\wce211\mspro\dll\sh4\%langdir%			move %blddrv%%bldpath%\samplece\windic\build\wce211\mspro\dll\sh4\%langdir%			%blddrv%%bldpath%\samplece\windic\build\wce211\mspro\dll\sh4\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\windic\build\wce211\mspro\dll\x86em\%langdir%		move %blddrv%%bldpath%\samplece\windic\build\wce211\mspro\dll\x86em\%langdir%		%blddrv%%bldpath%\samplece\windic\build\wce211\mspro\dll\x86em\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\windic\build\wce211\mspro\static\arm\%langdir%		move %blddrv%%bldpath%\samplece\windic\build\wce211\mspro\static\arm\%langdir%		%blddrv%%bldpath%\samplece\windic\build\wce211\mspro\static\arm\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\windic\build\wce211\mspro\static\mips\%langdir%		move %blddrv%%bldpath%\samplece\windic\build\wce211\mspro\static\mips\%langdir%		%blddrv%%bldpath%\samplece\windic\build\wce211\mspro\static\mips\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\windic\build\wce211\mspro\static\sh\%langdir%		move %blddrv%%bldpath%\samplece\windic\build\wce211\mspro\static\sh\%langdir%		%blddrv%%bldpath%\samplece\windic\build\wce211\mspro\static\sh\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\windic\build\wce211\mspro\static\sh4\%langdir%		move %blddrv%%bldpath%\samplece\windic\build\wce211\mspro\static\sh4\%langdir%		%blddrv%%bldpath%\samplece\windic\build\wce211\mspro\static\sh4\%langdir%_%index%
if exist %blddrv%%bldpath%\samplece\windic\build\wce211\mspro\static\x86em\%langdir%	move %blddrv%%bldpath%\samplece\windic\build\wce211\mspro\static\x86em\%langdir%	%blddrv%%bldpath%\samplece\windic\build\wce211\mspro\static\x86em\%langdir%_%index%

if exist %blddrv%%bldpath%\samples\dtmemory\build\%langdir%		move %blddrv%%bldpath%\samples\dtmemory\build\%langdir%		%blddrv%%bldpath%\samples\dtmemory\build\%langdir%_%index%
if exist %blddrv%%bldpath%\samples\dtsample\build\%langdir%		move %blddrv%%bldpath%\samples\dtsample\build\%langdir%		%blddrv%%bldpath%\samples\dtsample\build\%langdir%_%index%
if exist %blddrv%%bldpath%\samples\say\build\%langdir%			move %blddrv%%bldpath%\samples\say\build\%langdir%			%blddrv%%bldpath%\samples\say\build\%langdir%_%index%
if exist %blddrv%%bldpath%\samples\speak\build\%langdir%		move %blddrv%%bldpath%\samples\speak\build\%langdir%		%blddrv%%bldpath%\samples\speak\build\%langdir%_%index%
if exist %blddrv%%bldpath%\samples\ttssrv\build\%langdir%		move %blddrv%%bldpath%\samples\ttssrv\build\%langdir%		%blddrv%%bldpath%\samples\ttssrv\build\%langdir%_%index%
if exist %blddrv%%bldpath%\samples\ttstest\build\%langdir%		move %blddrv%%bldpath%\samples\ttstest\build\%langdir%		%blddrv%%bldpath%\samples\ttstest\build\%langdir%_%index%
if exist %blddrv%%bldpath%\samples\windic\build\%langdir%		move %blddrv%%bldpath%\samples\windic\build\%langdir%		%blddrv%%bldpath%\samples\windic\build\%langdir%_%index%

if "%2"=="fr" skip_rename_lang_wttstest
if exist %blddrv%%bldpath%\samples\wttstest\build\%langdir%		move %blddrv%%bldpath%\samples\wttstest\build\%langdir%		%blddrv%%bldpath%\samples\wttstest\build\%langdir%_%index%
:skip_rename_lang_wttstest

if "%2"=="fr" skip_rename_lang_sapi
if exist %blddrv%%bldpath%\sapi\build\dtlkttse\%langdir%	move %blddrv%%bldpath%\sapi\build\dtlkttse\%langdir%	%blddrv%%bldpath%\sapi\build\dtlkttse\%langdir%_%index%
if exist %blddrv%%bldpath%\sapi\build\wtlkttse\%langdir%	move %blddrv%%bldpath%\sapi\build\wtlkttse\%langdir%	%blddrv%%bldpath%\sapi\build\wtlkttse\%langdir%_%index%
:skip_rename_lang_sapi

if exist %blddrv%%bldpath%\sapi5\build\%langdir% move %blddrv%%bldpath%\sapi5\build\%langdir%	%blddrv%%bldpath%\sapi5\build\%langdir%_%index%

if exist %blddrv%%bldpath%\swi95nt\%langdir%	move %blddrv%%bldpath%\swi95nt\%langdir%	%blddrv%%bldpath%\swi95nt\%langdir%_%index%

if exist %blddrv%%bldpath%\swi95nt\demos		move %blddrv%%bldpath%\swi95nt\demos	%blddrv%%bldpath%\swi95nt\demos_%langdir%%index%

if exist %blddrv%%bldpath%\tools\tunecheck\%langdir% move %blddrv%%bldpath%\tools\tunecheck\%langdir%	%blddrv%%bldpath%\tools\tunecheck\%langdir%_%index%
set /a index+=1
goto end
:skip_rename_lang

rem Rename build folders if they exist 
rem if "%index%"=="1" for /d /r %i in (*build) do echo %i & pause
if /i "%option%"=="pack" set /a index-=1 & goto rename_swi95nt
if /i "%option%"=="debug" goto skip_rename
set /a index-=1
if exist %blddrv%%bldpath%\cpanel\build		move %blddrv%%bldpath%\cpanel\build		%blddrv%%bldpath%\cpanel\build_%index%
if exist %blddrv%%bldpath%\dapi\build		move %blddrv%%bldpath%\dapi\build		%blddrv%%bldpath%\dapi\build_%index%
if exist %blddrv%%bldpath%\dtalkml\build	move %blddrv%%bldpath%\dtalkml\build	%blddrv%%bldpath%\dtalkml\build_%index%
if exist %blddrv%%bldpath%\kitting\build	move %blddrv%%bldpath%\kitting\build	%blddrv%%bldpath%\kitting\build_%index%

if exist %blddrv%%bldpath%\license\liceninc\build	move %blddrv%%bldpath%\license\liceninc\build	%blddrv%%bldpath%\license\liceninc\build_%index%
if exist %blddrv%%bldpath%\license\liceninc\wbuild	move %blddrv%%bldpath%\license\liceninc\wbuild	%blddrv%%bldpath%\license\liceninc\wbuild_%index%
if exist %blddrv%%bldpath%\license\licenseu\build	move %blddrv%%bldpath%\license\licenseu\build	%blddrv%%bldpath%\license\licenseu\build_%index%
if exist %blddrv%%bldpath%\license\licenseu\wbuild	move %blddrv%%bldpath%\license\licenseu\wbuild	%blddrv%%bldpath%\license\licenseu\wbuild_%index%

if exist %blddrv%%bldpath%\samplece\cetalk\build	move %blddrv%%bldpath%\samplece\cetalk\build	%blddrv%%bldpath%\samplece\cetalk\build_%index%
if exist %blddrv%%bldpath%\samplece\dtsample\build	move %blddrv%%bldpath%\samplece\dtsample\build	%blddrv%%bldpath%\samplece\dtsample\build_%index%
if exist %blddrv%%bldpath%\samplece\mailread\build	move %blddrv%%bldpath%\samplece\mailread\build	%blddrv%%bldpath%\samplece\mailread\build_%index%
if exist %blddrv%%bldpath%\samplece\windic\build	move %blddrv%%bldpath%\samplece\windic\build	%blddrv%%bldpath%\samplece\windic\build_%index%

if exist %blddrv%%bldpath%\sampleml\mldemo\build move %blddrv%%bldpath%\sampleml\mldemo\build	%blddrv%%bldpath%\sampleml\mldemo\build_%index%

if exist %blddrv%%bldpath%\samples\dtmemory\build	move %blddrv%%bldpath%\samples\dtmemory\build	%blddrv%%bldpath%\samples\dtmemory\build_%index%
if exist %blddrv%%bldpath%\samples\dtsample\build	move %blddrv%%bldpath%\samples\dtsample\build	%blddrv%%bldpath%\samples\dtsample\build_%index%
if exist %blddrv%%bldpath%\samples\say\build		move %blddrv%%bldpath%\samples\say\build		%blddrv%%bldpath%\samples\say\build_%index%
if exist %blddrv%%bldpath%\samples\speak\build		move %blddrv%%bldpath%\samples\speak\build		%blddrv%%bldpath%\samples\speak\build_%index%
if exist %blddrv%%bldpath%\samples\ttssrv\build		move %blddrv%%bldpath%\samples\ttssrv\build		%blddrv%%bldpath%\samples\ttssrv\build_%index%
if exist %blddrv%%bldpath%\samples\ttstest\build	move %blddrv%%bldpath%\samples\ttstest\build	%blddrv%%bldpath%\samples\ttstest\build_%index%
if exist %blddrv%%bldpath%\samples\vercheck\build	move %blddrv%%bldpath%\samples\vercheck\build	%blddrv%%bldpath%\samples\vercheck\build_%index%
if exist %blddrv%%bldpath%\samples\windic\build		move %blddrv%%bldpath%\samples\windic\build		%blddrv%%bldpath%\samples\windic\build_%index%
if exist %blddrv%%bldpath%\samples\wttstest\build	move %blddrv%%bldpath%\samples\wttstest\build	%blddrv%%bldpath%\samples\wttstest\build_%index%

if exist %blddrv%%bldpath%\sapi\build move %blddrv%%bldpath%\sapi\build		%blddrv%%bldpath%\sapi\build_%index%

if exist %blddrv%%bldpath%\sapi5\build move %blddrv%%bldpath%\sapi5\build	%blddrv%%bldpath%\sapi5\build_%index%

:rename_swi95nt
if exist %blddrv%%bldpath%\swi95nt move %blddrv%%bldpath%\swi95nt	%blddrv%%bldpath%\swi95nt_%index%
if /i "%option%"=="pack" set /a index+=1 & goto skip_rename

if exist %blddrv%%bldpath%\tools\ceagent\build			move %blddrv%%bldpath%\tools\ceagent\build			%blddrv%%bldpath%\tools\ceagent\build_%index%
if exist %blddrv%%bldpath%\tools\preproc\build			move %blddrv%%bldpath%\tools\preproc\build			%blddrv%%bldpath%\tools\preproc\build_%index%
if exist %blddrv%%bldpath%\tools\smit\smitgen\build		move %blddrv%%bldpath%\tools\smit\smitgen\build		%blddrv%%bldpath%\tools\smit\smitgen\build_%index%
if exist %blddrv%%bldpath%\tools\smit\smitread\build	move %blddrv%%bldpath%\tools\smit\smitread\build	%blddrv%%bldpath%\tools\smit\smitread\build_%index%
if exist %blddrv%%bldpath%\tools\smit\smittk\build		move %blddrv%%bldpath%\tools\smit\smittk\build		%blddrv%%bldpath%\tools\smit\smittk\build_%index%
set /a index+=1
:skip_rename

if /i "%1"=="test" goto skip_file_time
rem Log source files system time
call .\scripts\file_time
echo on
:skip_file_time

if NOT "%run_ce%"=="1" goto skip_ce
rem starting prompt for cebuild for
start echo start prompt to build Windows CE
if /i "%1"=="ce" goto reset
if /i "%2"=="ce" goto reset
:skip_ce

if /i "%1"=="all" ( 
	call dectalk32.bat prodmak >> %blddrv%%bldpath%\build_log\log\win_build%index%.log 2>%blddrv%%bldpath%\build_log\errors\output_win%index%.log
	goto end
)
if /i "%1"=="win" call dectalk32.bat %2 >> %blddrv%%bldpath%\build_log\log\win_build%index%.log 2>&1
if /i "%1"=="redo" (
	call dectalk32.bat %2 >> %blddrv%%bldpath%\build_log\log\win_build%index%.log 2>%blddrv%%bldpath%\build_log\errors\output_win%index%.log
	goto end
)
if /i "%1"=="tune" (
	call dectalk32.bat %1
	goto end
)
if /i "%1"=="test" (
	call .\scripts\pre_dec_test.bat ml on
	goto end
)

rem the rest
call dectalk32.bat %1 >> %blddrv%%bldpath%\build_log\log\win_build%index%.log 2>%blddrv%%bldpath%\build_log\errors\output_win%index%.log
goto end

:bug_setvar
echo Error! You did not run setvar!
goto bug_end

:bug_invalid_folder
echo Error! You are not in the same path as in d:\work\setvar.bat
goto bug_end

:end
if /i "%1"=="test" goto skip_warning
if /i "%option%"=="pack" goto skip_warning
rem Log all the warning found during build process
echo The number of warning found is below > %blddrv%%bldpath%\build_log\warning\win_warning%index%.log
find /c "warning" %blddrv%%bldpath%\build_log\log\win_build%index%.log >> %blddrv%%bldpath%\build_log\warning\win_warning%index%.log
find /n "warning" %blddrv%%bldpath%\build_log\log\win_build%index%.log >> %blddrv%%bldpath%\build_log\warning\win_warning%index%.log
:skip_warning

rem reindex files in archive
if NOT "%run_ce%"=="1" call .\scripts\re_index.bat

:reset
rem return prompt to original state
prompt
set increment=1

:bug_end
