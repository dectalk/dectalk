@echo on
REM  DECtalk for windows CE build script
rem 10-apr-1999	mfg added ARM support and WINce 211 support
rem 08-feb-2000	mfg added Access32 support
rem 08-feb-2000	mfg added email reader build for 211 it is not supported for 200
rem 13-apr-2000 cab added windic build for 211

@echo To override the default settings,
@echo Type the name of this batch file followed by a platform choice: WCE100 WCE101 WCE200 
@echo Example: wcesh WCE200



set VCROOT=C:\Program Files\Microsoft Visual Studio
set DEVROOT=D:\Windows CE Tools
set SDKROOT=D:\Windows CE Tools

if "%1"=="WCE211" goto build_wce211
if "%1"=="wce211" goto build_wce211
if "%1"=="WCE211ML" goto build_wce211ML
if "%1"=="wce211ml" goto build_wce211ML
if "%1"=="WCE200ML" goto build_wce200ML
if "%1"=="wce200ml" goto build_wce200ML


if "%1"=="" goto default
set PLATFORM=%1
goto settings

:default
if "%1"=="" set PLATFORM=WCE200

:settings
set INCLUDE=%DEVROOT%\%PLATFORM%\MS HPC\include;%DEVROOT%\%PLATFORM%\MS HPC\mfc\include
set PATH=%VCROOT%\Common\MSDev98\Bin;%VCROOT%\VC98\Bin;%DEVROOT%\%PLATFORM%\bin;%path%

rem if been built once move back so we don't have to build again

move .\dapi\build\%PLATFORM%\cedll .\dapi\build\cedll  
move .\dapi\build\%PLATFORM%\cestatic .\dapi\build\cestatic 
move .\samplece\CEtalk\build\%PLATFORM%\dll .\samplece\CEtalk\build\dll  
move .\samplece\CEtalk\build\%PLATFORM%\static .\samplece\CEtalk\build\static  
move .\samplece\Dtsample\build\%PLATFORM%\dll .\samplece\Dtsample\build\dll 
move .\samplece\Dtsample\build\%PLATFORM%\static .\samplece\Dtsample\build\static
move .\dtalkml\build\%PLATFORM%\mips .\dtalkml\build\ce\mips
move .\dtalkml\build\%PLATFORM%\x86em .\dtalkml\build\ce\x86em
move .\dtalkml\build\%PLATFORM%\sh  .\dtalkml\build\ce\sh


rem set paths for DECtalk CE build  WCE200

cd .\dapi\src

@echo make the static and dynamic library versions of dectalk for the x86em platform
set LIB=%DEVROOT%\%PLATFORM%\MS HPC\lib\X86em;

nmake /f "ce.mak" CFG="CE - Win32 (WCE x86em) Release" CESubsystem=windowsce,2.0 CEVersion=200  CEConfigName="H/PC Ver. 2.00"
nmake /f "ce.mak" CFG="CE - Win32 (WCE x86em) Release Spanish" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "ce.mak" CFG="CE - Win32 (WCE x86em) Release Latin American" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "ce.mak" CFG="CE - Win32 (WCE x86em) Release English UK" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "ce.mak" CFG="CE - Win32 (WCE x86em) Release German" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"


nmake /f "cedll.mak" CFG="cedll - Win32 (WCE x86em) Release" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE x86em) Release Spanish" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE x86em) Release Latin American" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE x86em) Release English UK" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE x86em) Release German" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"

nmake /f "cedll.mak" CFG="cedll - Win32 (WCE x86em) Access32" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"

@echo make the static and dynamic library version of dectalk for the mips platform
set LIB=%DEVROOT%\%PLATFORM%\MS HPC\lib\mips;

nmake /f "ce.mak" CFG="CE - Win32 (WCE MIPS) Release" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "ce.mak" CFG="CE - Win32 (WCE MIPS) Release Spanish" CESubsystem=windowsce,2.0 CEVersion=200  CEConfigName="H/PC Ver. 2.00"
nmake /f "ce.mak" CFG="CE - Win32 (WCE MIPS) Release Latin American" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "ce.mak" CFG="CE - Win32 (WCE MIPS) Release English UK" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "ce.mak" CFG="CE - Win32 (WCE MIPS) Release German" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"

nmake /f "cedll.mak" CFG="cedll - Win32 (WCE MIPS) Release" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE MIPS) Release Spanish" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE MIPS) Release Latin American" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE MIPS) Release English UK" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE MIPS) Release German" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"

