echo off       
set aci_debug=0
rem ***************************************************************
rem File Name:          PRODCLN.BAT
rem File Created:       30-APR-1997
rem File Author:        Nick Shin
rem File Purpose:       Generates ACI codes
rem ***************************************************************
rem Revisions:
rem 001	30apr97 ncs    	Start here.
rem 002 16may97 cjl    	Add setting drive and path section
rem 003 12sep00 cab		Removed Alpha from script
rem
rem ***************************************************************
rem
rem ***************************************************************
rem	This file is to run the process of stripping out sensitive
rem codes that ACI doesn't need/nor should see.
rem
rem 	All that is done here is -- running all code through the
rem PreProcessor program and the generated files are placed in
rem the proper location.
rem
rem ***************************************************************
rem Known Bugs:
rem     1)
rem ***************************************************************

if NOT "%setvar%"=="" goto goodtogo
:nogood
echo WARNING: Setvar not defined.
echo WARNING: Using default build drive (d:).
set blddrv=d:
echo WARNING: Using current path as default build path (.)
echo WARNING: Using default MSDEV drive (c:).
set msddrv=c:
echo WARNING: Using default MSDEV path (\msdev).
set msdpath=\msdev
echo WARNING: Using default machine build (x86).
rem There must be a space after the = sign for (x86) builds.
set bld_mach=i386
goto checkdef

if %prodmak_debug%==1 pause
:goodtogo
if NOT EXIST %setvar% echo WARNING: Path %setvar% is not defined.
if NOT EXIST %setvar% goto nogood
if "%setvardone%"=="1" echo SETVAR.BAT already done.
if "%setvardone%"=="1" goto checkdef
call %setvar%

:checkdef
rem SETTING UP FOR i386 MACHINE
if "%bld_mach%"=="i386" set bld_path=build
rem note platform is equal to a space
if "%bld_mach%"=="i386" set platform= 

rem default: in case something goes wrong
if "%bld_mach%"=="" echo BLD_MACH is undefined, defaulting to i386 machine
if "%bld_mach%"=="" set bld_path=build
if "%bld_mach%"=="" set platform= 

set aci_path=%blddrv%%bldpath%\3rdparty\aci

rem ***************************************************************
rem Setting the drive and path
rem ***************************************************************
%blddrv%
cd %aci_path%
rem Set environment variables if not done yet
if "%vcvars32%"=="1" goto cont3
call %msddrv%%msdpath%\bin\vcvars32 x86
set vcvars32=1
:cont3


rem ***************************************************************
rem * PREPROC
rem * This component is not Language specific
rem ***************************************************************
cd ..\..\tools\preproc
mkdir %bld_path%
mkdir %bld_path%\release
mkdir %bld_path%\release\link

if "%doclean%"=="n" goto contprep
echo CLEANING: PREPROC ***********
nmake /NOLOGO /fpreproc.mak CFG="preproc - Win32%platform%Release" CLEAN
echo DONE CLEANING
:contprep

if "%aci_cln%"=="1" goto clean001
echo Building PREPROC.EXE ***********
nmake /NOLOGO /fpreproc.mak CFG="preproc - Win32%platform%Release" .\%bld_path%\release\preproc.exe
if NOT exist %bld_path%\release\preproc.exe cd %aci_path%
if NOT exist %bld_path%\release\preproc.exe goto error_end

copy .\%bld_path%\release\preproc.exe %aci_path%\.

:clean001
cd %aci_path%

if %aci_debug%==1 pause
echo ***** First making sure we have an empty Directory *****
del /s/q frm_work
del /s/q corecode

echo ***** Making Necessary Directories ********
mkdir frm_work
mkdir frm_work\dapi
mkdir frm_work\dapi\src
mkdir frm_work\dapi\src\api
mkdir frm_work\dapi\src\cmd
mkdir frm_work\dapi\src\include
mkdir frm_work\dapi\src\kernel
mkdir frm_work\dapi\src\nt
mkdir frm_work\dapi\src\ph
mkdir frm_work\dapi\src\protos
mkdir frm_work\dapi\src\vtm
mkdir frm_work\hardware
mkdir frm_work\hardware\src
mkdir frm_work\hardware\src\lib
mkdir frm_work\hardware\src\misc
mkdir frm_work\sapi
mkdir frm_work\sapi\src
mkdir frm_work\sapi\src\api
rem NOTE!!! cpanel will just be included into aci\...\dapi\src\include
mkdir corecode
mkdir corecode\dapi
mkdir corecode\dapi\src
mkdir corecode\dapi\src\api
mkdir corecode\dapi\src\cmd
mkdir corecode\dapi\src\include
mkdir corecode\dapi\src\kernel
mkdir corecode\dapi\src\lts
mkdir corecode\dapi\src\nt
mkdir corecode\dapi\src\ph
mkdir corecode\dapi\src\protos
mkdir corecode\dapi\src\vtm

echo ****** Starting Conversion Process ***********
rem preproc -x willowpond 0 never dtalk50 dtalk_50 neverdefined
rem preproc -x nolongerused nothing notused notyet old vocal
rem preproc -y aci_license

echo ****** Copying Necessary Files ***********
call list_pre

echo ****** Running Conversion Program ***********
echo .
echo Cleaning out WILLOWPOND from code.
call list_nxt -x WILLOWPOND
cd %aci_path%

echo .
echo Cleaning out (0) from code.
call list_nxt -x 0
cd %aci_path%

echo .
echo Cleaning out NEVER from code.
call list_nxt -x NEVER
cd %aci_path%

echo .
echo Cleaning out DTALK50 from code.
call list_nxt -x DTALK50
cd %aci_path%

echo .
echo Cleaning out DTALK_50 from code.
call list_nxt -x DTALK_50
cd %aci_path%

echo .
echo Cleaning out NEVERDEFINED from code.
call list_nxt -x NEVERDEFINED
cd %aci_path%

echo .
echo Cleaning out NOLONGERUSED from code.
call list_nxt -x NOLONGERUSED
cd %aci_path%

echo .
echo Cleaning out NOTHING from code.
call list_nxt -x NOTHING
cd %aci_path%

echo .
echo Cleaning out NOTUSED from code.
call list_nxt -x NOTUSED
cd %aci_path%

echo .
echo Cleaning out NOTYET from code.
call list_nxt -x NOTYET
cd %aci_path%

echo .
echo Cleaning out OLD from code.
call list_nxt -x OLD
cd %aci_path%

echo .
echo Cleaning out VOCAL from code.
call list_nxt -x VOCAL
cd %aci_path%

echo .
echo Checking out for ACI_LICENSE in the code.
call list_nxt -y aci_license
cd %aci_path%

del preproc.exe
goto end

:error_end
echo Error in BUILD Process: ACI.BAT ************
goto exit

:end
echo ***** BUILD Process: ACI.BAT COMPLETED SUCCESSFULLY *****

:exit
