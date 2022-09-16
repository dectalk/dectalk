@echo off
rem cdcopy.bat
rem Matthew Schnee
rem created on 01/22/1998
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
set dest_iso=dt%new_sdk_version%%release_number%.iso



%dest_drive%
cd \
deltree /y \%dest_src_path% 
mkdir \%dest_src_path%

mkdir \%dest_src_path%\ml
mkdir \%dest_src_path%\ml\intel
mkdir \%dest_src_path%\ml\intel\disk1
mkdir \%dest_src_path%\ml\alpha
mkdir \%dest_src_path%\ml\alpha\disk1

mkdir \%dest_src_path%\us
mkdir \%dest_src_path%\us\intel
mkdir \%dest_src_path%\us\intel\disk1
mkdir \%dest_src_path%\us\intel\disk2
mkdir \%dest_src_path%\us\intel\disk3
mkdir \%dest_src_path%\us\intel\license
mkdir \%dest_src_path%\us\alpha
mkdir \%dest_src_path%\us\alpha\disk1
mkdir \%dest_src_path%\us\alpha\disk2
mkdir \%dest_src_path%\us\alpha\disk3
mkdir \%dest_src_path%\us\alpha\license

mkdir \%dest_src_path%\uk
mkdir \%dest_src_path%\uk\intel
mkdir \%dest_src_path%\uk\intel\disk1
mkdir \%dest_src_path%\uk\intel\disk2
mkdir \%dest_src_path%\uk\intel\disk3
mkdir \%dest_src_path%\uk\intel\license
mkdir \%dest_src_path%\uk\alpha
mkdir \%dest_src_path%\uk\alpha\disk1
mkdir \%dest_src_path%\uk\alpha\disk2
mkdir \%dest_src_path%\uk\alpha\disk3
mkdir \%dest_src_path%\uk\alpha\license

mkdir \%dest_src_path%\sp
mkdir \%dest_src_path%\sp\intel
mkdir \%dest_src_path%\sp\intel\disk1
mkdir \%dest_src_path%\sp\intel\disk2
mkdir \%dest_src_path%\sp\intel\disk3
mkdir \%dest_src_path%\sp\intel\license
mkdir \%dest_src_path%\sp\alpha
mkdir \%dest_src_path%\sp\alpha\disk1
mkdir \%dest_src_path%\sp\alpha\disk2
mkdir \%dest_src_path%\sp\alpha\disk3
mkdir \%dest_src_path%\sp\alpha\license

mkdir \%dest_src_path%\la
mkdir \%dest_src_path%\la\intel
mkdir \%dest_src_path%\la\intel\disk1
mkdir \%dest_src_path%\la\intel\disk2
mkdir \%dest_src_path%\la\intel\disk3
mkdir \%dest_src_path%\la\intel\license
mkdir \%dest_src_path%\la\alpha
mkdir \%dest_src_path%\la\alpha\disk1
mkdir \%dest_src_path%\la\alpha\disk2
mkdir \%dest_src_path%\la\alpha\disk3
mkdir \%dest_src_path%\la\alpha\license

mkdir \%dest_src_path%\gr
mkdir \%dest_src_path%\gr\intel
mkdir \%dest_src_path%\gr\intel\disk1
mkdir \%dest_src_path%\gr\intel\disk2
mkdir \%dest_src_path%\gr\intel\disk3
mkdir \%dest_src_path%\gr\intel\license
mkdir \%dest_src_path%\gr\alpha
mkdir \%dest_src_path%\gr\alpha\disk1
mkdir \%dest_src_path%\gr\alpha\disk2
mkdir \%dest_src_path%\gr\alpha\disk3
mkdir \%dest_src_path%\gr\alpha\disk4
mkdir \%dest_src_path%\gr\alpha\license


rem us intel
copy %sourcepath%\w95-nt-i\us\disk1 %dest_src_path%\us\intel\disk1
copy %sourcepath%\w95-nt-i\us\disk2 %dest_src_path%\us\intel\disk2
copy %sourcepath%\w95-nt-i\us\disk3 %dest_src_path%\us\intel\disk3
copy %sourcepath%\w95-nt-i\lock_mgr\licenin3.exe %dest_src_path%\us\intel\license

rem us alpha
copy %sourcepath%\nt-a\us\disk1 %dest_src_path%\us\alpha\disk1
copy %sourcepath%\nt-a\us\disk2 %dest_src_path%\us\alpha\disk2
copy %sourcepath%\nt-a\us\disk3 %dest_src_path%\us\alpha\disk3
copy %sourcepath%\nt-a\lock_mgr\licenin3.exe %dest_src_path%\us\alpha\license

