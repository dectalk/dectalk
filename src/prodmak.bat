@echo on
goto skip_comment     
set prodmak_debug=0
rem
rem ***************************************************************
rem File Name:          PRODMAK.BAT
rem File Created:       14-NOV-1996
rem File Author:        Carl Leeber
rem File Purpose:       Call the mak files for each product target.
rem ***************************************************************
rem Revisions:
rem     11/15/96 cjl    Add drive letter for MSDEV directories.
rem     11/18/96 cjl    Add main dictionary build.
rem     11/19/96 cjl    Fix liceninc builds.
rem     11/21/96 cjl    More license fixes.
rem     11/22/96 cjl    Add VerCheck.
rem     11/27/96 cjl    Add ttstest.
rem     12/02/96 cjl    Add BAT file error checking.
rem     12/17/96 sik    Add DTDEMO.EXE and DTSTAT.LIB builds.
rem     01/10/97 cjl    Add SPANISH and GERMAN processing for DTDEMO.EXE.
rem     01/13/97 ncs    Fix logic for build IDs.
rem     01/14/97 ncs    Fix multiple path echos in checkdef.
rem                     Add Usage statement in checkdef.
rem                     Made the bat file more "readable".
rem                     Add support for SPANISH and GERMAN proccessing
rem                     on all builds.
rem                     Fix all builds to handle defined variables when paths
rem                     and locations are of different languages.
rem                     Defined the naming convention -- See naming conventions
rem                     under Known Bugs.
rem                     Add CLEAN support.
rem     01/15/97 ncs    Fix call to vcvars32.bat.
rem                     Made prodmak.bat call setvar and eliminated passed in
rem                     variables set to blddrv, bldpath, msdev drive.
rem     01/16/97 ncs    Fix vcvars32.bat call to proper location.
rem     01/17/97 ncs    Fix non-US DECTALK.LIB NMAKE command line.
rem                     File is now able to accept non-US language completely.
rem     02/05/97 ncs    Add Latin American language check (SPANISH_LA).
rem     02/11/97 ncs    Add nmake command for Cpanel component.
rem     03/26/97 ncs    Added in Willow Pond build processes.
rem     04/02/97 ncs    Moved Cpanel up near the top of the build process.
rem     04/10/97 ncs    Adding in Kevin's new ph stuff.
rem     04/16/97 ncs    Fixing Alpha support
rem     06/19/97 ncs    Adding Access32 support
rem     08/18/97 cjl    By-pass ttssrv build, does not work.
rem     08/20/97 ncs    TTSSRV build is fixed.  Also allowed multiple configuations
rem                     to exit out of build if errored out (ie standard and access32)
rem     09/05/97 ksb    Scooting around SPEAK2 build routines
rem     09/11/97 cjl    Fixed vercheck nmake config to lower case.
rem                     Partial implementation of exe, dll and lib build checks.
rem     09/24/97 DR     added SMIT to build, added SAPI ACCESS32 dtalkttse.dll to build
rem     10/01/97 cjl    Add d2static.lib build using d2static.mak
rem     10/02/97 cjl    Removed d2static.lib build. Re-commented all builds.
rem                     REMed out build of DEMOSTAT.LIB & shortened labels.
rem     10/22/97 ncs/cjl Changed ttstest.exe config to A2A from A2W.
rem     10/31/97 ncs    Correction - ttstest was changed to A2A.
rem                     Also, wttstest is also changed to A2A.
rem                     And added in ENGLISH_UK support.
rem     12/03/97 cjl    Add Access32 SMIT builds (Top Secret!) {:^)
rem                     Reactivate Access32 builds for dtlkstat.lib for SAPI
rem     12/17/97 cjl    Add Artic Technology.
rem     12/23/97 cjl    Add Applied Human Factors.
rem     01/06/98 MGS    Changed dtsample and windic to ML builds
rem     01/19/98 JAW    Fixed two if statements that were missing the keyword
rem                     "goto".  prodmak.bat will now exit correctly for the
rem                     errors the if statements are checking for.
rem     02/18/98 CJL    Add Microtalk to SMIT list.
rem     03/11/98 CJL    Add Kurzweil, Consultants for Communication Technolgy,
rem                     Innocomp & JBliss to SMIT list.
rem     06/02/98 CJL    Add DtTest CONDITIONAL build to process.
rem     08/25/98 CJL    Add non-A32 version of static library and say.exe demo.
rem                     Fixed path for DTACCESS ML. Bypass 16 bit dictionary.
rem     10/29/98 CJL    Fixed pkunzip bug for 32 bit dictionary builds.
rem     02/04/99 CJL    Added PATH reset at end. Depends on setvar.bat to set.
rem     02/09/99 CJL    Added ALPHA build by-pass for WillowPrond.
rem     02/10/99 CJL    Added SMITPR to build process.
rem     02/18/99 CJL    Fixed DTTEST32 build by-pass. Removed ending PATH fix.
rem     04/21/99 CJL	Added Arkenstone to SMIT builds.
rem                     (Note: Prentke-Romich prev. added).
rem     05/20/00 MFG	Added Neil squire Foundation to SMIT builds.
rem     05/23/00 MFG	Added Medium and small dictionary builds dectalkm.dic, dectalks.dic 
rem		08/25/00 CAB	Removed extra folders for MLDemo
rem 	09/12/00 cab	Removed Alpha code from file
rem		10/18/00 cab    Removed variable msddrv, vcvars32 and msdpath not used anymore
rem		10/23/00 cab	Added if not exist to every mkdir so that it will only be created once
rem		10/27/00 cab	Added french
rem		11/15/00 cab	Added Sapi 5.0
rem 	11/27/00 cab	Added Assistive Technologies Inc and Navsys As to smitcode
rem		11/29/00 cab	Added check for file of both companies
rem		12/14/00 cab	Added Mayer-Johnson, Inc. for windows access32
rem		12/21/00 cab	1. Added label skip_comment
rem						2. Removed setvar test done in dectalk32 file
rem 	01/29/01 cab	Fixed check variable %prodmak_debug%
rem 	01/30/01 cab	1. Removed french for sapi3
rem						2. License stuff now builds only for us
rem 	01/31/01 cab	1. Removed french for ttstest
rem 					2. Modified vercheck to build only for us
rem						3. Removed 16 bit dictionary built
rem 	02/14/01 cab	1. Added test if setvar was run
rem						2. Removed envpatch
rem 	02/15/01 cab	1. Changed error_end to bug_end
rem		02/26/01 cab	1. Fixed missing cd command for dtalkml build section
rem						2. Built mldemo and dtalkml only for English as default 
rem     03/01/01 cab	Report errors to log file and corrected redundant built
rem		03/09/01 cab	Added build of debug for all languages for devdtk43.dsw
rem		03/16/01 cab	1. Fixed error output to include entire path
rem						2. Fixed errors additional and made test for doclean case insentitive
rem		03/19/01 cab	Added missing rem
rem 	03/29/01 cab	1. Removed @
rem						2. Added tunecheck build
rem		04/02/01 cab	1. Added parameter 4 and edit label clean041 clean040
rem						2. Added /A to force specfic workspaces
rem 	04/13/01 cab	Removed /A option
rem		06/04/01 cab	Removed build for dtstatic for Release Standard
rem		06/05/01 cab	Removed %platform% variable
rem		06/05/01 cab	1. Removed Access32 because of merge
rem						2. Removed Force built comments
rem		06/22/01 cab	Removed mkdir and paths for nmake command since they are not used
rem		06/26/01 cab	Removed %bld_mach%	variable
rem		07/03/01 cab	Added /i for comparison
rem		07/10/01 cab	Modified dic.exe to create dictionaries as dtalk_%langdir%
rem		07/26/01 cab	Fixed missing if for creation of dictionary
rem 	10/08/01 cab	Fixed incorrect or missing paths for error logging	
rem		09/23/02 cab	Removed pkunzip for dic build since files are now checked as text files
rem		09/25/02 cab	Added all languages to sapi5
rem		10/20/03 mfg	added dectalkvb to build 

