echo off
set kitcopy_debug=0
rem ******************
rem File Name:   kitcopy.bat
rem Written By:  Tom Kopec
rem modified On: 29-OCT-1996
rem modified By: Carl Leeber
rem ******************
rem 10-OCT-1996 cjl     Add multiple drive bld environemnt capability. 
rem 15-Nov-1996 sik     Updating for 4.4 operation
rem 18-Nov-1996 cjl     Add debug infomration for installshield. 
rem 22-Nov-1996 cjl     Add VerCheck to kit.
rem 27-Nov-1996 cjl     Add Ttstest to kit.
rem 02-Dec-1996 cjl     Add Error detection for Command file.
rem 03-DEC-1996 cjl     Use us\ subdirectory.
rem 07-JAN-1997 cjl     Add dectalk.lib to \lib for installs.
rem 15-JAN-1997 tql     Add multi-language support and option to do pre-clean
rem 15-JAN-1997 ncs     Add support for SETVAR environment.
rem 22-JAN-1997 ncs     Updating kit building for new directory structure.
rem 05-FEB-1997 ncs     Added Latin American support.
rem 12-FEB-1997 ncs     Fixed up to install cpanel
rem 26-FEB-1997 ncs     Fixed for the new and improved directory structure.
rem 25-MAR-1997 ncs     Removed tools directory manipulation commands.
rem 27-MAR-1997 ncs     Changed contents of diskX.id to reflect actual disk id.
rem 27-MAR-1997 ncs     Added in Willow Pond Kit build.
rem 07-APR-1997 cjl     Add TTSAPI.H & TTS.H to \include for installs.
rem                     BATS #342
rem                     Add Appendix1 & Appendix2.txt to installs. BATS #338
rem 09-APR-1997 cjl     Now take out TTS.H as an included SDK file.
rem 13-APR-1997 ncs     Adding in alpha support.
rem 20-MAY-1997 cjl     Fix Samples Support...
rem 19-JUN-1997 ncs     Added in Access32 support.
rem 01-AUG-1997 ncs     Changed for the streamlined setup.rul scripts.
rem                     (USED the as_is directories.)
rem 08-AUG-1997 ncs     Fixed copy command for Access32.
rem 18-AUG-1997 cjl     Added Appendix3.txt to installs. Added DELTREE /Y.
rem 20-AUG-1997 ncs     Added in the correct way to implement DELTREE and DEL.
rem                     Also, stored all of the static builds in one directory.
rem 05-SEP-1997 ksb     Stripped ML back out of code (carl says we *temporarily* disabled
rem                     the code...
rem 24-SEP-1997 cjl/dg  Add Access32 code, dynamic. (Tom's changes).
rem 01-OCT-1997 cjl     Add D2static.lib copy. static windic.exe still needed.
rem 02-OCT-1997 cjl     Remove D2static.lib copy. Static windic.exe is built.
rem 22-OCT-1997 cjl     Add Appendix3.txt to the sdk disk1.
rem 23-OCT-1997 ncs     Fix ML installs.
rem 31-OCT-1997 ncs     Added in UK support.
rem 04-DEC-1997 cjl     Add "kits" for SMIT/ACCESS32.
rem 17-DEC-1997 cjl     Add "kits" for SMIT/ACCESS32 Artic Technology smit.
rem 23-DEC-1997 cjl     Add "kits" for SMIT/ACCESS32 Applied Human Factors smit.
rem 01-Jan-1998 MGS     Changed dtsample and windic to multilanguage
rem 03-feb-1998 cjl     Add ttsfeat.h to all it builds.
rem 03-feb-1998 ksb     Add quotes to if tests, clean up.
rem 11-feb-1998 cjl     Change Help file name to dectalk.hlp.
rem 17-feb-1998 cjl     Add disk3 for Intel builds.
rem 17-feb-1998 cjl     Change disk1 sizes for InstallShield Splits.
rem 18-feb-1998 cjl     Add MicroTalk to SMIT list.
rem 11-feb-1998 CJL     Add Kurzweil, Consultants for Communication Technolgy,
rem                       Innocomp & JBliss to SMIT list.
rem 18-mar-1998 CJL	Add SAPI MULTI_LANGUAGE switch to setup.rul compile.
rem 22-may-1998 CJL     Add Appendix4.txt to the sdk disk1.
rem 26-aug-1998 CJL     Add Non-A32 Static kitting PKGs.
rem 04-sep-1998 CJL     Add disk4 for German Alpha NT Build.
rem 09-nov-1998 CJL     Add disk4 and disk5 for CE Build.
rem 16-apr-1999 mfg 	added Windows CE support for versions 2.00 2.11 for visual C++ 6.0
rem 10-feb-1999 CJL     Add SMITPR for Prentke-Romich.
rem 21-apr-1999 CJL     Add SMITAR for Arkenstone.
rem 02-sep-1999 MGS	Changed to smart.bmp
rem 06-dec-1999 mfg		added SMTEN for enkidu
rem 21-dec-1999 mfg	merged in Windows CE build so alll 32 bit kits made from the same build script
rem 17-feb-2000 mfg	added email reader sample for windows ce
rem 15-mar-2000 mfg	added disk4 for US and UK, added disk6 for GR inWindowsCE 
rem 15-mar-2000 mfg	added Multlang for 211 mips,sh,sh4 inWindowsCE 
rem 19-apr-2000 cab	Added windic for windows ce 211
rem 19-may-2000 mfg	added SMITNS for Neil Squire Foundation
rem 10-aug-2000 cab	removed extra lang folder from windic
rem 15-aug-2000 cab     changed smart bmp to force logo
rem 29-aug-2000 cab	Added if to Copy only us x86em access32 
rem ******************
rem
set dtlkid=%2
set dtlang=%3
set dtclean=%4
set cln_only=%5

if "%kitcopy_debug%"=="1" pause

if "%setvardone%"=="1" echo File setvar.bat has already been executed.
if "%setvardone%"=="1" goto checkit

if NOT "%setvar%"=="" goto goodtogo
:nogood
echo WARNING: Setvar not defined.
echo WARNING: Using default InstallShield drive letter.
set is3drv=c:
echo WARNING: Using default InstallShield path.
set is3path=\progra~1\instal~1\is3int~1
goto checkit

:goodtogo
if  NOT EXIST %setvar% echo WARNING: Path %setvar% is not defined.
if  NOT EXIST %setvar% goto nogood
call %setvar%

:checkit

rem SETTING UP FOR i386 MACHINE
if "%bld_mach%"=="i386" set bld_path=build
if "%bld_mach%"=="i386" set wpbld_path=wbuild
rem note platform is equal to a space
if "%bld_mach%"=="i386" set platform= 
if "%bld_mach%"=="i386" set arch_dir=swi95nt
if "%bld_mach%"=="i386" set msdir=i386


rem SETTING UP FOR ALPHA MACHINE
if "%bld_mach%"=="ALPHA" set bld_path=alpha
if "%bld_mach%"=="ALPHA" set wpbld_path=walpha
rem note: there is a space after ALPHA
if "%bld_mach%"=="ALPHA" set platform= ALPHA 
if "%bld_mach%"=="ALPHA" set arch_dir=sw_a_nt
if "%bld_mach%"=="ALPHA" set msdir=alpha

rem default: in case something goes wrong
if "%bld_mach%"=="" echo BLD_MACH is undefined, defaulting to i386 machine
if "%bld_mach%"=="" set bld_path=build
if "%bld_mach%"=="" set wpbld_path=wpond
if "%bld_mach%"=="" set platform= 
if "%bld_mach%"=="" set arch_dir=swi95nt


rem check for arguments
if "%1"=="" goto noargs
if "%dtlkid%"=="" goto defarg
if "%dtlkid%"=="""" goto defarg
if "%dtlang%"=="" goto deflang
if "%dtlang%"=="""" goto deflang
if "%dtclean%"=="" goto defclean
if "%dtclean%"=="""" goto defclean
goto cont1

:defarg
echo WARNING: using default identifier string!
set dtlkid=%VERSIONSFULLNAME%
goto checkit
:deflang
echo WARNING: using default language (ENGLISH_US)
set dtlang=ENGLISH_US
goto checkit
:defclean
echo WARNING: using default cleanup option (Y)
set dtclean=Y
goto checkit

:cont1
echo Building DECtalk Software %1 (%dtlkid%)
if "%kitcopy_debug%"=="1" pause

rem ***************************************************************
rem     Support build of multi-language kit building from a
rem     choice of several.
rem     Currently supporting:
rem             ENGLISH_US, GERMAN, SPANISH, SPANISH_LA (Latin American),
rem             ENGLISH_UK
rem
if "%dtlang%"=="ML" set langdir=ml
if "%dtlang%"=="ML" set syslangdir="MultLang"
if "%dtlang%"=="ML" goto dtlangok
if "%dtlang%"=="ENGLISH_US" set langdir=us
if "%dtlang%"=="ENGLISH_US" goto dtlangok
if "%dtlang%"=="GERMAN" set langdir=gr
if "%dtlang%"=="GERMAN" goto dtlangok
if "%dtlang%"=="SPANISH" set  langdir=sp
if "%dtlang%"=="SPANISH" goto dtlangok
if "%dtlang%"=="SPANISH_LA" set  langdir=la
if "%dtlang%"=="SPANISH_LA" goto dtlangok
if "%dtlang%"=="ENGLISH_UK" set  langdir=uk
if "%dtlang%"=="ENGLISH_UK" goto dtlangok
rem Error
echo Language parameter (%dtlang%) not recognized.
goto noargs

:dtlangok
echo Defined variables:
echo .
echo VERSION  = %1%
echo DTALK ID = %dtlkid%
echo Language = %dtlang%
echo CLEAN    = %doclean%
echo PLATFORM = "%platform%"
echo ARCH_DIR = %arch_dir%
echo MSDIR    = %msdir%
echo ISHIELD3 = %is3drv%%is3path%
echo .

if "%kitcopy_debug%"=="1" pause
rem ****************************************************************
rem     Supports the use of y, Y, n, or N.
if "%dtclean%" == "n" goto noclean
if "%dtclean%" == "N" goto noclean
if "%dtclean%" == "y" goto cleanok
if "%dtclean%" == "Y" goto cleanok
echo Cleanup parameter (%dtclean%) not recognized.
goto noargs

:cleanok
if "%kitcopy_debug%"=="1" pause
echo Cleaning out the old crud.

if "%OS%"=="Windows_NT" goto clnnt
rem ce must build under Windows nt
if "%ce_bld%"=="mips" goto error_end
deltree /y ..\%arch_dir%\%langdir%\install
goto clndone
:clnnt
del /s/q ..\%arch_dir%\%langdir%\install
:clndone
echo Done cleaning.

if "%cln_only%"=="1" goto exit

:noclean
rem ***************************************************************
rem ML STUFF IS AT THE BOTTOM
if "%langdir%" == "ml" goto ml_kits
rem ***************************************************************

rem make up the directory tree..
echo ***************************************************************
echo Make up the directory trees
echo ***************************************************************

md ..\%arch_dir%
md ..\%arch_dir%\%langdir%
md ..\%arch_dir%\%langdir%\install
md ..\%arch_dir%\%langdir%\static
md ..\%arch_dir%\%langdir%\staticS

md ..\%arch_dir%\%langdir%\staticSce
md ..\%arch_dir%\%langdir%\staticSce\Wce200
md ..\%arch_dir%\%langdir%\staticSce\Wce200\mips
md ..\%arch_dir%\%langdir%\staticSce\Wce200\sh
md ..\%arch_dir%\%langdir%\staticSce\Wce200\x86em
md ..\%arch_dir%\%langdir%\staticSce\Wce211
md ..\%arch_dir%\%langdir%\staticSce\Wce211\mips
md ..\%arch_dir%\%langdir%\staticSce\Wce211\sh
md ..\%arch_dir%\%langdir%\staticSce\Wce211\sh4
md ..\%arch_dir%\%langdir%\staticSce\Wce211\arm
md ..\%arch_dir%\%langdir%\staticSce\Wce211\x86em


md ..\%arch_dir%\lock_mgr
md ..\%arch_dir%\lock_mgr\standard
md ..\%arch_dir%\lock_mgr\wpond
if "%kitcopy_debug%"=="1" pause

rem -- data directories
md ..\%arch_dir%\%langdir%\install\data
md ..\%arch_dir%\%langdir%\install\data\as_is
md ..\%arch_dir%\%langdir%\install\wdata
md ..\%arch_dir%\%langdir%\install\wdata\as_is
md ..\%arch_dir%\%langdir%\install\cedata
md ..\%arch_dir%\%langdir%\install\cedata\as_is
if "%kitcopy_debug%"=="1" pause

rem -- data sub-directories
md ..\%arch_dir%\%langdir%\install\data\as_is\patch
md ..\%arch_dir%\%langdir%\install\wdata\as_is\patch
md ..\%arch_dir%\%langdir%\install\data\as_is\samples
md ..\%arch_dir%\%langdir%\install\data\as_is\samples\dtmemory
md ..\%arch_dir%\%langdir%\install\data\as_is\samples\dtsample
md ..\%arch_dir%\%langdir%\install\data\as_is\samples\say
md ..\%arch_dir%\%langdir%\install\data\as_is\samples\ttstest
md ..\%arch_dir%\%langdir%\install\data\as_is\samples\vercheck
md ..\%arch_dir%\%langdir%\install\data\as_is\samples\windic
md ..\%arch_dir%\%langdir%\install\data\program
md ..\%arch_dir%\%langdir%\install\wdata\program
md ..\%arch_dir%\%langdir%\install\cedata\program
md ..\%arch_dir%\%langdir%\install\data\sprogram
md ..\%arch_dir%\%langdir%\install\wdata\sprogram
md ..\%arch_dir%\%langdir%\install\cedata\sprogram
md ..\%arch_dir%\%langdir%\install\data\as_is\help
md ..\%arch_dir%\%langdir%\install\cedata\as_is\help
md ..\%arch_dir%\%langdir%\install\data\speech
md ..\%arch_dir%\%langdir%\install\wdata\speech
md ..\%arch_dir%\%langdir%\install\data\as_is\include
md ..\%arch_dir%\%langdir%\install\wdata\as_is\include
md ..\%arch_dir%\%langdir%\install\cedata\as_is\include
md ..\%arch_dir%\%langdir%\install\data\as_is\%langdir%



if "%kitcopy_debug%"=="1" pause
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%langdir%
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%langdir%\mips
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%langdir%\sh
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%langdir%\x86em
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample\bin
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample\bin\mips\%langdir%
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample\bin\sh\%langdir%
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample\bin\x86em\%langdir%
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\cetalk
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\cetalk\res
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\cetalk\bin
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\cetalk\bin\mips\%langdir%
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\cetalk\bin\sh\%langdir%
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\cetalk\bin\x86em\%langdir%
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\mailread
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\mailread\res
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\mailread\bin
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\mailread\bin\mips\%langdir%
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\mailread\bin\sh\%langdir%
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\mailread\bin\x86em\%langdir%


if "%kitcopy_debug%"=="1" pause
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\%langdir%
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\%langdir%\mips
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\%langdir%\sh
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\%langdir%\sh4
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\%langdir%\arm
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\%langdir%\x86em
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\dtsample
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\dtsample\bin
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\dtsample\bin\mips\%langdir%
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\dtsample\bin\sh\%langdir%
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\dtsample\bin\sh4\%langdir%
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\dtsample\bin\arm\%langdir%
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\dtsample\bin\x86em\%langdir%
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\cetalk
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\cetalk\res
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\cetalk\bin
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\cetalk\bin\mips\%langdir%
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\cetalk\bin\sh\%langdir%
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\cetalk\bin\sh4\%langdir%
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\cetalk\bin\arm\%langdir%
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\cetalk\bin\x86em\%langdir%
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\mailread
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\mailread\res
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\mailread\bin
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\mailread\bin\mips\%langdir%
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\mailread\bin\sh\%langdir%
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\mailread\bin\sh4\%langdir%
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\mailread\bin\arm\%langdir%
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\mailread\bin\x86em\%langdir%
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\windic\bin
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\windic\bin\mips\%langdir%
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\windic\bin\sh\%langdir%
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\windic\bin\sh4\%langdir%
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\windic\bin\arm\%langdir%
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\windic\bin\x86em\%langdir%


rem -- setup directories
md ..\%arch_dir%\%langdir%\install\instdec
md ..\%arch_dir%\%langdir%\install\idisk
md ..\%arch_dir%\%langdir%\install\setup
md ..\%arch_dir%\%langdir%\install\wsetup
md ..\%arch_dir%\%langdir%\install\cesetup
if "%kitcopy_debug%"=="1" pause

rem -- kit directories
md ..\%arch_dir%\%langdir%\install\disk1
md ..\%arch_dir%\%langdir%\install\disk2
md ..\%arch_dir%\%langdir%\install\disk3

md ..\%arch_dir%\%langdir%\install\cedisk1
md ..\%arch_dir%\%langdir%\install\cedisk2
md ..\%arch_dir%\%langdir%\install\cedisk3

if "%dtlang%"=="ENGLISH_UK" md ..\%arch_dir%\%langdir%\install\cedisk4
if "%dtlang%"=="ENGLISH_US" md ..\%arch_dir%\%langdir%\install\cedisk4
if "%dtlang%"=="GERMAN" md ..\%arch_dir%\%langdir%\install\cedisk4

if "%dtlang%"=="GERMAN" md ..\%arch_dir%\%langdir%\install\cedisk5
if "%dtlang%"=="GERMAN" md ..\%arch_dir%\%langdir%\install\cedisk6



if NOT "%bld_mach%"=="ALPHA" goto alpbypa1
if "%dtlang%"=="GERMAN" md ..\%arch_dir%\%langdir%\install\disk4
:alpbypa1

md ..\%arch_dir%\%langdir%\install\wdisk1
md ..\%arch_dir%\%langdir%\install\wdisk2
rem if not "%bld_mach%"=="ALPHA" goto dirdone
rem md ..\%arch_dir%\%langdir%\install\wdisk2
rem :dirdone

rem copy all the required files to the install build area

if "%kitcopy_debug%"=="1" pause
rem *****************************************************
rem arch_dir\language\INSTALL\DATA\SAMPLES\DTMEMORY
rem *****************************************************

echo ***************************************************************
echo arch_dir\language\INSTALL\DATA\SAMPLES\DTMEMORY
echo ***************************************************************

rem give source codes and exes for V4.4 and above per meeting 5/13/97 ckl
copy ..\samples\dtmemory\*.h ..\%arch_dir%\%langdir%\install\data\as_is\samples\dtmemory
copy ..\samples\dtmemory\*.c ..\%arch_dir%\%langdir%\install\data\as_is\samples\dtmemory
copy ..\samples\dtmemory\*.ico ..\%arch_dir%\%langdir%\install\data\as_is\samples\dtmemory
copy ..\samples\dtmemory\*.rc ..\%arch_dir%\%langdir%\install\data\as_is\samples\dtmemory
copy ..\samples\dtmemory\%bld_path%\%langdir%\release\link\*.res ..\%arch_dir%\%langdir%\install\data\as_is\samples\dtmemory
copy ..\samples\dtmemory\%bld_path%\%langdir%\release\*.exe ..\%arch_dir%\%langdir%\install\data\as_is\samples\dtmemory
copy ..\samples\dtmemory\udtmemor.mak ..\%arch_dir%\%langdir%\install\data\as_is\samples\dtmemory
if not errorlevel 0 goto error_end


if "%kitcopy_debug%"=="1" pause
rem *****************************************************
rem arch_dir\language\INSTALL\DATA\SAMPLES\DTSAMPLE
rem *****************************************************

echo ***************************************************************
echo arch_dir\language\INSTALL\DATA\SAMPLES\DTSAMPLE
echo ***************************************************************

rem give source codes and exes for V4.4 and above per meeting 5/13/97 ckl
copy ..\samples\dtsample\*.h ..\%arch_dir%\%langdir%\install\data\as_is\samples\dtsample
copy ..\samples\dtsample\*.c ..\%arch_dir%\%langdir%\install\data\as_is\samples\dtsample
copy ..\samples\dtsample\*.ico ..\%arch_dir%\%langdir%\install\data\as_is\samples\dtsample
copy ..\samples\dtsample\*.rc ..\%arch_dir%\%langdir%\install\data\as_is\samples\dtsample
copy ..\samples\dtsample\*.txt ..\%arch_dir%\%langdir%\install\data\as_is\samples\dtsample
copy ..\samples\dtsample\%bld_path%\ml\release\link\*.res ..\%arch_dir%\%langdir%\install\data\as_is\samples\dtsample
copy ..\samples\dtsample\%bld_path%\ml\release\*.exe ..\%arch_dir%\%langdir%\install\data\as_is\samples\dtsample
copy ..\samples\dtsample\udtsampl.mak ..\%arch_dir%\%langdir%\install\data\as_is\samples\dtsample
if not errorlevel 0 goto error_end

rem ce sample code wce200
copy ..\samplece\dtsample\*.h    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample
copy ..\samplece\dtsample\*.c    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample
copy ..\samplece\dtsample\*.cur    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample
copy ..\samplece\dtsample\*.bmp    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample
copy ..\samplece\dtsample\*.ico    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample
copy ..\samplece\dtsample\udtsampl.*    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample
copy ..\samplece\dtsample\*.rc    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample
copy ..\samplece\dtsample\%bld_path%\Wce200\dll\mips\%langdir%\release\*.exe    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample\bin\mips\%langdir%
copy ..\samplece\dtsample\%bld_path%\Wce200\dll\sh\%langdir%\release\*.exe    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample\bin\sh\%langdir%
copy ..\samplece\dtsample\%bld_path%\Wce200\dll\x86em\%langdir%\release\*.exe ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample\bin\x86em\%langdir%
if not errorlevel 0 goto error_end


copy ..\samplece\cetalk\*.h    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\cetalk
copy ..\samplece\cetalk\*.cpp    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\cetalk
copy ..\samplece\cetalk\ucetalk.*    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\cetalk
copy ..\samplece\cetalk\*.rc    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\cetalk
copy ..\samplece\cetalk\res\*.*    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\cetalk\res
copy ..\samplece\cetalk\%bld_path%\Wce200\dll\mips\%langdir%\release\*.exe    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\cetalk\bin\mips\%langdir%
copy ..\samplece\cetalk\%bld_path%\Wce200\dll\sh\%langdir%\release\*.exe    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\cetalk\bin\sh\%langdir%
copy ..\samplece\cetalk\%bld_path%\Wce200\dll\x86em\%langdir%\release\*.exe    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\cetalk\bin\x86em\%langdir%
if not errorlevel 0 goto error_end


rem ce sample code Wce211
copy ..\samplece\dtsample\*.h    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\dtsample
copy ..\samplece\dtsample\*.c    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\dtsample
copy ..\samplece\dtsample\*.cur    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\dtsample
copy ..\samplece\dtsample\*.bmp    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\dtsample
copy ..\samplece\dtsample\*.ico    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\dtsample
copy ..\samplece\dtsample\udtsampl.*    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\dtsample
copy ..\samplece\dtsample\*.rc    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\dtsample
copy ..\samplece\dtsample\%bld_path%\Wce211\dll\mips\%langdir%\release\*.exe    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\dtsample\bin\mips\%langdir%
copy ..\samplece\dtsample\%bld_path%\Wce211\dll\sh\%langdir%\release\*.exe    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\dtsample\bin\sh\%langdir%
copy ..\samplece\dtsample\%bld_path%\Wce211\dll\sh4\%langdir%\release\*.exe    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\dtsample\bin\sh4\%langdir%
copy ..\samplece\dtsample\%bld_path%\Wce211\dll\arm\%langdir%\release\*.exe    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\dtsample\bin\arm\%langdir%
copy ..\samplece\dtsample\%bld_path%\Wce211\dll\x86em\%langdir%\release\*.exe ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\dtsample\bin\x86em\%langdir%
if not errorlevel 0 goto error_end


copy ..\samplece\cetalk\*.h    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\cetalk
copy ..\samplece\cetalk\*.cpp    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\cetalk
copy ..\samplece\cetalk\ucetalk.*    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\cetalk
copy ..\samplece\cetalk\*.rc    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\cetalk
copy ..\samplece\cetalk\res\*.*    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\cetalk\res
copy ..\samplece\cetalk\%bld_path%\Wce211\dll\mips\%langdir%\release\*.exe    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\cetalk\bin\mips\%langdir%
copy ..\samplece\cetalk\%bld_path%\Wce211\dll\sh\%langdir%\release\*.exe    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\cetalk\bin\sh\%langdir%
copy ..\samplece\cetalk\%bld_path%\Wce211\dll\sh4\%langdir%\release\*.exe    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\cetalk\bin\sh4\%langdir%
copy ..\samplece\cetalk\%bld_path%\Wce211\dll\arm\%langdir%\release\*.exe    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\cetalk\bin\arm\%langdir%
copy ..\samplece\cetalk\%bld_path%\Wce211\dll\x86em\%langdir%\release\*.exe    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\cetalk\bin\x86em\%langdir%
if not errorlevel 0 goto error_end


copy ..\samplece\mailread\*.h    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\mailread
copy ..\samplece\mailread\*.cpp    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\mailread
copy ..\samplece\mailread\*.rc    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\mailread
copy ..\samplece\mailread\res\*.*    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\mailread\res
copy ..\samplece\mailread\%bld_path%\Wce211\dll\mips\us\release\*.exe    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\mailread\bin\mips\%langdir%
copy ..\samplece\mailread\%bld_path%\Wce211\dll\sh\us\release\*.exe    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\mailread\bin\sh\%langdir%
copy ..\samplece\mailread\%bld_path%\Wce211\dll\sh4\us\release\*.exe    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\mailread\bin\sh4\%langdir%
copy ..\samplece\mailread\%bld_path%\Wce211\dll\arm\us\release\*.exe    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\mailread\bin\arm\%langdir%
copy ..\samplece\mailread\%bld_path%\Wce211\dll\x86em\us\release\*.exe    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\mailread\bin\x86em\%langdir%
if not errorlevel 0 goto error_end

copy ..\samplece\windic\%bld_path%\Wce211\cedll\mips\%langdir%\release\*.exe    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\windic\bin\mips\%langdir%
copy ..\samplece\windic\%bld_path%\Wce211\cedll\sh\%langdir%\release\*.exe    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\windic\bin\sh\%langdir%
copy ..\samplece\windic\%bld_path%\Wce211\cedll\sh4\%langdir%\release\*.exe    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\windic\bin\sh4\%langdir%
copy ..\samplece\windic\%bld_path%\Wce211\cedll\arm\%langdir%\release\*.exe    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\windic\bin\arm\%langdir%
copy ..\samplece\windic\%bld_path%\Wce211\cedll\x86em\%langdir%\release\*.exe ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\windic\bin\x86em\%langdir%
if not errorlevel 0 goto error_end



if "%kitcopy_debug%"=="1" pause

rem *****************************************************
rem arch_dir\language\INSTALL\DATA\SAMPLES\SAY
rem *****************************************************

echo ***************************************************************
echo arch_dir\language\INSTALL\DATA\SAMPLES\SAY
echo ***************************************************************

rem give source codes and exes for V4.4 and above per meeting 5/13/97 ckl
copy ..\samples\say\say.c ..\%arch_dir%\%langdir%\install\data\as_is\samples\say
copy ..\samples\say\%bld_path%\%langdir%\release\*.exe ..\%arch_dir%\%langdir%\install\data\as_is\samples\say
copy ..\samples\say\usay.mak ..\%arch_dir%\%langdir%\install\data\as_is\samples\say
if not errorlevel 0 goto error_end

if "%kitcopy_debug%"=="1" pause
rem *****************************************************
rem arch_dir\language\INSTALL\DATA\SAMPLES\TTSTEST
rem *****************************************************

echo ***************************************************************
echo arch_dir\language\INSTALL\DATA\SAMPLES\TTSTEST
echo ***************************************************************

rem no ttstest sources, no objs, EXE ONLY per meeting 5/13/97 cjl
copy ..\samples\ttstest\%bld_path%\%langdir%\release\*.exe ..\%arch_dir%\%langdir%\install\data\as_is\samples\ttstest
if not errorlevel 0 goto error_end

if "%kitcopy_debug%"=="1" pause
rem *****************************************************
rem arch_dir\language\INSTALL\DATA\SAMPLES\VERCHECK
rem This component has no Language specific SOURCE
rem *****************************************************

echo ***************************************************************
echo arch_dir\language\INSTALL\DATA\SAMPLES\VERCHECK
echo ***************************************************************

rem we do send the vercheck sources and exe, no objs per meeting 5/13/97 ckl
copy ..\samples\vercheck\*.* ..\%arch_dir%\%langdir%\install\data\as_is\samples\vercheck
copy ..\samples\vercheck\%bld_path%\release\*.exe ..\%arch_dir%\%langdir%\install\data\as_is\samples\vercheck
if not errorlevel 0 goto error_end

if "%kitcopy_debug%"=="1" pause
rem *****************************************************
rem arch_dir\language\INSTALL\DATA\SAMPLES\WINDIC
rem *****************************************************

echo ***************************************************************
echo arch_dir\language\INSTALL\DATA\SAMPLES\WINDIC
echo ***************************************************************

rem we do send the windic sources and exe per meeting 5/13/97 ckl
copy ..\samples\windic\*.c ..\%arch_dir%\%langdir%\install\data\as_is\samples\windic
copy ..\samples\windic\*.h ..\%arch_dir%\%langdir%\install\data\as_is\samples\windic
copy ..\samples\windic\*.def ..\%arch_dir%\%langdir%\install\data\as_is\samples\windic
copy ..\samples\windic\*.ico ..\%arch_dir%\%langdir%\install\data\as_is\samples\windic
copy ..\samples\windic\*.rc ..\%arch_dir%\%langdir%\install\data\as_is\samples\windic
copy ..\samples\windic\*.bmp ..\%arch_dir%\%langdir%\install\data\as_is\samples\windic
rem copy ..\samples\windic\uwindic.mak ..\%arch_dir%\%langdir%\install\data\as_is\samples\windic
copy ..\samples\windic\%bld_path%\ml\release\link\*.res ..\%arch_dir%\%langdir%\install\data\as_is\samples\windic
copy ..\samples\windic\%bld_path%\ml\release\*.exe ..\%arch_dir%\%langdir%\install\data\as_is\samples\windic
if not errorlevel 0 goto error_end

if "%kitcopy_debug%"=="1" pause
rem *****************************************************
rem arch_dir\language\INSTALL\DATA\PROGRAM
rem arch_dir\language\INSTALL\WDATA\PROGRAM
rem *****************************************************

echo ***************************************************************
echo arch_dir\language\INSTALL\DATA\PROGRAM (WDATA too)
echo ***************************************************************


rem files for the dectalk program area
copy ..\samples\dtsample\%bld_path%\ml\release\dtsample.exe ..\%arch_dir%\%langdir%\install\data\program
if not errorlevel 0 goto error_end
copy ..\samples\speak\%bld_path%\%langdir%\release\speak.exe ..\%arch_dir%\%langdir%\install\data\program
if not errorlevel 0 goto error_end
copy ..\samples\windic\%bld_path%\ml\release\windic.exe ..\%arch_dir%\%langdir%\install\data\program
if not errorlevel 0 goto error_end
copy ..\samples\ttstest\%bld_path%\%langdir%\release\ttstest.exe ..\%arch_dir%\%langdir%\install\data\program
if not errorlevel 0 goto error_end
rem -- Willow Pond's version of TTSTEST --
copy ..\samples\wttstest\%bld_path%\%langdir%\release\wttstest.exe ..\%arch_dir%\%langdir%\install\wdata\program
if not errorlevel 0 goto error_end
rem REMEMBER: The following (VERCHECK) is not language dependent.
copy ..\samples\vercheck\%bld_path%\release\vercheck.exe ..\%arch_dir%\%langdir%\install\data\program


if not errorlevel 0 goto error_end
rem *****************************************************
rem arch_dir\language\INSTALL\DATA\SPEECH
rem arch_dir\language\INSTALL\WDATA\SPEECH
rem *****************************************************

echo ***************************************************************
echo arch_dir\language\INSTALL\DATA\SPEECH (WDATA too)
echo ***************************************************************

copy ..\sapi\%bld_path%\dtlkttse\%langdir%\release\dtlkttse.dll ..\%arch_dir%\%langdir%\install\data\speech
if not errorlevel 0 goto error_end
rem -- Willow Pond's version of DTLKTTSE.DLL --
copy ..\sapi\%bld_path%\wtlkttse\%langdir%\release\wtlkttse.dll ..\%arch_dir%\%langdir%\install\wdata\speech
if not errorlevel 0 goto error_end

if "%kitcopy_debug%"=="1" pause
rem *****************************************************
rem arch_dir\language\INSTALL\DATA\HELP
rem *****************************************************

echo ***************************************************************
echo arch_dir\language\INSTALL\DATA\HELP
echo ***************************************************************

rem help files
copy ..\help\dectalk.* ..\%arch_dir%\%langdir%\install\data\as_is\help

copy ..\help\dectalk.* ..\%arch_dir%\%langdir%\install\cedata\as_is\help

if not errorlevel 0 goto error_end
rem *****************************************************
rem arch_dir\language\INSTALL\DATA
rem *****************************************************

echo ***************************************************************
echo arch_dir\language\INSTALL\DATA
echo ***************************************************************

copy ..\help\dtkmsapi.txt ..\%arch_dir%\%langdir%\install\data\as_is
if not errorlevel 0 goto error_end

if not errorlevel 0 goto error_end
rem *****************************************************
rem arch_dir\language\staticS
rem NOTE: This is for Non-Access32 static builds
rem     PLUS the renamed dictionary dectalk.dic -> dtalk_xx.dic
rem *****************************************************

echo ***************************************************************
echo arch_dir\language\staticS (Non-Access32 Static PKG)
echo ***************************************************************

copy ..\dapi\%bld_path%\dtstatics\%langdir%\release\*.lib ..\%arch_dir%\%langdir%\staticS
copy ..\samples\say\%bld_path%\%langdir%\static\*.exe ..\%arch_dir%\%langdir%\staticS
copy ..\samples\windic\%bld_path%\%langdir%\wdicstat\*.exe ..\%arch_dir%\%langdir%\staticS
copy ..\dapi\%bld_path%\dtalkdic\%langdir%\release\dectalk.dic ..\%arch_dir%\%langdir%\staticS\dtalk_%langdir%.dic
if "%dtlang%"=="ENGLISH_US" copy ..\dapi\%bld_path%\dtalkdic\%langdir%\release\dectalkm.dic ..\%arch_dir%\%langdir%\install\cedata\as_is\dtalk_%langdir%m.dic
if "%dtlang%"=="ENGLISH_US" copy ..\dapi\%bld_path%\dtalkdic\%langdir%\release\dectalks.dic ..\%arch_dir%\%langdir%\install\cedata\as_is\dtalk_%langdir%s.dic
if "%dtlang%"=="ENGLISH_UK" copy ..\dapi\%bld_path%\dtalkdic\%langdir%\release\dectalks.dic ..\%arch_dir%\%langdir%\install\cedata\as_is\dtalk_%langdir%s.dic
if "%dtlang%"=="GERMAN" copy ..\dapi\%bld_path%\dtalkdic\%langdir%\release\dectalks.dic ..\%arch_dir%\%langdir%\install\cedata\as_is\dtalk_%langdir%s.dic 


echo *****************************************************************
echo arch_dir\language\staticSce (Non-Access32 Static PKG) Windows CE
echo *****************************************************************

copy ..\dapi\%bld_path%\dtalkdic\%langdir%\release\dectalk.dic ..\%arch_dir%\%langdir%\staticSce\dtalk_%langdir%.dic
if "%dtlang%"=="ENGLISH_US" copy ..\dapi\%bld_path%\dtalkdic\%langdir%\release\dectalkm.dic ..\%arch_dir%\%langdir%\staticSce\dtalk_%langdir%m.dic
if "%dtlang%"=="ENGLISH_US" copy ..\dapi\%bld_path%\dtalkdic\%langdir%\release\dectalks.dic ..\%arch_dir%\%langdir%\staticSce\dtalk_%langdir%s.dic
if "%dtlang%"=="ENGLISH_UK" copy ..\dapi\%bld_path%\dtalkdic\%langdir%\release\dectalks.dic ..\%arch_dir%\%langdir%\staticSce\dtalk_%langdir%s.dic
if "%dtlang%"=="GERMAN" copy ..\dapi\%bld_path%\dtalkdic\%langdir%\release\dectalks.dic ..\%arch_dir%\%langdir%\staticSce\dtalk_%langdir%s.dic

copy ..\samples\windic\%bld_path%\%langdir%\wdicstat\*.exe ..\%arch_dir%\%langdir%\staticSce

copy ..\dapi\%bld_path%\Wce200\cestatic\mips\%langdir%\release\*.lib ..\%arch_dir%\%langdir%\staticSce\Wce200\mips
copy ..\dapi\%bld_path%\Wce200\cestatic\sh\%langdir%\release\*.lib ..\%arch_dir%\%langdir%\staticSce\Wce200\sh
copy ..\dapi\%bld_path%\Wce200\cestatic\x86em\%langdir%\release\*.lib ..\%arch_dir%\%langdir%\staticSce\Wce200\x86em
copy ..\dapi\%bld_path%\Wce211\cestatic\mips\%langdir%\release\*.lib ..\%arch_dir%\%langdir%\staticSce\Wce211\mips
copy ..\dapi\%bld_path%\Wce211\cestatic\sh\%langdir%\release\*.lib ..\%arch_dir%\%langdir%\staticSce\Wce211\sh
copy ..\dapi\%bld_path%\Wce211\cestatic\sh4\%langdir%\release\*.lib ..\%arch_dir%\%langdir%\staticSce\Wce211\sh4
copy ..\dapi\%bld_path%\Wce211\cestatic\arm\%langdir%\release\*.lib ..\%arch_dir%\%langdir%\staticSce\Wce211\arm
copy ..\dapi\%bld_path%\Wce211\cestatic\x86em\%langdir%\release\*.lib ..\%arch_dir%\%langdir%\staticSce\Wce211\x86em



if "%kitcopy_debug%"=="1" pause

rem *** 08/26/98 cjl ***
if not errorlevel 0 goto error_end
rem *****************************************************
rem arch_dir\language\STATIC
rem NOTE: This is all access32 builds
rem     PLUS the renamed dictionary dectalk.dic -> dtalk_xx.dic
rem *****************************************************

echo ***************************************************************
echo arch_dir\language\static (Access32 Static PKG)
echo ***************************************************************

copy ..\dapi\%bld_path%\dtstatic\%langdir%\release\*.lib ..\%arch_dir%\%langdir%\static
copy ..\dapi\%bld_path%\dtdemo\%langdir%\release\*.exe ..\%arch_dir%\%langdir%\static
copy ..\samples\dtsample\%bld_path%\%langdir%\a32stat\*.exe ..\%arch_dir%\%langdir%\static
copy ..\samples\windic\%bld_path%\%langdir%\wdicstat\*.exe ..\%arch_dir%\%langdir%\static
copy ..\dapi\%bld_path%\dtalkdic\%langdir%\release\dectalk.dic ..\%arch_dir%\%langdir%\static\dtalk_%langdir%.dic
if "%dtlang%"=="ENGLISH_US" copy ..\dapi\%bld_path%\dtalkdic\%langdir%\release\dectalkm.dic ..\%arch_dir%\%langdir%\install\cedata\as_is\dtalk_%langdir%m.dic
if "%dtlang%"=="ENGLISH_US" copy ..\dapi\%bld_path%\dtalkdic\%langdir%\release\dectalks.dic ..\%arch_dir%\%langdir%\install\cedata\as_is\dtalk_%langdir%s.dic
if "%dtlang%"=="ENGLISH_UK" copy ..\dapi\%bld_path%\dtalkdic\%langdir%\release\dectalks.dic ..\%arch_dir%\%langdir%\install\cedata\as_is\dtalk_%langdir%s.dic
if "%dtlang%"=="GERMAN" copy ..\dapi\%bld_path%\dtalkdic\%langdir%\release\dectalks.dic ..\%arch_dir%\%langdir%\install\cedata\as_is\dtalk_%langdir%s.dic 

if "%kitcopy_debug%"=="1" pause
rem *** 08/26/98 cjl ***

rem *****************************************************
rem speech.dll
rem *****************************************************

echo ***************************************************************
echo Speech.dll
echo ***************************************************************

copy ..\"microsoft"\%msdir%\speech.dll ..\%arch_dir%\%langdir%\install\data\speech
copy ..\"microsoft"\%msdir%\speech.dll ..\%arch_dir%\%langdir%\install\wdata\speech

if not errorlevel 0 goto error_end

if "%kitcopy_debug%"=="1" pause
rem *****************************************************
rem arch_dir\language\INSTALL\DATA\SPROGRAM
rem *****************************************************

echo ***************************************************************
echo arch_dir\language\INSTALL\DATA\SPROGRAM
echo ***************************************************************

copy ..\samples\ttssrv\%bld_path%\%langdir%\release\ttssrv.exe ..\%arch_dir%\%langdir%\install\data\sprogram
copy ..\"microsoft"\%msdir%\msvcrt.dll ..\%arch_dir%\%langdir%\install\data\sprogram
copy ..\"microsoft"\%msdir%\msvcrt.dll ..\%arch_dir%\%langdir%\install\wdata\sprogram
copy ..\"microsoft"\%msdir%\msvcrt.dll ..\%arch_dir%\%langdir%\install\cedata\sprogram
if not errorlevel 0 goto error_end

if "%kitcopy_debug%"=="1" pause
rem *****************************************************
rem dectalk.lib, dectalk.dll, and cpanel.dll goes together
rem dtlkstat.lib and wtlkstat.lib here??? (we made them but are not included)
rem *****************************************************

echo ***************************************************************
echo dectalk.lib, dectalk.dll, and cpanel.dll goes together
echo ***************************************************************

copy ..\dapi\%bld_path%\dectalk\%langdir%\release\dectalk.lib ..\%arch_dir%\%langdir%\install\data\as_is\%langdir%
if not errorlevel 0 goto error_end
rem windows, windows\system area
copy ..\dapi\%bld_path%\dectalk\%langdir%\release\dectalk.dll ..\%arch_dir%\%langdir%\install\data\sprogram
if not errorlevel 0 goto error_end
REM *** copy ..\cpanel\%bld_path%\release\cpanel.dll ..\%arch_dir%\%langdir%\install\data\sprogram
REM *** copy dtlkstat? to data\lib
REM *** copy wtlkstat? to wdata\wlib


echo ***************************************************************
echo dectalk.lib, dectalk.dll for Wce
echo ***************************************************************

copy ..\dapi\%bld_path%\Wce200\cedll\mips\%langdir%\release\dectalk.dll ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%langdir%\mips
copy ..\dapi\%bld_path%\Wce200\cedll\mips\%langdir%\release\dectalk.lib ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%langdir%\mips

copy ..\dapi\%bld_path%\Wce200\cedll\sh\%langdir%\release\dectalk.dll ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%langdir%\sh
copy ..\dapi\%bld_path%\Wce200\cedll\sh\%langdir%\release\dectalk.lib ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%langdir%\sh

copy ..\dapi\%bld_path%\Wce200\cedll\x86em\%langdir%\release\dectalk.dll ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%langdir%\x86em
copy ..\dapi\%bld_path%\Wce200\cedll\x86em\%langdir%\release\dectalk.lib ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%langdir%\x86em

copy ..\dapi\%bld_path%\Wce211\cedll\arm\%langdir%\release\dectalk.dll ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\%langdir%\arm
copy ..\dapi\%bld_path%\Wce211\cedll\arm\%langdir%\release\dectalk.lib ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\%langdir%\arm

copy ..\dapi\%bld_path%\Wce211\cedll\x86em\%langdir%\release\dectalk.dll ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\%langdir%\x86em
copy ..\dapi\%bld_path%\Wce211\cedll\x86em\%langdir%\release\dectalk.lib ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\%langdir%\x86em

copy ..\dapi\%bld_path%\Wce211\cedll\sh\%langdir%\release\dectalk.dll ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\%langdir%\sh
copy ..\dapi\%bld_path%\Wce211\cedll\sh\%langdir%\release\dectalk.lib ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\%langdir%\sh

copy ..\dapi\%bld_path%\Wce211\cedll\sh4\%langdir%\release\dectalk.dll ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\%langdir%\sh4
copy ..\dapi\%bld_path%\Wce211\cedll\sh4\%langdir%\release\dectalk.lib ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\%langdir%\sh4

copy ..\dapi\%bld_path%\Wce211\cedll\mips\%langdir%\release\dectalk.dll ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\%langdir%\mips
copy ..\dapi\%bld_path%\Wce211\cedll\mips\%langdir%\release\dectalk.lib ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\%langdir%\mips


echo ***************************************************************
echo copy dictionary for for Wce
echo ***************************************************************
copy ..\dapi\%bld_path%\dtalkdic\%langdir%\release\dectalk.dic ..\%arch_dir%\%langdir%\install\cedata\as_is\dtalk_%langdir%.dic
if "%dtlang%"=="ENGLISH_US" copy ..\dapi\%bld_path%\dtalkdic\%langdir%\release\dectalkm.dic ..\%arch_dir%\%langdir%\install\cedata\as_is\dtalk_%langdir%m.dic
if "%dtlang%"=="ENGLISH_US" copy ..\dapi\%bld_path%\dtalkdic\%langdir%\release\dectalks.dic ..\%arch_dir%\%langdir%\install\cedata\as_is\dtalk_%langdir%s.dic
if "%dtlang%"=="ENGLISH_UK" copy ..\dapi\%bld_path%\dtalkdic\%langdir%\release\dectalks.dic ..\%arch_dir%\%langdir%\install\cedata\as_is\dtalk_%langdir%s.dic
if "%dtlang%"=="GERMAN" copy ..\dapi\%bld_path%\dtalkdic\%langdir%\release\dectalks.dic ..\%arch_dir%\%langdir%\install\cedata\as_is\dtalk_%langdir%s.dic 

echo ***************************************************************
echo copy windic executable win95 for Wce user dictionary creator
echo ***************************************************************
copy ..\samples\windic\%bld_path%\%langdir%\wdicstat\windic.exe ..\%arch_dir%\%langdir%\install\cedata\program\windic_%langdir%.exe



if "%kitcopy_debug%"=="1" pause
rem *****************************************************
rem ttsapi.h ttsfeat to include directory.
rem *****************************************************

echo ***************************************************************
echo ttsapi.h ttsfeat to include directory.
echo ***************************************************************

copy ..\dapi\src\api\ttsapi.h ..\%arch_dir%\%langdir%\install\data\as_is\include
copy ..\dapi\src\api\ttsfeat.h ..\%arch_dir%\%langdir%\install\data\as_is\include
if not errorlevel 0 goto error_end

copy ..\dapi\src\dectalk.def ..\%arch_dir%\%langdir%\install\data\as_is\include
if not errorlevel 0 goto error_end

rem copy to ce include directory

copy ..\dapi\src\api\ttsapi.h ..\%arch_dir%\%langdir%\install\cedata\as_is\include
copy ..\dapi\src\api\ttsfeat.h ..\%arch_dir%\%langdir%\install\cedata\as_is\include


rem *****************************************************
rem misc stuff
rem *****************************************************

echo ***************************************************************
echo misc stuff
echo ***************************************************************

REM *** FIX DICTIONARY LOCATION LATER !!!!******
copy ..\dapi\%bld_path%\dtalkdic\%langdir%\release\dectalk.dic ..\%arch_dir%\%langdir%\install\data\as_is
if "%dtlang%"=="ENGLISH_US" copy ..\dapi\%bld_path%\dtalkdic\%langdir%\release\dectalkm.dic ..\%arch_dir%\%langdir%\install\data\as_is\dtalk_%langdir%m.dic
if "%dtlang%"=="ENGLISH_US" copy ..\dapi\%bld_path%\dtalkdic\%langdir%\release\dectalks.dic ..\%arch_dir%\%langdir%\install\data\as_is\dtalk_%langdir%s.dic
if "%dtlang%"=="ENGLISH_UK" copy ..\dapi\%bld_path%\dtalkdic\%langdir%\release\dectalks.dic ..\%arch_dir%\%langdir%\install\data\as_is\dtalk_%langdir%s.dic
if "%dtlang%"=="GERMAN" copy ..\dapi\%bld_path%\dtalkdic\%langdir%\release\dectalks.dic ..\%arch_dir%\%langdir%\install\data\as_is\dtalk_%langdir%s.dic 
if not errorlevel 0 goto error_end
copy ..\dapi\%bld_path%\dtalkdic\%langdir%\release\dectalk.dic ..\%arch_dir%\%langdir%\install\wdata\as_is
if not errorlevel 0 goto error_end
copy ..\dapi\src\dic\user.tab ..\%arch_dir%\%langdir%\install\data\as_is
if not errorlevel 0 goto error_end
copy ..\dapi\src\dic\user.tab ..\%arch_dir%\%langdir%\install\wdata\as_is
if not errorlevel 0 goto error_end
copy ..\dapi\src\dic\user.tab ..\%arch_dir%\%langdir%\install\cedata\as_is
if not errorlevel 0 goto error_end
copy word.txt ..\%arch_dir%\%langdir%\install\data\as_is
if not errorlevel 0 goto error_end
copy ..\samples\say\%bld_path%\%langdir%\release\say.exe ..\%arch_dir%\%langdir%\install\data\sprogram
if not errorlevel 0 goto error_end


if "%kitcopy_debug%"=="1" pause
rem *****************************************************
rem putting the *.TXT files in place
rem *****************************************************

echo ***************************************************************
echo putting the *.TXT files in place
echo ***************************************************************

copy readme.txt ..\%arch_dir%\%langdir%\install\data\as_is
copy readme.txt ..\%arch_dir%\%langdir%\install\wdata\as_is
copy readme.txt ..\%arch_dir%\%langdir%\install\cedata\as_is
if not errorlevel 0 goto error_end
copy appendix1.txt ..\%arch_dir%\%langdir%\install\data\as_is
copy appendix1.txt ..\%arch_dir%\%langdir%\install\wdata\as_is
copy appendix1.txt ..\%arch_dir%\%langdir%\install\cedata\as_is
if not errorlevel 0 goto error_end
copy appendix2.txt ..\%arch_dir%\%langdir%\install\data\as_is
copy appendix2.txt ..\%arch_dir%\%langdir%\install\wdata\as_is
copy appendix2.txt ..\%arch_dir%\%langdir%\install\cedata\as_is
if not errorlevel 0 goto error_end
rem 22oct97  cjl   Add Appendix3.txt to the sdk disk1.
copy appendix3.txt ..\%arch_dir%\%langdir%\install\data\as_is
copy appendix3.txt ..\%arch_dir%\%langdir%\install\wdata\as_is
copy appendix3.txt ..\%arch_dir%\%langdir%\install\cedata\as_is
if not errorlevel 0 goto error_end
rem 22may98  cjl   Add Appendix4.txt to the sdk disk1.
copy appendix4.txt ..\%arch_dir%\%langdir%\install\data\as_is
copy appendix4.txt ..\%arch_dir%\%langdir%\install\wdata\as_is
copy appendix4.txt ..\%arch_dir%\%langdir%\install\cedata\as_is
if not errorlevel 0 goto error_end

rem **********************************************************
rem This is for the patch thingie that will make dectalk
rem have multiple languages installed on one machine
rem **********************************************************

echo ***************************************************************
echo Patch For Multi-Language Dectalk On One Machine.
echo ***************************************************************

copy swaplang.txt ..\%arch_dir%\%langdir%\install\data\as_is\patch
if not errorlevel 0 goto error_end
copy ..\install\src\setup\set2%langdir%.bat ..\%arch_dir%\%langdir%\install\data\as_is\patch
if not errorlevel 0 goto error_end
REM -- Willow Pond stuff ---
copy swaplang.txt ..\%arch_dir%\%langdir%\install\wdata\as_is\patch
if not errorlevel 0 goto error_end
copy ..\install\src\setup\wset2%langdir%.bat ..\%arch_dir%\%langdir%\install\wdata\as_is\patch\set2%langdir%.bat
if not errorlevel 0 goto error_end

rem *****************************************************
rem the following is for getting misc items
rem in the correct place
rem *****************************************************

rem getting Willow Pond's setup ready
xcopy /e/c/q ..\%arch_dir%\%langdir%\install\data\as_is\include ..\%arch_dir%\%langdir%\install\wdata\as_is\include\
rem xcopy /e/c/q ..\%arch_dir%\%langdir%\install\data\as_is\lib ..\%arch_dir%\%langdir%\install\wdata\as_is\lib\
if not errorlevel 0 goto error_end

if "%kitcopy_debug%"=="1" pause
set fp=%bld_path%\release\
rem *****************************************************
rem create the version info file..
rem *****************************************************

echo ***************************************************************
echo DECtalk Software version %1 (%dtlkid%) > dtalkver.txt
echo ***************************************************************

REM *** %fp%finfo ..\%arch_dir%\%langdir%\install\data\lib\dtlkstat.lib >> dtalkver.txt
%fp%finfo ..\%arch_dir%\%langdir%\install\data\as_is\user.tab >> dtalkver.txt
%fp%finfo ..\%arch_dir%\%langdir%\install\data\as_is\word.txt >> dtalkver.txt
%fp%finfo ..\%arch_dir%\%langdir%\install\data\as_is\dectalk.dic >> dtalkver.txt
%fp%finfo ..\%arch_dir%\%langdir%\install\data\program\ttstest.exe >> dtalkver.txt
%fp%finfo ..\%arch_dir%\%langdir%\install\data\program\speak.exe >> dtalkver.txt
%fp%finfo ..\%arch_dir%\%langdir%\install\data\program\windic.exe >> dtalkver.txt
%fp%finfo ..\%arch_dir%\%langdir%\install\data\program\vercheck.exe >> dtalkver.txt
%fp%finfo ..\%arch_dir%\%langdir%\install\data\program\dtsample.exe >> dtalkver.txt
%fp%finfo ..\%arch_dir%\%langdir%\install\data\sprogram\ttssrv.exe >> dtalkver.txt
%fp%finfo ..\%arch_dir%\%langdir%\install\data\sprogram\say.exe >> dtalkver.txt
%fp%finfo ..\%arch_dir%\%langdir%\install\data\speech\dtlkttse.dll >> dtalkver.txt
%fp%finfo ..\microsoft\%msdir%\speech.dll >> dtalkver.txt
%fp%finfo ..\microsoft\%msdir%\msvcrt.dll >> dtalkver.txt
%fp%finfo ..\%arch_dir%\%langdir%\install\data\as_is\%langdir%\dectalk.lib >> dtalkver.txt
%fp%finfo ..\%arch_dir%\%langdir%\install\data\as_is\include\ttsapi.h >> dtalkver.txt
%fp%finfo ..\%arch_dir%\%langdir%\install\data\as_is\include\ttsfeat.h >> dtalkver.txt


REM -- Regular stuff ---
%fp%finfo ..\%arch_dir%\%langdir%\install\data\sprogram\dectalk.dll >> dtalkver.txt

REM -- Willow Pond stuff ---
echo -- >> wtalkver.txt
echo Willow Pond Files >> wtalkver.txt
%fp%finfo ..\%arch_dir%\%langdir%\install\wdata\as_is\dectalk.dic >> wtalkver.txt
REM *** %fp%finfo ..\%arch_dir%\%langdir%\install\wdata\as_is\w%langdir%\wtlkstat.lib >> wtalkver.txt
%fp%finfo ..\%arch_dir%\%langdir%\install\wdata\speech\wtlkttse.dll >> wtalkver.txt
%fp%finfo ..\%arch_dir%\%langdir%\install\wdata\program\wttstest.exe >> wtalkver.txt

rem *****************************************************
rem put it where it belongs
rem *****************************************************

echo ***************************************************************
echo Put it where it belongs
echo ***************************************************************

copy dtalkver.txt ..\%arch_dir%\%langdir%\install\data\as_is
if not errorlevel 0 goto error_end
copy wtalkver.txt ..\%arch_dir%\%langdir%\install\wdata\as_is
if not errorlevel 0 goto error_end

rem *****************************************************
rem cleaning up files for kit release
rem *****************************************************

echo ***************************************************************
echo CLEANING up the sources in SAMPLES\DTSAMPLE for regular kit builds.
echo ***************************************************************

copy ..\tools\preproc\%bld_path%\release\preproc.exe ..\%arch_dir%\%langdir%\install\data\as_is\samples\dtsample
cd ..\%arch_dir%\%langdir%\install\data\as_is\samples\dtsample
preproc -i dtsample.c -x ACCESS32
preproc -i dtsample.h -x ACCESS32
del preproc.exe
cd ..\..\..\..\..\..\..\kitting

rem **********************************************************
rem Customer Specific SMIT/ACCESS32 "kits"
rem **********************************************************

echo ***************************************************************
echo BUILDING Customer Specific SMIT/ACCESS32 KITs
echo ***************************************************************

rem Assumes starting at root of \work\rnd\kitting or like structure and
rem moving up to \work\rnd or the like.
cd ..\

md %arch_dir%\%langdir%\access32

rem start:                                    Tom Kopec/DECtalk Internal
set smitcode=tk

:smitloop
md %arch_dir%\%langdir%\access32\smit%smitcode%
echo %arch_dir%\%langdir%\access32\smit%smitcode%
if "%kitcopy_debug%"=="1" pause

copy tools\SMIT\SMITGEN\%bld_path%\smitxx\smit%smitcode%.c %arch_dir%\%langdir%\access32\smit%smitcode%
copy dapi\%bld_path%\dectalk\%langdir%\access32\dectalk.dll %arch_dir%\%langdir%\access32\smit%smitcode%\dectalk.dll
copy sapi\%bld_path%\dtlkttse\%langdir%\access32\dtlkttse.dll %arch_dir%\%langdir%\access32\smit%smitcode%\dtlkttse.dll
copy tools\SMIT\readme.txt %arch_dir%\%langdir%\access32\smit%smitcode%\readme.txt
copy tools\SMIT\setup.reg %arch_dir%\%langdir%\access32\smit%smitcode%\setup.reg
copy tools\SMIT\docopy.bat %arch_dir%\%langdir%\access32\smit%smitcode%\docopy.bat

pkzip -sdectalk%smitcode% %arch_dir%\%langdir%\access32\smit%smitcode%\smit%smitcode%.zip %arch_dir%\%langdir%\access32\smit%smitcode%\*.*

rem NOTE: This list MUST be in reverse order to work.
rem if last, exit smitloop
if %smitcode%==ns goto smitend
rem                                           Update last entry exit, while
rem                                           New entries get added HERE!
rem next:                                     Neil Squire Foundation
if %smitcode%==ar set smitcode=ns
rem next:                                     Arkenstone
if %smitcode%==pr set smitcode=ar
rem next:                                     Prentke-Romich
if %smitcode%==jb set smitcode=pr
rem next:                                     Jbliss
if %smitcode%==in set smitcode=jb
rem next:                                     Innocomp
if %smitcode%==cc set smitcode=in
rem next:                                     Consultants For Commincation Technology
if %smitcode%==ke set smitcode=cc
rem next:                                     Kurzweil Education Systems
if %smitcode%==mt set smitcode=ke
rem next:                                     MicroTalk
if %smitcode%==ah set smitcode=mt
rem next:                                     Applied Human Factors
if %smitcode%==at set smitcode=ah
rem next:                                     Artic Technology
if %smitcode%==gw set smitcode=at
rem next:                                     GW Micro
if %smitcode%==ts set smitcode=gw
rem next:                                     Telesensory
if %smitcode%==wp set smitcode=ts
rem next:                                     Words+
if %smitcode%==gc set smitcode=wp
rem next:                                     Gus Communications
if %smitcode%==sv set smitcode=gc
rem next:                                     Sytha-Voice
if %smitcode%==hj set smitcode=sv
rem next:                                     Henter-Joyce
if %smitcode%==tk set smitcode=hj
if "%kitcopy_debug%"=="1" pause

goto smitloop

:smitend


echo ***************************************************************
echo BUILDING Customer Specific SMIT/ACCESS32 KITs for Windows CE
echo ***************************************************************


rem rem md %arch_dir%\%langdir%\accessCE

rem start:                                    Tom Kopec/DECtalk Internal
set smitcode=tk


:smitloopce
md %arch_dir%\%langdir%\accessCE\Wce200\mips\smit%smitcode%
md %arch_dir%\%langdir%\accessCE\Wce200\sh\smit%smitcode%
md %arch_dir%\%langdir%\accessCE\Wce200\x86em\smit%smitcode%

md %arch_dir%\%langdir%\accessCE\Wce211\mips\smit%smitcode%
md %arch_dir%\%langdir%\accessCE\Wce211\sh\smit%smitcode%
md %arch_dir%\%langdir%\accessCE\Wce211\sh4\smit%smitcode%
md %arch_dir%\%langdir%\accessCE\Wce211\arm\smit%smitcode%
md %arch_dir%\%langdir%\accessCE\Wce211\x86em\smit%smitcode%

echo %arch_dir%\%langdir%\accessCE\smit%smitcode%
if "%kitcopy_debug%"=="1" pause



copy dapi\%bld_path%\Wce200\cedll\mips\%langdir%\access32\dectalk.dll %arch_dir%\%langdir%\accessCE\Wce200\mips\smit%smitcode%\dectalk.dll
copy dapi\%bld_path%\Wce200\cedll\sh\%langdir%\access32\dectalk.dll %arch_dir%\%langdir%\accessCE\Wce200\sh\smit%smitcode%\dectalk.dll
if "%langdir%"=="us" copy dapi\%bld_path%\Wce200\cedll\x86em\%langdir%\access32\dectalk.dll %arch_dir%\%langdir%\accessCE\Wce200\x86em\smit%smitcode%\dectalk.dll
copy tools\SMIT\SMITGEN\%bld_path%\smitxx\smit%smitcode%.c %arch_dir%\%langdir%\accessCE\Wce200\mips\smit%smitcode%
copy tools\SMIT\SMITGEN\%bld_path%\smitxx\smit%smitcode%.c %arch_dir%\%langdir%\accessCE\Wce200\sh\smit%smitcode%
copy tools\SMIT\SMITGEN\%bld_path%\smitxx\smit%smitcode%.c %arch_dir%\%langdir%\accessCE\Wce200\x86em\smit%smitcode%
copy tools\SMIT\readme.txt %arch_dir%\%langdir%\accessCE\Wce200\mips\smit%smitcode%\readme.txt
copy tools\SMIT\setup.reg %arch_dir%\%langdir%\accessCE\Wce200\mips\smit%smitcode%\setup.reg
copy tools\SMIT\docopy.bat %arch_dir%\%langdir%\accessCE\Wce200\mips\smit%smitcode%\docopy.bat
copy tools\SMIT\readme.txt %arch_dir%\%langdir%\accessCE\Wce200\sh\smit%smitcode%\readme.txt
copy tools\SMIT\setup.reg %arch_dir%\%langdir%\accessCE\Wce200\sh\smit%smitcode%\setup.reg
copy tools\SMIT\docopy.bat %arch_dir%\%langdir%\accessCE\Wce200\sh\smit%smitcode%\docopy.bat
copy tools\SMIT\readme.txt %arch_dir%\%langdir%\accessCE\Wce200\x86em\smit%smitcode%\readme.txt
copy tools\SMIT\setup.reg %arch_dir%\%langdir%\accessCE\Wce200\x86em\smit%smitcode%\setup.reg
copy tools\SMIT\docopy.bat %arch_dir%\%langdir%\accessCE\Wce200\x86em\smit%smitcode%\docopy.bat

copy dapi\%bld_path%\Wce211\cedll\mips\%langdir%\access32\dectalk.dll %arch_dir%\%langdir%\accessCE\Wce211\mips\smit%smitcode%\dectalk.dll
copy dapi\%bld_path%\Wce211\cedll\sh\%langdir%\access32\dectalk.dll %arch_dir%\%langdir%\accessCE\Wce211\sh\smit%smitcode%\dectalk.dll
copy dapi\%bld_path%\Wce211\cedll\sh4\%langdir%\access32\dectalk.dll %arch_dir%\%langdir%\accessCE\Wce211\sh4\smit%smitcode%\dectalk.dll
copy dapi\%bld_path%\Wce211\cedll\arm\%langdir%\access32\dectalk.dll %arch_dir%\%langdir%\accessCE\Wce211\arm\smit%smitcode%\dectalk.dll
if "%langdir%"=="us" copy dapi\%bld_path%\Wce211\cedll\x86em\%langdir%\access32\dectalk.dll %arch_dir%\%langdir%\accessCE\Wce211\x86em\smit%smitcode%\dectalk.dll
copy tools\SMIT\SMITGEN\%bld_path%\smitxx\smit%smitcode%.c %arch_dir%\%langdir%\accessCE\Wce211\mips\smit%smitcode%
copy tools\SMIT\SMITGEN\%bld_path%\smitxx\smit%smitcode%.c %arch_dir%\%langdir%\accessCE\Wce211\sh\smit%smitcode%
copy tools\SMIT\SMITGEN\%bld_path%\smitxx\smit%smitcode%.c %arch_dir%\%langdir%\accessCE\Wce211\sh4\smit%smitcode%
copy tools\SMIT\SMITGEN\%bld_path%\smitxx\smit%smitcode%.c %arch_dir%\%langdir%\accessCE\Wce211\arm\smit%smitcode%
copy tools\SMIT\SMITGEN\%bld_path%\smitxx\smit%smitcode%.c %arch_dir%\%langdir%\accessCE\Wce211\x86em\smit%smitcode%
copy tools\SMIT\readme.txt %arch_dir%\%langdir%\accessCE\Wce211\mips\smit%smitcode%\readme.txt
copy tools\SMIT\setup.reg %arch_dir%\%langdir%\accessCE\Wce211\mips\smit%smitcode%\setup.reg
copy tools\SMIT\docopy.bat %arch_dir%\%langdir%\accessCE\Wce211\mips\smit%smitcode%\docopy.bat
copy tools\SMIT\readme.txt %arch_dir%\%langdir%\accessCE\Wce211\sh\smit%smitcode%\readme.txt
copy tools\SMIT\setup.reg %arch_dir%\%langdir%\accessCE\Wce211\sh\smit%smitcode%\setup.reg
copy tools\SMIT\docopy.bat %arch_dir%\%langdir%\accessCE\Wce211\sh\smit%smitcode%\docopy.bat
copy tools\SMIT\readme.txt %arch_dir%\%langdir%\accessCE\Wce211\sh4\smit%smitcode%\readme.txt
copy tools\SMIT\setup.reg %arch_dir%\%langdir%\accessCE\Wce211\sh4\smit%smitcode%\setup.reg
copy tools\SMIT\docopy.bat %arch_dir%\%langdir%\accessCE\Wce211\sh4\smit%smitcode%\docopy.bat
copy tools\SMIT\readme.txt %arch_dir%\%langdir%\accessCE\Wce211\arm\smit%smitcode%\readme.txt
copy tools\SMIT\setup.reg %arch_dir%\%langdir%\accessCE\Wce211\arm\smit%smitcode%\setup.reg
copy tools\SMIT\docopy.bat %arch_dir%\%langdir%\accessCE\Wce211\arm\smit%smitcode%\docopy.bat
copy tools\SMIT\readme.txt %arch_dir%\%langdir%\accessCE\Wce211\x86em\smit%smitcode%\readme.txt
copy tools\SMIT\setup.reg %arch_dir%\%langdir%\accessCE\Wce211\x86em\smit%smitcode%\setup.reg
copy tools\SMIT\docopy.bat %arch_dir%\%langdir%\accessCE\Wce211\x86em\smit%smitcode%\docopy.bat


rem pkzip -sdectalk%smitcode% %arch_dir%\%langdir%\accessCE\smit%smitcode%\smit%smitcode%.zip %arch_dir%\%langdir%\accessCE\smit%smitcode%\*.*

pkzip -sdectalk%smitcode% %arch_dir%\%langdir%\accessCE\Wce200\mips\smit%smitcode%\smit%smitcode%.zip %arch_dir%\%langdir%\accessCE\Wce200\mips\smit%smitcode%\*.*
pkzip -sdectalk%smitcode% %arch_dir%\%langdir%\accessCE\Wce200\sh\smit%smitcode%\smit%smitcode%.zip %arch_dir%\%langdir%\accessCE\Wce200\sh\smit%smitcode%\*.*
pkzip -sdectalk%smitcode% %arch_dir%\%langdir%\accessCE\Wce200\x86em\smit%smitcode%\smit%smitcode%.zip %arch_dir%\%langdir%\accessCE\Wce200\x86em\smit%smitcode%\*.*

pkzip -sdectalk%smitcode% %arch_dir%\%langdir%\accessCE\Wce211\mips\smit%smitcode%\smit%smitcode%.zip %arch_dir%\%langdir%\accessCE\Wce211\mips\smit%smitcode%\*.*
pkzip -sdectalk%smitcode% %arch_dir%\%langdir%\accessCE\Wce211\sh\smit%smitcode%\smit%smitcode%.zip %arch_dir%\%langdir%\accessCE\Wce211\sh\smit%smitcode%\*.*
pkzip -sdectalk%smitcode% %arch_dir%\%langdir%\accessCE\Wce211\sh4\smit%smitcode%\smit%smitcode%.zip %arch_dir%\%langdir%\accessCE\Wce211\sh4\smit%smitcode%\*.*
pkzip -sdectalk%smitcode% %arch_dir%\%langdir%\accessCE\Wce211\arm\smit%smitcode%\smit%smitcode%.zip %arch_dir%\%langdir%\accessCE\Wce211\arm\smit%smitcode%\*.*
pkzip -sdectalk%smitcode% %arch_dir%\%langdir%\accessCE\Wce211\x86em\smit%smitcode%\smit%smitcode%.zip %arch_dir%\%langdir%\accessCE\Wce211\x86em\smit%smitcode%\*.*


rem NOTE: This list MUST be in reverse order to work.
rem if last, exit smitloop
if %smitcode%==en goto smitendce
rem                                           Update last entry exit, while
rem                                           New entries get added HERE!
rem next:                                     Enkidu
if %smitcode%==tk set smitcode=en
if "%kitcopy_debug%"=="1" pause


goto smitloopce

:smitendce


rem Put default back to \work\rnd\kitting or the like structure.

cd kitting

rem ------------------------------------------------
rem      End Of Customer specific SMIT/ACCESS32 "Kits"
rem ------------------------------------------------

if "%kitcopy_debug%"=="1" pause
rem **********************************************************
rem INSTALL SHIELD SETUP
rem   Copying the needed files to the install directory
rem **********************************************************

echo ***************************************************************
echo INSTALL SHIELD SETUP
echo ***************************************************************

copy ..\install\src\setup\setup.rul ..\%arch_dir%\%langdir%\install\setup
if not errorlevel 0 goto error_end
rem -- For Willow Pond kit build --
copy ..\install\src\setup\setup.rul ..\%arch_dir%\%langdir%\install\wsetup
if not errorlevel 0 goto error_end
rem -- For Windows CE kit build --
copy ..\install\src\setup\setup.rul ..\%arch_dir%\%langdir%\install\cesetup
if not errorlevel 0 goto error_end

if "%kitcopy_debug%"=="1" pause
copy ..\install\src\setup\force.bmp ..\%arch_dir%\%langdir%\install\instdec
if not errorlevel 0 goto error_end
copy license.txt ..\%arch_dir%\%langdir%\install\instdec
if not errorlevel 0 goto error_end
copy "%is3drv%%is3path%\program\uninst.exe" ..\%arch_dir%\%langdir%\install\instdec
if not errorlevel 0 goto error_end
copy "%is3drv%%is3path%\program\_isres.dll" ..\%arch_dir%\%langdir%\install\instdec
if not errorlevel 0 goto error_end
copy "%is3drv%%is3path%\program\ctl3d32.dll" ..\%arch_dir%\%langdir%\install\instdec
if not errorlevel 0 goto error_end

if "%kitcopy_debug%"=="1" pause
rem **********************************************************
rem INSTALL SHIELD -- FILE COMPRESSING
rem **********************************************************

echo ***************************************************************
echo INSTALL SHIELD -- FILE COMPRESSING
echo ***************************************************************

"%is3drv%%is3path%\program\icomp" ..\%arch_dir%\%langdir%\install\instdec\*.* ..\%arch_dir%\%langdir%\install\idisk\_setup.lib
if not errorlevel 0 goto error_end

if "%kitcopy_debug%"=="1" pause
rem **********************************************************
rem INSTALL SHIELD SETUP
rem   Copying more files to the install directory
rem **********************************************************

echo ***************************************************************
echo INSTALL SHIELD SETUP (More Files)
echo ***************************************************************

copy "%is3drv%%is3path%\program\_isdel.exe" ..\%arch_dir%\%langdir%\install\idisk
if not errorlevel 0 goto error_end
copy "%is3drv%%is3path%\program\_setup.dll" ..\%arch_dir%\%langdir%\install\idisk
if not errorlevel 0 goto error_end
copy "%is3drv%%is3path%\program\setup.exe" ..\%arch_dir%\%langdir%\install\idisk
if not errorlevel 0 goto error_end
if "%bld_mach%"=="ALPHA" goto is3_a_01
copy "%is3drv%%is3path%\program\_inst32i.ex_" ..\%arch_dir%\%langdir%\install\idisk
if "%kitcopy_debug%"=="1" pause

goto is3_01
:is3_a_01
copy "%is3drv%%is3path%\program\_inst32a.ex_" ..\%arch_dir%\%langdir%\install\idisk
:is3_01
if not errorlevel 0 goto error_end

if "%kitcopy_debug%"=="1" pause
rem compile the install script..
copy "%is3drv%%is3path%\program\compile.exe" ..\%arch_dir%\%langdir%\install\setup
if not errorlevel 0 goto error_end
copy "%is3drv%%is3path%\program\packlist.exe" ..\%arch_dir%\%langdir%\install\setup
if not errorlevel 0 goto error_end
if "%kitcopy_debug%"=="1" pause

rem -- For Willow Pond kit build --
rem compile the install script..
copy "%is3drv%%is3path%\program\compile.exe" ..\%arch_dir%\%langdir%\install\wsetup
if not errorlevel 0 goto error_end
copy "%is3drv%%is3path%\program\packlist.exe" ..\%arch_dir%\%langdir%\install\wsetup
if not errorlevel 0 goto error_end

rem -- For Windows CE kit build --
rem compile the install script..
copy "%is3drv%%is3path%\program\compile.exe" ..\%arch_dir%\%langdir%\install\cesetup
if not errorlevel 0 goto error_end
copy "%is3drv%%is3path%\program\packlist.exe" ..\%arch_dir%\%langdir%\install\cesetup
if not errorlevel 0 goto error_end


if "%kitcopy_debug%"=="1" pause
rem **********************************************************
rem INSTALL SHIELD - Final Step
rem   Compiling and splitting the files in the install directory
rem **********************************************************

echo ***************************************************************
echo BUILDING WINDOWS CE DECtalk KIT
echo ***************************************************************

cd ..\%arch_dir%\%langdir%\install\cesetup

compile setup.rul /D%dtlang% /DSAPI_MULTI_LANGUAGE_SUPPORT /D_WINDOWS_CE

if not errorlevel 0 goto error_end
rem compress all the actual kit files..
echo rem compress all the actual kit files.. 1
del ..\cedata\dectalk
if "%kitcopy_debug%"=="1" pause


"%is3drv%%is3path%\program\icomp" -i ..\cedata\*.* ..\cedata\dectalk.Z
if not errorlevel 0 goto error_end
if "%kitcopy_debug%"=="1" pause

rem split the compressed file..

rem 17-feb-1998 cjl     Change disk1 size to 600 from 700
"%is3drv%%is3path%\program\split" ..\cedata\dectalk.Z -f1370 -D1@600 -c
if not errorlevel 0 goto error_end

if "%kitcopy_debug%"=="1" pause
goto splitgo1
:a_split1
rem 17-feb-1998 cjl     Change disk1 size to 400 from 500
"%is3drv%%is3path%\program\split" ..\cedata\dectalk.Z -f1440 -D1@400 -c
if not errorlevel 0 goto error_end
:splitgo1

rem deal with the packaging list
echo 1; > setup.lst
echo ..\cedata\dectalk.Z >> setup.lst
packlist setup.lst
if not errorlevel 0 goto error_end

if "%kitcopy_debug%"=="1" pause

cd ..\..\..\..\kitting

echo **********************************************************
echo  END OF WINDOWS CE KIT BUILD
echo **********************************************************

echo ***************************************************************
echo Copy the files to their final destinations. (Windows CE)
echo ***************************************************************

copy ..\%arch_dir%\%langdir%\install\idisk\*.* ..\%arch_dir%\%langdir%\install\cedisk1
if not errorlevel 0 goto error_end
copy ..\%arch_dir%\%langdir%\install\cesetup\setup.ins ..\%arch_dir%\%langdir%\install\cedisk1
if not errorlevel 0 goto error_end
copy ..\%arch_dir%\%langdir%\install\cesetup\setup.pkg ..\%arch_dir%\%langdir%\install\cedisk1
if not errorlevel 0 goto error_end
copy ..\%arch_dir%\%langdir%\install\cesetup\dectalk.1 ..\%arch_dir%\%langdir%\install\cedisk1
echo disk1 > ..\%arch_dir%\%langdir%\install\cedisk1\disk1.id
if not errorlevel 0 goto error_end
copy ..\%arch_dir%\%langdir%\install\cesetup\dectalk.2 ..\%arch_dir%\%langdir%\install\cedisk2
echo disk2 > ..\%arch_dir%\%langdir%\install\cedisk2\disk2.id
if not errorlevel 0 goto error_end
copy ..\%arch_dir%\%langdir%\install\cesetup\dectalk.3 ..\%arch_dir%\%langdir%\install\cedisk3
echo disk3 > ..\%arch_dir%\%langdir%\install\cedisk3\disk3.id
if not errorlevel 0 goto error_end


if NOT "%dtlang%"=="ENGLISH_US" goto skip_us
copy ..\%arch_dir%\%langdir%\install\cesetup\dectalk.4 ..\%arch_dir%\%langdir%\install\cedisk4
echo disk4 > ..\%arch_dir%\%langdir%\install\cedisk4\disk4.id 
:skip_us

if NOT "%dtlang%"=="ENGLISH_UK" goto skip_uk
copy ..\%arch_dir%\%langdir%\install\cesetup\dectalk.4 ..\%arch_dir%\%langdir%\install\cedisk4
echo disk4 > ..\%arch_dir%\%langdir%\install\cedisk4\disk4.id 
:skip_uk

if NOT "%dtlang%"=="GERMAN" goto skip_german
copy ..\%arch_dir%\%langdir%\install\cesetup\dectalk.4 ..\%arch_dir%\%langdir%\install\cedisk4
echo disk4 > ..\%arch_dir%\%langdir%\install\cedisk4\disk4.id 

copy ..\%arch_dir%\%langdir%\install\cesetup\dectalk.5 ..\%arch_dir%\%langdir%\install\cedisk5
echo disk5 > ..\%arch_dir%\%langdir%\install\cedisk5\disk5.id 

copy ..\%arch_dir%\%langdir%\install\cesetup\dectalk.6 ..\%arch_dir%\%langdir%\install\cedisk6
echo disk6 > ..\%arch_dir%\%langdir%\install\cedisk6\disk6.id 
:skip_german


echo ***************************************************************
echo BUILDING DECtalk KIT
echo ***************************************************************

cd ..\%arch_dir%\%langdir%\install\setup

compile setup.rul /D%dtlang% /DSAPI_MULTI_LANGUAGE_SUPPORT
if not errorlevel 0 goto error_end
rem compress all the actual kit files..
echo rem compress all the actual kit files.. 1
del ..\data\dectalk.Z
if "%kitcopy_debug%"=="1" pause

"%is3drv%%is3path%\program\icomp" -i ..\data\*.* ..\data\dectalk.Z
if not errorlevel 0 goto error_end
if "%kitcopy_debug%"=="1" pause

rem split the compressed file..

if "%bld_mach%"=="ALPHA" goto a_split1
rem 17-feb-1998 cjl     Change disk1 size to 600 from 700
"%is3drv%%is3path%\program\split" ..\data\dectalk.Z -f1370 -D1@600 -c
if not errorlevel 0 goto error_end

if "%kitcopy_debug%"=="1" pause
goto splitgo1
:a_split1
rem 17-feb-1998 cjl     Change disk1 size to 400 from 500
"%is3drv%%is3path%\program\split" ..\data\dectalk.Z -f1440 -D1@400 -c
if not errorlevel 0 goto error_end
:splitgo1

rem deal with the packaging list
echo 1; > setup.lst
echo ..\data\dectalk.Z >> setup.lst
packlist setup.lst
if not errorlevel 0 goto error_end

if "%kitcopy_debug%"=="1" pause

cd ..\..\..\..\kitting

rem **********************************************************
rem Copy the files to their final destinations.
rem **********************************************************

echo ***************************************************************
echo Copy the files to their final destinations.
echo ***************************************************************

copy ..\%arch_dir%\%langdir%\install\idisk\*.* ..\%arch_dir%\%langdir%\install\disk1
if not errorlevel 0 goto error_end
copy ..\%arch_dir%\%langdir%\install\setup\setup.ins ..\%arch_dir%\%langdir%\install\disk1
if not errorlevel 0 goto error_end
copy ..\%arch_dir%\%langdir%\install\setup\setup.pkg ..\%arch_dir%\%langdir%\install\disk1
if not errorlevel 0 goto error_end
copy ..\%arch_dir%\%langdir%\install\setup\dectalk.1 ..\%arch_dir%\%langdir%\install\disk1
echo disk1 > ..\%arch_dir%\%langdir%\install\disk1\disk1.id
if not errorlevel 0 goto error_end
copy ..\%arch_dir%\%langdir%\install\setup\dectalk.2 ..\%arch_dir%\%langdir%\install\disk2
echo disk2 > ..\%arch_dir%\%langdir%\install\disk2\disk2.id
if not errorlevel 0 goto error_end
copy ..\%arch_dir%\%langdir%\install\setup\dectalk.3 ..\%arch_dir%\%langdir%\install\disk3
echo disk3 > ..\%arch_dir%\%langdir%\install\disk3\disk3.id


rem **********************************************************
rem INSTALL SHIELD - Final Step -- For Willow Pond
rem   Compiling and splitting the files in the install directory
rem **********************************************************

echo ***************************************************************
echo BUILDING DECtalk (WILLOWPOND) KIT
echo ***************************************************************

cd ..\%arch_dir%\%langdir%\install\wsetup

compile setup.rul /D%dtlang% /D_WILLOWPOND /DSAPI_MULTI_LANGUAGE_SUPPORT
if not errorlevel 0 goto error_end
rem compress all the actual kit files..
echo rem compress all the actual kit files.. 2
del ..\wdata\dectalk.Z
if "%kitcopy_debug%"=="1" pause

"%is3drv%%is3path%\program\icomp" -i ..\wdata\*.* ..\wdata\dectalk.Z
if not errorlevel 0 goto error_end
rem split the compressed file..

if "%bld_mach%"=="ALPHA" goto a_split3
rem 17-feb-1998 cjl     Change disk1 size to 600 from 700
"%is3drv%%is3path%\program\split" ..\wdata\dectalk.Z -f1370 -D1@600 -c
if not errorlevel 0 goto error_end
if "%kitcopy_debug%"=="1" pause

goto splitgo3
:a_split3
rem 17-feb-1998 cjl     Change disk1 size to 400 from 500
"%is3drv%%is3path%\program\split" ..\wdata\dectalk.Z -f1440 -D1@400 -c
if not errorlevel 0 goto error_end
:splitgo3

rem deal with the packaging list
echo 1; > setup.lst
echo ..\wdata\dectalk.Z >> setup.lst
packlist setup.lst
if not errorlevel 0 goto error_end

if "%kitcopy_debug%"=="1" pause
rem go back..
cd ..\..\..\..\kitting
rem **********************************************************
rem Copy the files to their final destinations.
rem **********************************************************

echo ***************************************************************
echo Copy the files to their final destinations.
echo ***************************************************************

copy ..\%arch_dir%\%langdir%\install\idisk\*.* ..\%arch_dir%\%langdir%\install\disk1
if not errorlevel 0 goto error_end
copy ..\%arch_dir%\%langdir%\install\setup\setup.ins ..\%arch_dir%\%langdir%\install\disk1
if not errorlevel 0 goto error_end
copy ..\%arch_dir%\%langdir%\install\setup\setup.pkg ..\%arch_dir%\%langdir%\install\disk1
if not errorlevel 0 goto error_end
copy ..\%arch_dir%\%langdir%\install\setup\dectalk.1 ..\%arch_dir%\%langdir%\install\disk1
echo disk1 > ..\%arch_dir%\%langdir%\install\disk1\disk1.id
if not errorlevel 0 goto error_end
copy ..\%arch_dir%\%langdir%\install\setup\dectalk.2 ..\%arch_dir%\%langdir%\install\disk2
echo disk2 > ..\%arch_dir%\%langdir%\install\disk2\disk2.id
if not errorlevel 0 goto error_end
copy ..\%arch_dir%\%langdir%\install\setup\dectalk.3 ..\%arch_dir%\%langdir%\install\disk3
echo disk3 > ..\%arch_dir%\%langdir%\install\disk3\disk3.id

goto alpbypa2

if not errorlevel 0 goto error_end

if NOT "%bld_mach%"=="ALPHA" goto alpbypa2
if "%dtlang%"=="GERMAN" copy ..\%arch_dir%\%langdir%\install\setup\dectalk.4 ..\%arch_dir%\%langdir%\install\disk4
if "%dtlang%"=="GERMAN" echo disk4 > ..\%arch_dir%\%langdir%\install\disk4\disk4.id
if "%dtlang%"=="GERMAN" copy ..\%arch_dir%\%langdir%\install\cesetup\dectalk.4 ..\%arch_dir%\%langdir%\install\cedisk4
if "%dtlang%"=="GERMAN" echo disk4 > ..\%arch_dir%\%langdir%\install\cedisk4\disk4.id
:alpbypa2
if not errorlevel 0 goto error_end
if "%kitcopy_debug%"=="1" pause

rem uncompressed stuff..? (this may have to change)
copy readme.txt ..\%arch_dir%\%langdir%\install\disk1
if not errorlevel 0 goto error_end
copy appendix1.txt ..\%arch_dir%\%langdir%\install\disk1
if not errorlevel 0 goto error_end
copy appendix2.txt ..\%arch_dir%\%langdir%\install\disk1
if not errorlevel 0 goto error_end
rem 22oct97  cjl   Add Appendix3.txt to the sdk disk1.
copy appendix3.txt ..\%arch_dir%\%langdir%\install\disk1
if not errorlevel 0 goto error_end
rem 22may98  cjl   Add Appendix4.txt to the sdk disk1.
copy appendix4.txt ..\%arch_dir%\%langdir%\install\disk1
if not errorlevel 0 goto error_end
copy ..\help\dtkmsapi.txt ..\%arch_dir%\%langdir%\install\disk1
if not errorlevel 0 goto error_end

copy readme.txt ..\%arch_dir%\%langdir%\install\cedisk1
if not errorlevel 0 goto error_end
copy appendix1.txt ..\%arch_dir%\%langdir%\install\cedisk1
if not errorlevel 0 goto error_end
copy appendix2.txt ..\%arch_dir%\%langdir%\install\cedisk1
if not errorlevel 0 goto error_end
rem 22oct97  cjl   Add Appendix3.txt to the sdk cedisk1.
copy appendix3.txt ..\%arch_dir%\%langdir%\install\cedisk1
if not errorlevel 0 goto error_end
rem 22may98  cjl   Add Appendix4.txt to the sdk cedisk1.
copy appendix4.txt ..\%arch_dir%\%langdir%\install\cedisk1
if not errorlevel 0 goto error_end

if "%kitcopy_debug%"=="1" pause
rem **********************************************************
rem Copy the files to their final destinations.
rem -- For Willow Pond kit build --
rem **********************************************************

echo ***************************************************************
echo Copy the files to their final destinations. (Willow Pond)
echo ***************************************************************

copy ..\%arch_dir%\%langdir%\install\idisk\*.* ..\%arch_dir%\%langdir%\install\wdisk1
if not errorlevel 0 goto error_end
copy ..\%arch_dir%\%langdir%\install\wsetup\setup.ins ..\%arch_dir%\%langdir%\install\wdisk1\setup.ins
if not errorlevel 0 goto error_end
copy ..\%arch_dir%\%langdir%\install\wsetup\setup.pkg ..\%arch_dir%\%langdir%\install\wdisk1
if not errorlevel 0 goto error_end
copy ..\%arch_dir%\%langdir%\install\wsetup\dectalk.1 ..\%arch_dir%\%langdir%\install\wdisk1
echo disk1 > ..\%arch_dir%\%langdir%\install\wdisk1\disk1.id
if not errorlevel 0 goto error_end
copy ..\%arch_dir%\%langdir%\install\wsetup\dectalk.2 ..\%arch_dir%\%langdir%\install\wdisk2
echo disk2 > ..\%arch_dir%\%langdir%\install\wdisk2\disk2.id
if not errorlevel 0 goto error_end
rem if "%kitcopy_debug%"=="1" pause

rem uncompressed stuff..? (this may have to change)
copy readme.txt ..\%arch_dir%\%langdir%\install\wdisk1
if not errorlevel 0 goto error_end
copy appendix1.txt ..\%arch_dir%\%langdir%\install\wdisk1
if not errorlevel 0 goto error_end
copy appendix2.txt ..\%arch_dir%\%langdir%\install\wdisk1
if not errorlevel 0 goto error_end
rem 22oct97  cjl   Add Appendix3.txt to the sdk disk1.
copy appendix3.txt ..\%arch_dir%\%langdir%\install\wdisk1
if not errorlevel 0 goto error_end
rem 22may98  cjl   Add Appendix4.txt to the sdk disk1.
copy appendix4.txt ..\%arch_dir%\%langdir%\install\wdisk1
if not errorlevel 0 goto error_end
copy ..\help\dtkmsapi.txt ..\%arch_dir%\%langdir%\install\wdisk1
if not errorlevel 0 goto error_end


if "%kitcopy_debug%"=="1" pause
rem *****************************************************
rem arch_dir\lock_mgr
rem arch_dir\lock_mgr\standard
rem arch_dir\lock_mgr\wpond
rem *****************************************************

echo ***************************************************************
echo Copy the lock manager stuff into place
echo ***************************************************************

copy ..\license\liceninc\%bld_path%\licenin1\release\*.exe ..\%arch_dir%\lock_mgr\standard
if not errorlevel 0 goto error_end
copy ..\license\liceninc\%bld_path%\licenin3\release\*.exe ..\%arch_dir%\lock_mgr\standard
if not errorlevel 0 goto error_end
copy ..\license\liceninc\%bld_path%\licenin7\release\*.exe ..\%arch_dir%\lock_mgr\standard
if not errorlevel 0 goto error_end
copy ..\license\licenseu\%bld_path%\release\*.exe ..\%arch_dir%\lock_mgr\standard
if not errorlevel 0 goto error_end
if "%kitcopy_debug%"=="1" pause

copy ..\license\liceninc\%wpbld_path%\licenin1\release\*.exe ..\%arch_dir%\lock_mgr\wpond
if not errorlevel 0 goto error_end
copy ..\license\liceninc\%wpbld_path%\licenin3\release\*.exe ..\%arch_dir%\lock_mgr\wpond
if not errorlevel 0 goto error_end
copy ..\license\liceninc\%wpbld_path%\licenin7\release\*.exe ..\%arch_dir%\lock_mgr\wpond
if not errorlevel 0 goto error_end
copy ..\license\licenseu\%wpbld_path%\release\*.exe ..\%arch_dir%\lock_mgr\wpond
if not errorlevel 0 goto error_end

goto exit


rem *****************************************************
rem THIS IS THE ML KITTING AREA
rem *****************************************************

echo ***************************************************************
echo THIS IS THE ML KITTING AREA
echo ***************************************************************

:ml_kits
md ..\%arch_dir%
md ..\%arch_dir%\%langdir%
md ..\%arch_dir%\%langdir%\install
md ..\%arch_dir%\%langdir%\install\data
md ..\%arch_dir%\%langdir%\install\data\as_is
md ..\%arch_dir%\%langdir%\install\data\as_is\%syslangdir%
md ..\%arch_dir%\%langdir%\install\data\as_is\patch
md ..\%arch_dir%\%langdir%\install\data\as_is\samples
md ..\%arch_dir%\%langdir%\install\data\as_is\samples\vercheck
md ..\%arch_dir%\%langdir%\install\data\as_is\samples\mldemo
md ..\%arch_dir%\%langdir%\install\data\as_is\samples\mldemo\res
md ..\%arch_dir%\%langdir%\install\data\program
md ..\%arch_dir%\%langdir%\install\data\sprogram
md ..\%arch_dir%\%langdir%\install\data\as_is\include
md ..\%arch_dir%\%langdir%\install\instdec
md ..\%arch_dir%\%langdir%\install\idisk
md ..\%arch_dir%\%langdir%\install\setup
md ..\%arch_dir%\%langdir%\install\disk1


rem md ..\%arch_dir%\%langdir%\install\cedata\as_is\%syslangdir%
md ..\%arch_dir%\%langdir%\install\cedata
md ..\%arch_dir%\%langdir%\install\cedata\as_is
md ..\%arch_dir%\%langdir%\install\cedata\as_is\include
md ..\%arch_dir%\%langdir%\install\cedisk1
md ..\%arch_dir%\%langdir%\install\cesetup

md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%syslangdir%
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%syslangdir%\mips
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%syslangdir%\sh
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%syslangdir%\x86em
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample\bin
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample\bin\mips\%syslangdir%
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample\bin\sh\%syslangdir%
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample\bin\x86em\%syslangdir%


md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\%syslangdir%
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\%syslangdir%\arm
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\%syslangdir%\x86em
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\%syslangdir%\sh
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\%syslangdir%\sh4
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\%syslangdir%\mips
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\dtsample
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\dtsample\bin
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\dtsample\bin\arm\%syslangdir%
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\dtsample\bin\x86em\%syslangdir%
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\dtsample\bin\sh\%syslangdir%
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\dtsample\bin\sh4\%syslangdir%
md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\dtsample\bin\mips\%syslangdir%



if "%kitcopy_debug%"=="1" pause
rem *****************************************************
rem arch_dir\language\INSTALL\DATA\SAMPLEML\MLDEMO
rem This component has no Language specific SOURCE
rem *****************************************************

echo ***************************************************************
echo arch_dir\language\INSTALL\DATA\SAMPLEML\MLDEMO
echo ***************************************************************

rem give source codes and exe
copy ..\sampleml\mldemo\res\*.* ..\%arch_dir%\%langdir%\install\data\as_is\samples\mldemo\res
if not errorlevel 0 goto error_end
copy ..\sampleml\mldemo\*.* ..\%arch_dir%\%langdir%\install\data\as_is\samples\mldemo
if not errorlevel 0 goto error_end
copy ..\sampleml\mldemo\%bld_path%\release\*.exe ..\%arch_dir%\%langdir%\install\data\program
if not errorlevel 0 goto error_end

if "%kitcopy_debug%"=="1" pause
rem *****************************************************
rem arch_dir\language\INSTALL\DATA\SAMPLEML\ENVPATCH
rem *****************************************************

echo ***************************************************************
echo arch_dir\language\INSTALL\DATA\SAMPLEML\ENVPATCH
echo ***************************************************************

copy ..\sampleml\envpatch\%bld_path%\release\envpatch.exe ..\%arch_dir%\%langdir%\install\data\program
if not errorlevel 0 goto error_end
copy ..\sampleml\envpatch\%bld_path%\release\envpatch.exe ..\%arch_dir%\%langdir%\install\data\as_is\patch
if not errorlevel 0 goto error_end


if "%kitcopy_debug%"=="1" pause
rem *****************************************************
rem arch_dir\language\INSTALL\DATA\SAMPLES\VERCHECK
rem This component has no Language specific SOURCE
rem *****************************************************

echo ***************************************************************
echo arch_dir\language\INSTALL\DATA\SAMPLES\VERCHECK
echo ***************************************************************

rem we do send the vercheck sources and exe, no objs per meeting 5/13/97 ckl
copy ..\samples\vercheck\*.* ..\%arch_dir%\%langdir%\install\data\as_is\samples\vercheck
if not errorlevel 0 goto error_end
copy ..\samples\vercheck\%bld_path%\release\*.exe ..\%arch_dir%\%langdir%\install\data\as_is\samples\vercheck
if not errorlevel 0 goto error_end
copy ..\samples\vercheck\%bld_path%\release\vercheck.exe ..\%arch_dir%\%langdir%\install\data\program
if not errorlevel 0 goto error_end

rem *****************************************************
rem dectalk.lib and dectalk.dll goes together
rem *****************************************************

echo ***************************************************************
echo dectalk.lib and dectalk.dll goes together ML
echo ***************************************************************

copy ..\dtalkml\%bld_path%\release\dectalk.lib ..\%arch_dir%\%langdir%\install\data\as_is\%syslangdir%
if not errorlevel 0 goto error_end
rem windows, windows\system area
copy ..\dtalkml\%bld_path%\release\dectalk.dll ..\%arch_dir%\%langdir%\install\data\sprogram
if not errorlevel 0 goto error_end


copy ..\dtalkml\%bld_path%\Wce200\x86em\release\dectalk.dll ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%syslangdir%\x86em
copy ..\dtalkml\%bld_path%\Wce200\x86em\release\dectalk.lib ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%syslangdir%\x86em
copy ..\dtalkml\%bld_path%\Wce200\sh\release\dectalk.dll ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%syslangdir%\sh
copy ..\dtalkml\%bld_path%\Wce200\sh\release\dectalk.lib ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%syslangdir%\sh
copy ..\dtalkml\%bld_path%\Wce200\mips\release\dectalk.dll ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%syslangdir%\mips
copy ..\dtalkml\%bld_path%\Wce200\mips\release\dectalk.lib ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%syslangdir%\mips

copy ..\dtalkml\%bld_path%\Wce211\x86em\release\dectalk.dll ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\%syslangdir%\x86em
copy ..\dtalkml\%bld_path%\Wce211\x86em\release\dectalk.lib ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\%syslangdir%\x86em
copy ..\dtalkml\%bld_path%\Wce211\arm\release\dectalk.dll ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\%syslangdir%\arm
copy ..\dtalkml\%bld_path%\Wce211\arm\release\dectalk.lib ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\%syslangdir%\arm
copy ..\dtalkml\%bld_path%\Wce211\sh\release\dectalk.dll ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\%syslangdir%\sh
copy ..\dtalkml\%bld_path%\Wce211\sh\release\dectalk.lib ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\%syslangdir%\sh
copy ..\dtalkml\%bld_path%\Wce211\sh4\release\dectalk.dll ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\%syslangdir%\sh4
copy ..\dtalkml\%bld_path%\Wce211\sh4\release\dectalk.lib ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\%syslangdir%\sh4
copy ..\dtalkml\%bld_path%\Wce211\mips\release\dectalk.dll ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\%syslangdir%\mips
copy ..\dtalkml\%bld_path%\Wce211\mips\release\dectalk.lib ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\%syslangdir%\mips
if not errorlevel 0 goto error_end

copy ..\samplece\dtsample\%bld_path%\Wce200\dll\mips\us\release\*.exe    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample\bin\mips\%syslangdir%
copy ..\samplece\dtsample\%bld_path%\Wce200\dll\sh\us\release\*.exe    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample\bin\sh\%syslangdir%
copy ..\samplece\dtsample\%bld_path%\Wce200\dll\x86em\us\release\*.exe ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample\bin\x86em\%syslangdir%

copy ..\samplece\dtsample\%bld_path%\Wce211\dll\arm\us\release\*.exe    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\dtsample\bin\arm\%syslangdir%
copy ..\samplece\dtsample\%bld_path%\Wce211\dll\x86em\us\release\*.exe ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\dtsample\bin\x86em\%syslangdir%
copy ..\samplece\dtsample\%bld_path%\Wce211\dll\sh\us\release\*.exe    ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\dtsample\bin\sh\%syslangdir%
copy ..\samplece\dtsample\%bld_path%\Wce211\dll\sh4\us\release\*.exe ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\dtsample\bin\sh4\%syslangdir%
copy ..\samplece\dtsample\%bld_path%\Wce211\dll\mips\us\release\*.exe ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\samples\dtsample\bin\mips\%syslangdir%

if "%kitcopy_debug%"=="1" pause
rem *****************************************************
rem ttsapi.h & ttsfeat.h to \include directory.
rem *****************************************************

echo ***************************************************************
echo ttsapi.h & ttsfeat.h to \include directory.
echo ***************************************************************

copy ..\dapi\src\api\ttsapi.h ..\%arch_dir%\%langdir%\install\data\as_is\include
copy ..\dapi\src\api\ttsfeat.h ..\%arch_dir%\%langdir%\install\data\as_is\include
if not errorlevel 0 goto error_end

copy ..\dapi\src\api\ttsapi.h ..\%arch_dir%\%langdir%\install\cedata\as_is\include
copy ..\dapi\src\api\ttsfeat.h ..\%arch_dir%\%langdir%\install\cedata\as_is\include
if not errorlevel 0 goto error_end

rem <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

if "%kitcopy_debug%"=="1" pause

rem **********************************************************
rem INSTALL SHIELD SETUP
rem   Copying the needed files to the install directory
rem **********************************************************

echo ***************************************************************
echo INSTALL SHIELD SETUP
echo ***************************************************************

copy ..\install\src\setup\setup.rul ..\%arch_dir%\%langdir%\install\cesetup
if not errorlevel 0 goto error_end
copy ..\install\src\setup\setup.rul ..\%arch_dir%\%langdir%\install\setup
if not errorlevel 0 goto error_end

if "%kitcopy_debug%"=="1" pause
copy ..\install\src\setup\force.bmp ..\%arch_dir%\%langdir%\install\instdec
if not errorlevel 0 goto error_end
copy license.txt ..\%arch_dir%\%langdir%\install\instdec
if not errorlevel 0 goto error_end
copy "%is3drv%%is3path%\program\uninst.exe" ..\%arch_dir%\%langdir%\install\instdec
if not errorlevel 0 goto error_end
copy "%is3drv%%is3path%\program\_isres.dll" ..\%arch_dir%\%langdir%\install\instdec
if not errorlevel 0 goto error_end
copy "%is3drv%%is3path%\program\ctl3d32.dll" ..\%arch_dir%\%langdir%\install\instdec
if not errorlevel 0 goto error_end


rem **********************************************************
rem INSTALL SHIELD -- FILE COMPRESSING
rem **********************************************************

echo ***************************************************************
echo INSTALL SHIELD -- FILE COMPRESSING
echo ***************************************************************

"%is3drv%%is3path%\program\icomp" ..\%arch_dir%\%langdir%\install\instdec\*.* ..\%arch_dir%\%langdir%\install\idisk\_setup.lib
if not errorlevel 0 goto error_end

if "%kitcopy_debug%"=="1" pause
rem **********************************************************
rem INSTALL SHIELD SETUP
rem   Copying more files to the install directory
rem **********************************************************

echo ***************************************************************
echo INSTALL SHIELD SETUP (More Files)
echo ***************************************************************

copy "%is3drv%%is3path%\program\_isdel.exe" ..\%arch_dir%\%langdir%\install\idisk
if not errorlevel 0 goto error_end
copy "%is3drv%%is3path%\program\_setup.dll" ..\%arch_dir%\%langdir%\install\idisk
if not errorlevel 0 goto error_end
copy "%is3drv%%is3path%\program\setup.exe" ..\%arch_dir%\%langdir%\install\idisk
if not errorlevel 0 goto error_end
set instfile="_inst32i.ex_"
if "%bld_mach%"=="ALPHA" set instfile="_inst32a.ex_"
copy "%is3drv%%is3path%\program\%instfile%" ..\%arch_dir%\%langdir%\install\idisk
if not errorlevel 0 goto error_end

if "%kitcopy_debug%"=="1" pause
rem compile the install script..
copy "%is3drv%%is3path%\program\compile.exe" ..\%arch_dir%\%langdir%\install\setup
if not errorlevel 0 goto error_end
copy "%is3drv%%is3path%\program\packlist.exe" ..\%arch_dir%\%langdir%\install\setup
if not errorlevel 0 goto error_end


rem compile the install script..
copy "%is3drv%%is3path%\program\compile.exe" ..\%arch_dir%\%langdir%\install\cesetup
if not errorlevel 0 goto error_end
copy "%is3drv%%is3path%\program\packlist.exe" ..\%arch_dir%\%langdir%\install\cesetup
if not errorlevel 0 goto error_end


if "%kitcopy_debug%"=="1" pause
rem **********************************************************
rem INSTALL SHIELD - Final Step
rem   Compiling and splitting the files in the install directory
rem **********************************************************

echo ***************************************************************
echo BUILDING WINDOWS CE DECtalk KIT
echo ***************************************************************

cd ..\%arch_dir%\%langdir%\install\cesetup

compile setup.rul /D_MULTI_LANG /D_WINDOWS_CE

if not errorlevel 0 goto error_end
rem compress all the actual kit files..
del ..\cedata\dectalk.Z
if "%kitcopy_debug%"=="1" pause

echo rem compress all the actual kit files.. 3
"%is3drv%%is3path%\program\icomp" -i ..\cedata\*.* ..\cedata\dectalk.Z
if not errorlevel 0 goto error_end
rem don't split ML files

if "%bld_mach%"=="ALPHA" goto a_mlspt1
rem 17-feb-1998 cjl     Change disk1 size to 1000 from 5000
"%is3drv%%is3path%\program\split" ..\cedata\dectalk.Z -f1370 -D1@1000 -c
if not errorlevel 0 goto error_end
if "%kitcopy_debug%"=="1" pause

goto splitml1
:a_mlspt1
rem 17-feb-1998 cjl     Change disk1 size for Alpha to 1000 from 500
"%is3drv%%is3path%\program\split" ..\cedata\dectalk.Z -f1440 -D1@1000 -c
if not errorlevel 0 goto error_end
if "%kitcopy_debug%"=="1" pause

:splitml1

rem deal with the packaging list
echo 1; > setup.lst
echo ..\cedata\dectalk.Z >> setup.lst
packlist setup.lst
if not errorlevel 0 goto error_end

if "%kitcopy_debug%"=="1" pause
rem go back..

cd ..\..\..\..\kitting


if "%kitcopy_debug%"=="1" pause

echo **********************************************************
echo  END OF WINDOWS CE KIT BUILD
echo **********************************************************

echo ***************************************************************
echo Copy the files to their final destinations.
echo ***************************************************************

copy ..\%arch_dir%\%langdir%\install\idisk\*.* ..\%arch_dir%\%langdir%\install\cedisk1
if not errorlevel 0 goto error_end
copy ..\%arch_dir%\%langdir%\install\cesetup\setup.ins ..\%arch_dir%\%langdir%\install\cedisk1
if not errorlevel 0 goto error_end
copy ..\%arch_dir%\%langdir%\install\cesetup\setup.pkg ..\%arch_dir%\%langdir%\install\cedisk1
if not errorlevel 0 goto error_end
copy ..\%arch_dir%\%langdir%\install\cesetup\dectalk.1 ..\%arch_dir%\%langdir%\install\cedisk1
echo disk1 > ..\%arch_dir%\%langdir%\install\cedisk1\disk1.id
if not errorlevel 0 goto error_end


echo ***************************************************************
echo BUILDING DECtalk KIT 2
echo ***************************************************************


cd ..\%arch_dir%\%langdir%\install\setup

compile setup.rul /D_MULTI_LANG

if not errorlevel 0 goto error_end
rem compress all the actual kit files..
del ..\data\dectalk.Z
if "%kitcopy_debug%"=="1" pause

echo rem compress all the actual kit files.. 3
"%is3drv%%is3path%\program\icomp" -i ..\data\*.* ..\data\dectalk.Z
if not errorlevel 0 goto error_end
rem don't split ML files

if "%bld_mach%"=="ALPHA" goto a_mlspt1
rem 17-feb-1998 cjl     Change disk1 size to 1000 from 5000
"%is3drv%%is3path%\program\split" ..\data\dectalk.Z -f1370 -D1@1000 -c
if not errorlevel 0 goto error_end
if "%kitcopy_debug%"=="1" pause

goto splitml1
:a_mlspt1
rem 17-feb-1998 cjl     Change disk1 size for Alpha to 1000 from 500
"%is3drv%%is3path%\program\split" ..\data\dectalk.Z -f1440 -D1@1000 -c
if not errorlevel 0 goto error_end
if "%kitcopy_debug%"=="1" pause

:splitml1

rem deal with the packaging list
echo 1; > setup.lst
echo ..\data\dectalk.Z >> setup.lst
packlist setup.lst
if not errorlevel 0 goto error_end


if "%kitcopy_debug%"=="1" pause
rem go back..
cd ..\..\..\..\kitting

rem **********************************************************
rem Copy the files to their final destinations.
rem **********************************************************

echo ***************************************************************
echo Copy the files to their final destinations.
echo ***************************************************************

copy ..\%arch_dir%\%langdir%\install\idisk\*.* ..\%arch_dir%\%langdir%\install\disk1
if not errorlevel 0 goto error_end
copy ..\%arch_dir%\%langdir%\install\setup\setup.ins ..\%arch_dir%\%langdir%\install\disk1
if not errorlevel 0 goto error_end
copy ..\%arch_dir%\%langdir%\install\setup\setup.pkg ..\%arch_dir%\%langdir%\install\disk1
if not errorlevel 0 goto error_end
copy ..\%arch_dir%\%langdir%\install\setup\dectalk.1 ..\%arch_dir%\%langdir%\install\disk1
echo disk1 > ..\%arch_dir%\%langdir%\install\disk1\disk1.id
if not errorlevel 0 goto error_end

rem <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

REM DONE!!!

goto exit

:noargs
echo NOTE:
echo ------------------------------------------------
echo      Usage: kitcopy version id language clean
echo ------------------------------------------------

:error_end
echo Error in BUILD process: KitCopy.BAT *****************************
goto end

:exit
echo ***** BUILD process: KitCopy.BAT COMPLETED SUCCESSFULLY *****

:end