nmake /f "cedll.mak" CFG="cedll - Win32 (WCE MIPS) Access32" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE MIPS) Access32 Spanish" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE MIPS) Access32 Latin American" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE MIPS) Access32 English UK" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE MIPS) Access32 German" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"


@echo make the static and dynamic library versions of dectalk for the sh platform
set LIB=%DEVROOT%\%PLATFORM%\MS HPC\lib\sh3;

nmake /f "ce.mak" CFG="CE - Win32 (WCE SH3) Release" CESubsystem=windowsce,2.0 CEVersion=200  CEConfigName="H/PC Ver. 2.00"
nmake /f "ce.mak" CFG="CE - Win32 (WCE SH3) Release Spanish" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "ce.mak" CFG="CE - Win32 (WCE SH3) Release Latin American" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "ce.mak" CFG="CE - Win32 (WCE SH3) Release English UK" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "ce.mak" CFG="CE - Win32 (WCE SH3) Release German" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"

nmake /f "cedll.mak" CFG="cedll - Win32 (WCE SH3) Release" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE SH3) Release Spanish" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE SH3) Release Latin American" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE SH3) Release English UK" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE SH3) Release German" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"

nmake /f "cedll.mak" CFG="cedll - Win32 (WCE SH3) Access32" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE SH3) Access32 Spanish" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE SH3) Access32 Latin American" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE SH3) Access32 English UK" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE SH3) Access32 German" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"


@echo build DTSample

cd .\..\..\samplece\Dtsample

set LIB=%DEVROOT%\%PLATFORM%\MS HPC\lib\X86em;%DEVROOT%\%PLATFORM%\MS HPC\mfc\lib\X86em;

nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE x86em) Release" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE x86em) Release Spanish" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE x86em) Release Latin American" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE x86em) Release English UK" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE x86em) Release German" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"

nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE x86em) Release Dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE x86em) Release Spanish Dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE x86em) Release Latin American Dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE x86em) Release English UK Dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE x86em) Release German Dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"

nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE x86em) Debug Dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE x86em) Debug Spanish Dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE x86em) Debug Latin American Dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE x86em) Debug English UK Dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE x86em) Debug German Dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"





set LIB=%DEVROOT%\%PLATFORM%\MS HPC\lib\mips;%DEVROOT%\%PLATFORM%\MS HPC\mfc\lib\mips;

nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE MIPS) Release" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE MIPS) Release Spanish" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE MIPS) Release Latin American" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE MIPS) Release English UK" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE MIPS) Release German" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"

nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE MIPS) Release Dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE MIPS) Release Spanish Dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE MIPS) Release Latin American Dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE MIPS) Release English UK Dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE MIPS) Release German Dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"


set LIB=%DEVROOT%\%PLATFORM%\MS HPC\lib\sh3;%DEVROOT%\%PLATFORM%\MS HPC\mfc\lib\sh3;

nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE SH3) Release" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE SH3) Release Spanish" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE SH3) Release Latin American" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE SH3) Release English UK" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE SH3) Release German" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"

nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE SH3) Release Dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE SH3) Release Spanish Dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE SH3) Release Latin American Dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE SH3) Release English UK Dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE SH3) Release German Dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"

@echo build CEtalk

cd .\..\CEtalk

set LIB=%DEVROOT%\%PLATFORM%\MS HPC\lib\X86em;%DEVROOT%\%PLATFORM%\MS HPC\mfc\lib\X86em;

nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE x86em) Release" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE x86em) Release Spanish" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE x86em) Release Latin American" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE x86em) Release English UK" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE x86em) Release German" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"

nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE x86em) Release dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE x86em) Release Spanish dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE x86em) Release Latin American dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE x86em) Release English UK dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE x86em) Release German dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"

nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE x86em) Debug dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE x86em) Debug Spanish dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE x86em) Debug Latin American dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE x86em) Debug English UK dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE x86em) Debug German dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"


set LIB=%DEVROOT%\%PLATFORM%\MS HPC\lib\mips;%DEVROOT%\%PLATFORM%\MS HPC\mfc\lib\mips;

nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE MIPS) Release" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE MIPS) Release Spanish" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE MIPS) Release Latin American" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE MIPS) Release English UK" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE MIPS) Release German" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"

nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE MIPS) Release dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE MIPS) Release Spanish dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE MIPS) Release Latin American dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE MIPS) Release English UK dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE MIPS) Release German dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"


set LIB=%DEVROOT%\%PLATFORM%\MS HPC\lib\sh3;%DEVROOT%\%PLATFORM%\MS HPC\mfc\lib\sh3;

nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE SH3) Release" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE SH3) Release Spanish" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE SH3) Release Latin American" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE SH3) Release English UK" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE SH3) Release German" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"

nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE SH3) Release dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE SH3) Release Spanish dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE SH3) Release Latin American dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE SH3) Release English UK dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE SH3) Release German dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"


cd .\..\..

:build_wce200ML
set PLATFORM=WCE200

set INCLUDE=%DEVROOT%\%PLATFORM%\MS HPC\include;%DEVROOT%\%PLATFORM%\MS HPC\mfc\include
set PATH=%VCROOT%\Common\MSDev98\Bin;%VCROOT%\VC98\Bin;%DEVROOT%\%PLATFORM%\bin;%path%

@echo bulid dectalk multi language
cd .\dtalkml\src

@echo make the dynamic library versions of dectalk ML for the x86em, mips and sh3 platforms
set LIB=%DEVROOT%\%PLATFORM%\MS HPC\lib\X86em;
nmake /f "DtalkMLCE.mak" CFG="DTalkML - Win32 (WCE x86em) Release" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"

set LIB=%DEVROOT%\%PLATFORM%\MS HPC\lib\mips;
nmake /f "DtalkMLCE.mak" CFG="DTalkML - Win32 (WCE MIPS) Release" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"

set LIB=%DEVROOT%\%PLATFORM%\MS HPC\lib\sh3;
nmake /f "DtalkMLCE.mak" CFG="DTalkML - Win32 (WCE SH3) Release" CESubsystem=windowsce,2.0 CEVersion=200  CEConfigName="H/PC Ver. 2.00"


cd .\..\..

deltree /Y .\dapi\build\%PLATFORM%
deltree /Y .\samplece\CEtalk\build\%PLATFORM%
deltree /Y .\samplece\Dtsample\build\%PLATFORM%
deltree /Y .\samplece\Mailread\build\%PLATFORM%
deltree /Y .\samplece\windic\build\%PLATFORM%
deltree /Y .\dtalkml\build\%PLATFORM%

mkdir .\dapi\build\%PLATFORM%
move .\dapi\build\cedll  .\dapi\build\%PLATFORM%\
move .\dapi\build\cestatic .\dapi\build\%PLATFORM%\

mkdir .\samplece\CEtalk\build\%PLATFORM%
move .\samplece\CEtalk\build\dll  .\samplece\CEtalk\build\%PLATFORM%\
move .\samplece\CEtalk\build\static  .\samplece\CEtalk\build\%PLATFORM%\

mkdir .\samplece\Dtsample\build\%PLATFORM%
move .\samplece\Dtsample\build\dll .\samplece\Dtsample\build\%PLATFORM%\
move .\samplece\Dtsample\build\static  .\samplece\Dtsample\build\%PLATFORM%\

mkdir .\dtalkml\build\%PLATFORM%
move .\dtalkml\build\ce\mips .\dtalkml\build\%PLATFORM%\
move .\dtalkml\build\ce\x86em .\dtalkml\build\%PLATFORM%\
move .\dtalkml\build\ce\sh .\dtalkml\build\%PLATFORM%\
deltree /Y .\dtalkml\build\ce

if "%1"=="WCE200" goto end

:build_wce211
set PLATFORM=WCE211

set INCLUDE=%DEVROOT%\%PLATFORM%\MS HPC PRO\include;%DEVROOT%\%PLATFORM%\MS HPC PRO\mfc\include
set PATH=%VCROOT%\Common\MSDev98\Bin;%VCROOT%\VC98\Bin;%DEVROOT%\%PLATFORM%\bin;%path%


rem if been built once move back so we don't have to build again

