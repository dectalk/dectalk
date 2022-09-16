@echo off
set hardebug=0
rem ***************************************************************
rem File Name:          HARDMAK.BAT
rem File Created:       04-FEB-1997
rem File Author:        Trung Ly
rem File Purpose:       Prepare the \release directory for a flat 16-bit build.
rem ***************************************************************
rem ATTENTION! - make _sure_ that setvar.bat is set up correctly or 
rem     this build process has NO chance of working.
rem     This file will copy all needed files from the subdirectories
rem     of \hardware\src and the subdirectories of \dapi\src.
rem 	This file should only be run from the \hardware\src directory!
rem ***************************************************************
rem Known Bugs:
rem     1)when build fails hardmak.bat exits to strange directories.
rem ***************************************************************
rem Revisions:
rem     02/04/97  tql   File created.  Added wildcard copy's.
rem     02/07/97  tql   Added multi-language and multi-product support.
rem     02/10/97  tql   Added multiple support of \release directories.
rem                       Currently, 9 \release directories can be made,
rem                       3 products times 3 languages.
rem     02/17/97  tql   Added error checks and setvar.bat support.
rem     02/24/97  tql   Extensive changes to enable DTExpress and Embedded builds.
rem     02/27/97  tql   Added copy option so that the builder doesn't always
rem                       have to copy all the source files over to the directory.
rem     02/27/97  tql   Added clean option so that the builder can get rid
rem                       of the source files from the release directory.
rem     02/28/97  tql   Organized this file into sections and added comments.
rem     03/03/97  tql   Added English/Spanish and Spanish/English DTExpress builds.
rem     03/26/97  cjl   Force \include directory copy of l_*.h file last.
rem                       BATS#310.
rem     04/07/97  cjl   Add Appendix1 & Appendix2.txt to installs.
rem                       BATS#338.
rem     04/09/97  cjl   Now remove TTS.H from the SDK build.
rem     04/11/97  tql   Moved wildcard copy of dapi\src\ph to the end to
rem                       ensure that the correct version of phlog.c is copied.
rem                       BATS#350.
rem     05/01/97  tql   Hardmak now stops when an nmake erorr occurs.
rem                       BATS#296.
rem     05/01/97  tql   For DTEX build, pass in US_AND_SP as a CL flag.
rem                       BATS#366.
rem     06/26/97  cjl   Add support for language SPANISH_LA.
rem     08/20/97   dr   Fixed up the misspelling of the some error labels.
rem                             Also, fixed it so that if it is dtex it will
rem                                     go through only once for one language.
rem     10/27/97  cjl/dr Added NWS.
rem	11/05/97  dr    changed the nws_flags to custom_args.  Makefile NOW gets passed
rem                     a CUSTOM_ARGS argument.	 added defualt values for watcom etc.
rem	11/14/97  dr    result of fixing BAT295 HARDMAK now has defualt paths for 
rem                     the paths of our compilers and it now makes msvcdrv and msvcpath 
rem                     environment variables obsolete.
rem     12/30/97  cjl   Add ENGLISH_UK to build mix.
rem     01/21/98  jl    BAT#553 Finished ENGLISH_UK to build mix.
rem     01/22/98  jl    BAT#566 Fixed Spanish/English English/Spanish build for DTEX.
rem     01/29/98  jl    BAT#512 Deleted ENGLISH_UK files in clean option
rem     03/13/98  cjl   Add dectalkf.h to copy and clean operations.
rem     07/14/98 mfg    Added changes for SPANISH_LA and SPANISH_SP builds
rem     06/22/1998 ETT  add %platform% to variables for building of preproc.
rem	06/22/1998 ETT  add dollpars.exe to the build section for crazy make stuff.
rem     10/23/1998 GL   BATS#779 fix ENGSPAN SPANENG setup
rem     11/25/98  cjl   Fixed Paths & env vars for correct PRODMAK operation.
rem                     Also, removed hardwired cd for dollpars builds.
rem     12/02/98  cjl   Added SPANISH defined actions to be the same as SPANISH_SP.
rem     12/18/98  cjl   Added ENGLISH defined actions to be the same as ENGLISH_US.
rem     03/18/99  cjl   Add NWS Spanish (LA) to build process.
rem     03/30/99  cjl   Make all path specifications use setvar.bat settings.
rem     07/20/99  gl    fix 6.0 preproc build
rem 
rem
rem ***************************************************************
rem     This file will copy all needed files from the subdirectories
rem     of \hardware\src and the subdirectories of \dapi\src.
rem 	This file should only be run from the \hardware\src directory!
rem ***************************************************************
rem Known Bugs:
rem     1)
rem ***************************************************************


rem ********** INITIALIZE SECTION START **********

rem ET 06/22/1998 save the various paths:
set tempath=%path%
set tempincl=%INCLUDE%
set templib=%LIB%

rem If the setvar variable isn't set, set defaults for msvcdrv and msvcpath.
if NOT "%setvar%"=="" goto goodtogo
echo WARNING: Setvar not defined.
echo WARNING: Using default path(s).
set MSVC_PATH=c:\msvc
set WATCOM_PATH=c:\watcom
set PHAR_PATH=c:\phar386
set MASM_PATH=C:\masm611
set PKZIP_PATH=c:\pkzip
set MSDDRV=c:
set MSDPATH=\progra~1\devstu~1\vc98
goto skipset