rem ***************************************************************
rem     This file will call the mak files, one at a time and cause
rem     the targets for DECtalk(tm) Software to be built. This file
rem     may be the basis for further and more intricate automation.
rem
rem     The basic operation involves entring a directory of the
rem     production tree and invoking the proper mak file with the
rem     proper macro definitions on the command line.
rem
rem     This file presently assumes that the production area is on
rem     the d: drive at a 'root' directory like \work\product and that
rem     MSDEV files are located on the c: drive. 
rem
rem     The %1 parameter is for language. Default is ENGLISH_US.
rem     The %2 parameter is to force CLEAN before going on to compiling.
rem
rem     Also assumed is that all StarTeam files are checked out.
rem
rem     NOTE!!!
rem     You must have the variable SETVAR set in the autoexec.bat file.
rem     PLEASE READ the SETVAR.BAT file for more information about this.
rem ***************************************************************
rem Known Bugs:
rem     1)
rem ***************************************************************
rem Naming Conventions:
rem     Any english_us file name that ended in *stat.* and *static.*
rem     the other languages were named xx_xxsta.* and xx_xxstt.* respecivly.
rem
rem     Note: only the last character is different in the main filename.
rem
rem     This is used since the file name convention of dtstatic.lib
rem     has lead to (ie.) sp_dtstt.lib. While there was dtlkstat.lib
rem     and for (ie.) spanish it was named sp_dtsta.lib.
rem ***************************************************************
:skip_comment

rem The only input parameters allowed are Language and Clean

rem check if setvar was run
if not "%setvardone%"=="1" goto bug_setvar

set dtlang=%1
set doclean=%2
set prod_cln=%3
set prodexe=%4

set lang_bug=0

:checkdef
rem check for arguments
if {%1}=={} goto deflang
if {%2}=={} goto defclean
if "%prod_cln%"=="1" if NOT {%4}=={} echo Parameter prod_cln  can't be run with prodexe option & goto bug_end
if "%prodexe%"=="1" echo WARNING: PRODUCTION RUN (exe, dll, lib will be deleted!) & pause
goto cont1

if "%prodmak_debug%"=="1" pause
:deflang
rem ***************************************************************
rem     prodexe==1 will cause each .exe or .lib to be deleted.
rem ***************************************************************
set prodexe=0
if "%prodrun%"=="1" set prodexe=1
rem if "%prodrun%"=="1" set prodexe=0 *****pause *****
echo Hello %VERSIONSFULLNAME%; prodexe=%prodexe%

echo NOTE:
echo ------------------------------------------------------------------------
echo    "Usage: prodmak Language clean"
echo ------------------------------------------------------------------------
if "%prodexe%"=="1" echo WARNING: PRODUCTION RUN (exe, dll, lib will be deleted!)
echo WARNING: Using default language (ENGLISH_US)
set dtlang=ENGLISH_US
goto checkdef

:defclean
echo WARNING: CLEAN parameter is OFF.
set doclean=n
goto checkdef

:cont1
rem ***************************************************************
rem Continue
rem ***************************************************************
rem Checking the CLEAN parameter
rem ***************************************************************
if /i "%doclean%"=="n" set doclean=n
if "%doclean%"=="n" goto cont2
if /i "%doclean%"=="y" set doclean=y
if "%doclean%"=="y" goto cont2
if /i "%doclean%"=="clean" set doclean=y

rem Error
echo PRODMAK.BAT Language parameter (%doclean%) not recognized.
echo Use (n,N,y,Y,clean, or CLEAN)
goto bug_end

if "%prodmak_debug%"=="1" pause
:cont2
rem ***************************************************************
rem Setting the drive and path
rem ***************************************************************
%blddrv%
cd %bldpath%

if "%prodmak_debug%"=="1" pause
:cont3

set tool_path = \work\tools

rem SETTING UP FOR i386 MACHINE
set bld_path=build

if "%prodmak_debug%"=="1" pause
rem ***************************************************************
rem Support build of single language at a time from a choice of several.
rem     Current support for ENGLISH_US, GERMAN, SPANISH, SPANISH_LA
rem
rem NEW: internal variables:
rem     lang_long (NOTE: there is a WHITESPACE in the beginning and
rem     lang_short              a double quote at the end.
rem                             This is needed because NMAKE is very
rem                             picky.)
rem ***************************************************************
if /i "%dtlang%"=="ENGLISH_US" set lang_long="
if /i "%dtlang%"=="ENGLISH_US" set lang_conf= 
if /i "%dtlang%"=="ENGLISH_US" set lang_short=us
if /i "%dtlang%"=="ENGLISH_US" goto dtlangok
if /i "%dtlang%"=="FRENCH" set lang_long= French"
if /i "%dtlang%"=="FRENCH" set lang_conf= French
if /i "%dtlang%"=="FRENCH" set lang_short=fr
if /i "%dtlang%"=="FRENCH" goto dtlangok
if /i "%dtlang%"=="GERMAN" set lang_long= German"
if /i "%dtlang%"=="GERMAN" set lang_conf= German
if /i "%dtlang%"=="GERMAN" set lang_short=gr
if /i "%dtlang%"=="GERMAN" goto dtlangok
if /i "%dtlang%"=="SPANISH" set lang_long= Spanish"
if /i "%dtlang%"=="SPANISH" set lang_conf= Spanish
if /i "%dtlang%"=="SPANISH" set lang_short=sp
if /i "%dtlang%"=="SPANISH" goto dtlangok
if /i "%dtlang%"=="SPANISH_LA" set lang_long= Latin American"
if /i "%dtlang%"=="SPANISH_LA" set lang_conf= Latin American
if /i "%dtlang%"=="SPANISH_LA" set lang_short=la
if /i "%dtlang%"=="SPANISH_LA" goto dtlangok
if /i "%dtlang%"=="ENGLISH_UK" set lang_long= United Kingdom"
if /i "%dtlang%"=="ENGLISH_UK" set lang_conf= United Kingdom
if /i "%dtlang%"=="ENGLISH_UK" set lang_short=uk
if /i "%dtlang%"=="ENGLISH_UK" goto dtlangok
rem <INSERT HERE new Language> (Follow the convention above)

rem Error
echo PRODMAK.BAT Language parameter (%dtlang%) not recognized.
echo -------------------------------------------------------------------
echo Choices are:
echo    ENGLISH_US      FRENCH		GERMAN          
echo	ENGLISH_UK		SPANISH     SPANISH_LA
rem		INSERT MORE LANGUAGES HERE!!!
echo ___________________________________________________________________
goto bug_end

:dtlangok

echo Defined variables:
echo.
echo blddrv   = %blddrv%
echo bldpath  = %bldpath%
echo Language = %dtlang%
echo CLEAN    = %doclean%
echo INCLUDE  = %INCLUDE%
echo LIB      = %LIB%
echo tool_path = %tool_path%
echo.

