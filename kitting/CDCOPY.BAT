@echo on
rem cdcopy.bat
rem Matthew Schnee
rem created on 01/22/1998
rem Comments
rem 001	CAB	08/24/00	removed Alpha 
rem 002 CAB	11/27/00	1. changed to 4.61 and b002
rem						2. Made changes for new install shield
rem						3. Removed is3drv and is3path variables
rem						4. Changed dao33 to dao and dao_drive to k:
rem						5. Changed ddest_drive to j:

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
echo WARNING: using default dao drive letter in NLeeber
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
if %cd_clean%=="" echo using default cd_clean=Y
if %cd_clean%=="" set cd_clean=Y

set sourcepath=\\atgserv\atgcom\dtpc_95\sdk_%sdk_version%\%release_number%%release_flag%
set dest_iso=dt%new_sdk_version%%release_number%.iso

%dest_drive%
cd \
deltree /y \%dest_src_path% 

mkdir \%dest_src_path%
mkdir \%dest_src_path%\windows\disk1
mkdir \%dest_src_path%\windows\disk1\sapi5
mkdir \%dest_src_path%\windows\disk1\license

rem us intel
copy %sourcepath%\w95-nt-i\disk1\*.*				%dest_src_path%\windows\disk1\*.*
copy %sourcepath%\w95-nt-i\disk1\sapi5\*.*			%dest_src_path%\windows\disk1\sapi5\*.*
copy %sourcepath%\w95-nt-i\lock_mgr\licenin3.exe	%dest_src_path%\windows\disk1\license\*.*

rem creating iso image
mkdir %dest_drive%\%dest_iso_path%
%dao_drive%\%dao_path%\makeiso %dest_drive%\%dest_src_path%\windows\disk1 %dest_drive%\%dest_iso_path%\%dest_iso% /recurse /hidden /system /volume=DECtalk%new_sdk_version%%release_number%