:goodtogo
rem If setvar.bat was already run, don't run it again.  This causes environment problems.
if "%setvardone%"=="1" goto skipset
call %setvar%
if NOT "%setvardone%"=="1" goto seterror

:skipset
rem Call msvcvars.bat to set some need variables.
if "%vcvarsdone%"=="1" goto skipvars
call %msvc_path%\bin\msvcvars.bat
set vcvarsdone=1

:skipvars
rem Assign names to the arguments.
set prod_arg=%1
set lang_arg=%2
set voc_arg=%3
set copy_arg=%4
set clean_arg=%5
set custom_arg=%6
rem ET 06/22/1998 add command line option for platform
set platform=%7

rem default message string for error routine.
set err_mess=

rem Set defaults arguments if none are given.
if "%prod_arg%"=="" set prod_arg=DTPC2
if "%lang_arg%"=="" set lang_arg=ENGLISH_US
if "%voc_arg%"=="" set voc_arg=VOCAL
if "%copy_arg%"=="" set copy_arg=Y
if "%clean_arg%"=="" set clean_arg=N
if "%custom_arg%"=="" set custom_arg=NONE
rem ET 06/22/1998 : for preproc set platform = 'blank' for Win32 Intel
set platform= 

rem Check if the product is valid.
if "%prod_arg%"=="DTPC1" goto noerror1
if "%prod_arg%"=="DTPC2" goto noerror1
if "%prod_arg%"=="DTEX" goto noerror1
if "%prod_arg%"=="EBD08" goto noerror1
set err_mess=Product
goto error

:noerror1
rem Check if the language is valid.
if "%lang_arg%"=="ENGLISH" echo Changing ENGLISH To ENGLISH_US.
if "%lang_arg%"=="ENGLISH" set lang_arg=ENGLISH_US
if "%lang_arg%"=="ENGLISH_US" goto noerror2
if "%lang_arg%"=="ENGLISH_UK" goto noerror2
if "%lang_arg%"=="SPANISH" echo Changing SPANISH To SPANISH_SP.
if "%lang_arg%"=="SPANISH" set lang_arg=SPANISH_SP
if "%lang_arg%"=="SPANISH_SP" goto noerror2
if "%lang_arg%"=="SPANISH_LA" goto noerror2
if "%lang_arg%"=="GERMAN" goto noerror2
if "%lang_arg%"=="ENGSPAN" goto noerror2
if "%lang_arg%"=="SPANENG" goto noerror2
set err_mess=Language
goto error

:noerror2
rem Check if the vocal option is valid.
if "%voc_arg%"=="VOCAL" goto noerror3
if "%voc_arg%"=="NOVOCAL" goto noerror3
set err_mess=Vocal
goto error

:noerror3
rem Check if the copy option is valid.
if "%copy_arg%"=="y" set copy_arg=Y
if "%copy_arg%"=="Y" goto noerror4
if "%copy_arg%"=="n" set copy_arg=N
if "%copy_arg%"=="N" goto noerror4
set err_mess=Copy
goto error

:noerror4
rem Check if the clean option is valid.
if "%clean_arg%"=="y" set clean_arg=Y
if "%clean_arg%"=="Y" goto noerror5
if "%clean_arg%"=="n" set clean_arg=N
if "%clean_arg%"=="N" goto noerror5
set err_mess=Clean
goto error

:noerror5
rem Set the defaults for custom option is valid.
set cust_arg=
set cust_dir=
if "%custom_arg%"=="NWSNOAA" set voc_arg=NOVOCAL
if "%custom_arg%"=="NWSNOAA" set cust_arg= /D NWSNOAA
if "%custom_arg%"=="NWSNOAA" set cust_dir=nws_
if "%custom_arg%"=="NWSNOAA" goto noerror6
if "%custom_arg%"=="NONE" goto noerror6
set err_mess=Custom
goto error

:noerror6
rem Set the product abbreviation for DTEX and EBD08.
if "%prod_arg%"=="DTEX" set prod_short=ex
if "%prod_arg%"=="EBD08" set prod_short=eb

rem Set the language abbreviation.
if "%lang_arg%"=="ENGLISH_US" set lang_short=us
if "%lang_arg%"=="ENGLISH_UK" set lang_short=uk
if "%lang_arg%"=="SPANISH_SP" set lang_short=sp
if "%lang_arg%"=="SPANISH_LA" set lang_short=la
if "%lang_arg%"=="GERMAN" set lang_short=gr
if "%lang_arg%"=="ENGSPAN" set lang_short=ussp
if "%lang_arg%"=="SPANENG" set lang_short=spus

rem Latin American is the same as Spanish except that a define is passed in.
set lang2_arg=
if "%lang_arg%"=="SPANISH_SP" set lang2_arg= /D SPANISH
if "%lang_arg%"=="SPANISH_LA" set lang2_arg= /D SPANISH
if "%lang_arg%"=="ENGLISH_US" set lang2_arg= /D ENGLISH
if "%lang_arg%"=="ENGLISH_UK" set lang2_arg= /D ENGLISH