move .\dapi\build\%PLATFORM%\cedll .\dapi\build\cedll  
move .\dapi\build\%PLATFORM%\cestatic .\dapi\build\cestatic 
move .\samplece\CEtalk\build\%PLATFORM%\dll .\samplece\CEtalk\build\dll  
move .\samplece\CEtalk\build\%PLATFORM%\static .\samplece\CEtalk\build\static  
move .\samplece\Dtsample\build\%PLATFORM%\dll .\samplece\Dtsample\build\dll 
move .\samplece\Dtsample\build\%PLATFORM%\static .\samplece\Dtsample\build\static
move .\samplece\Mailread\build\%PLATFORM%\dll .\samplece\Mailread\build\dll 
move .\samplece\Mailread\build\%PLATFORM%\static .\samplece\Mailread\build\static
move .\samplece\windic\build\%PLATFORM%\cedll .\samplece\windic\build\cedll 
move .\samplece\windic\build\%PLATFORM%\static .\samplece\windic\build\static
move .\dtalkml\build\%PLATFORM%\mips .\dtalkml\build\ce\mips
move .\dtalkml\build\%PLATFORM%\x86em .\dtalkml\build\ce\x86em
move .\dtalkml\build\%PLATFORM%\sh  .\dtalkml\build\ce\sh
move .\dtalkml\build\%PLATFORM%\sh4  .\dtalkml\build\ce\sh4
move .\dtalkml\build\%PLATFORM%\arm  .\dtalkml\build\ce\arm

rem set paths for DECtalk CE build  WCE211

cd .\dapi\src

@echo make the static and dynamic library versions of dectalk for the x86em platform
set LIB=%DEVROOT%\%PLATFORM%\MS HPC PRO\lib\X86em;

nmake /f "ce.mak" CFG="CE - Win32 (WCE x86em) Release" CESubsystem=windowsce,2.0 CEVersion=211  CEConfigName="H/PC Pro 2.11"
nmake /f "ce.mak" CFG="CE - Win32 (WCE x86em) Release Spanish" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "ce.mak" CFG="CE - Win32 (WCE x86em) Release Latin American" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "ce.mak" CFG="CE - Win32 (WCE x86em) Release English UK" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "ce.mak" CFG="CE - Win32 (WCE x86em) Release German" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"


nmake /f "cedll.mak" CFG="cedll - Win32 (WCE x86em) Release" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE x86em) Release Spanish" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE x86em) Release Latin American" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE x86em) Release English UK" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE x86em) Release German" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

nmake /f "cedll.mak" CFG="cedll - Win32 (WCE x86em) Access32" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

@echo make the static and dynamic library version of dectalk for the arm platform
set LIB=%DEVROOT%\%PLATFORM%\MS HPC PRO\lib\ARM;

nmake /f "ce.mak" CFG="CE - Win32 (WCE ARM) Release" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "ce.mak" CFG="CE - Win32 (WCE ARM) Release Spanish" CESubsystem=windowsce,2.0 CEVersion=211  CEConfigName="H/PC Pro 2.11"
nmake /f "ce.mak" CFG="CE - Win32 (WCE ARM) Release Latin American" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "ce.mak" CFG="CE - Win32 (WCE ARM) Release English UK" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "ce.mak" CFG="CE - Win32 (WCE ARM) Release German" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

nmake /f "cedll.mak" CFG="cedll - Win32 (WCE ARM) Release" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE ARM) Release Spanish" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE ARM) Release Latin American" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE ARM) Release English UK" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE ARM) Release German" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

nmake /f "cedll.mak" CFG="cedll - Win32 (WCE ARM) Access32" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE ARM) Access32 Spanish" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE ARM) Access32 Latin American" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE ARM) Access32 English UK" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE ARM) Access32 German" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

@echo make the static and dynamic library version of dectalk for the mips platform
set LIB=%DEVROOT%\%PLATFORM%\MS HPC PRO\lib\MIPS;

nmake /f "ce.mak" CFG="CE - Win32 (WCE MIPS) Release" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "ce.mak" CFG="CE - Win32 (WCE MIPS) Release Spanish" CESubsystem=windowsce,2.0 CEVersion=211  CEConfigName="H/PC Pro 2.11"
nmake /f "ce.mak" CFG="CE - Win32 (WCE MIPS) Release Latin American" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "ce.mak" CFG="CE - Win32 (WCE MIPS) Release English UK" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "ce.mak" CFG="CE - Win32 (WCE MIPS) Release German" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

nmake /f "cedll.mak" CFG="cedll - Win32 (WCE MIPS) Release" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE MIPS) Release Spanish" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE MIPS) Release Latin American" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE MIPS) Release English UK" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE MIPS) Release German" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