rem uk intel
copy %sourcepath%\w95-nt-i\uk\disk1 %dest_src_path%\uk\intel\disk1
copy %sourcepath%\w95-nt-i\uk\disk2 %dest_src_path%\uk\intel\disk2
copy %sourcepath%\w95-nt-i\uk\disk3 %dest_src_path%\uk\intel\disk3
copy %sourcepath%\w95-nt-i\lock_mgr\licenin3.exe %dest_src_path%\uk\intel\license

rem uk alpha
copy %sourcepath%\nt-a\uk\disk1 %dest_src_path%\uk\alpha\disk1
copy %sourcepath%\nt-a\uk\disk2 %dest_src_path%\uk\alpha\disk2
copy %sourcepath%\nt-a\uk\disk3 %dest_src_path%\uk\alpha\disk3
copy %sourcepath%\nt-a\lock_mgr\licenin3.exe %dest_src_path%\uk\alpha\license

rem sp intel
copy %sourcepath%\w95-nt-i\sp\disk1 %dest_src_path%\sp\intel\disk1
copy %sourcepath%\w95-nt-i\sp\disk2 %dest_src_path%\sp\intel\disk2
copy %sourcepath%\w95-nt-i\sp\disk3 %dest_src_path%\sp\intel\disk3
copy %sourcepath%\w95-nt-i\lock_mgr\licenin3.exe %dest_src_path%\sp\intel\license

rem sp alpha
copy %sourcepath%\nt-a\sp\disk1 %dest_src_path%\sp\alpha\disk1
copy %sourcepath%\nt-a\sp\disk2 %dest_src_path%\sp\alpha\disk2
copy %sourcepath%\nt-a\sp\disk3 %dest_src_path%\sp\alpha\disk3
copy %sourcepath%\nt-a\lock_mgr\licenin3.exe %dest_src_path%\sp\alpha\license

rem la intel
copy %sourcepath%\w95-nt-i\la\disk1 %dest_src_path%\la\intel\disk1
copy %sourcepath%\w95-nt-i\la\disk2 %dest_src_path%\la\intel\disk2
copy %sourcepath%\w95-nt-i\la\disk3 %dest_src_path%\la\intel\disk3
copy %sourcepath%\w95-nt-i\lock_mgr\licenin3.exe %dest_src_path%\la\intel\license

rem la alpha
copy %sourcepath%\nt-a\la\disk1 %dest_src_path%\la\alpha\disk1
copy %sourcepath%\nt-a\la\disk2 %dest_src_path%\la\alpha\disk2
copy %sourcepath%\nt-a\la\disk3 %dest_src_path%\la\alpha\disk3
copy %sourcepath%\nt-a\lock_mgr\licenin3.exe %dest_src_path%\la\alpha\license

rem gr intel
copy %sourcepath%\w95-nt-i\gr\disk1 %dest_src_path%\gr\intel\disk1
copy %sourcepath%\w95-nt-i\gr\disk2 %dest_src_path%\gr\intel\disk2
copy %sourcepath%\w95-nt-i\gr\disk3 %dest_src_path%\gr\intel\disk3
copy %sourcepath%\w95-nt-i\lock_mgr\licenin3.exe %dest_src_path%\gr\intel\license

rem gr alpha
copy %sourcepath%\nt-a\gr\disk1 %dest_src_path%\gr\alpha\disk1
copy %sourcepath%\nt-a\gr\disk2 %dest_src_path%\gr\alpha\disk2
copy %sourcepath%\nt-a\gr\disk3 %dest_src_path%\gr\alpha\disk3
copy %sourcepath%\nt-a\gr\disk4 %dest_src_path%\gr\alpha\disk4
copy %sourcepath%\nt-a\lock_mgr\licenin3.exe %dest_src_path%\gr\alpha\license

rem ml
copy %sourcepath%\w95-nt-i\ml\disk1 %dest_src_path%\ml\intel\disk1
copy %sourcepath%\nt-a\ml\disk1 %dest_src_path%\ml\alpha\disk1

d:
cd work
cd rnd
cd kitting


rem creating iso image
mkdir %dest_drive%\%dest_iso_path%
%dao_drive%\%dao_path%\makeiso %dest_drive%\%dest_src_path%\ %dest_drive%\%dest_iso_path%\%dest_iso% /recurse /hidden /system /volume=DECtalk%new_sdk_version%%release_number%