rem This is required for the naming of the .zip file later on.
if "%voc_arg%"=="VOCAL" set voc_short=v

rem intialize cl_flags and ml_flagsto NULL             
set cl_flags=
set ml_flags=
rem DTEX and EBD08 require these flags to be set.
if "%prod_arg%"=="DTEX" set cl_flags=/Fc /D DTEX
if "%prod_arg%"=="DTEX" if "%lang_arg%"=="ENGSPAN" set cl_flags=/Fc /D US_AND_SP
if "%prod_arg%"=="DTEX" if "%lang_arg%"=="SPANENG" set cl_flags=/Fc /D US_AND_SP
if "%prod_arg%"=="DTEX" set ml_flags=/Fl /D DTEX
if "%prod_arg%"=="EBD08" set cl_flags=/Fc /D EBD08
if "%prod_arg%"=="EBD08" if "%lang_arg%"=="ENGSPAN" set cl_flags=/Fc /D EBD08 /D US_AND_SP
if "%prod_arg%"=="EBD08" if "%lang_arg%"=="SPANENG" set cl_flags=/Fc /D EBD08 /D US_AND_SP
if "%prod_arg%"=="EBD08" set ml_flags=/Fl /D EBD08

rem ********** INITIALIZE SECTION END **********


rem ********** COPY SECTION START **********

echo.
echo Welcome to the 16-bit hardware build.
echo.
echo PRODUCT TO BUILD:   %prod_arg%.
echo LANGUAGE TO BUILD:  %lang_arg%.
echo VOCAL OPTION:       %voc_arg%.
echo COPY OPTION:        %copy_arg%.
echo CLEAN OPTION:       %clean_arg%.
echo CUSTOM OPTION:      %custom_arg%.
echo BUILD DRIVE:        %blddrv%.
echo BUILD PATH:         %bldpath%.
echo.
echo Check to see if these options are correct.
echo Press Ctrl-C to abort.

choice /T:Y,8 "8 seconds to press NO!"

if errorlevel 2 goto no
if errorlevel 1 goto yes
:no
goto stop
:yes

rem ***************************************************************
rem ETT 6/22/1998
rem Setting the drive and path
rem ***************************************************************
%blddrv%
cd %bldpath%\hardware\src

rem Create the directory structure.
mkdir %prod_arg%
mkdir %prod_arg%\%cust_dir%%lang_short%
mkdir %prod_arg%\%cust_dir%%lang_short%\release

rem Copy all necessary source files to \release unless the copy option is N.
if "%copy_arg%"=="N" goto nocopy
copy ..\..\dectalkf.h .
copy ..\..\dectalkf.h %prod_arg%\%cust_dir%%lang_short%\release
copy ..\..\dapi\src\kernel\*.* %prod_arg%\%cust_dir%%lang_short%\release
copy ..\..\dapi\src\cmd\*.* %prod_arg%\%cust_dir%%lang_short%\release
copy ..\..\dapi\src\lts\*.* %prod_arg%\%cust_dir%%lang_short%\release
copy ..\..\dapi\src\vtm\*.* %prod_arg%\%cust_dir%%lang_short%\release
copy ..\..\dapi\src\include\*.* %prod_arg%\%cust_dir%%lang_short%\release
copy ..\..\dapi\src\protos\*.* %prod_arg%\%cust_dir%%lang_short%\release
copy ..\..\dapi\src\api\*.h %prod_arg%\%cust_dir%%lang_short%\release
copy ..\..\dapi\src\NT\*.h %prod_arg%\%cust_dir%%lang_short%\release
copy ..\..\txt16bit\*.* %prod_arg%\%cust_dir%%lang_short%\release
copy lib\*.* %prod_arg%\%cust_dir%%lang_short%\release
copy misc\*.* %prod_arg%\%cust_dir%%lang_short%\release
copy dll\*.* %prod_arg%\%cust_dir%%lang_short%\release
copy console\*.* %prod_arg%\%cust_dir%%lang_short%\release
copy *.mak %prod_arg%\%cust_dir%%lang_short%\release
copy *.bat %prod_arg%\%cust_dir%%lang_short%\release
rem This was moved to ensure that dapi\src\ph\phlog.c is the file being used.
copy ..\..\dapi\src\ph\*.* %prod_arg%\%cust_dir%%lang_short%\release
rem This copy MUST be last to make sure the correct version of the file is placed
copy ..\..\dapi\src\include\l_*.h %prod_arg%\%cust_dir%%lang_short%\release
rem this is put last to make sure that the correct version of the dictionary is placed
copy ..\..\dapi\src\dic\*.* %prod_arg%\%cust_dir%%lang_short%\release

:nocopy

rem ********** COPY SECTION END *************
rem ********** BUILD SECTION START **********

rem ***************************************************************
rem * PREPROC
rem * ETT 06/22/1998 : preproc build section
rem * copied from aci.bat/prodmake with changes
rem * This component is not Language specific
rem * we need to use the nmake from msdev 5.0 for preproc!!!
rem ***************************************************************

cd ..\..\tools\preproc
mkdir build
mkdir build\release
mkdir build\release\link
if %hardebug%==1 pause