if not "%lang_short%"=="us" goto skip_non_lang_specfic_1
if "%prodmak_debug%"=="1" pause
rem ***************************************************************
rem Invoke Nmake to build each target, using CFG to pass the
rem configuration information.
rem Set the path to the area with the mak file relative to the 'root'.
rem ***************************************************************

rem ***************************************************************
rem * KITTING
rem * This component is not Language specific
rem ***************************************************************
cd kitting
if "%prodmak_debug%"=="1" pause

if "%doclean%"=="n" goto contkitt
echo CLEANING: KITTING ***********
nmake /NOLOGO /ffinfo.mak CFG="Finfo - Win32 Release" CLEAN
echo DONE CLEANING
:contkitt

if "%prod_cln%"=="1" goto clean001
if "%prodexe%"=="1" del %bld_path%\release\finfo.exe
echo Building FINFO.EXE ***********
nmake /NOLOGO /ffinfo.mak CFG="Finfo - Win32 Release"
if NOT exist %bld_path%\release\finfo.exe echo Workspace %blddrv%%bldpath%\kitting\finfo.dsw for Win32 Release not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

:clean001
cd ..


if "%prodmak_debug%"=="1" pause
cd tools
rem ***************************************************************
rem * TOOLS
rem * NOTE: This is the START of the directory usage of -- tools.
rem *       You need to remember this for the following builds.
rem ***************************************************************

rem ***************************************************************
rem * TOOLS\PREPROC
rem * This component is not Language specific
rem ***************************************************************
cd preproc

if "%doclean%"=="n" goto contprep
echo CLEANING: PREPROC ***********
nmake /NOLOGO /fpreproc.mak CFG="preproc - Win32 Release" CLEAN
echo DONE CLEANING
:contprep

if "%aci_cln%"=="1" goto clean010
echo Building PREPROC.EXE ***********
if "%prodexe%"=="1" del %bld_path%\release\preproc.exe
nmake /NOLOGO /fpreproc.mak CFG="preproc - Win32 Release"
if NOT exist %bld_path%\release\preproc.exe echo Workspace %blddrv%%bldpath%\tools\preproc\preproc.dsw for Win32 Release not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log  

rem copy .\%bld_path%\release\preproc.exe to_this_location
:clean010
cd ..\..
rem ******************************************
rem * FROM TOOLS\PREPROC TO %bldpath%
rem * NOTE: This is the end of the preproc build  \tools\preproc
rem *******************************************

rem ***************************************************************
rem * CPANEL\%bld_path%\RELEASE\
rem * This component is not Language specific
rem ***************************************************************
cd cpanel\src

if "%doclean%"=="n" goto contcpan
echo CLEANING: CPANEL ***********
nmake /NOLOGO /fcpdll.mak CFG="CPDLL - Win32 Release" CLEAN
echo DONE CLEANING
:contcpan

if "%prod_cln%"=="1" goto clean020
echo Building CPANEL.DLL ***********
if "%prodexe%"=="1" del ..\%bld_path%\release\cpanel.dll
nmake /NOLOGO /fcpdll.mak CFG="CPDLL - Win32 Release"
if NOT exist ..\%bld_path%\release\cpanel.dll echo Workspace %blddrv%%bldpath%\cpanel\cpdll.dsw for Win32 Release not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

:clean020
cd ..\..
:skip_non_lang_specfic_1

if "%prodmak_debug%"=="1" pause
cd dapi\src
rem ***************************************************************
rem * DAPI\SRC
rem * NOTE: This is the START of the directory usage of -- dapi\src.
rem *       You need to remember this for the following builds.
rem ***************************************************************

rem ***************************************************************
rem * DAPI\%bld_path%\DECTALK\language\RELEASE
rem *
rem * NOTE!!!
rem * CPANEL.lib must be built before this build can work
rem * because dectalk.dll (and dectalk.lib) needs cpanel.lib.
rem ***************************************************************

if "%doclean%"=="n" goto contdtlk
echo CLEANING: DECTALK ***********
nmake /NOLOGO /fdevdtk43.mak CFG="devdtk43 - Win32 Release%lang_long% CLEAN
echo DONE CLEANING
:contdtlk

if "%prod_cln%"=="1" goto clean030

echo Building ( %lang_short% ) DECTALK.DLL ***********
if "%prodexe%"=="1" del ..\%bld_path%\dectalk\%lang_short%\release\dectalk.dll
nmake /NOLOGO /fdevdtk43.mak CFG="devdtk43 - Win32 Release%lang_long%
if NOT exist ..\%bld_path%\dectalk\%lang_short%\release\dectalk.dll echo Workspace %blddrv%%bldpath%\dapi\src\devdtk43.dsw for Win32 Release%lang_conf% not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

rem Tunecheck build
echo Building ( %lang_short% ) tunecheck.exe ***********
if "%prodexe%"=="1" del ..\%bld_path%\dectalk\%lang_short%\release\tunecheck.exe
cd ..\..\tools\tunecheck 
nmake /NOLOGO /ftunecheck.mak CFG="TuneCheck - Win32 Release%lang_long%
if NOT exist ..\..\dapi\%bld_path%\dectalk\%lang_short%\release\tunecheck.exe echo Workspace %blddrv%%bldpath%\tools\tunecheck\tunecheck.dsw for Win32 Release%lang_conf% not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
cd ..\..\dapi\src

echo Building Debug ( %lang_short% ) DECTALK.DLL ***********
if "%prodexe%"=="1" del ..\%bld_path%\dectalk\%lang_short%\debug\dectalk.dll
nmake /NOLOGO /fdevdtk43.mak CFG="devdtk43 - Win32 Debug%lang_long%
if NOT exist ..\%bld_path%\dectalk\%lang_short%\debug\dectalk.dll echo Workspace %blddrv%%bldpath%\dapi\src\devdtk43.dsw for Win32 Debug%lang_conf% not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

:clean030


rem mfg
if "%prod_cln%"=="1" goto clean030vb

echo Building ( %lang_short% ) DECTALKVB.DLL ***********
if "%prodexe%"=="1" del ..\%bld_path%\dectalk\%lang_short%\release\dectalkvb.dll
nmake /NOLOGO /fdectalkvb.mak CFG="dectalkvb - Win32 Release%lang_long%
if NOT exist ..\%bld_path%\dectalk\%lang_short%\release\dectalkvb.dll echo Workspace %blddrv%%bldpath%\dapi\src\dectalkvb.dsw for Win32 Release%lang_conf% not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

cd ..\..\dapi\src
:clean030vb


if "%prodmak_debug%"=="1" pause
rem
rem ***************************************************************
rem * DAPI\%bld_path%\DEMOSTAT\language\RELEASE
rem ***************************************************************
rem

rem ***************************************************************
rem * DAPI\%bld_path%\DTLKSTAT\language\RELEASE
rem * This builds the library of DAPI funtions USED in the later
rem *   build of SAPI DLL.
rem ***************************************************************

if "%doclean%"=="n" goto contdtst
echo CLEANING: DTLKSTAT ***********
nmake /NOLOGO /fdtlkstat.mak CFG="DTLKSTAT - Win32 Release%lang_long% CLEAN
echo DONE CLEANING
:contdtst

if "%prod_cln%"=="1" goto clean032
echo Building ( %lang_short% ) DTLKSTAT.LIB ***********
if "%prodexe%"=="1" del ..\%bld_path%\dtlkstat\%lang_short%\release\dtlkstat.lib
nmake /NOLOGO /fdtlkstat.mak CFG="DTLKSTAT - Win32 Release%lang_long%
if NOT exist ..\%bld_path%\dtlkstat\%lang_short%\release\dtlkstat.lib echo Workspace %blddrv%%bldpath%\dapi\src\dtlkstat.dsw for Win32 Release%lang_conf% not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

