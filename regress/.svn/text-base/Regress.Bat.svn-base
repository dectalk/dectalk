@echo off
REM *** Regression Testing for DECtalk Software ***
REM *** Kevin Bruckert  Jan 26, 1998 ***

REM *** Constants which CANNOT be changed ***
set clean=Y
set noclean=N

REM *** Basic Constants, which CAN be changed ***
set build=rnd
set ProjectName="DECtalk NT Server:RND Code Base"
set defaultlang=us
set kitver=x 
set kitid=x
REM  *** DoClean is either (clean) or (noclean)
set DoClean=%noclean%

set language=%1
set versionlabel=%2

if "%language%" == "" set language=defaultlang
if "%1" == "/?" goto Usage
if "%3" == "" goto NoThird
goto Usage

:NoThird

REM *** Jump to %build%
D:
cd \work\%build%

REM *** Delete old Regress Log
if EXIST D:\work\build.%build% goto KillBuild
Goto BuildReady

:KillBuild
Del D:\work\build.%build%

:BuildReady
echo Regression Log > D:\work\build.%build%
echo ************** >> D:\work\build.%build%

REM *** Remove tree
if "%versionlabel%" == "nocheckout" goto DoBuild
Deltree /Y *.*

REM *** Checkout tree
if "%versionlabel%" == "" goto nolabel
C:\Starteam\v20\STCMD CO /P %ProjectName% /vl %versionlabel% /is /un "Regress" /pw "Regress" /x /o >> D:\work\build.%build%
REM *** This should have checked out the code system
goto DoBuild

:nolabel
C:\Starteam\v20\STCMD CO /P %ProjectName% /is /un "Regress" /pw "Regress" /x /o >> D:\work\build.%build%
REM *** This should have checked out the code system
goto DoBuild

:DoBuild
REM *** Code kit for kitcopy
copy D:\work\kitcopy.bat D:\work\%build%\kitting
REM *** Delete after carl does code checkin

REM *** Call D:\work\setvar
call D:\work\setvar

REM *** Test for Prodmak
if exist Prodmak.BAT goto GotProdmak
echo ERROR: Unable to find PRODMAK >> D:\work\build.%build%
goto error

:GotProdmak
REM *** Build the code ***
if "%language%" == "" goto bldUS
if "%language%" == "us" goto bldUS
if "%language%" == "sp" goto bldSP
if "%language%" == "la" goto bldLA
if "%language%" == "gr" goto bldGR
if "%language%" == "uk" goto bldUK
if "%language%" == "all" goto bldALL