rem ETT 06/22/1998 use the paths for the 5.0 compiler/linker/etc!!!
rem *********** copied from \devstudio\vc\bin\vcvars32.bat **************
set PATH=%msddrv%%msdpath%\bin;%msddrv%%msdpath%\..\SharedIDE\bin;

rem GL 07/20/1999 use the paths for the 6.0 compiler/linker/etc!!!
rem set PATH=%msddrv%%msdpath%\bin;%msddrv%%msdpath%\..\SharedIDE\bin;
call  %msddrv%%msdpath%\bin\vcvars32.bat x86

rem %PATH%
set INCLUDE=%msddrv%%msdpath%\INCLUDE;%msddrv%%msdpath%\MFC\INCLUDE;%msddrv%%msdpath%\ATL\INCLUDE
set LIB=%msddrv%%msdpath%\LIB;%msddrv%%msdpath%\MFC\LIB
set vcvarsdone=0
if %hardebug%==1 echo PATH = %path%
if %hardebug%==1 echo INCLUDE PATH = %INCLUDE%
if %hardebug%==1 echo LIB PATH = %LIB%
if %hardebug%==1 pause

if "%clean_arg%"=="N" goto contprep
echo CLEANING: PREPROC ***********
rem C:\progra~1\devstu~1\bin\nmake /NOLOGO /F preproc.mak CFG="preproc - Win32 Release" CLEAN
%msddrv%%msdpath%\bin\nmake /NOLOGO /F preproc.mak CFG="preproc - Win32%platform%Release" CLEAN
rem nmake /NOLOGO /F preproc.mak CFG="preproc - Win32%platform%Release" CLEAN
echo DONE CLEANING
if %hardebug%==1 pause
:contprep

echo Building PREPROC.EXE ***********
rem C:\progra~1\devstu~1\bin\nmake /NOLOGO /F preproc.mak CFG="preproc - Win32 Release" .\build\release\preproc.exe
%msddrv%%msdpath%\bin\nmake /NOLOGO /F preproc.mak CFG="preproc - Win32%platform%Release" .\build\release\preproc.exe
rem nmake /NOLOGO /fpreproc.mak CFG="preproc - Win32%platform%Release" .\build\release\preproc.exe
if %hardebug%==1 pause

set path=%tempath%
rem Call msvcvars.bat to reset the paths for the 1.52 compiler/linker/etc.
if "%vcvarsdone%"=="1" goto endprepr
rem msvcvars.bat CHANGES THE PATH!!!
call %msvc_path%\bin\msvcvars.bat
set vcvarsdone=1

if NOT exist .\build\release\preproc.exe goto nmakeerr
copy .\build\release\preproc.exe %bldpath%\hardware\src\%prod_arg%\%cust_dir%%lang_short%\release
echo **** PREPROC built and copied successfully ****
if %hardebug%==1 pause
:endprepr
rem *************** PREPROC SECTION END ****************
rem *************** DOLLPARS SECTION START *************
rem cd D:\work\ad\tools\dollpars
%blddrv%
cd %bldpath%\tools\dollpars

if %hardebug%==1 echo msvcdrv = %msvcdrv%
if %hardebug%==1 echo msvcpath = %msvcpath%
if %hardebug%==1 pause

%msvcdrv%%msvcpath%\bin\cl dollpars.c
if NOT exist .\dollpars.exe goto nmakeerr
copy .\dollpars.exe %bldpath%\hardware\src\%prod_arg%\%cust_dir%%lang_short%\release
echo ****** DOLLPARS COMPILED SUCCESSFULLY ****************
if %hardebug%==1 pause
rem cd D:\work\ad\hardware\src\%prod_arg%\%cust_dir%%lang_short%\release
%blddrv%
cd %bldpath%\hardware\src\%prod_arg%\%cust_dir%%lang_short%\release

rem EBD08 is exactly the same as DTEX from this point on.
if "%prod_arg%"=="EBD08" set prod_arg=DTEX

set two_lang=
set built_twice=true

rem this stuff is is added so that we don't have to go through the build
rem twice if only one lang
if "%lang_arg%"=="ENGSPAN" set built_twice=
if "%lang_arg%"=="SPANENG" set built_twice=


if "%lang_arg%"=="ENGSPAN" set two_lang=1
if "%lang_arg%"=="SPANENG" set two_lang=2

if "%two_lang%"=="1" set lang_arg=SPANISH_LA
if "%two_lang%"=="1" set lang_short=la
if "%two_lang%"=="1" set lang2_arg= /D SPANISH

if "%two_lang%"=="2" set lang_arg=ENGLISH_US
if "%two_lang%"=="2" set lang_short=us
if "%two_lang%"=="2" set lang2_arg= /D ENGLISH

rem mfg Latin American is exactly the same as Spanish from this point on.
rem mfg  if "%lang_arg%"=="SPANISH_LA" set lang_short=la
rem mfg  if "%lang_arg%"=="SPANISH_LA" set lang_arg=SPANISH
rem if "%lang_arg%"=="SPANISH" set lang_short=sp
rem if "%lang_arg%"=="SPANISH_SP" set lang_short=sp
rem if "%lang_arg%"=="SPANISH_LA" set lang_arg=SPANISH