:clean032

if "%prodmak_debug%"=="1" pause
rem ***************************************************************
rem * DAPI\%bld_path%\WTLKSTAT\language\RELEASE
rem * This is the build for Willow Pond's Codes
rem * Willow Pond's version of DTLKSTAT
rem * This builds the library of DAPI funtions USED in the later
rem *   build of SAPI DLL.
rem ***************************************************************

if "%doclean%"=="n" goto contwtlk
echo CLEANING: WTLKSTAT ***********
nmake /NOLOGO /fwtlkstat.mak CFG="wtlkstat - Win32 Release%lang_long% CLEAN
echo DONE CLEANING
:contwtlk

if "%prod_cln%"=="1" goto clean033
echo Building ( %lang_short% ) WTLKSTAT.LIB ***********
if "%prodexe%"=="1" del ..\%bld_path%\wtlkstat\%lang_short%\release\wtlkstat.lib
nmake /NOLOGO /fwtlkstat.mak CFG="wtlkstat - Win32 Release%lang_long%
if NOT exist ..\%bld_path%\wtlkstat\%lang_short%\release\wtlkstat.lib echo Workspace %blddrv%%bldpath%\dapi\src\wtlkstat.dsw for Win32 Release%lang_conf% not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

:clean033

rem ****************************************************************
rem * The following is for DTDEMO and other STATIC Builds
rem ****************************************************************

if "%prodmak_debug%"=="1" pause
rem ****************************************************************
rem * DAPI\%bld_path%\DTSTATIC\language\RELEASE
rem ****************************************************************

if "%doclean%"=="n" goto contdsta
echo CLEANING: DTSTATIC (demo version) ***********
nmake /NOLOGO /fdtstatic.mak CFG="dtstatic - Win32 Release Demo%lang_long% CLEAN
echo CLEANING: DTSTATIC (Release - static) ***********
nmake /NOLOGO /fdtstatic.mak CFG="dtstatic - Win32 Release%lang_long% CLEAN
echo DONE CLEANING
:contdsta

if "%prod_cln%"=="1" goto clean034

echo Building ( %lang_short% ) DTSTATIC.LIB (demo version) ***********
if "%prodexe%"=="1" del ..\%bld_path%\dtstatic\%lang_short%\demo\dtstatic.lib
nmake /NOLOGO /fdtstatic.mak CFG="dtstatic - Win32 Release Demo%lang_long%
if NOT exist ..\%bld_path%\dtstatic\%lang_short%\demo\dtstatic.lib echo Workspace %blddrv%%bldpath%\dapi\src\dtstatic.dsw for Win32 Release Demo%lang_conf% not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

echo Building ( %lang_short% ) DTSTATIC.LIB (Release - static) ***********
if "%prodexe%"=="1" del ..\%bld_path%\dtstatic\%lang_short%\release\dtstatic.lib
nmake /NOLOGO /fdtstatic.mak CFG="dtstatic - Win32 Release%lang_long%
if NOT exist ..\%bld_path%\dtstatic\%lang_short%\release\dtstatic.lib echo Workspace %blddrv%%bldpath%\dapi\src\dtstatic.dsw for Win32 Release%lang_conf% not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

:clean034

if "%prodmak_debug%"=="1" pause
rem ****************************************************************
rem * DAPI\%bld_path%\DTDEMO\language\RELEASE
rem * Note: DTDEMO Must be build after dtstatic.lib.
rem *       DTdemo is dependent on it.
rem *       Requires dtalk_xx.dic to be in same directory as .exe.
rem ****************************************************************

if "%doclean%"=="n" goto contdtdm
echo CLEANING: DTDEMO ***********
nmake /NOLOGO /fdtdemo.mak CFG="dtdemo - Win32 Release%lang_long% CLEAN
echo DONE CLEANING
:contdtdm

if "%prod_cln%"=="1" goto clean035
echo Building ( %lang_short% ) DTDEMO.EXE ***********
if "%prodexe%"=="1" del ..\%bld_path%\dtdemo\%lang_short%\release\dtdemo.exe
nmake /NOLOGO /fdtdemo.mak CFG="dtdemo - Win32 Release%lang_long%
if NOT exist ..\%bld_path%\dtdemo\%lang_short%\release\dtdemo.exe echo Workspace %blddrv%%bldpath%\dapi\src\dtdemo.dsw for Win32 Release%lang_conf% not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

:clean035

rem ***************************************************************
rem D2Static.mak SHOULD NOT BE USED D2Static.mak SHOULD NOT BE USED
rem ***************************************************************

cd ..\..
rem ***************************************************************
rem * FROM DAPI\SRC to (%bld_path%)
rem * NOTE: this is the END of the directory usage of -- dapi\src.
rem ***************************************************************

if "%lang_short%"=="fr" goto skip_sapi3
if "%prodmak_debug%"=="1" pause
cd sapi\src

rem ***************************************************************
rem * SAPI\SRC
rem * NOTE: This is the START of the directory usage of -- sapi\src.
rem *       You need to remember this for the following builds.
rem ***************************************************************

rem ***************************************************************
rem * SAPI\%bld_path%\DTLKTTSE\language\RELEASE
rem ***************************************************************

if "%doclean%"=="n" goto contttse
echo CLEANING: DTLKTTSE ***********
nmake /NOLOGO /fttsdtlkc.mak CFG="ttsdtlk - Win32 Release%lang_long% CLEAN
echo DONE CLEANING
:contttse

if "%prod_cln%"=="1" goto clean040
echo Building ( %lang_short% ) DTLKTTSE.DLL ***********
if "%prodexe%"=="1" del ..\%bld_path%\dtlkttse\%lang_short%\release\dtlkttse.dll
nmake /NOLOGO /fttsdtlkc.mak CFG="ttsdtlk - Win32 Release%lang_long%
if NOT exist ..\%bld_path%\dtlkttse\%lang_short%\release\dtlkttse.dll echo Workspace %blddrv%%bldpath%\sapi\src\ttddtlkc.dsw for Win32 Release%lang_conf% not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

:clean040

rem ***************************************************************
rem * SAPI\%bld_path%\WTLKTTSE\language\RELEASE
rem * This is the build for Willow Pond's Codes
rem * Willow Pond's version of SAPI
rem ***************************************************************

if "%doclean%"=="n" goto contwtts
echo CLEANING: WTLKTTSE ***********
nmake /NOLOGO /fwttsdtlk.mak CFG="wttsdtlk - Win32 Release%lang_long% CLEAN
echo DONE CLEANING
:contwtts

if "%prod_cln%"=="1" goto clean042
echo Building ( %lang_short% ) WTLKTTSE.DLL ***********
if "%prodexe%"=="1" del ..\%bld_path%\wtlkttse\%lang_short%\release\wtlkttse.dll
nmake /NOLOGO /fwttsdtlk.mak CFG="wttsdtlk - Win32 Release%lang_long%
if NOT exist ..\%bld_path%\wtlkttse\%lang_short%\release\wtlkttse.dll echo Workspace %blddrv%%bldpath%\sapi\src\wttsdtlk.dsw for Win32 Release%lang_conf% not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