:bldALL
call prodmak ENGLISH_US %DoClean% >> D:\work\build.%build%
grep -i error D:\work\build.%build%| grep -v error.au > D:\work\errors.%build%
grep -i "Bad command or file name" D:\work\build.%build% >> D:\work\errors.%build%
grep -i invalid D:\work\build.%build% >> D:\work\errors.%build%
grep -i "The system cannot find the file specified." D:\work\build.%build% >> D:\work\errors.%build%
grep -i "0 file(s) copied" D:\work\build.%build% >> D:\work\errors.%build%
linec D:\work\errors.%build%
if %ERRORLEVEL% GTR 0 echo *** Errors encountered ***
if %ERRORLEVEL% GTR 0 echo *** Errors encountered in Prodmak ENGLISH_US *** >> D:\work\build.%build%
if %ERRORLEVEL% GTR 0 goto error
call prodmak SPANISH %DoClean% >> D:\work\build.%build%
grep -i error D:\work\build.%build%| grep -v error.au > D:\work\errors.%build%
grep -i "Bad command or file name" D:\work\build.%build% >> D:\work\errors.%build%
grep -i invalid D:\work\build.%build% >> D:\work\errors.%build%
grep -i "The system cannot find the file specified." D:\work\build.%build% >> D:\work\errors.%build%
grep -i "0 file(s) copied" D:\work\build.%build% >> D:\work\errors.%build%
linec D:\work\errors.%build%
if %ERRORLEVEL% GTR 0 echo *** Errors encountered ***
if %ERRORLEVEL% GTR 0 echo *** Errors encountered in Prodmak SPANISH *** >> D:\work\build.%build%
if %ERRORLEVEL% GTR 0 goto error
call prodmak SPANISH_LA %DoClean% >> D:\work\build.%build%
grep -i error D:\work\build.%build%| grep -v error.au > D:\work\errors.%build%
grep -i "Bad command or file name" D:\work\build.%build% >> D:\work\errors.%build%
grep -i invalid D:\work\build.%build% >> D:\work\errors.%build%
grep -i "The system cannot find the file specified." D:\work\build.%build% >> D:\work\errors.%build%
grep -i "0 file(s) copied" D:\work\build.%build% >> D:\work\errors.%build%
linec D:\work\errors.%build%
if %ERRORLEVEL% GTR 0 echo *** Errors encountered ***
if %ERRORLEVEL% GTR 0 echo *** Errors encountered in Prodmak SPANISH_LA *** >> D:\work\build.%build%
if %ERRORLEVEL% GTR 0 goto error
call prodmak GERMAN %DoClean% >> D:\work\build.%build%
grep -i error D:\work\build.%build%| grep -v error.au > D:\work\errors.%build%
grep -i "Bad command or file name" D:\work\build.%build% >> D:\work\errors.%build%
grep -i invalid D:\work\build.%build% >> D:\work\errors.%build%
grep -i "The system cannot find the file specified." D:\work\build.%build% >> D:\work\errors.%build%
grep -i "0 file(s) copied" D:\work\build.%build% >> D:\work\errors.%build%
linec D:\work\errors.%build%
if %ERRORLEVEL% GTR 0 echo *** Errors encountered ***
if %ERRORLEVEL% GTR 0 echo *** Errors encountered in Prodmak GERMAN *** >> D:\work\build.%build%
if %ERRORLEVEL% GTR 0 goto error
call prodmak ENGLISH_UK %DoClean% >> D:\work\build.%build%
set lang="ENGLISH_UK"
goto DoneBuild

:bldUS
call prodmak ENGLISH_US %DoClean% >> D:\work\build.%build%
set lang="ENGLISH_US"
goto DoneBuild

:bldSP
call prodmak SPANISH %DoClean% >> D:\work\build.%build%
set lang="SPANISH"
goto DoneBuild

:bldLA
call prodmak SPANISH_LA %DoClean% >> D:\work\build.%build%
set lang="SPANISH_LA"
goto DoneBuild

:bldGR
call prodmak GERMAN %DoClean% >> D:\work\build.%build%
set lang="GERMAN"
goto DoneBuild

:bldUK
call prodmak ENGLISH_UK %DoClean% >> D:\work\build.%build%
set lang="ENGLISH_UK"
goto DoneBuild

:DoneBuild
REM *** Test for errors ***
grep -i error D:\work\build.%build%| grep -v error.au > D:\work\errors.%build%
grep -i "Bad command or file name" D:\work\build.%build% >> D:\work\errors.%build%
grep -i invalid D:\work\build.%build% >> D:\work\errors.%build%
grep -i "The system cannot find the file specified." D:\work\build.%build% >> D:\work\errors.%build%
grep -i "0 file(s) copied" D:\work\build.%build% >> D:\work\errors.%build%
linec D:\work\errors.%build%
if %ERRORLEVEL% LEQ 0 goto GoodBld
echo *** Errors encountered ***
echo *** Errors encountered in Prodmak %lang% *** >> D:\work\build.%build%
goto error

:GoodBld
echo *** PRODMAK completed ***
echo *** PRODMAK completed *** >> D:\work\build.%build%
echo *** KitCopy *** > D:\work\kitting.%build%
cd kitting

REM *** Language Selector, again ***
if "%language%" == "" goto kitUS
if "%language%" == "us" goto kitUS
if "%language%" == "sp" goto kitSP
if "%language%" == "la" goto kitLA
if "%language%" == "gr" goto kitGR
if "%language%" == "uk" goto kitUK
if "%language%" == "all" goto kitALL

