@echo off
rem cecdcopy.bat
rem Mike Garufi
rem created on 06/15/1999
rem

rem set sdk_version=460
rem set new_sdk_version=460
rem set release_number=B009
rem set release_flag=

set sdk_version=%1
set new_sdk_version=%2
set release_number=%3
set cd_clean=%4
set release_flag=%5

echo WARNING: Setvar not defined.
rem stuff that should go in setvar.bat
echo WARNING: using default dao drive letter
set dao_drive=c:
echo WARNING: using default dao path
set dao_path=dao33
echo WARNING: using default destination drive
set dest_drive=d:
echo WARNING: using default temp file path
set dest_src_path=cdromsrc
echo WARNING: using default iso path
set dest_iso_path=iso


echo WARNING: Using default InstallShield drive letter.
set is3drv=c:
echo WARNING: Using default InstallShield path.
set is3path=\progra~1\instal~1\is3int~1

if %sdk_version%=="" echo using degault sdk_version=460
if %sdk_version%=="" set sdk_version=460
if %release_number%=="" echo using default release_number=B009
if %release_number%=="" set release_number=B009
if %release_flag%=="" echo using default release_flag=
if %release_flag%=="" set release_flag=
if %cd_clean%=="" echo using default cd_clean=Y
if %cd_clean%=="" set cd_clean=Y

set sourcepath=\\atgserv\atgcom\dtpc_95\sdk_%sdk_version%\%release_number%%release_flag%
set dest_iso=ce%new_sdk_version%%release_number%.iso


%dest_drive%
cd \
deltree /y \%dest_src_path% 
mkdir \%dest_src_path%

mkdir \%dest_src_path%\us
mkdir \%dest_src_path%\us\wince
mkdir \%dest_src_path%\us\wince\disk1
mkdir \%dest_src_path%\us\wince\disk2
mkdir \%dest_src_path%\us\wince\disk3
mkdir \%dest_src_path%\us\wince\disk4
mkdir \%dest_src_path%\us\wince\license

mkdir \%dest_src_path%\uk
mkdir \%dest_src_path%\uk\wince
mkdir \%dest_src_path%\uk\wince\disk1
mkdir \%dest_src_path%\uk\wince\disk2
mkdir \%dest_src_path%\uk\wince\disk3
mkdir \%dest_src_path%\uk\wince\disk4
mkdir \%dest_src_path%\uk\wince\license

mkdir \%dest_src_path%\sp
mkdir \%dest_src_path%\sp\wince
mkdir \%dest_src_path%\sp\wince\disk1
mkdir \%dest_src_path%\sp\wince\disk2
mkdir \%dest_src_path%\sp\wince\disk3
mkdir \%dest_src_path%\sp\wince\license


mkdir \%dest_src_path%\la
mkdir \%dest_src_path%\la\wince
mkdir \%dest_src_path%\la\wince\disk1
mkdir \%dest_src_path%\la\wince\disk2
mkdir \%dest_src_path%\la\wince\disk3
mkdir \%dest_src_path%\la\wince\license


mkdir \%dest_src_path%\gr
mkdir \%dest_src_path%\gr\wince
mkdir \%dest_src_path%\gr\wince\disk1
mkdir \%dest_src_path%\gr\wince\disk2
mkdir \%dest_src_path%\gr\wince\disk3
mkdir \%dest_src_path%\gr\wince\disk4
mkdir \%dest_src_path%\gr\wince\disk5
mkdir \%dest_src_path%\gr\wince\disk6

mkdir \%dest_src_path%\gr\wince\license

mkdir \%dest_src_path%\ml
mkdir \%dest_src_path%\ml\wince
mkdir \%dest_src_path%\ml\wince\disk1

rem us wince
copy %sourcepath%\ce\us\disk1 %dest_src_path%\us\wince\disk1
copy %sourcepath%\ce\us\disk2 %dest_src_path%\us\wince\disk2
copy %sourcepath%\ce\us\disk3 %dest_src_path%\us\wince\disk3
copy %sourcepath%\ce\us\disk4 %dest_src_path%\us\wince\disk4
copy %sourcepath%\ce\lock_mgr\licenin3.exe %dest_src_path%\us\wince\license


rem uk wince
copy %sourcepath%\ce\uk\disk1 %dest_src_path%\uk\wince\disk1
copy %sourcepath%\ce\uk\disk2 %dest_src_path%\uk\wince\disk2
copy %sourcepath%\ce\uk\disk3 %dest_src_path%\uk\wince\disk3
copy %sourcepath%\ce\uk\disk4 %dest_src_path%\uk\wince\disk4
copy %sourcepath%\ce\lock_mgr\licenin3.exe %dest_src_path%\uk\wince\license


rem sp wince
copy %sourcepath%\ce\sp\disk1 %dest_src_path%\sp\wince\disk1
copy %sourcepath%\ce\sp\disk2 %dest_src_path%\sp\wince\disk2
copy %sourcepath%\ce\sp\disk3 %dest_src_path%\sp\wince\disk3
copy %sourcepath%\ce\lock_mgr\licenin3.exe %dest_src_path%\sp\wince\license


rem la wince
copy %sourcepath%\ce\la\disk1 %dest_src_path%\la\wince\disk1
copy %sourcepath%\ce\la\disk2 %dest_src_path%\la\wince\disk2
copy %sourcepath%\ce\la\disk3 %dest_src_path%\la\wince\disk3
copy %sourcepath%\ce\lock_mgr\licenin3.exe %dest_src_path%\la\wince\license

rem gr wince
copy %sourcepath%\ce\gr\disk1 %dest_src_path%\gr\wince\disk1
copy %sourcepath%\ce\gr\disk2 %dest_src_path%\gr\wince\disk2
copy %sourcepath%\ce\gr\disk3 %dest_src_path%\gr\wince\disk3
copy %sourcepath%\ce\gr\disk4 %dest_src_path%\gr\wince\disk4
copy %sourcepath%\ce\gr\disk5 %dest_src_path%\gr\wince\disk5
copy %sourcepath%\ce\gr\disk6 %dest_src_path%\gr\wince\disk6
copy %sourcepath%\ce\lock_mgr\licenin3.exe %dest_src_path%\gr\wince\license

rem ml wince
copy %sourcepath%\ce\ml\disk1 %dest_src_path%\ml\wince\disk1

d:
cd work
cd ad
cd kitting


rem creating iso image
mkdir %dest_drive%\%dest_iso_path%
%dao_drive%\%dao_path%\makeiso %dest_drive%\%dest_src_path%\ %dest_drive%\%dest_iso_path%\%dest_iso% /recurse /hidden /system /volume=DECtalk%new_sdk_version%%release_number%



