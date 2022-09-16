@echo off
REM  DECtalk for windows CE build script

@echo To override the default settings,
@echo Type the name of this batch file followed by a platform choice: WCE100 WCE101 WCE200 
@echo Example: wcesh WCE200


if "%1"=="" goto default
set PLATFORM=%1
goto settings

:default
if "%1"=="" set PLATFORM=WCE200


:settings
set SDKROOT=C:\Program Files\Windows CE Platform SDK
set DEVROOT=C:\Program Files\DevStudio
set VCROOT=C:\Program Files\DevStudio\VC
set PATH=%DEVROOT%\WCE\bin;%DEVROOT%\sharedide\bin;%VCROOT%\bin;%path%
set INCLUDE=%DEVROOT%\WCE\include\%PLATFORM%;%DEVROOT%\WCE\MFC\include\%PLATFORM%;%DEVROOT%\WCE\ATL\include;



set LIB=%DEVROOT%\WCE\lib\%PLATFORM%\WCEmips;%DEVROOT%\WCE\MFC\lib\%PLATFORM%\WCEmips;
nmake /f "uCEtalk.mak" CFG="CEtalk - Win32 (WCE MIPS) Release dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"

set LIB=%DEVROOT%\WCE\lib\%PLATFORM%\WCEsh;%DEVROOT%\WCE\MFC\lib\%PLATFORM%\WCEsh;
nmake /f "uCEtalk.mak" CFG="CEtalk - Win32 (WCE SH) Release dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"

set LIB=%SDKROOT%\WCE\lib\%PLATFORM%\HPC\x86em;%DEVROOT%\WCE\lib\%PLATFORM%\X86em;%DEVROOT%\WCE\MFC\lib\%PLATFORM%\X86em;
nmake /f "uCEtalk.mak" CFG="CEtalk - Win32 (WCE x86em) Release dll" CESubsystem=windowsce,2.0 CEVersion=200 CEConfigName="H/PC Ver. 2.00"