:build
rem To make sure we have the right loader, we rebuild it.
if "%prod_arg%"=="DTEX" if EXIST loader.obj del loader.obj
if %hardebug%==1 pause

rem This part is where the actual building takes place for all products.
echo "PRODUCT_ARGUMENT=%prod_arg%" "LANG_ARGUMENT=%lang_arg%" "COMPILER_FLAGS=%cl_flags%" "ASSEMBLER_FLAGS=%ml_flags%" "CUSTOM_ARGS=%custom_arg%" > command.tmp
nmake /NOLOGO /S /C /F dtpccjlt.mak "OUTPUT_ARGUMENT=%voc_arg%%lang2_arg%%cust_arg%" @command.tmp
del command.tmp
if %hardebug%==1 pause

rem Error check - if NMAKE fails, stop the batch file from running.
if ERRORLEVEL 1 goto nmakeerr

rem If building the Dectalk PC, we're done.
if "%prod_arg%"=="DTPC1" goto finished
if "%prod_arg%"=="DTPC2" goto finished

if "%built_twice%"=="true" goto built2
set built_twice=true

if "%two_lang%"=="1" set lang_arg=ENGLISH_US
if "%two_lang%"=="1" set lang_short=us
if "%two_lang%"=="1" set lang2_arg= /D ENGLISH

if "%two_lang%"=="2" set lang_arg=SPANISH_LA
if "%two_lang%"=="2" set lang_short=la
if "%two_lang%"=="2" set lang2_arg= /D SPANISH

del *.dep
del *.obj

goto build


:built2                              
rem This part stuffs all needed executables into pd.flr.
if %hardebug%==1 pause
nmake /NOLOGO /S /F mkpdtool.mak all 
if %hardebug%==1 pause
if ERRORLEVEL 1 goto nmakeerr
fixup -i kernel.sys -o kernel.bin -f kernel.inf -l 400 
if %hardebug%==1 pause
mkpdrom pd.bin kernel.bin -d%lang_short%dic_%lang_short%.dic lts_%lang_short%.exe ph_%lang_short%.exe cmd.exe %lang_short%.exe dtpc_850.exe 
if %hardebug%==1 pause
if "%two_lang%"=="1" mkpdrom pd.bin kernel.bin -dusdic_us.dic lts_us.exe ph_us.exe -dladic_la.dic lts_la.exe ph_la.exe cmd.exe us.exe la.exe dtpc_850.exe 
if "%two_lang%"=="2" mkpdrom pd.bin kernel.bin -dusdic_us.dic lts_la.exe ph_la.exe -dladic_la.dic lts_us.exe ph_us.exe cmd.exe la.exe us.exe dtpc_850.exe  
if %hardebug%==1 pause
bin2flr -i pd.bin -o pd.flr 
if %hardebug%==1 pause

rem Make the Express tools
nmake /NOLOGO /S /F maketool.mak all 
if ERRORLEVEL 1 goto nmakeerr
nmake /NOLOGO /S /F makecons.mak mon  
if ERRORLEVEL 1 goto nmakeerr
nmake /NOLOGO /F makeutil.mak all      
if ERRORLEVEL 1 goto nmakeerr
if %hardebug%==1 pause

rem Create header files.
echo ; DECtalk Express Speech Synthesizer > cpr.tmp
echo ; Copyright (c)1996 Digital Equipment Corporation. >> cpr.tmp
echo ; All rights reserved. >> cpr.tmp
echo ; >> cpr.tmp
cl -AC /D%lang_arg% getver.c
getver > version.txt
if %hardebug%==1 pause

rem Create the files that will be loaded onto the Express.
copy blast.flr+destart.flr out.flr
copy out.flr+pd_test2.flr out2.flr
del out.flr
if %hardebug%==1 pause

copy cpr.tmp+version.txt+pd.flr+out2.flr out.flr
ren mon.hex mon.tmp
ren fastload.hxo fastload.tmp
copy cpr.tmp+version.txt+mon.tmp mon.hex
copy cpr.tmp+version.txt+fastload.tmp fastload.hxo

if %hardebug%==1 pause
del mon.tmp
del fastload.tmp
del out2.flr

rem Create the .zip file.
if "%two_lang%"=="1" set lang_short=ussp
if "%two_lang%"=="2" set lang_short=spus
pkzip %prod_short%%voc_short%_%lang_short%.zip mfg_load.exe load.bat fastload.hxo out.flr mon.hex
if %hardebug%==1 pause

:finished
rem Show what was done in this run.
echo.
echo This 16-bit hardware build was for the following:
echo.
echo PRODUCT TO BUILD:   %prod_arg%.
echo LANGUAGE TO BUILD:  %lang_arg%.
echo VOCAL OPTION:       %voc_arg%.
echo COPY OPTION:        %copy_arg%.
echo CLEAN OPTION:       %clean_arg%.
echo CUSTOM OPTION:      %custom_arg%.
echo.

rem If the clean_arg variable is set to Y, delete all source files.
if "%clean_arg%"=="Y" goto cleanall
cd ..\..\..
goto stop

rem ********** BUILD SECTION END **********


rem ********** CLEAN SECTION START **********

