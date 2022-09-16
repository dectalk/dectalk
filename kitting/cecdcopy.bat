@echo on
rem cecdcopy.bat
rem Mike Garufi
rem created on 06/15/1999
rem COMMENTS
rem 001	CAB	11/27/00	1. Changed to 4.61 and B002
rem						2. Removed is3drv and is3path
rem						3. Changed dao_path to dao

rem set sdk_version=461
rem set new_sdk_version=461
rem set release_number=B002
rem set release_flag=

set sdk_version=%1
set new_sdk_version=%2
set release_number=%3
set cd_clean=%4
set release_flag=%5

echo WARNING: Setvar not defined.
rem stuff that should go in setvar.bat
echo WARNING: using default dao drive letter
set dao_drive=k:
echo WARNING: using default dao path
set dao_path=dao
echo WARNING: using default destination drive
set dest_drive=j:
echo WARNING: using default temp file path
set dest_src_path=cdromsrc
echo WARNING: using default iso path
set dest_iso_path=iso

if %sdk_version%=="" echo using degault sdk_version=461
if %sdk_version%=="" set sdk_version=461
if %release_number%=="" echo using default release_number=B002
if %release_number%=="" set release_number=B002
if "%release_flag%"=="" echo using default release_flag=
if "%release_flag%"=="" set release_flag=
if "%cd_clean%"=="" echo using default cd_clean=Y
if "%cd_clean%"=="" set cd_clean=Y

set sourcepath=\\atgserv\atgcom\dtpc_95\sdk_%sdk_version%\%release_number%%release_flag%
set dest_iso=ce%new_sdk_version%%release_number%.iso


%dest_drive%
rem cd \
rem deltree /y \%dest_src_path% 

mkdir \%dest_src_path%\windowsce
mkdir \%dest_src_path%\windowsce\disk1
mkdir \%dest_src_path%\windowsce\disk1\license

rem us wince
copy %sourcepath%\ce\disk1 %dest_src_path%\windowsce\disk1
copy %sourcepath%\ce\lock_mgr\licenin3.exe %dest_src_path%\windowsce\disk1\license

rem creating iso image
mkdir %dest_drive%\%dest_iso_path%
%dao_drive%\%dao_path%\makeiso %dest_drive%\%dest_src_path%\windowsce\disk1 %dest_drive%\%dest_iso_path%\%dest_iso% /recurse /hidden /system /volume=DECtalk%new_sdk_version%%release_number%