rem ***************************************************************
rem * FROM SAPI\SRC to (%bld_path%)
rem * NOTE: this is the END of the directory usage of -- sapi\src.
rem ***************************************************************
:clean042
cd ..\..
rem Currently no french for sapi3
:skip_sapi3

cd .\sapi5
if "%prodmak_debug%"=="1" pause
rem ***************************************************************
rem * SAPI5
rem * NOTE: This is the START of the directory usage of -- sapi5\src.
rem *       You need to remember this for the following builds.
rem ***************************************************************

rem ***************************************************************
rem * SAPI5\%bld_path%\language\RELEASE
rem ***************************************************************

if "%doclean%"=="n" goto contsapi5
echo CLEANING: SAPI5 ***********
nmake /NOLOGO /fsapi5.mak CFG="Sapi5 - Win32 Release%lang_long% CLEAN
if "%prodmak_debug%"=="1" pause
echo DONE CLEANING
:contsapi5

if "%prod_cln%"=="1" goto clean043
echo Building ( %lang_short% ) SAPI5.DLL ***********
if "%prodexe%"=="1" del ..\%bld_path%\%lang_short%\release\sapi5.dll
nmake /NOLOGO /fsapi5.mak CFG="Sapi5 - Win32 Release%lang_long%
if "%prodmak_debug%"=="1" pause
if NOT exist .\%bld_path%\%lang_short%\release\sapi5.dll echo Workspace %blddrv%%bldpath%\sapi5\sapi5.dsw for Win32 Release%lang_conf% not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

rem ***************************************************************
rem * FROM SAPI5 to (%bld_path%)
rem * NOTE: this is the END of the directory usage of -- sapi\src.
rem ***************************************************************
:clean043
cd .\..
:skip_sapi5

rem Non language specfic. Make English as default for built
if not "%lang_short%"=="us"	goto skip_dtalkml
if "%prodmak_debug%"=="1" pause
cd dtalkml\src
rem ***************************************************************
rem * DTALKML\SRC
rem * NOTE: This is the START of the directory usage of -- dtalkml\src.
rem *       You need to remember this for the following builds.
rem ***************************************************************

rem ***************************************************************
rem * DECtalk.dll
rem * This is the multi-language component
rem ***************************************************************

if "%doclean%"=="n" goto contdtml
echo CLEANING: DECTALK ***********
nmake /NOLOGO /fDTalkML.mak CFG="DTalkML - Win32 Release" CLEAN
echo DONE CLEANING
:contdtml

if "%prod_cln%"=="1" goto clean100
echo Building (ML) DECTALK.DLL ***********
if "%prodexe%"=="1" del ..\%bld_path%\release\dectalk.dll
nmake /NOLOGO /fDTalkML.mak CFG="DTalkML - Win32 Release"
if NOT exist ..\%bld_path%\release\dectalk.dll echo Workspace %blddrv%%bldpath%\dtalkml\src\dtalkml.dsw for Win32 Release not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

rem ***************************************************************
rem * FROM DTALKML\SRC to (%bld_path%)
rem * NOTE: this is the END of the directory usage of -- dtalkml\src.
rem ***************************************************************
:clean100
cd ..\..

:skip_dtalkml

rem Non language specfic. Make English as default for build
if not "%lang_short%"=="us"	goto skip_mldemo

if "%prodmak_debug%"=="1" pause
rem ***************************************************************
rem * SAMPLEML
rem * NOTE: This is the START of the directory usage of -- sampleml.
rem *       You need to remember this for the following builds.
rem * MLDemo.exe
rem * This is the multi-language speak application
rem ***************************************************************
cd .\sampleml\mldemo

if "%doclean%"=="n" goto contmldm
echo CLEANING: MultiLang DEMO ***********
nmake /NOLOGO /fMLDemo.mak CFG="MLDemo - Win32 Release" CLEAN
echo DONE CLEANING
:contmldm

if "%prod_cln%"=="1" goto clean103
echo Building ( ML ) MLDEMO.EXE ***********
if "%prodexe%"=="1" del %bld_path%\release\mldemo.exe
nmake /NOLOGO /fMLDemo.mak CFG="MLDemo - Win32 Release"
if NOT exist %bld_path%\release\mldemo.exe echo Workspace %blddrv%%bldpath%\sampleml\mldemo\mldemo.dsw for Win32 Release not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

rem ***************************************************************
rem * FROM SAMPLEML to (%bld_path%)
rem * NOTE: this is the END of the directory usage of -- sampleml.
rem ***************************************************************
:clean103
cd ..\..

:skip_mldemo

if "%prodmak_debug%"=="1" pause
cd samples
rem ***************************************************************
rem * SAMPLES
rem * NOTE: This is the START of the directory usage of -- samples.
rem *       You need to remember this for the following builds.
rem ***************************************************************


rem ***************************************************************
rem * SAMPLES\DTMEMORY\%bld_path%\language\RELEASE
rem ***************************************************************
cd dtmemory

if "%doclean%"=="n" goto contdtmm
echo CLEANING: DTMEMORY ***********
nmake /NOLOGO /fdtmemory.mak CFG="Dtmemory - Win32 Release%lang_long% CLEAN
echo DONE CLEANING
:contdtmm

if "%prod_cln%"=="1" goto clean050
echo Building ( %lang_short% ) DTMEMORY.EXE ***********
if "%prodexe%"=="1" del %bld_path%\%lang_short%\release\dtmemory.exe
nmake /NOLOGO /fdtmemory.mak CFG="Dtmemory - Win32 Release%lang_long%
if NOT exist %bld_path%\%lang_short%\release\dtmemory.exe echo Workspace %blddrv%%bldpath%\samples\dtmemory\dtmemory.dsw for Win32 Release%lang_conf% not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

:clean050
cd ..


if "%prodmak_debug%"=="1" pause
rem ***************************************************************
rem * SAMPLES\DTSAMPLE\ml\language\RELEASE
rem * SAMPLES\DTSAMPLE\%bld_path%\access32\RELEASE
rem ***************************************************************
cd dtsample
if "%prodmak_debug%"=="1" pause

if "%doclean%"=="n" goto contdtsm
echo CLEANING: DTSAMPLE ***********
nmake /NOLOGO /fdtsample.mak CFG="Dtsample - Win32 Release" CLEAN
echo CLEANING: DTACCESS (static build) ***********
nmake /NOLOGO /fdtsample.mak CFG="Dtsample - Win32 Release Access32 Static%lang_long%" CLEAN
echo DONE CLEANING
:contdtsm

if "%prod_cln%"=="1" goto clean052
echo Building ( %lang_short% ) DTSAMPLE.EXE ***********
if "%prodmak_debug%"=="1" pause

rem Make ML default for us
if not "%lang_short%"=="us" goto skip_dtsample
if "%prodexe%"=="1" del %bld_path%\ml\release\dtsample.exe
nmake /NOLOGO /fdtsample.mak CFG="Dtsample - Win32 Release"
if NOT exist %bld_path%\ml\release\dtsample.exe echo Workspace %blddrv%%bldpath%\samples\dtsample\dtsample.dsw for Win32 Release not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
if "%prodmak_debug%"=="1" pause
:skip_dtsample

echo Building ( %lang_short% ) DTACCESS.EXE (static build) ***********
if "%prodexe%"=="1" del %bld_path%\%lang_short%\a32stat\dtaccess.exe
nmake /NOLOGO /fdtsample.mak CFG="Dtsample - Win32 Release Access32 Static%lang_long%
if NOT exist %bld_path%\%lang_short%\a32stat\dtaccess.exe echo Workspace %blddrv%%bldpath%\samples\dtsample\dtsample.dsw for Win32 Release Access32 Static%lang_conf% not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
if "%prodmak_debug%"=="1" pause

