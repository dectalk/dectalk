@echo off
goto skip_comment
rem Created by Christian Berrios
rem date: March 30, 2001
rem 001	CAB 	03/30/01	Created
rem 002	CAB	    04/04/01	Removed extra > to create new always
rem 003 CAB		04/12/01	Add additional folders
rem 						Fixed paths
rem 004 CAB		04/13/01	Added /s to include directories
rem 005 CAB		06/06/01	Removed Sapi 5 directory with no files
rem 006 CAB		06/07/01	Added skip_comment label
rem 007 CAB		06/24/01	1. Moved entire log of tree here
rem							2. Create folder files & archive
rem 007	CAB		07/31/01	Added echo off 
rem 008 CAB		09/14/01	Removed build_log move
:skip_comment

rem copy last written date of build files
rem check timp stamp date in starteam for reference
rem dir entire tree
dir /a-d /o-d /Tw /s > %blddrv%%bldpath%\build_log\files\tree_files%index%.log

rem directory %bldpath%
dir /a-d /o-n /Tw > %blddrv%%bldpath%\build_log\files\source_files%index%.log

rem dapi\src directory
cd .\3rdparty\aci
dir /a-d /o-n /Tw /s >> %blddrv%%bldpath%\build_log\files\source_files%index%.log
cd .\src
dir /a-d /o-n /Tw /s >> %blddrv%%bldpath%\build_log\files\source_files%index%.log
cd ..\..\..

rem cpanel\src
cd .\cpanel\src
dir /a-d /o-n /Tw /s >> %blddrv%%bldpath%\build_log\files\source_files%index%.log
cd ..\..\

rem dapi\src directory
cd .\dapi\src
dir /a-d /o-n /Tw /s >> %blddrv%%bldpath%\build_log\files\source_files%index%.log

rem dtalkml directory
cd ..\..\dtalkml\src
dir /a-d /o-n /Tw >> %blddrv%%bldpath%\build_log\files\source_files%index%.log

rem docs directory
cd ..\..\docs
dir /a-d /o-n /Tw >> %blddrv%%bldpath%\build_log\files\source_files%index%.log

rem docsosf directory
cd ..\docsosf
dir /a-d /o-n /Tw /s >> %blddrv%%bldpath%\build_log\files\source_files%index%.log

rem help directory
cd ..\help
dir /a-d /o-n /Tw >> %blddrv%%bldpath%\build_log\files\source_files%index%.log

rem install directory
cd ..\install
dir /a-d /o-n /Tw /s >> %blddrv%%bldpath%\build_log\files\source_files%index%.log

rem kitosf directory
cd ..\kitosf
dir /a-d /o-n /Tw /s >> %blddrv%%bldpath%\build_log\files\source_files%index%.log

rem kitting directory
cd ..\kitting
dir /a-d /o-n /Tw >> %blddrv%%bldpath%\build_log\files\source_files%index%.log

rem license directory
cd ..\license\liceninc
dir /a-d /o-n /Tw >> %blddrv%%bldpath%\build_log\files\source_files%index%.log
cd ..\licenseu
dir /a-d /o-n /Tw >> %blddrv%%bldpath%\build_log\files\source_files%index%.log

rem licunix directory
cd ..\..\licunix
dir /a-d /o-n /Tw /s >> %blddrv%%bldpath%\build_log\files\source_files%index%.log

rem licunix directory
cd ..\microsoft
dir /a-d /o-n /Tw /s >> %blddrv%%bldpath%\build_log\files\source_files%index%.log

rem samplece folders
cd ..\samplece\cetalk
dir /a-d /o-n /Tw >> %blddrv%%bldpath%\build_log\files\source_files%index%.log
cd .\res
dir /a-d /o-n /Tw >> %blddrv%%bldpath%\build_log\files\source_files%index%.log

cd ..\..\dtsample
dir /a-d /o-n /Tw >> %blddrv%%bldpath%\build_log\files\source_files%index%.log

cd  ..\mailread
dir /a-d /o-n /Tw >> %blddrv%%bldpath%\build_log\files\source_files%index%.log
cd .\res
dir /a-d /o-d /Tw >> %blddrv%%bldpath%\build_log\files\source_files%index%.log