:kitUS
call kitcopy %KitVer% %kitid% ENGLISH_US >> D:\work\kitting.%build%
set lang=ENGLISH_US
REM *** Test for errors ***
grep -i error D:\work\kitting.%build% > D:\work\errors.%build%
grep -i "Bad command or file name" D:\work\kitting.%build% >> D:\work\errors.%build%
grep -i "The system cannot find the file specified." D:\work\kitting.%build% >> D:\work\errors.%build%
grep -i "0 file(s) copied" D:\work\kitting.%build% >> D:\work\errors.%build%
linec D:\work\errors.%build%
if %ERRORLEVEL% LEQ 0 goto KitML
echo *** Errors encountered ***
echo *** Errors encountered in KitCopy %KitVer% %kitid% %lang% *** >> D:\work\kitting.%build%
goto error

:kitSP
call kitcopy %KitVer% %kitid% SPANISH >> D:\work\kitting.%build%
set lang=SPANISH
REM *** Test for errors ***
grep -i error D:\work\kitting.%build% > D:\work\errors.%build%
grep -i "Bad command or file name" D:\work\kitting.%build% >> D:\work\errors.%build%
grep -i "The system cannot find the file specified." D:\work\kitting.%build% >> D:\work\errors.%build%
grep -i "0 file(s) copied" D:\work\kitting.%build% >> D:\work\errors.%build%
linec D:\work\errors.%build%
if %ERRORLEVEL% LEQ 0 goto KitML
echo *** Errors encountered ***
echo *** Errors encountered in KitCopy %KitVer% %kitid% %lang% *** >> D:\work\kitting.%build%
goto error

:kitLA
call kitcopy %KitVer% %kitid% SPANISH_LA >> D:\work\kitting.%build%
set lang=SPANISH_LA
REM *** Test for errors ***
grep -i error D:\work\kitting.%build% > D:\work\errors.%build%
grep -i "Bad command or file name" D:\work\kitting.%build% >> D:\work\errors.%build%
grep -i "The system cannot find the file specified." D:\work\kitting.%build% >> D:\work\errors.%build%
grep -i "0 file(s) copied" D:\work\kitting.%build% >> D:\work\errors.%build%
linec D:\work\errors.%build%
if %ERRORLEVEL% LEQ 0 goto KitML
echo *** Errors encountered ***
echo *** Errors encountered in KitCopy %KitVer% %kitid% %lang% *** >> D:\work\kitting.%build%
goto error

:kitGR
call kitcopy %KitVer% %kitid% GERMAN >> D:\work\kitting.%build%
set lang=GERMAN
REM *** Test for errors ***
grep -i error D:\work\kitting.%build% > D:\work\errors.%build%
grep -i "Bad command or file name" D:\work\kitting.%build% >> D:\work\errors.%build%
grep -i "The system cannot find the file specified." D:\work\kitting.%build% >> D:\work\errors.%build%
grep -i "0 file(s) copied" D:\work\kitting.%build% >> D:\work\errors.%build%
linec D:\work\errors.%build%
if %ERRORLEVEL% LEQ 0 goto KitML
echo *** Errors encountered ***
echo *** Errors encountered in KitCopy %KitVer% %kitid% %lang% *** >> D:\work\kitting.%build%
goto error

:kitUK
call kitcopy %KitVer% %kitid% ENGLISH_UK >> D:\work\kitting.%build%
set lang=ENGLISH_UK
REM *** Test for errors ***
grep -i error D:\work\kitting.%build% > D:\work\errors.%build%
grep -i "Bad command or file name" D:\work\kitting.%build% >> D:\work\errors.%build%
grep -i "The system cannot find the file specified." D:\work\kitting.%build% >> D:\work\errors.%build%
grep -i "0 file(s) copied" D:\work\kitting.%build% >> D:\work\errors.%build%
linec D:\work\errors.%build%
if %ERRORLEVEL% LEQ 0 goto KitML
echo *** Errors encountered ***
echo *** Errors encountered in KitCopy %KitVer% %kitid% %lang% *** >> D:\work\kitting.%build%
goto error