:cleanall
rem This list is created by piping all the source files to a .txt file.
rem The command used was:  dir /b > files.txt
rem This was done after all source files were copied to one directory.
del dectalkf.h
del 186_macs.asm
del c_macs.asm
del create.asm
del data.asm
rem del C1.DBG
del disp.asm
del EXPRESS.C
del gate.asm
del isa.c
del isa_dma.c
del iso_char.c
del isr.asm
del kernel.asm
del loader.c
del LOADHELP.ASM
del main.c
del malloc.asm
del os.asm
del os_macs.asm
del phmath.asm
del pipe.asm
del queue.asm
del ring.asm
del sema.asm
del serial.c
del services.c
del servs.asm
del spc_driv.c
del startup.asm
del support.asm
del timer.asm
del usa.c
del Usa_init.c
del C_US_CDE.H
del cm_cdef.h
del cm_cdefi.h
del cm_char.c
del cm_chari.c
del cm_cmd.c
del cm_cmd.h
del cm_cons.h
del cm_copt.c
del cm_copt.h
del cm_data.h
del cm_def.h
del cm_defs.h
del cm_main.c
del cm_pars.c
del cm_phon.c
del cm_phon.h
del cm_prot.h
del cm_text.c
del cm_text.h
del cm_us_co.h
del cm_util.c
del cm_util.h
del cm_vars.c
del Cmd_init.c
del cmd_wav.c
del comp_dum.h
del par_ambi.c
del PAR_AMBI.TAB
del par_char.c
del par_comp.c
del par_def.h
del PAR_DICF.C
del par_dict.c
del par_pars.c
del par_rule.c
del PAR_RULE.H
del par_rule.par
del par_tab.c
del par_tabc.c
del PAR_TES.H
del PAR_TEST.H
del Par_test.par
del par_text.txt
del l_ac_con.c
del l_com_ph.h
del l_gr_ad1.c
del l_gr_con.c
del l_gr_ma1.c
del l_gr_ph.h
del l_gr_pr1.c
del l_gr_rta.c
del l_gr_ru1.c
del l_gr_sp1.c
del l_gr_suf.c
del l_sp_ad1.c
del l_sp_con.c
del l_sp_ma1.c
del l_sp_ph.h
del l_sp_pr1.c
del l_sp_ru1.c
del l_la_sp1.c
del l_la_ad1.c
del l_la_con.c
del l_la_ma1.c
del l_la_ph.h
del l_la_pr1.c
del l_la_ru1.c
del l_la_sp1.c
del l_us_ad1.c
del l_us_cha.c
del l_us_con.c
del l_us_ma1.c
del l_us_ph.h
del l_us_pr1.c
del l_us_rta.c
del l_us_ru1.c
del l_us_sp1.c
del l_us_spe.c
del l_us_suf.c
del l_uk_ad1.c
del l_uk_con.c
del l_uk_ma1.c
del l_uk_ph.h
del l_uk_pr1.c
del l_uk_rta.c
del l_uk_ru1.c
del l_uk_sp1.c
del l_uk_spe.c
del l_uk_suf.c
del loaddict.c
del ls_acna.h
del ls_adju.c
del ls_adju1.c
del ls_char.h
del ls_chari.c
del ls_cons.h
del ls_consi.c
del ls_data.h
del ls_def.h
del ls_defs.h
del ls_dict.c
del ls_dict.h
del ls_homo.c
del ls_homo.h
del ls_main.c
del ls_math.c
del ls_math1.c
del ls_proc.c
del ls_proc2.c
del ls_prot.h
del ls_rtabi.c
del ls_rule.c
del ls_rule1.c
del ls_rule2.c
del ls_spel.c
del ls_spel1.c
del ls_speli.c
del ls_suff.c
del ls_suffi.c
del ls_task.c
del ls_util.c
del LSA_ADJU.C
del lsa_coni.c
del lsa_cons.h
del lsa_fr.c
del lsa_gr.c
del lsa_ir.c
del lsa_it.c
del lsa_ja.c
del lsa_main.c
del lsa_prot.h
del lsa_rta.c
del lsa_rtbi.c
del lsa_rule.c
del lsa_sl.c
del lsa_sp.c
del lsa_task.c
del lsa_us.c
del lsa_util.c
del lsw_main.c
del mn_char.h
del p_gr_dr1.c
del p_gr_rom.c
del p_gr_sr1.c
del p_gr_st1.c
del p_gr_tim.c
del p_gr_vdf.c
del p_sp_rom.c
del p_sp_sr1.c
del p_sp_st1.c
del p_sp_sy1.c
del p_sp_tim.c
del p_la_vdf.c
del p_la_rom.c
del p_la_sr1.c
del p_la_st1.c
del p_la_sy1.c
del p_la_tim.c
del p_la_vdf.c
del p_us_rom.c
del p_us_sr1.c
del p_us_st1.c
del p_us_sy1.c
del p_us_tim.c
del p_us_vdf.c
del p_uk_rom.c
del p_uk_sr1.c
del p_uk_st1.c
del p_uk_sy1.c
del p_uk_tim.c
del p_uk_vdf.c
del ph_aloph.c
del ph_claus.c
del ph_data.h
del ph_def.h
del ph_defs.h
del ph_draw.c
del ph_draw1.c
del ph_drwt0.c
del ph_inton.c
del ph_main.c
del ph_prot.h
del ph_romi.c
del ph_setar.c
del ph_sort.c
del ph_sort1.c
del ph_sort2.c
del ph_sttr1.c
del ph_sttr2.c
del ph_syl.c
del ph_syl1.c
del ph_syntx.c
del ph_task.c
del ph_time1.c
del ph_timng.c
del ph_vdefi.c
del ph_vset.c
del phinit.c
del phlog.c
del decvoc_f.c
del decvoc_i.c
del fvtmtabl.h
del playtone.c
del samprate.h
del sinetab.h
del sync.c
del vfmd2pol.h
del vfmfiltr.h
del vfphdefs.h
del vfport.h
del viphdefs.h
del viport.h
del vismprat.h
del vtm.c
del vtm.h
del vtm_f.c
del vtm_f.h
del vtm_fdef.h
del vtm_fman.c
del vtm_i.c
del vtm_i.h
del vtm_idef.h
del vtm_iman.c
del vtmfunc.h
del vtmfunci.h
del vtminst.h
del vtmiont.c
del vtmtabf.h
del vtmtable.h
del vtmtabli.h
del 186.h
del ansi_ch.h
del audioapi.h
del audiodef.h
del cmd.h
del copyrite.c
del dectalk.h
del defs.h
del doskern.h
del esc.h
del exes.h
del ger_def.h
del ger_err.tab
del ger_phon.tab
del ger_type.tab
del la_def.h
del la_err.tab
del la_phon.tab
del la_type.tab
del hardw.h
del IMPLODE.H
del iso_char.h
del jap_phon.h
del kernel.h
del LOADER.H
del ls_feat.tab
del ls_fold.tab
del ls_lower.tab
del ls_upper.tab
del mulawi.h
del pcdt.h
del pcport.h
del PDROM.H
del personal.tab
del pipe.h
del port.h
del portd.h
del portw.h
del share.h
del spa_def.h
del spa_err.tab
del spa_phon.tab
del spa_type.tab
del spc.h
del tsr.h
del uk_def.h
del uk_phon.tab
del uk_type.tab
del usa_def.h
del usa_err.tab
del usa_phon.tab
del usa_type.tab
del versdef.h
del VERSION.H
del voc_prot.h
del cnfp.h
del dt_com_p.h
del DTDEMP.H
del DTSTARP.H
del GDTDEMP.H
del GDTSTARP.H
del kernp.h
del ldrp.h
del libp.h
del LIST.TXT
del mdemop.h
del SDTDEMP.H
del SDTSTARP.H
del STAR_USP.H
del tsrp.h
del vtm_fp.h
del vtm_ip.h
del DIC_USS.ZIP
del dic.c
del DIC.H
del dic_cnvt.c
del dic_comm.c
del dic_gr.zip
del dic_sp.zip
del dic_us.zip
del dic_uk.zip
del dic_la.zip
del USER.TAB
del DIC_LA.ZIP
del coop.h
del TTSAPI.H
del ttserr.h
del dbgwins.h
del mmalloc.h
del myalloc.h
del opatype.h
del opmmsys.h
del opthread.h
del playaud.h
del playaudd.h
del apndx_a.txt
del apndx_b.txt
del apndx_c.txt
del apndx_d.txt
del apndx_e.txt
del apndx_f.txt
del baseforg.txt
del basevorg.txt
del bbs.txt
del cd_rom.txt
del chap_1.txt
del chap_2.txt
del chap_3.txt
del chap_4.txt
del chap_5.txt
del chap_6.txt
del chap_7.txt
del cmd.txt
del command.txt
del contents.txt
del develop.txt
del dialogic.doc
del dialogic.txt
del dict_utl.txt
del digitize.txt
del dll.txt
del dll.wri
del dll_demo.txt
del dll_inst.txt
del dt_specs.txt
del dtx_spec.txt
del fileorgn.txt
del globals.txt
del intro.txt
del kern.txt
del lib.txt
del lickitrm.txt
del multibrd.txt
del music0.txt
del music1.txt
del music2.txt
del music3.txt
del names.txt
del opersys.txt
del personal.txt
del phonemes.txt
del plugplay.txt
del progrmng.txt
del readme.txt
del ref_man.txt
del scale.txt
del shrt_cmd.txt
del singing.txt
del tape_lvl.txt
del title.txt
del toolkit.txt
del uguide.txt
del unzip.txt
del upgrade.txt
del v41_read.me
del v42_read.me
del vermont.txt
del version.txt
del voc_ctrl.txt
del vtm_f.txt
del vtm_i.txt
del adjallo.c
del adjind.c
del chkind.c
del deflang.c
del donef.c
del getc.c
del gpio.c
del indal.c
del indph.c
del kdisable.c
del kenable.c
del printf.c
del putc.c
del puthex.c
del putn.c
del putseq.c
del putstr.c
del resetspc.c
del saveind.c
del sendind.c
del serialu.c
del spcget.c
del spcwrite.c
del startf.c
del statabs.c
del statabsu.c
del statclr.c
del statclru.c
del statset.c
del statsetu.c
del stattog.c
del stattogu.c
del voldown.c
del volset.c
del volup.c
del !dtc07aa.cfg
del alphabet.c
del BIN2FLR.C
del EH.C
del bootup.asm
del cnf_main.c
del comchk.c
del cpg_437.c
del cpg_850.c
del cpg_863.c
del cpg_def.h
del cpg_main.c
del dec.voc
del dectalk.ini
del defdecs.h
del demo_gr.c
del demo_sp.c
del demo_us.c
del demo_uk.c
del depend.cpp
del DEPEND.VCW
del DEPEND.WSP
rem del dt.bat
rem del dt2.bat
del dtcommon.c
del dtdemo.h
del dtstart.h
del dttsr.h
del FIXUP.C
del ger_main.c
del getver.c
del glblclvr.c
del hexobj.c
del ldr.h
del ldr_boot.c
del ldr_err.c
del ldr_file.c
del ldr_main.c
del ldr_swit.c
del mdemo.c
del mkboot.c
del mkboot1.c
del MKPDROM.C
del mkvers.c
del mt.bat
del mul_read.c
del music.bat
del newvar.c
del pcboot.c
del PERSONAL.DTU
del power.c
del priodic.c
del report.c
del sdt.bat
del SER_TSR.H
del spa_main.c
del start_gr.c
del start_sp.c
del start_us.c
del start_uk.c
del start_la.c
del tsr_com.c
del tsr_err.c
del tsr_io.c
del tsr_lpt.c
del tsr_main.c
del tsr_mult.c
del tsr_swit.c
del udic_gr.c
del udic_sp.c
del udic_us.c
del udic_uk.c
del udic_la.c
del usa_main.c
del uk_main.c
del user_dic.bat
del user_dll.h
del userdic.h
del verscopy.bat
del voc_main.c
del wav_voc.c
del wsr.def
del wsr.h
del wsr.ico
del wsr.mak
del wsr.rc
del wsr_char.c
del wsr_dlg.h
del wsr_file.c
del wsr_ind.c
del wsr_main.c
del wsr_prot.h
del wsr_rc.h
del wsr_tty.c
del dt2_uk.bat
del dt2_sp.bat
del dt2_us.bat
del dt2_gr.bat
del dt2_la.bat