:clean052
cd ..



rem ***************************************************************
rem * SAMPLES\SAY\%bld_path%\language\RELEASE
rem ***************************************************************
cd say
if "%prodmak_debug%"=="1" pause

if "%doclean%"=="n" goto contsay
echo CLEANING: SAY ***********
nmake /NOLOGO /fsay.mak CFG="say - Win32 Release%lang_long% CLEAN
echo DONE CLEANING
:contsay

if "%prod_cln%"=="1" goto clean053
echo Building ( %lang_short% ) SAY.EXE ***********
if "%prodexe%"=="1" del %bld_path%\%lang_short%\release\say.exe
nmake /NOLOGO /fsay.mak CFG="say - Win32 Release%lang_long%
if NOT exist %bld_path%\%lang_short%\release\say.exe echo Workspace %blddrv%%bldpath%\samples\say\say.dsw for Win32 Release%lang_conf% not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

:clean053

rem ***************************************************************
rem * SAMPLES\SAY\%bld_path%\language\RELEASE Non-A32 Static demo pgm
rem ***************************************************************

if "%prodmak_debug%"=="1" pause

if "%doclean%"=="n" goto contsays
echo CLEANING: SAY ***********
nmake /NOLOGO /fsay.mak CFG="say - Win32 Release Static%lang_long% CLEAN
echo DONE CLEANING
:contsays

if "%prod_cln%"=="1" goto cleans53
echo Building ( %lang_short% ) SAY.EXE Demo ***********
if "%prodexe%"=="1" del %bld_path%\%lang_short%\static\say.exe
nmake /NOLOGO /fsay.mak CFG="say - Win32 Release Static%lang_long%
if NOT exist %bld_path%\%lang_short%\static\say.exe echo Workspace %blddrv%%bldpath%\samples\say\say.dsw for Win32 Release Static%lang_conf% not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

:cleans53
cd ..

if "%prodmak_debug%"=="1" pause
rem ***************************************************************
rem * SAMPLES\SPEAK\%bld_path%\language\RELEASE
rem ***************************************************************
cd speak

if "%doclean%"=="n" goto contspk
echo CLEANING: SPEAK ***********
nmake /NOLOGO /fspeak.mak CFG="speak - Win32 Release%lang_long% CLEAN
echo DONE CLEANING
:contspk

if "%prod_cln%"=="1" goto clean054
echo Building ( %lang_short% ) SPEAK.EXE ***********
if "%prodexe%"=="1" del %bld_path%\%lang_short%\release\speak.exe
nmake /NOLOGO /fspeak.mak CFG="speak - Win32 Release%lang_long%
if NOT exist %bld_path%\%lang_short%\release\speak.exe echo Workspace %blddrv%%bldpath%\samples\speak\speak.dsw for Win32 Release%lang_conf% not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

:clean054
cd ..

rem ***************************************************************
rem * SAMPLES\TTSSRV\%bld_path%\language\RELEASE
rem ***************************************************************
cd ttssrv
if "%prodmak_debug%"=="1" pause

if "%doclean%"=="n" goto contttss
echo CLEANING: TTSSRV ***********
nmake /NOLOGO /fttssrv.mak CFG="ttssrv - Win32 Release%lang_long% CLEAN
echo DONE CLEANING
:contttss

if "%prod_cln%"=="1" goto clean055
echo Building ( %lang_short% ) TTSSRV.EXE ***********
if "%prodexe%"=="1" del %bld_path%\%lang_short%\release\ttssrv.exe
nmake /NOLOGO /fttssrv.mak CFG="ttssrv - Win32 Release%lang_long%
if NOT exist %bld_path%\%lang_short%\release\ttssrv.exe echo Workspace %blddrv%%bldpath%\samples\ttssrv\ttssrv.dsw for Win32 Release%lang_conf% not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

:clean055
cd ..

if "%lang_short%"=="fr" goto skip_ttstest
if "%prodmak_debug%"=="1" pause
rem ***************************************************************
rem * SAMPLES\TTSTEST\%bld_path%\language\RELEASE
rem ***************************************************************
cd ttstest

if "%doclean%"=="n" goto contttst
echo CLEANING: TTSTEST ***********
nmake /NOLOGO /fttstst.mak CFG="Ttstst - Win32 A2ARel%lang_long% CLEAN
echo DONE CLEANING
:contttst

if "%prod_cln%"=="1" goto clean056
echo Building ( %lang_short% ) TTSTEST.EXE ***********
if "%prodexe%"=="1" del %bld_path%\%lang_short%\release\ttstest.exe
nmake /NOLOGO /fttstst.mak CFG="Ttstst - Win32 A2ARel%lang_long%
if NOT exist %bld_path%\%lang_short%\release\ttstest.exe echo Workspace %blddrv%%bldpath%\samples\ttstest\ttstst.dsw for Win32 Release%A2ARel%%lang_conf% not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

:clean056
cd ..
rem currently doesn't support french
:skip_ttstest

if not "%lang_short%"=="us" goto skip_non_lang_specfic_2
if "%prodmak_debug%"=="1" pause
rem ***************************************************************
rem * SAMPLES\VERCHECK\%bld_path%\RELEASE
rem * This component is not Language specific
rem ***************************************************************
cd vercheck

if "%doclean%"=="n" goto contvrck
echo CLEANING: VERCHECK ***********
nmake /NOLOGO /fvercheck.mak CFG="vercheck - Win32 Release" CLEAN
echo DONE CLEANING
:contvrck

if "%prod_cln%"=="1" goto clean057
echo Building VERCHECK.EXE ***********
if "%prodexe%"=="1" del %bld_path%\release\vercheck.exe
nmake /NOLOGO /fvercheck.mak CFG="vercheck - Win32 Release"
if NOT exist %bld_path%\release\vercheck.exe echo Workspace %blddrv%%bldpath%\samples\vercheck\vercheck.dsw for Win32 Release not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

:clean057
cd ..
rem for non language specfic using us as default
:skip_non_lang_specfic_2


if "%prodmak_debug%"=="1" pause
rem ***************************************************************
rem * SAMPLES\WINDIC\%bld_path%\language\RELEASE
rem ***************************************************************
cd windic

if "%doclean%"=="n" goto contwind
echo CLEANING: WINDIC ***********
nmake /NOLOGO /fwindic.mak CFG="windic - Win32 Release CLEAN
echo CLEANING: WINDIC (static build) ***********
nmake /NOLOGO /fwindic.mak CFG="windic - Win32 Release Static%lang_long% CLEAN
echo DONE CLEANING
:contwind

if "%prod_cln%"=="1" goto clean058

rem Muli language revision but making us as default
if not "%lang_short%"=="us" goto skip_windic_ml

echo Building ( %lang_short% ) WINDIC.EXE ***********
if "%prodexe%"=="1" del %bld_path%\ml\release\windic.exe
nmake /NOLOGO /fwindic.mak CFG="windic - Win32 Release"
if NOT exist %bld_path%\ml\release\windic.exe echo Workspace %blddrv%%bldpath%\samples\windic\windic.dsw for Win32 Release not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
:skip_windic_ml