cd ..\..\windic
dir /a-d /o-n /Tw >> %blddrv%%bldpath%\build_log\files\source_files%index%.log

rem sampleml directory
cd ..\..\sampleml\mldemo
dir /a-d /o-n /Tw >> %blddrv%%bldpath%\build_log\files\source_files%index%.log
cd .\res
dir /a-d /o-n /Tw >> %blddrv%%bldpath%\build_log\files\source_files%index%.log

rem samples directory
cd ..\..\..\samples\dtmemory
dir /a-d /o-n /Tw >> %blddrv%%bldpath%\build_log\files\source_files%index%.log

cd ..\dtsample
dir /a-d /o-n /Tw >> %blddrv%%bldpath%\build_log\files\source_files%index%.log

cd ..\say
dir /a-d /o-n /Tw >> %blddrv%%bldpath%\build_log\files\source_files%index%.log

cd ..\speak
dir /a-d /o-n /Tw >> %blddrv%%bldpath%\build_log\files\source_files%index%.log
cd .\text
dir /a-d /o-n /Tw >> %blddrv%%bldpath%\build_log\files\source_files%index%.log

cd ..\..\ttssrv\
dir /a-d /o-n /Tw >> %blddrv%%bldpath%\build_log\files\source_files%index%.log

cd ..\ttstest
dir /a-d /o-n /Tw >> %blddrv%%bldpath%\build_log\files\source_files%index%.log

cd ..\vercheck
dir /a-d /o-n /Tw >> %blddrv%%bldpath%\build_log\files\source_files%index%.log

cd ..\windic
dir /a-d /o-n /Tw >> %blddrv%%bldpath%\build_log\files\source_files%index%.log

cd ..\wttstest
dir /a-d /o-n /Tw >> %blddrv%%bldpath%\build_log\files\source_files%index%.log

rem samplosf directory
cd ..\..\samplosf
dir /a-d /o-n /Tw /s >> %blddrv%%bldpath%\build_log\files\source_files%index%.log

rem sapi directory
cd ..\sapi\src
dir /a-d /o-n /Tw >> %blddrv%%bldpath%\build_log\files\source_files%index%.log

rem sapi5 directory
cd ..\..\sapi5
dir /a-d /o-n /Tw >> %blddrv%%bldpath%\build_log\files\source_files%index%.log
cd .\idl
dir /a-d /o-n /Tw >> %blddrv%%bldpath%\build_log\files\source_files%index%.log
cd ..\include
dir /a-d /o-n /Tw >> %blddrv%%bldpath%\build_log\files\source_files%index%.log
cd ..\lib\i386
dir /a-d /o-n /Tw >> %blddrv%%bldpath%\build_log\files\source_files%index%.log
cd ..\..\src
dir /a-d /o-n /Tw >> %blddrv%%bldpath%\build_log\files\source_files%index%.log

rem tools directory
cd ..\..\tools\tunecheck
dir /a-d /o-n /Tw >> %blddrv%%bldpath%\build_log\files\source_files%index%.log

cd ..\..

rem if "%index%"=="1" goto skip_diff
rem decrease count by one
rem set /a index_temp=index-1

rem separate files name only
rem fgrep / %blddrv%%bldpath%\build_log\files_time%index%.log > %blddrv%%bldpath%\build_log\temp%index%.log
rem fgrep / %blddrv%%bldpath%\build_log\files_time%index_temp%.log > %blddrv%%bldpath%\build_log\temp%index_temp%.log

rem diff -u --ignore-case d:\work\rnd\build_log\temp%index%.log D:\work\rnd\build_log\temp%index_temp%.log > %blddrv%%bldpath%\build_log\files_diff%index%.log
rem diff -U0 --ignore-case --ignore-space-change %blddrv%%bldpath%\build_log\files_time%index%.log %blddrv%%bldpath%\build_log\files_time%index_temp%.log > %blddrv%%bldpath%\build_log\files_diff%index%.log
goto end

:skip_diff
rem echo First time run > %blddrv%%bldpath%\build_log\files_diff%index%.log

:end