:kitML
call kitcopy %KitVer% %kitid% ML >> D:\work\kitting.%build%
set lang=DECtalk ML
REM *** Test for errors ***
grep -i error D:\work\kitting.%build% > D:\work\errors.%build%
grep -i "Bad command or file name" D:\work\kitting.%build% >> D:\work\errors.%build%
grep -i "The system cannot find the file specified." D:\work\kitting.%build% >> D:\work\errors.%build%
grep -i "0 file(s) copied" D:\work\kitting.%build% >> D:\work\errors.%build%
linec D:\work\errors.%build%
if %ERRORLEVEL% LEQ 0 goto GoodKit
echo *** Errors encountered ***
echo *** Errors encountered in KitCopy %KitVer% %kitid% %lang% *** >> D:\work\kitting.%build%
goto error

:kitALL
call kitcopy %KitVer% %kitid% ENGLISH_US >> D:\work\kitting.%build%
set lang=ENGLISH_US
REM *** Test for errors ***
grep -i error D:\work\kitting.%build% > D:\work\errors.%build%
grep -i "Bad command or file name" D:\work\kitting.%build% >> D:\work\errors.%build%
grep -i "The system cannot find the file specified." D:\work\kitting.%build% >> D:\work\errors.%build%
grep -i "0 file(s) copied" D:\work\kitting.%build% >> D:\work\errors.%build%
linec D:\work\errors.%build%
if %ERRORLEVEL% LEQ 0 goto GoodUS
echo *** Errors encountered ***
echo *** Errors encountered in KitCopy %KitVer% %kitid% %lang% *** >> D:\work\kitting.%build%
goto error
:GoodUS
call kitcopy %KitVer% %kitid% SPANISH >> D:\work\kitting.%build%
set lang=SPANISH
REM *** Test for errors ***
grep -i error D:\work\kitting.%build% > D:\work\errors.%build%
grep -i "Bad command or file name" D:\work\kitting.%build% >> D:\work\errors.%build%
grep -i "The system cannot find the file specified." D:\work\kitting.%build% >> D:\work\errors.%build%
grep -i "0 file(s) copied" D:\work\kitting.%build% >> D:\work\errors.%build%
linec D:\work\errors.%build%
if %ERRORLEVEL% LEQ 0 goto GoodSP
echo *** Errors encountered ***
echo *** Errors encountered in KitCopy %KitVer% %kitid% %lang% *** >> D:\work\kitting.%build%
goto error
:GoodSP
call kitcopy %KitVer% %kitid% SPANISH_LA >> D:\work\kitting.%build%
set lang=SPANISH_LA
REM *** Test for errors ***
grep -i error D:\work\kitting.%build% > D:\work\errors.%build%
grep -i "Bad command or file name" D:\work\kitting.%build% >> D:\work\errors.%build%
grep -i "The system cannot find the file specified." D:\work\kitting.%build% >> D:\work\errors.%build%
grep -i "0 file(s) copied" D:\work\kitting.%build% >> D:\work\errors.%build%
linec D:\work\errors.%build%
if %ERRORLEVEL% LEQ 0 goto GoodLA
echo *** Errors encountered ***
echo *** Errors encountered in KitCopy %KitVer% %kitid% %lang% *** >> D:\work\kitting.%build%
goto error
:GoodLA
call kitcopy %KitVer% %kitid% GERMAN >> D:\work\kitting.%build%
set lang=GERMAN
REM *** Test for errors ***
grep -i error D:\work\kitting.%build% > D:\work\errors.%build%
grep -i "Bad command or file name" D:\work\kitting.%build% >> D:\work\errors.%build%
grep -i "The system cannot find the file specified." D:\work\kitting.%build% >> D:\work\errors.%build%
grep -i "0 file(s) copied" D:\work\kitting.%build% >> D:\work\errors.%build%
linec D:\work\errors.%build%
if %ERRORLEVEL% LEQ 0 goto GoodGR
echo *** Errors encountered ***
echo *** Errors encountered in KitCopy %KitVer% %kitid% %lang% *** >> D:\work\kitting.%build%
goto error
:GoodGR
call kitcopy %KitVer% %kitid% ENGLISH_UK >> D:\work\kitting.%build%
set lang=ENGLISH_UK
REM *** Test for errors ***
grep -i error D:\work\kitting.%build% > D:\work\errors.%build%
grep -i "Bad command or file name" D:\work\kitting.%build% >> D:\work\errors.%build%
grep -i "The system cannot find the file specified." D:\work\kitting.%build% >> D:\work\errors.%build%
grep -i "0 file(s) copied" D:\work\kitting.%build% >> D:\work\errors.%build%
linec D:\work\errors.%build%
if %ERRORLEVEL% LEQ 0 goto GoodUK
echo *** Errors encountered ***
echo *** Errors encountered in KitCopy %KitVer% %kitid% %lang% *** >> D:\work\kitting.%build%
goto error
:GoodUK
call kitcopy %KitVer% %kitid% ML >> D:\work\kitting.%build%
set lang=DECtalk ML
REM *** Test for errors ***
grep -i error D:\work\kitting.%build% > D:\work\errors.%build%
grep -i "Bad command or file name" D:\work\kitting.%build% >> D:\work\errors.%build%
grep -i "The system cannot find the file specified." D:\work\kitting.%build% >> D:\work\errors.%build%
grep -i "0 file(s) copied" D:\work\kitting.%build% >> D:\work\errors.%build%
linec D:\work\errors.%build%
if %ERRORLEVEL% LEQ 0 goto GoodML
echo *** Errors encountered ***
echo *** Errors encountered in KitCopy %KitVer% %kitid% %lang% *** >> D:\work\kitting.%build%
goto error