del config.dlg
del custom.dlg
del dll.def
del dll.h
del dll_box.c
del dll_conf.c
del dll_cust.c
del dll_dlg.h
del dll_dtpc.rc
del dll_file.c
del dll_ini.c
del dll_io.c
del dll_main.c
del dll_prot.h
del dll_user.c
del dll_usym.h
del dll_wnd.c
del drv.h
del drv_main.c
del drv_prot.h
del files.dlg
del outdll.dlg
del output.dlg
del settings.dlg
del speech.dlg
del strings.dlg
del text.dlg
rem del DTEXP.BAT
del 82c315a.inc
del am00.inc
del am05.inc
del am07.inc
del amsegs32.inc
del b.asm
del bits.h
del blast.c
del c0.asm
del com.inc
del cp.asm
del ctl.asm
del de.asm
del destart.asm
del dmp.asm
del dt.asm
del EH.H
del ex.asm
del exp2flr.c
del exp2hex2.c
del fastload.c
del fill.asm
del func.inc
del g.asm
del hdt.inc
del his.asm
del hlp.asm
del int.asm
del io.asm
del lca.asm
del ld.asm
del limits.inc
del lr.asm
del lw.asm
del m0.asm
del m1.asm
del m2.asm
del m2.inc
del m3.asm
del ma.asm
del makecons.mak
del maketool.mak
del makeutil.mak
del mkdate.c
del MKPDTOOL.MAK
del mp.asm
del mpic.inc
del mt.asm
del p0.asm
del pd.h
del pd_test2.c
del pr.asm
del proto.inc
del r0.asm
del segass16.inc
del segass32.inc
del st.asm
del sym.asm
del t.asm
del tss.asm
del x.asm
del implode.lib
rem del LOAD.BAT
del mon.lnk
del dtpccjl1.mak
del dtpccjlt.mak
del dtpckits.mak
del dtpcmacr.mak
rem hardmak.bat

set clean_arg=N
goto finished

rem ********** CLEAN SECTION END **********


rem ********** ERROR SECTION START **********

:error
echo .
echo Build of the product (%prod_arg%) for the language (%lang_arg%) was not successful.
echo Please check your (%err_mess%) argument and try again.
echo The syntax is the following:
echo    hardmak [product] [language] [vocal] [copy] [clean] [custom]
echo Example:
echo    hardmak DTEX ENGLISH_US NOVOCAL Y Y NONE
echo .
goto stop

:seterror
echo .
echo ERROR:  The file setvar.bat was not successfully run.
echo Please add the following line to your autoexec.bat:
echo    set setvar=[drive]\[path]\setvar.bat
echo Another alternative is to type this line in at the command prompt.
echo After this is done, rerun hardmak.
echo .
goto stop

:nmakeerr
echo .
echo ERROR:  An error has occured in NMAKE.
echo Please fix the problem and run hardmak again.
echo .
rem cd d:\work\ad\hardware\src
%blddrv%
cd %bldpath%\hardware\src
set path=.;%tempath%
goto finished

rem ********** ERROR SECTION END **********


:stop