nmake /f "cedll.mak" CFG="cedll - Win32 (WCE MIPS) Access32" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE MIPS) Access32 Spanish" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE MIPS) Access32 Latin American" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE MIPS) Access32 English UK" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE MIPS) Access32 German" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"


@echo make the static and dynamic library version of dectalk for the sh4 platform
set LIB=%DEVROOT%\%PLATFORM%\MS HPC PRO\lib\SH3;

nmake /f "ce.mak" CFG="CE - Win32 (WCE SH3) Release" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "ce.mak" CFG="CE - Win32 (WCE SH3) Release Spanish" CESubsystem=windowsce,2.0 CEVersion=211  CEConfigName="H/PC Pro 2.11"
nmake /f "ce.mak" CFG="CE - Win32 (WCE SH3) Release Latin American" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "ce.mak" CFG="CE - Win32 (WCE SH3) Release English UK" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "ce.mak" CFG="CE - Win32 (WCE SH3) Release German" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

nmake /f "cedll.mak" CFG="cedll - Win32 (WCE SH3) Release" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE SH3) Release Spanish" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE SH3) Release Latin American" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE SH3) Release English UK" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE SH3) Release German" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

nmake /f "cedll.mak" CFG="cedll - Win32 (WCE SH3) Access32" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE SH3) Access32 Spanish" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE SH3) Access32 Latin American" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE SH3) Access32 English UK" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE SH3) Access32 German" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"


@echo make the static and dynamic library version of dectalk for the sh4 platform
set LIB=%DEVROOT%\%PLATFORM%\MS HPC PRO\lib\SH4;

nmake /f "ce.mak" CFG="CE - Win32 (WCE SH4) Release" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "ce.mak" CFG="CE - Win32 (WCE SH4) Release Spanish" CESubsystem=windowsce,2.0 CEVersion=211  CEConfigName="H/PC Pro 2.11"
nmake /f "ce.mak" CFG="CE - Win32 (WCE SH4) Release Latin American" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "ce.mak" CFG="CE - Win32 (WCE SH4) Release English UK" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "ce.mak" CFG="CE - Win32 (WCE SH4) Release German" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

nmake /f "cedll.mak" CFG="cedll - Win32 (WCE SH4) Release" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE SH4) Release Spanish" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE SH4) Release Latin American" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE SH4) Release English UK" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE SH4) Release German" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

nmake /f "cedll.mak" CFG="cedll - Win32 (WCE SH4) Access32" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE SH4) Access32 Spanish" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE SH4) Access32 Latin American" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE SH4) Access32 English UK" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "cedll.mak" CFG="cedll - Win32 (WCE SH4) Access32 German" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

@echo build DTSample

cd .\..\..\samplece\Dtsample

set LIB=%DEVROOT%\%PLATFORM%\MS HPC PRO\lib\X86em;%DEVROOT%\%PLATFORM%\MS HPC PRO\mfc\lib\X86em;

nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE x86em) Release" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE x86em) Release Spanish" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE x86em) Release Latin American" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE x86em) Release English UK" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE x86em) Release German" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE x86em) Release Dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE x86em) Release Spanish Dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE x86em) Release Latin American Dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE x86em) Release English UK Dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE x86em) Release German Dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE x86em) Debug Dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE x86em) Debug Spanish Dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE x86em) Debug Latin American Dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE x86em) Debug English UK Dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE x86em) Debug German Dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"


set LIB=%DEVROOT%\%PLATFORM%\MS HPC PRO\lib\ARM;%DEVROOT%\%PLATFORM%\MS HPC PRO\mfc\lib\ARM;

nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE ARM) Release" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE ARM) Release Spanish" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE ARM) Release Latin American" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE ARM) Release English UK" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE ARM) Release German" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE ARM) Release dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE ARM) Release Spanish dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE ARM) Release Latin American dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE ARM) Release English UK dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE ARM) Release German dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

set LIB=%DEVROOT%\%PLATFORM%\MS HPC PRO\lib\SH3;%DEVROOT%\%PLATFORM%\MS HPC PRO\mfc\lib\SH3;

nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE SH3) Release" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE SH3) Release Spanish" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE SH3) Release Latin American" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE SH3) Release English UK" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE SH3) Release German" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE SH3) Release Dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE SH3) Release Spanish Dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE SH3) Release Latin American Dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE SH3) Release English UK Dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE SH3) Release German Dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

set LIB=%DEVROOT%\%PLATFORM%\MS HPC PRO\lib\SH4;%DEVROOT%\%PLATFORM%\MS HPC PRO\mfc\lib\SH4;

nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE SH4) Release" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE SH4) Release Spanish" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE SH4) Release Latin American" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE SH4) Release English UK" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE SH4) Release German" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE SH4) Release Dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE SH4) Release Spanish Dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE SH4) Release Latin American Dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE SH4) Release English UK Dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE SH4) Release German Dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

set LIB=%DEVROOT%\%PLATFORM%\MS HPC PRO\lib\MIPS;%DEVROOT%\%PLATFORM%\MS HPC PRO\mfc\lib\MIPS;

nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE MIPS) Release" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE MIPS) Release Spanish" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE MIPS) Release Latin American" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE MIPS) Release English UK" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE MIPS) Release German" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE MIPS) Release Dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE MIPS) Release Spanish Dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE MIPS) Release Latin American Dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE MIPS) Release English UK Dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Dtsample.mak" CFG="Dtsample - Win32 (WCE MIPS) Release German Dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"



@echo build CEtalk

cd .\..\CEtalk

set LIB=%DEVROOT%\%PLATFORM%\MS HPC PRO\lib\X86em;%DEVROOT%\%PLATFORM%\MS HPC PRO\mfc\lib\X86em;

nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE x86em) Release" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE x86em) Release Spanish" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE x86em) Release Latin American" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE x86em) Release English UK" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE x86em) Release German" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE x86em) Release dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE x86em) Release Spanish dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE x86em) Release Latin American dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE x86em) Release English UK dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE x86em) Release German dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"


nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE x86em) Debug dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE x86em) Debug Spanish dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE x86em) Debug Latin American dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE x86em) Debug English UK dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE x86em) Debug German dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

set LIB=%DEVROOT%\%PLATFORM%\MS HPC PRO\lib\ARM;%DEVROOT%\%PLATFORM%\MS HPC PRO\mfc\lib\ARM;

nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE ARM) Release" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE ARM) Release Spanish" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE ARM) Release Latin American" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE ARM) Release English UK" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE ARM) Release German" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE ARM) Release dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE ARM) Release Spanish dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE ARM) Release Latin American dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE ARM) Release English UK dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE ARM) Release German dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

set LIB=%DEVROOT%\%PLATFORM%\MS HPC PRO\lib\SH3;%DEVROOT%\%PLATFORM%\MS HPC PRO\mfc\lib\SH3;

nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE SH3) Release" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE SH3) Release Spanish" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE SH3) Release Latin American" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE SH3) Release English UK" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE SH3) Release German" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE SH3) Release dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE SH3) Release Spanish dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE SH3) Release Latin American dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE SH3) Release English UK dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE SH3) Release German dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

set LIB=%DEVROOT%\%PLATFORM%\MS HPC PRO\lib\SH4;%DEVROOT%\%PLATFORM%\MS HPC PRO\mfc\lib\SH4;

nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE SH4) Release" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE SH4) Release Spanish" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE SH4) Release Latin American" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE SH4) Release English UK" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE SH4) Release German" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE SH4) Release dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE SH4) Release Spanish dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE SH4) Release Latin American dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE SH4) Release English UK dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE SH4) Release German dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

set LIB=%DEVROOT%\%PLATFORM%\MS HPC PRO\lib\MIPS;%DEVROOT%\%PLATFORM%\MS HPC PRO\mfc\lib\MIPS;

nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE MIPS) Release" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE MIPS) Release Spanish" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE MIPS) Release Latin American" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE MIPS) Release English UK" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE MIPS) Release German" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE MIPS) Release dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE MIPS) Release Spanish dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE MIPS) Release Latin American dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE MIPS) Release English UK dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "CEtalk.mak" CFG="CEtalk - Win32 (WCE MIPS) Release German dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"



@echo build Mailread
cd .\..\Mailread

set LIB=%DEVROOT%\%PLATFORM%\MS HPC PRO\lib\X86em;%DEVROOT%\%PLATFORM%\MS HPC PRO\mfc\lib\X86em;
nmake /f "Mailread.mak" CFG="Mailread - Win32 (WCE x86em) Release" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Mailread.mak" CFG="Mailread - Win32 (WCE x86em) Release dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"


set LIB=%DEVROOT%\%PLATFORM%\MS HPC PRO\lib\mips;%DEVROOT%\%PLATFORM%\MS HPC PRO\mfc\lib\mips;
nmake /f "Mailread.mak" CFG="Mailread - Win32 (WCE MIPS) Release" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Mailread.mak" CFG="Mailread - Win32 (WCE MIPS) Release dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"