:GoodML
goto GoodKit

:GoodKit
echo *** KitCopy completed ***
echo *** KitCopy completed *** >> D:\work\kitting.%build%

REM *** Cleanup from Regression ***
echo *** Regression Suite Completed Successfully!!! ***
echo *** Regression Suite Completed Successfully!!! *** > D:\work\regress.%build%
echo ************************************************** >> D:\work\regress.%build%
REM *** Build mail message
echo ************************************************** > D:\work\mail.%build%
echo *** Regression Suite Completed Successfully!!! *** >> D:\work\mail.%build%
echo ************************************************** >> D:\work\mail.%build%
type D:\work\build.%build% > D:\work\regress.%build%
type D:\work\kitting.%build% >> D:\work\regress.%build%
del D:\work\build.%build%
del D:\work\kitting.%build%
wSendMail -noini -hdectalk.shr.dec.com -s"successful build of %build%" -fregress@dectalk.shr.dec.com regress@dectalk.shr.dec.com D:\work\mail.%build%
del D:\work\mail.%build%
goto end

:error
echo *** Regression Suite FAILED!!! ***
echo *** Regression Suite FAILED!!! *** > D:\work\regress.%build%
echo ********************************** >> D:\work\regress.%build%
if exist D:\work\errors.%build% type D:\work\errors.%build% >> d:\work\regress.%build%
echo ********************************** >> D:\work\regress.%build%
echo ***     Log of regressions     *** >> D:\work\regress.%build%
echo ********************************** >> D:\work\regress.%build%
if exist D:\work\build.%build% type D:\work\build.%build% >> D:\work\regress.%build%
if exist D:\work\kitting.%build% type D:\work\kitting.%build% >> D:\work\regress.%build%
wSendMail -noini -hdectalk.shr.dec.com -s"FAILED build of %build%" -fregress@dectalk.shr.dec.com regressfail@dectalk.shr.dec.com D:\work\regress.%build%

goto end

:usage
echo DoBuild [langauage: us sp la gr uk all] ["version label"]
goto end

:end
if Exist D:\work\build.%build% del D:\work\build.%build%
if Exist D:\work\kitting.%build% del D:\work\kitting.%build%
if Exist D:\work\errors.%build% del D:\work\errors.%build%
