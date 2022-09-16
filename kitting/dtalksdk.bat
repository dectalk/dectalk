echo off
rem dtalksdk.bat
rem created: 18-JUL-1996
rem revised: 17-FEB-1997; v4.40.30 b003
rem revised: 25-MAR-1997; v4.40.32 b004 INTEL ONLY cjl
rem revised: 12-MAY-1997; v4.40.35 b005 cjl
rem revised: 30-JUN-1997; v4.40.38 b006 Assistive/WillowPond added. cjl
rem revised: 20-AUG-1997; v4.40.43 r007rnd-rnd Static Builds? cjl
rem revised: 24-NOV-1997; v4.41.11 r010rnd SAPI/NWSNOAA builds. cjl
rem revised: 14-JAN-1998; v4.41.12 r011rnd SAPI builds. cjl
rem revised: 14-JAN-1998; v4.45.01 b001rnd SAPI builds. Add SDK parameter. cjl
rem revised: 22-JAN-1998; Add help.
rem revised: 19-feb-1998; Add disk3 to Intel copy.
rem revised: 29-OCT-1998; v4.60.00 b001 AD->RND. cjl
rem
rem ***************************************************************
rem get language, if passed in.
set dtlang=%1
rem ***************************************************************
rem get assistive version, if passed in.
set dtabnormal=%2
rem ***************************************************************
rem get version area, if passed in.
set v_area=%3
rem ***************************************************************
rem get SDK area, if passed in.
set sdk_area=%4
rem ***************************************************************

rem check for arguments
:checkit
if "%dtlang%"=="" goto deflang
if "%dtlang%"=="""" goto deflang
if "%dtlang%"=="HELP" goto dtask
rem
if "%dtabnormal%"=="" goto defabnorm
if "%dtabnormal%"=="""" goto defabnorm
rem
if "%v_area%"=="" goto defarea
if "%v_area%"=="""" goto defarea
rem
if "%sdk_area%"=="" goto defsdk
if "%sdk_area%"=="""" goto defsdk
goto cont1

:deflang
echo WARNING: using default language (ENGLISH_US)
set dtlang=ENGLISH_US
goto checkit

:defabnorm
echo WARNING: using default abnormal version (NORMAL)
set dtabnormal=NORMAL
goto checkit

:defarea
echo WARNING: using default version area (b001rnd)
set v_area=b001rnd
goto checkit

:defsdk
echo WARNING: using default SDK area (sdk_460)
set sdk_area=sdk_460
goto checkit

:cont1
rem ***************************************************************
rem     Support build of normal and abnormal kit building from a
rem     choice of several.
rem     Currently supporting:
rem             NORMAL, ASSISTIVE and WILLOWPOND
rem
if "%dtabnormal%"=="NORMAL" set abnormdiri=w95-nt-i
if "%dtabnormal%"=="NORMAL" set abnormdira=nt-a
if "%dtabnormal%"=="NORMAL" goto dtabnormok
if "%dtabnormal%"=="ASSISTIVE" set abnormdiri=a_w95nti
if "%dtabnormal%"=="ASSISTIVE" goto dtabnormok
if "%dtabnormal%"=="WILLOWPOND" set abnormdiri=wpond_i
if "%dtabnormal%"=="WILLOWPOND" set abnormdira=WillowPond-a
if "%dtabnormal%"=="WILLOWPOND" goto dtabnormok
rem Error
echo Assitive version parameter (%dtabnormal%) not recognized.
goto noargs

echo Defined variables:
echo .
echo Assistive Version = %dtabnormal%
echo .

:dtabnormok

:cont2
rem ***************************************************************
rem     Support build of multi-language kit building from a
rem     choice of several.
rem     Currently supporting:
rem             ENGLISH_US, GERMAN, SPANISH, SPANISH_LA (Latin American)
rem             ENGLSIH_UK
rem
if "%dtlang%"=="ENGLISH_US" set langdir=us
if "%dtlang%"=="ENGLISH_US" goto dtlangok
if "%dtlang%"=="GERMAN" set langdir=gr
if "%dtlang%"=="GERMAN" goto dtlangok
if "%dtlang%"=="SPANISH" set  langdir=sp
if "%dtlang%"=="SPANISH" goto dtlangok
if "%dtlang%"=="SPANISH_LA" set  langdir=la
if "%dtlang%"=="SPANISH_LA" goto dtlangok
if "%dtlang%"=="ENGLISH_UK" set langdir=uk
if "%dtlang%"=="ENGLISH_UK" goto dtlangok
rem Error
echo Language parameter (%dtlang%) not recognized.
goto noargs

echo Defined variables:
echo .
echo Language = %dtlang%
echo .

:dtlangok

:loop
rem Alpha ONLY
rem goto bypass
echo inset floppy for: 1 of 3 Intel
pause
copy y:\dtpc_95\%sdk_area%\%v_area%\%abnormdiri%\%langdir%\disk1 a:
echo inset floppy for: 2 of 3 Intel
pause
copy y:\dtpc_95\%sdk_area%\%v_area%\%abnormdiri%\%langdir%\disk2 a:
echo inset floppy for: 3 of 3 Intel
pause
copy y:\dtpc_95\%sdk_area%\%v_area%\%abnormdiri%\%langdir%\disk3 a:
echo inset floppy for: LOCK_MGR Intel
pause
copy y:\dtpc_95\%sdk_area%\%v_area%\%abnormdiri%\lock_mgr\licenin3.exe a:
rem assistive version is INTEL ONLY
if "%abnormdir%"=="a_w95nti" goto done_yet
rem
rem INTEL ONLY
rem goto done_yet
:bypass
echo inset floppy for: 1 of 3 Alpha
pause
copy y:\dtpc_95\%sdk_area%\%v_area%\%abnormdira%\%langdir%\disk1 a:
echo inset floppy for: 2 of 3 Alpha
pause
copy y:\dtpc_95\%sdk_area%\%v_area%\%abnormdira%\%langdir%\disk2 a:
echo inset floppy for: 3 of 3 Alpha
pause
copy y:\dtpc_95\%sdk_area%\%v_area%\%abnormdira%\%langdir%\disk3 a:
echo inset floppy for: LOCK_MGR Alpha
pause
copy y:\dtpc_95\%sdk_area%\%v_area%\%abnormdira%\lock_mgr\licenin3.exe a:
:done_yet
echo go again? (Yes, or No)
choice /c:yne Yes, No, or Exit?
if errorlevel 3 goto end
if errorlevel 2 goto end
if errorlevel 1 goto loop

:dtask
:noargs
echo NOTE:
echo ------------------------------------------------
echo      Usage: dtalksdk language abnormal version_area sdk_area
echo .
echo             dtalksdk ENGLISH_US NORMAL r011rnd sdk_440
echo ------------------------------------------------

:end