set LIB=%DEVROOT%\%PLATFORM%\MS HPC PRO\lib\sh3;%DEVROOT%\%PLATFORM%\MS HPC PRO\mfc\lib\sh3;
nmake /f "Mailread.mak" CFG="Mailread - Win32 (WCE SH3) Release" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Mailread.mak" CFG="Mailread - Win32 (WCE SH3) Release dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"


set LIB=%DEVROOT%\%PLATFORM%\MS HPC PRO\lib\sh4;%DEVROOT%\%PLATFORM%\MS HPC PRO\mfc\lib\sh4;
nmake /f "Mailread.mak" CFG="Mailread - Win32 (WCE SH4) Release" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Mailread.mak" CFG="Mailread - Win32 (WCE SH4) Release dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"


set LIB=%DEVROOT%\%PLATFORM%\MS HPC PRO\lib\arm;%DEVROOT%\%PLATFORM%\MS HPC PRO\mfc\lib\arm;
nmake /f "Mailread.mak" CFG="Mailread - Win32 (WCE ARM) Release" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "Mailread.mak" CFG="Mailread - Win32 (WCE ARM) Release dll" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"



@echo build windic
cd .\..\windic

set LIB=%DEVROOT%\%PLATFORM%\MS HPC PRO\lib\X86em;%DEVROOT%\%PLATFORM%\MS HPC PRO\mfc\lib\X86em;

nmake /f "windic.mak" CFG="windic - Win32 (WCE x86em) Release" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE x86em) Release Spanish" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE x86em) Release Latin American" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE x86em) Release English UK" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE x86em) Release German" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

nmake /f "windic.mak" CFG="windic - Win32 (WCE x86em) Release DLL" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE x86em) Release Spanish DLL" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE x86em) Release Latin American DLL" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE x86em) Release English UK DLL" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE x86em) Release German DLL" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

set LIB=%DEVROOT%\%PLATFORM%\MS HPC PRO\lib\ARM;%DEVROOT%\%PLATFORM%\MS HPC PRO\mfc\lib\ARM;

nmake /f "windic.mak" CFG="windic - Win32 (WCE ARM) Release" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE ARM) Release Spanish" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE ARM) Release Latin American" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE ARM) Release English UK" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE ARM) Release German" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

nmake /f "windic.mak" CFG="windic - Win32 (WCE ARM) Release DLL" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE ARM) Release Spanish DLL" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE ARM) Release Latin American DLL" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE ARM) Release English UK DLL" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE ARM) Release German DLL" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

set LIB=%DEVROOT%\%PLATFORM%\MS HPC PRO\lib\SH3;%DEVROOT%\%PLATFORM%\MS HPC PRO\mfc\lib\SH3;

nmake /f "windic.mak" CFG="windic - Win32 (WCE SH3) Release" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE SH3) Release Spanish" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE SH3) Release Latin American" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE SH3) Release English UK" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE SH3) Release German" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

nmake /f "windic.mak" CFG="windic - Win32 (WCE SH3) Release DLL" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE SH3) Release Spanish DLL" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE SH3) Release Latin American DLL" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE SH3) Release English UK DLL" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE SH3) Release German DLL" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

set LIB=%DEVROOT%\%PLATFORM%\MS HPC PRO\lib\SH4;%DEVROOT%\%PLATFORM%\MS HPC PRO\mfc\lib\SH4;

nmake /f "windic.mak" CFG="windic - Win32 (WCE SH4) Release" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE SH4) Release Spanish" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE SH4) Release Latin American" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE SH4) Release English UK" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE SH4) Release German" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

nmake /f "windic.mak" CFG="windic - Win32 (WCE SH4) Release DLL" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE SH4) Release Spanish DLL" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE SH4) Release Latin American DLL" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE SH4) Release English UK DLL" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE SH4) Release German DLL" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

set LIB=%DEVROOT%\%PLATFORM%\MS HPC PRO\lib\MIPS;%DEVROOT%\%PLATFORM%\MS HPC PRO\mfc\lib\MIPS;

nmake /f "windic.mak" CFG="windic - Win32 (WCE MIPS) Release" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE MIPS) Release Spanish" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE MIPS) Release Latin American" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE MIPS) Release English UK" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE MIPS) Release German" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