echo Building ( %lang_short% ) WINDIC.EXE (static build) ***********
if "%prodexe%"=="1" del %bld_path%\%lang_short%\wdicstat\windic.exe
nmake /NOLOGO /fwindic.mak CFG="windic - Win32 Release Static%lang_long%
if NOT exist %bld_path%\%lang_short%\wdicstat\windic.exe echo Workspace %blddrv%%bldpath%\samples\windic\windic.dsw for Win32 Release Static%lang_conf% not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

:clean058
cd ..

if "%lang_short%"=="fr" goto skip_wttstest
if "%prodmak_debug%"=="1" pause
cd wttstest

rem ***************************************************************
rem * SAMPLES\WTTSTEST\%bld_path%\language\RELEASE
rem * This is the build for Willow Pond's Codes
rem * Willow Pond's version of TTSTEST
rem ***************************************************************

if "%doclean%"=="n" goto contwtst
echo CLEANING: WTTSTEST ***********
nmake /NOLOGO /fwttstest.mak CFG="Wttstst - Win32 A2WRel%lang_long% CLEAN
echo DONE CLEANING
:contwtst

if "%prod_cln%"=="1" goto clean059
echo Building ( %lang_short% ) WTTSTEST.EXE ***********
if "%prodexe%"=="1" del %bld_path%\%lang_short%\release\wttstest.exe
nmake /NOLOGO /fwttstest.mak CFG="Wttstst - Win32 A2ARel%lang_long%
if NOT exist %bld_path%\%lang_short%\release\wttstest.exe echo Workspace %blddrv%%bldpath%\samples\wttstest\wttstest.dsw for Win32 Release%A2ARel%%lang_conf% not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

rem ***************************************************************
rem * FROM SAMPLES to (%bld_path%)
rem * NOTE: this is the END of the directory usage of -- samples.
rem ***************************************************************
:clean059
cd ..

rem sapi3 currently doesn't have French
:skip_wttstest
cd ..

if NOT "%lang_short%"=="us" goto skip_license
if "%prodmak_debug%"=="1" pause
cd license
rem ***************************************************************
rem * LICENSE
rem * NOTE: This is the START of the directory usage of -- license.
rem *       You need to remember this for the following builds.
rem ***************************************************************

rem ***************************************************************
rem * LICENSE\LICENSEU\%bld_path%\RELEASE
rem * LICENSE\LICENSEU\W%bld_path%\RELEASE
rem * This component is not Language specific
rem ***************************************************************
cd licenseu

if "%doclean%"=="n" goto contlicu
echo CLEANING: LICENSEU ***********
nmake /NOLOGO /flicenseu.mak CFG="LicenseU - Win32 Release" CLEAN
echo CLEANING: LICENSEU (willow pond) ***********
nmake /NOLOGO /flicenseu.mak CFG="LicenseU - Win32 WP Release" CLEAN
echo DONE CLEANING
:contlicu

if "%prod_cln%"=="1" goto clean070
echo Building LICENSEU.EXE ***********
if "%prodexe%"=="1" del %bld_path%\release\licenseu.exe
nmake /NOLOGO /flicenseu.mak CFG="LicenseU - Win32 Release"
if NOT exist %bld_path%\release\licenseu.exe echo Workspace %blddrv%%bldpath%\license\licenseu\licenseu.dsw for Win32 Release not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

echo Building LICENSEU.EXE (willow pond) ***********
if "%prodexe%"=="1" del w%bld_path%\release\licenseu.exe
nmake /NOLOGO /flicenseu.mak CFG="LicenseU - Win32 WP Release"
if NOT exist w%bld_path%\release\licenseu.exe echo Workspace %blddrv%%bldpath%\license\licenseu\licenseu.dsw for Win32 WP Release not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

:clean070
cd ..


if "%prodmak_debug%"=="1" pause
cd liceninc

rem ***************************************************************
rem * LICENSE\LICENINC
rem * NOTE: This is the START of the directory usage of -- license\liceninc.
rem *       You need to remember this for the following builds.
rem ***************************************************************

rem ***************************************************************
rem * LICENSE\LICENSEC\%bld_path%\LICENIN1\RELEASE
rem * LICENSE\LICENSEC\W%bld_path%\LICENIN1\RELEASE
rem * This component is not Language specific
rem ***************************************************************

if "%doclean%"=="n" goto contlic1
echo CLEANING: LICENIN1 ***********
nmake /NOLOGO /flicenin1.mak CFG="licenin1 - Win32 Release" CLEAN
echo CLEANING: LICENIN1 (willowpond) ***********
nmake /NOLOGO /flicenin1.mak CFG="licenin1 - Win32 WP Release" CLEAN
echo DONE CLEANING
:contlic1

if "%prod_cln%"=="1" goto clean071
echo Building LICENINC1.EXE ***********
if "%prodexe%"=="1" del %bld_path%\licenin1\release\licenin1.exe
nmake /NOLOGO /flicenin1.mak CFG="licenin1 - Win32 Release"
if NOT exist %bld_path%\licenin1\release\licenin1.exe echo Workspace %blddrv%%bldpath%\license\liceninc\licenin1.dsw for Win32 Release not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

echo Building LICENINC1.EXE (willow pond) ***********
if "%prodexe%"=="1" del w%bld_path%\licenin1\release\licenin1.exe
nmake /NOLOGO /flicenin1.mak CFG="licenin1 - Win32 WP Release"
if NOT exist w%bld_path%\licenin1\release\licenin1.exe echo Workspace %blddrv%%bldpath%\license\liceninc\licenin1.dsw for Win32 WP Release not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

:clean071

if "%prodmak_debug%"=="1" pause 
rem ***************************************************************
rem * LICENSE\LICENSEC\%bld_path%\LICENIN3\RELEASE
rem * LICENSE\LICENSEC\W%bld_path%\LICENIN3\RELEASE
rem * This component is not Language specific
rem ***************************************************************

if "%doclean%"=="n" goto contlic3
echo CLEANING: LICENIN3 ***********
nmake /NOLOGO /flicenin3.mak CFG="licenin3 - Win32 Release" CLEAN
echo CLEANING: LICENIN3 (willowpond) ***********
nmake /NOLOGO /flicenin3.mak CFG="licenin3 - Win32 WP Release" CLEAN
echo DONE CLEANING
:contlic3

if "%prod_cln%"=="1" goto clean072
echo Building LICENINC3.EXE ***********
if "%prodexe%"=="1" del %bld_path%\licenin3\release\licenin3.exe
nmake /NOLOGO /flicenin3.mak CFG="licenin3 - Win32 Release"
if NOT exist %bld_path%\licenin3\release\licenin3.exe echo Workspace %blddrv%%bldpath%\license\liceninc\licenin3.dsw for Win32 Release not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

echo Building LICENINC3.EXE (willow pond) ***********
if "%prodexe%"=="1" del w%bld_path%\licenin3\release\licenin3.exe
nmake /NOLOGO /flicenin3.mak CFG="licenin3 - Win32 WP Release"
if NOT exist w%bld_path%\licenin3\release\licenin3.exe echo Workspace %blddrv%%bldpath%\license\liceninc\licenin3.dsw for Win32 WP Release not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

:clean072

if "%prodmak_debug%"=="1" pause
rem ***************************************************************
rem * LICENSE\LICENSEC\%bld_path%\LICENIN7\RELEASE
rem * LICENSE\LICENSEC\W%bld_path%\LICENIN7\RELEASE
rem * This component is not Language specific
rem ***************************************************************