nmake /f "windic.mak" CFG="windic - Win32 (WCE MIPS) Release DLL" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE MIPS) Release Spanish DLL" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE MIPS) Release Latin American DLL" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE MIPS) Release English UK DLL" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"
nmake /f "windic.mak" CFG="windic - Win32 (WCE MIPS) Release German DLL" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

cd .\..\..
:build_wce211ML
set PLATFORM=WCE211

set INCLUDE=%DEVROOT%\%PLATFORM%\MS HPC PRO\include;%DEVROOT%\%PLATFORM%\MS HPC PRO\mfc\include
set PATH=%VCROOT%\Common\MSDev98\Bin;%VCROOT%\VC98\Bin;%DEVROOT%\%PLATFORM%\bin;%path%

@echo bulid dectalk multi language

cd .\dtalkml\src

@echo make the dynamic library versions of dectalk ML for the x86em and arm platforms
set LIB=%DEVROOT%\%PLATFORM%\MS HPC PRO\lib\X86em;
nmake /f "DtalkMLCE.mak" CFG="DTalkML - Win32 (WCE x86em) Release" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

set LIB=%DEVROOT%\%PLATFORM%\MS HPC PRO\lib\ARM;
nmake /f "DtalkMLCE.mak" CFG="DTalkML - Win32 (WCE ARM) Release" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

set LIB=%DEVROOT%\%PLATFORM%\MS HPC PRO\lib\SH3;
nmake /f "DtalkMLCE.mak" CFG="DTalkML - Win32 (WCE SH3) Release" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

set LIB=%DEVROOT%\%PLATFORM%\MS HPC PRO\lib\SH4;
nmake /f "DtalkMLCE.mak" CFG="DTalkML - Win32 (WCE SH4) Release" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"

set LIB=%DEVROOT%\%PLATFORM%\MS HPC PRO\lib\MIPS;
nmake /f "DtalkMLCE.mak" CFG="DTalkML - Win32 (WCE MIPS) Release" CESubsystem=windowsce,2.0 CEVersion=211 CEConfigName="H/PC Pro 2.11"


cd .\..\..

deltree /Y .\dapi\build\%PLATFORM%
deltree /Y .\samplece\CEtalk\build\%PLATFORM%
deltree /Y .\samplece\Dtsample\build\%PLATFORM%
deltree /Y .\samplece\Mailread\build\%PLATFORM%
deltree /Y .\samplece\windic\build\%PLATFORM%
deltree /Y .\dtalkml\build\%PLATFORM%

mkdir .\dapi\build\%PLATFORM%
move .\dapi\build\cedll  .\dapi\build\%PLATFORM%\
move .\dapi\build\cestatic .\dapi\build\%PLATFORM%\

mkdir .\samplece\CEtalk\build\%PLATFORM%
move .\samplece\CEtalk\build\dll  .\samplece\CEtalk\build\%PLATFORM%\
move .\samplece\CEtalk\build\static  .\samplece\CEtalk\build\%PLATFORM%\

mkdir .\samplece\Dtsample\build\%PLATFORM%
move .\samplece\Dtsample\build\dll .\samplece\Dtsample\build\%PLATFORM%\
move .\samplece\Dtsample\build\static  .\samplece\Dtsample\build\%PLATFORM%\

mkdir .\samplece\Mailread\build\%PLATFORM%
move .\samplece\Mailread\build\dll .\samplece\Mailread\build\%PLATFORM%\
move .\samplece\Mailread\build\static  .\samplece\Mailread\build\%PLATFORM%\

mkdir .\samplece\windic\build\%PLATFORM%
move .\samplece\windic\build\cedll .\samplece\windic\build\%PLATFORM%\
move .\samplece\windic\build\static  .\samplece\windic\build\%PLATFORM%\

mkdir .\dtalkml\build\%PLATFORM%
move .\dtalkml\build\ce\arm .\dtalkml\build\%PLATFORM%\
move .\dtalkml\build\ce\x86em .\dtalkml\build\%PLATFORM%\
move .\dtalkml\build\ce\sh .\dtalkml\build\%PLATFORM%\
move .\dtalkml\build\ce\sh4 .\dtalkml\build\%PLATFORM%\
move .\dtalkml\build\ce\mips .\dtalkml\build\%PLATFORM%\

deltree /Y .\dtalkml\build\ce

:end