if "%doclean%"=="n" goto contlic7
echo CLEANING: LICENIN7 ***********
nmake /NOLOGO /flicenin7.mak CFG="licenin7 - Win32 Release" CLEAN
echo CLEANING: LICENIN7 (willow pond) ***********
nmake /NOLOGO /flicenin7.mak CFG="licenin7 - Win32 WP Release" CLEAN
echo DONE CLEANING
:contlic7

if "%prod_cln%"=="1" goto clean073
echo Building LICENINC7.EXE ***********
if "%prodexe%"=="1" del %bld_path%\licenin7\release\licenin7.exe
nmake /NOLOGO /flicenin7.mak CFG="licenin7 - Win32 Release"
if NOT exist %bld_path%\licenin7\release\licenin7.exe echo Workspace %blddrv%%bldpath%\license\liceninc\licenin7.dsw for Win32 Release not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

echo Building LICENINC7.EXE (willow pond) ***********
if "%prodexe%"=="1" del w%bld_path%\licenin7\release\licenin7.exe
nmake /NOLOGO /flicenin7.mak CFG="licenin7 - Win32 WP Release"
if NOT exist w%bld_path%\licenin7\release\licenin7.exe echo Workspace %blddrv%%bldpath%\license\liceninc\licenin7.dsw for Win32 WP Release not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

rem ***************************************************************
rem * FROM LICENSE\LICENSEC to .\%bldpath%
rem * NOTE: this is the END of the directory usage of -- license
rem ***************************************************************
:clean073
cd ..\..
rem Only need to build once used English as default
:skip_license

if "%prodmak_debug%"=="1" pause
rem ***************************************************************
rem * DIC\%bld_path%\DTALKDIC\language\RELEASE
rem ***************************************************************
cd dapi\src

if "%doclean%"=="n" goto contdic
echo CLEANING: DIC.EXE ***********
nmake /NOLOGO /fdic.mak CFG="dic - Win32 Release%lang_long% CLEAN
echo DONE CLEANING
:contdic

if "%prod_cln%"=="1" goto clean080
echo Building ( %lang_short% ) DIC.EXE ***********
if "%prodexe%"=="1" del ..\%bld_path%\dtalkdic\%lang_short%\release\dic.exe
nmake /NOLOGO /fdic.mak CFG="dic - Win32 Release%lang_long%
if NOT exist ..\%bld_path%\dtalkdic\%lang_short%\release\dic.exe echo Workspace %blddrv%%bldpath%\dapi\src\dic.dsw for Win32 Release%lang_conf% not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

:clean080

if "%prodmak_debug%"=="1" pause
rem ***************************************************************
rem * COMPILING DECTALK.DIC
rem * DIC\%bld_path%\DTALKDIC\language\RELEASE\dectalk.dic   -- 32-BITS
rem ***************************************************************
if "%prod_cln%"=="1" goto clean081

cd ..\%bld_path%\DTALKDIC\%lang_short%\release

copy ..\..\..\..\src\dic\dic_%lang_short%.txt	dic_%lang_short%.txt

echo Building ( %lang_short% ) DECTALK.DIC (WIN32 : 32-BITS) ***********
if "%prodexe%"=="1" del dectalk.dic
dic.exe dic_%lang_short%.txt dtalk_%lang_short%.dic /t:win32
if NOT exist dtalk_%lang_short%.dic echo File %blddrv%%bldpath%\dapi\build\dectalk\%lang_short%\release\dtalk_%lang_short%.dic not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

if "%dtlang%"=="ENGLISH_US" dic.exe dic_%lang_short%.txt dtalk_%lang_short%m.dic /p:500 /t:win32
if "%dtlang%"=="ENGLISH_US"	if NOT exist dtalk_%lang_short%m.dic echo File %blddrv%%bldpath%\dapi\build\dectalk\%lang_short%\release\dtalk_%lang_short%m.dic not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
if "%dtlang%"=="ENGLISH_US" dic.exe dic_%lang_short%.txt dtalk_%lang_short%s.dic /p:300 /t:win32
if "%dtlang%"=="ENGLISH_US"	if NOT exist dtalk_%lang_short%s.dic echo File %blddrv%%bldpath%\dapi\build\dectalk\%lang_short%\release\dtalk_%lang_short%s.dic not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

if "%dtlang%"=="ENGLISH_UK" dic.exe dic_%lang_short%.txt dtalk_%lang_short%s.dic /p:700 /t:win32
if "%dtlang%"=="ENGLISH_UK" if NOT exist dtalk_%lang_short%s.dic echo File %blddrv%%bldpath%\dapi\build\dectalk\%lang_short%\release\dtalk_%lang_short%s.dic not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
rem if "%dtlang%"=="ENGLISH_UK" dic.exe dic_%lang_short%.txt dtalk_%lang_short%s.dic /p:600 /t:win32

if "%dtlang%"=="GERMAN" dic.exe dic_%lang_short%.txt dtalk_%lang_short%s.dic /p:500 /t:win32
if "%dtlang%"=="GERMAN" if NOT exist dtalk_%lang_short%s.dic echo File %blddrv%%bldpath%\dapi\build\dectalk\%lang_short%\release\dtalk_%lang_short%s.dic not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
rem if "%dtlang%"=="GERMAN" dic.exe dic_%lang_short%.txt dtalk_%lang_short%s.dic /p:350 /t:win32
echo DONE
cd ..\..\..\..\..

goto tool_next

:clean081
echo CLEANING: Compiled DIC files ***********
del /s/q ..\%bld_path%\DTALKDIC\%lang_short%\*
echo DONE CLEANING
goto end

:tool_next

rem ***************************************************************
rem * Test for the existance of (%tool_path%)
rem * NOTE: this is the START of the directory usage of work\tools.
rem ***************************************************************

if NOT exist %tool_path%\dttest\dttest32.mak echo WARNING: File %blddrv%%tool_path%\dttest\dttest32.mak missing.
if NOT exist %tool_path%\dttest\dttest32.mak goto dtbypass
echo INFORMATION: File %blddrv%%tool_path%\dttest\dttest32.mak exists.

cd %tool_path%
rem ***************************************************************
rem * FROM (%bld_path%) to (%tool_path%)
rem ***************************************************************

cd dttest
cd
rem ***************************************************************
rem * FROM (%tool_path%) to (%tool_path%\dttest)
rem * NOTE: getting ready to build dttest32.
rem * WARNING: (%bldpath%) is the selected root directory of the build.
rem *          (%bld_path%) is the subdirectory for the obj\exe files.
rem ***************************************************************

echo Building DTTEST32.EXE ***********
if "%prodexe%"=="1" del %tool_path%\dttest\dttest32.exe
nmake /NOLOGO /fdttest32.mak CFG="dttest32 - Win32 Release" .\dttest32.exe
rem if NOT exist %tool_path%\dttest\dttest32.exe cd %bldpath%
if NOT exist %tool_path%\dttest\dttest32.exe echo Workspace %blddrv%%tool_path%\dttest.dsw for Win32 Release not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

if "%prodmak_debug%"=="1" pause
cd ..

:dtbypass
if "%prodmak_debug%"=="1" pause

rem ***************************************************************
rem * FROM (%tool_path%)\dttest to .%bldpath%
rem * NOTE: this is the END of the directory usage of -- %tool_path%.
rem ***************************************************************
cd %bldpath%

REM DONE!!!
goto end

:bug_setvar
echo setvar not run
goto exit

:bug_end
echo Error in BUILD Process: PRODMAK.BAT ************
goto exit

:end
echo ***** BUILD Process: PRODMAK.BAT COMPLETED SUCCESSFULLY *****

:exit
