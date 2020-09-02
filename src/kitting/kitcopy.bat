@echo on
set kitcopy_debug=0
goto skip_comment
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
rem                     Innocomp & JBliss to SMIT list.
rem 18-mar-1998 CJL		Add SAPI MULTI_LANGUAGE switch to setup.rul compile.
rem 22-may-1998 CJL     Add Appendix4.txt to the sdk disk1.
rem 26-aug-1998 CJL     Add Non-A32 Static kitting PKGs.
rem 04-sep-1998 CJL     Add disk4 for German Alpha NT Build.
rem 09-nov-1998 CJL     Add disk4 and disk5 for CE Build.
rem 16-apr-1999 mfg 	added Windows CE support for versions 2.00 2.11 for visual C++ 6.0
rem 10-feb-1999 CJL     Add SMITPR for Prentke-Romich.
rem 21-apr-1999 CJL     Add SMITAR for Arkenstone.
rem 02-sep-1999 MGS		Changed to smart.bmp
rem 06-dec-1999 mfg		added SMTEN for enkidu
rem 21-dec-1999 mfg		merged in Windows CE build so alll 32 bit kits made from the same build script
rem 17-feb-2000 mfg		added email reader sample for windows ce
rem 15-mar-2000 mfg		added disk4 for US and UK, added disk6 for GR inWindowsCE 
rem 15-mar-2000 mfg		added Multlang for 211 mips,sh,sh4 inWindowsCE 
rem 19-apr-2000 cab		Added windic for windows ce 211
rem 19-may-2000 mfg		added SMITNS for Neil Squire Foundation
rem 01-aug-2000 cab		removed extra lang directory folders from sample windic folders
rem 08-aug-2000 cab		Removed mailread folders for wce200	
rem 15-aug-2000 cab     changed smart bmp to force logo
rem 22-aug-2000	cab		changed windic folder from cedll to dll
rem 29-aug-2000 cab		Added if to Copy only us x86em access32 
rem 09-sep-2000 cab		Removed alpha from script
rem 25-sep-2000 cab		Removed duplicate copy of dictionary files to cedata\as_is
rem 26-sep-2000 cab		Renamed dectalk.dic to dtalk_%langdir%.dic for data\as_is folder
rem 05-oct-2000 cab		Added new folders for only us install\cedata\wce200\samples & .\wce211\samples
rem						for windows CE samples files for Installshield 5.0
rem 07-oct-2000 cab		Renamed dectalk.dll in install\data\sprogram to dtalk_%langdir%.dll
rem						except for multi language which is not changed
rem 09-oct-2000 cab		1. Added the files dectak.dll, dtalk_%langdir%.dic, dtlkttse.dll, say.exe
rem						   speak_%langdir%.exe, ttssrv.exe and user_%langdir%.tab to install\data\as_is\us
rem						   so that it looks just like when it is installed.
rem						2. Added the file dectalk.dll to ml\install\data\as_is\MultLang
rem						3. Added folder sys_dir to %langdir%\install\data\as_is and added file
rem						   dtalk_%langdir%.dll except for ml which is left as dectalk.dll
rem 12-oct-2000 cab		1. Added folders us\install\data\windows\samples\xx\xx where xx is the name of the program
rem						3. Removed call to setvar still build process would be invalid anyway
rem						4. Added if not exist statement to all md
rem	13-Oct-2000 cab		1. Added speak.exe to as\is folder
rem						2. Removed data\disk* and cedata\diskce* folders because of upgrade to install shield 6.0
rem 25-Oct-2000 cab		1. Added new folder mspro for WCE211 MS HPC PRO 
rem						2. Added new folder palm for wce211 PALM SIZE PC
rem						3. Added new folder wce300 for POCKET PC
rem 26-oct-2000 cab		Removed windic for PALM SIZE PC and POCKET PC
rem 27-oct-2000	cab		1. Added label skip_comment to reduce size of output file
rem 31-oct-2000 cab		1. Removed mailread and windic from PALM SIZE PC 
rem						2. Removed dtsample and windic from POCKET PC
rem 06-nov-2000	cab		1. Changed copy section for vercheck to eliminate unneccesary files
rem						2. Renamed dtlkttse.dll to dtlkttse_%langdir%.dll for speecg folder only
rem						3. Removed & from echo because it produce error
rem	07-nov-2000 cab		1. Removed multi copy command for reduced size dictionary
rem						2. Added reduced size dictionaries to dtalkver.txt
rem						3. Removed files for mldemo that are not needed to build worspace
rem 17-nov-2000 cab		1. Added Sapi 5 for US only
rem 21-nov-2000 cab		1. Removed wdisk2 for sp and la. Only need 1 disk
rem						2. Added CEAgent
rem 27-nov-2000	cab		1. Added Assistive Technologies and Nav As to SMITAS and SMITNA
rem						2. Fixed missing period in file dtalk%langdir%.dic
rem						3. Added Dectalk_%langdir%.dll to dtalkver.txt
rem						4. Fixed error echo for wdisk2
rem 30-nov-2000 cab		1. Added files to ceagent folder.						
rem						2. Removed dectalk.hh from help folder not needed.
rem 18-dec-2000 cab		1. Removed patch folder
rem						2. Remove folders \setup and \cesetup
rem						3. Readded copy dectalk.hlp and dectalk.cnt files
rem 21-dec-2000 cab		1. removed setvar check
rem						2. removed ce_bld variable not used anymore
rem						3. Modified if cleaning by deleting entire lang tree
rem 28-dec-2000 cab		1. Added new folder swi95nt\install_files for install shield
rem						3. Removed all install shield 3.0 setup folders except access32
rem						4. Removed envpatch from folders not used anymore
rem	05-jan-2001 cab		1. Removed setup.reg for smitcode for windows
rem						2. Modified copy docopy.bat section for windows
rem						3. Removed docopy.bat for windows ce access32
rem 11-jan-2001 cab		Added the files dtk_reference_guide.*, dtk_install_guide.*, and dtk_prog_guide.*
rem 24-jan-2001 cab		Added French
rem 31-jan-2001 cab		Moved non lang specfic folders together
rem 12-feb-2001 cab		1. Removed smaller dictionary from staticSCE
rem						2. Deleted files for Win/Win CE smit code that created zip
rem	15-feb-2001	cab		1. Changed error_end to bug_end
rem 21-feb-2001 cab		1. Added file license.txt to swi95nt\install_files
rem						2. Made new bug_setvar label
rem 13-mar-2001	cab		Removed file udtmemor.mak(dtmemory),udtsampl.mak(dtsample), ucetalk.*(cetalk)
rem						Removed file usay.mak(say)
rem 18-mar-2001 cab		Continue adding test for errors
rem 20-mar-2001 cab		Fixed access32 issue by using %%
rem 30-mar-2001 cab		1. Changed output directory to win%index%
rem						2. fixed typos for buil_log output
rem						3. Removed french for sapi3 stuff
rem						4. Changed finfo for ml only
rem						5. Added missing goto, "", and fixed errors for finfo
rem	02-apr-2001 cab		1. Added Missing "
rem						2. Removed French for Willow Pond and removed extra space from ==
rem 04-apr-2001 cab		1. Added missing "'s
rem						2. Added dtalkver.txt for us as default
rem 05-apr-2001 cab		1. Finished add build_log messages
rem						2. Added dtsample for wce300
rem						3. Added Foreign language loan dictionary for GR
rem 06-apr-2001 cab		1. Fixed error for %syslangdir%
rem						2. Fixed dectalk foreign language dictionary
rem						3. Fixed ml for dtalkml and added folder dtsample for wce300
rem	11-apr-2001 cab		1. Added missing dtsample for wce300
rem						2. Rem out *.ps for windows
rem	12-apr-2001 cab		Unrem a label
rem 18-apr-2001 cab		Removed appendix1.txt
rem 05-jun-2001 cab		Removed %platform% variable
rem 06-jun-2001 cab		Removed access32 and smitcode
rem 08-jun-2001 cab		1. Changed staticsce to staticce
rem						2. Fixed extra space in %wpbld_path%
rem 26-jun-2001	cab		Removed variable %bld_mach%
rem 09-jul-2001	cab		Removed ceagent from build
rem 10-jul-2001 cab		No longer renaming dictionaries
rem 11-jul-2001 cab		1. Removed appendix*.txt and readme.txt from swi95nt\%langdir% folders
rem						2. Moved all sample code to swi95nt\samples for windows
rem 12-jul-2001 cab		Removed preproc since ACCESS32 is now part of code.
rem 16-jul-2001 cab		Moved all sample source code for Windows CE
rem						Moved include and help to swi95nt\
rem 17-jul-2001 cab		Added reduced size dic's to %langdir%
rem 14-sep-2001 cab		Fixed bug for finfo
rem 08-oct-2001 cab		1. Added new folder .swi95nt\microsoft
rem						2. Change log to kitxx.log
rem						3. Fixed build for US only errors
rem ******************
rem

rem to skip comment section
:skip_comment

rem to check if setvar was run
if not "%setvardone%"=="1" goto bug_setvar

set dtlkid=%2
set dtlang=%3
set dtclean=%4
set cln_only=%5

if "%kitcopy_debug%"=="1" pause

rem SETTING UP FOR i386 MACHINE
set bld_path=build
set wpbld_path=wbuild
set arch_dir=swi95nt
set msdir=i386

:checkit
rem check for arguments
if {%1}=={} goto noargs
if "%dtlkid%"=="" goto defarg
if "%dtlang%"=="" goto deflang
if "%dtclean%"=="" goto defclean
goto cont1

:defarg
echo WARNING: using default identifier string!
set dtlkid=cab
goto checkit

:deflang
echo WARNING: using default language (ENGLISH_US)
set dtlang=ENGLISH_US
goto checkit

:defclean
echo WARNING: using default cleanup option (Y)
set dtclean=Y
goto cont1

:cont1
echo Building DECtalk Software %1 (%dtlkid%)
if "%kitcopy_debug%"=="1" pause

rem ***************************************************************
rem     Support build of multi-language kit building from a
rem     choice of several.
rem     Currently supporting:
rem             ENGLISH_US, GERMAN, SPANISH, SPANISH_LA (Latin American),
rem             ENGLISH_UK, FRENCH
rem
if "%dtlang%"=="ML" set langdir=ml
if "%dtlang%"=="ML" set syslangdir=MultLang
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
if "%dtlang%"=="FRENCH" set langdir=fr
if "%dtlang%"=="FRENCH" goto dtlangok
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
if exist ..\%arch_dir%\%langdir% deltree /y ..\%arch_dir%\%langdir%
goto clndone

:clnnt
if exist ..\%arch_dir%\%langdir% del /s/q ..\%arch_dir%\%langdir%
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

rem non language specfic folders
if NOT "%langdir%"=="us" goto non_lang_specfic_folders

md ..\%arch_dir%\help
md ..\%arch_dir%\include
md ..\%arch_dir%\install_files

md ..\%arch_dir%\lock_mgr\standard
md ..\%arch_dir%\lock_mgr\wpond

md ..\%arch_dir%\microsoft

rem for source code for sample applications for Windows
md ..\%arch_dir%\samples\win\dtmemory
md ..\%arch_dir%\samples\win\dtsample
md ..\%arch_dir%\samples\win\say
md ..\%arch_dir%\samples\win\ttstest
md ..\%arch_dir%\samples\win\vercheck
md ..\%arch_dir%\samples\win\windic

rem for source code for sample applications for Windows CE
md ..\%arch_dir%\samples\wince\cetalk\res
md ..\%arch_dir%\samples\wince\dtsample
md ..\%arch_dir%\samples\wince\mailread\res

rem Exe's for sample applications for Windows CE
rem md ..\%arch_dir%\samples\wince\wce200\cetalk\bin
rem md ..\%arch_dir%\samples\wince\wce200\dtsample\bin
md ..\%arch_dir%\samples\wince\wce211\mspro\cetalk\bin
md ..\%arch_dir%\samples\wince\wce211\mspro\dtsample\bin
md ..\%arch_dir%\samples\wince\wce211\mspro\mailread\bin
md ..\%arch_dir%\samples\wince\wce211\palm\cetalk\bin
md ..\%arch_dir%\samples\wince\wce211\palm\dtsample\bin
md ..\%arch_dir%\samples\wince\wce300\pocket\cetalk\bin
md ..\%arch_dir%\samples\wince\wce300\pocket\dtsample\bin
md ..\%arch_dir%\samples\wince\wce300\pocket\mailread\bin
md ..\%arch_dir%\samples\wince\wce300\2000\cetalk\bin
md ..\%arch_dir%\samples\wince\wce300\2000\dtsample\bin
md ..\%arch_dir%\samples\wince\wce300\2000\mailread\bin


:non_lang_specfic_folders

if not exist ..\%arch_dir%\%langdir%\install   md ..\%arch_dir%\%langdir%\install
if not exist ..\%arch_dir%\%langdir%\static    md ..\%arch_dir%\%langdir%\static


rem wce200
rem if not exist ..\%arch_dir%\%langdir%\staticce\Wce200\mips	md ..\%arch_dir%\%langdir%\staticce\Wce200\mips
rem if not exist ..\%arch_dir%\%langdir%\staticce\Wce200\sh		md ..\%arch_dir%\%langdir%\staticce\Wce200\sh
rem if not exist ..\%arch_dir%\%langdir%\staticce\Wce200\x86em	md ..\%arch_dir%\%langdir%\staticce\Wce200\x86em

rem wce211 MS HPC PRO
if not exist ..\%arch_dir%\%langdir%\staticce\Wce211\mspro\arm		md ..\%arch_dir%\%langdir%\staticce\Wce211\mspro\arm
if not exist ..\%arch_dir%\%langdir%\staticce\Wce211\mspro\mips		md ..\%arch_dir%\%langdir%\staticce\Wce211\mspro\mips
if not exist ..\%arch_dir%\%langdir%\staticce\Wce211\mspro\sh		md ..\%arch_dir%\%langdir%\staticce\Wce211\mspro\sh
if not exist ..\%arch_dir%\%langdir%\staticce\Wce211\mspro\sh4		md ..\%arch_dir%\%langdir%\staticce\Wce211\mspro\sh4
if not exist ..\%arch_dir%\%langdir%\staticce\Wce211\mspro\x86em	md ..\%arch_dir%\%langdir%\staticce\Wce211\mspro\x86em

rem wce211 PALM SIZE PC
if not exist ..\%arch_dir%\%langdir%\staticce\Wce211\palm\mips		md ..\%arch_dir%\%langdir%\staticce\Wce211\palm\mips
if not exist ..\%arch_dir%\%langdir%\staticce\Wce211\palm\sh		md ..\%arch_dir%\%langdir%\staticce\Wce211\palm\sh
if not exist ..\%arch_dir%\%langdir%\staticce\Wce211\palm\x86em		md ..\%arch_dir%\%langdir%\staticce\Wce211\palm\x86em

rem wce300 POCKET PC
if not exist ..\%arch_dir%\%langdir%\staticce\wce300\pocket\xscale		md ..\%arch_dir%\%langdir%\staticce\wce300\pocket\xscale
if not exist ..\%arch_dir%\%langdir%\staticce\wce300\pocket\arm		md ..\%arch_dir%\%langdir%\staticce\wce300\pocket\arm
if not exist ..\%arch_dir%\%langdir%\staticce\wce300\pocket\mips	md ..\%arch_dir%\%langdir%\staticce\wce300\pocket\mips
if not exist ..\%arch_dir%\%langdir%\staticce\wce300\pocket\sh		md ..\%arch_dir%\%langdir%\staticce\wce300\pocket\sh
if not exist ..\%arch_dir%\%langdir%\staticce\wce300\pocket\x86em	md ..\%arch_dir%\%langdir%\staticce\wce300\pocket\x86em

rem wce300 HPC2000
if not exist ..\%arch_dir%\%langdir%\staticce\wce300\2000\arm	md ..\%arch_dir%\%langdir%\staticce\wce300\2000\arm
if not exist ..\%arch_dir%\%langdir%\staticce\wce300\2000\mips	md ..\%arch_dir%\%langdir%\staticce\wce300\2000\mips


if "%kitcopy_debug%"=="1" pause

rem -- data directories
if not exist ..\%arch_dir%\%langdir%\install\data\as_is		md ..\%arch_dir%\%langdir%\install\data\as_is
if not exist ..\%arch_dir%\%langdir%\install\wdata\as_is	md ..\%arch_dir%\%langdir%\install\wdata\as_is
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is   md ..\%arch_dir%\%langdir%\install\cedata\as_is
if not exist ..\%arch_dir%\%langdir%\install\data\speech   md ..\%arch_dir%\%langdir%\install\data\speech
if "%kitcopy_debug%"=="1" pause

if not exist ..\%arch_dir%\%langdir%\install\data\as_is\sys_dir				md ..\%arch_dir%\%langdir%\install\data\as_is\sys_dir
if not exist ..\%arch_dir%\%langdir%\install\data\program					md ..\%arch_dir%\%langdir%\install\data\program
if not exist ..\%arch_dir%\%langdir%\install\wdata\program					md ..\%arch_dir%\%langdir%\install\wdata\program
if not exist ..\%arch_dir%\%langdir%\install\cedata\program					md ..\%arch_dir%\%langdir%\install\cedata\program

rem for dynamic links in installshield 6.0
if not exist ..\%arch_dir%\us\install\data\windows\dectalk					md ..\%arch_dir%\us\install\data\windows\dectalk

rem for dynamic links in install shield 6.0
rem Windows CE wce200 dll and lib files
rem if not exist ..\%arch_dir%\%langdir%\install\cedata\wce200\dll_and_lib\%langdir%\mips	md ..\%arch_dir%\%langdir%\install\cedata\wce200\dll_and_lib\%langdir%\mips
rem if not exist ..\%arch_dir%\%langdir%\install\cedata\wce200\dll_and_lib\%langdir%\sh		md ..\%arch_dir%\%langdir%\install\cedata\wce200\dll_and_lib\%langdir%\sh
rem if not exist ..\%arch_dir%\%langdir%\install\cedata\wce200\dll_and_lib\%langdir%\x86em	md ..\%arch_dir%\%langdir%\install\cedata\wce200\dll_and_lib\%langdir%\x86em

rem for dynamic links in install shield 6.0
rem Windows CE wce211 MS HPC PRO dll and lib files
if not exist ..\%arch_dir%\%langdir%\install\cedata\wce211\mspro\dll_and_lib\%langdir%\arm		md ..\%arch_dir%\%langdir%\install\cedata\wce211\mspro\dll_and_lib\%langdir%\arm
if not exist ..\%arch_dir%\%langdir%\install\cedata\wce211\mspro\dll_and_lib\%langdir%\mips		md ..\%arch_dir%\%langdir%\install\cedata\wce211\mspro\dll_and_lib\%langdir%\mips
if not exist ..\%arch_dir%\%langdir%\install\cedata\wce211\mspro\dll_and_lib\%langdir%\sh		md ..\%arch_dir%\%langdir%\install\cedata\wce211\mspro\dll_and_lib\%langdir%\sh
if not exist ..\%arch_dir%\%langdir%\install\cedata\wce211\mspro\dll_and_lib\%langdir%\sh4		md ..\%arch_dir%\%langdir%\install\cedata\wce211\mspro\dll_and_lib\%langdir%\sh4
if not exist ..\%arch_dir%\%langdir%\install\cedata\wce211\mspro\dll_and_lib\%langdir%\x86em	md ..\%arch_dir%\%langdir%\install\cedata\wce211\mspro\dll_and_lib\%langdir%\x86em

rem Windows CE wce211 PALM SIZE PC dll and lib files
if not exist ..\%arch_dir%\%langdir%\install\cedata\wce211\palm\dll_and_lib\%langdir%\mips		md ..\%arch_dir%\%langdir%\install\cedata\wce211\palm\dll_and_lib\%langdir%\mips
if not exist ..\%arch_dir%\%langdir%\install\cedata\wce211\palm\dll_and_lib\%langdir%\sh		md ..\%arch_dir%\%langdir%\install\cedata\wce211\palm\dll_and_lib\%langdir%\sh
if not exist ..\%arch_dir%\%langdir%\install\cedata\wce211\palm\dll_and_lib\%langdir%\x86em		md ..\%arch_dir%\%langdir%\install\cedata\wce211\palm\dll_and_lib\%langdir%\x86em

rem Windows CE wce300 POCKET PC dll and lib files
if not exist ..\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\xscale		md ..\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\xscale
if not exist ..\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\arm		md ..\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\arm
if not exist ..\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\mips		md ..\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\mips
if not exist ..\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\sh		md ..\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\sh
if not exist ..\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\x86em		md ..\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\x86em

rem Windows CE wce300 HPC2000 dll and lib files
if not exist ..\%arch_dir%\%langdir%\install\cedata\wce300\2000\dll_and_lib\%langdir%\arm		md ..\%arch_dir%\%langdir%\install\cedata\wce300\2000\dll_and_lib\%langdir%\arm
if not exist ..\%arch_dir%\%langdir%\install\cedata\wce300\2000\dll_and_lib\%langdir%\mips		md ..\%arch_dir%\%langdir%\install\cedata\wce300\2000\dll_and_lib\%langdir%\mips

if not exist ..\%arch_dir%\%langdir%\install\data\sprogram			md ..\%arch_dir%\%langdir%\install\data\sprogram
if not exist ..\%arch_dir%\%langdir%\install\wdata\sprogram			md ..\%arch_dir%\%langdir%\install\wdata\sprogram
if not exist ..\%arch_dir%\%langdir%\install\cedata\sprogram		md ..\%arch_dir%\%langdir%\install\cedata\sprogram

if not exist ..\%arch_dir%\%langdir%\install\wdata\speech			md ..\%arch_dir%\%langdir%\install\wdata\speech

if not exist ..\%arch_dir%\us\install\data\as_is\sapi5				md ..\%arch_dir%\us\install\data\as_is\sapi5

if not exist ..\%arch_dir%\%langdir%\install\wdata\as_is\include	md ..\%arch_dir%\%langdir%\install\wdata\as_is\include
if not exist ..\%arch_dir%\%langdir%\install\data\as_is\%langdir%	md ..\%arch_dir%\%langdir%\install\data\as_is\%langdir%

if "%kitcopy_debug%"=="1" pause
rem wce200
rem if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce200\%langdir%\mips		md ..\%arch_dir%\%langdir%\install\cedata\as_is\wce200\%langdir%\mips
rem if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce200\%langdir%\sh		md ..\%arch_dir%\%langdir%\install\cedata\as_is\wce200\%langdir%\sh
rem if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce200\%langdir%\x86em	md ..\%arch_dir%\%langdir%\install\cedata\as_is\wce200\%langdir%\x86em

rem if not exist ..\%arch_dir%\samples\wince\wce200\cetalk\bin\mips\%langdir%			md ..\%arch_dir%\samples\wince\wce200\cetalk\bin\mips\%langdir%
rem if not exist ..\%arch_dir%\samples\wince\wce200\cetalk\bin\sh\%langdir%				md ..\%arch_dir%\samples\wince\wce200\cetalk\bin\sh\%langdir%
rem if not exist ..\%arch_dir%\samples\wince\wce200\cetalk\bin\x86em\%langdir%			md ..\%arch_dir%\samples\wince\wce200\cetalk\bin\x86em\%langdir%

rem if not exist ..\%arch_dir%\samples\wince\wce200\dtsample\bin\mips\%langdir%			md ..\%arch_dir%\samples\wince\wce200\dtsample\bin\mips\%langdir%
rem if not exist ..\%arch_dir%\samples\wince\wce200\dtsample\bin\sh\%langdir%			md ..\%arch_dir%\samples\wince\wce200\dtsample\bin\sh\%langdir%
rem if not exist ..\%arch_dir%\samples\wince\wce200\dtsample\bin\x86em\%langdir%		md ..\%arch_dir%\samples\wince\wce200\dtsample\bin\x86em\%langdir%

if "%kitcopy_debug%"=="1" pause
rem wce211 MS HPC PRO
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\arm		md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\arm
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\mips		md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\mips
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\sh			md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\sh
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\sh4		md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\sh4
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\x86em		md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\x86em

if not exist ..\%arch_dir%\samples\wince\wce211\mspro\dtsample\bin\arm\%langdir%			md ..\%arch_dir%\samples\wince\wce211\mspro\dtsample\bin\arm\%langdir%
if not exist ..\%arch_dir%\samples\wince\wce211\mspro\dtsample\bin\mips\%langdir%			md ..\%arch_dir%\samples\wince\wce211\mspro\dtsample\bin\mips\%langdir%
if not exist ..\%arch_dir%\samples\wince\wce211\mspro\dtsample\bin\sh\%langdir%				md ..\%arch_dir%\samples\wince\wce211\mspro\dtsample\bin\sh\%langdir%
if not exist ..\%arch_dir%\samples\wince\wce211\mspro\dtsample\bin\sh4\%langdir%			md ..\%arch_dir%\samples\wince\wce211\mspro\dtsample\bin\sh4\%langdir%
if not exist ..\%arch_dir%\samples\wince\wce211\mspro\dtsample\bin\x86em\%langdir%			md ..\%arch_dir%\samples\wince\wce211\mspro\dtsample\bin\x86em\%langdir%

if not exist ..\%arch_dir%\samples\wince\wce211\mspro\cetalk\bin\arm\%langdir%				md ..\%arch_dir%\samples\wince\wce211\mspro\cetalk\bin\arm\%langdir%
if not exist ..\%arch_dir%\samples\wince\wce211\mspro\cetalk\bin\mips\%langdir%				md ..\%arch_dir%\samples\wince\wce211\mspro\cetalk\bin\mips\%langdir%
if not exist ..\%arch_dir%\samples\wince\wce211\mspro\cetalk\bin\sh\%langdir%				md ..\%arch_dir%\samples\wince\wce211\mspro\cetalk\bin\sh\%langdir%
if not exist ..\%arch_dir%\samples\wince\wce211\mspro\cetalk\bin\sh4\%langdir%				md ..\%arch_dir%\samples\wince\wce211\mspro\cetalk\bin\sh4\%langdir%
if not exist ..\%arch_dir%\samples\wince\wce211\mspro\cetalk\bin\x86em\%langdir%			md ..\%arch_dir%\samples\wince\wce211\mspro\cetalk\bin\x86em\%langdir%

if not exist ..\%arch_dir%\samples\wince\wce211\mspro\mailread\bin\arm\%langdir%			md ..\%arch_dir%\samples\wince\wce211\mspro\mailread\bin\arm\%langdir%
if not exist ..\%arch_dir%\samples\wince\wce211\mspro\mailread\bin\mips\%langdir%			md ..\%arch_dir%\samples\wince\wce211\mspro\mailread\bin\mips\%langdir%
if not exist ..\%arch_dir%\samples\wince\wce211\mspro\mailread\bin\sh\%langdir%				md ..\%arch_dir%\samples\wince\wce211\mspro\mailread\bin\sh\%langdir%
if not exist ..\%arch_dir%\samples\wince\wce211\mspro\mailread\bin\sh4\%langdir%			md ..\%arch_dir%\samples\wince\wce211\mspro\mailread\bin\sh4\%langdir%
if not exist ..\%arch_dir%\samples\wince\wce211\mspro\mailread\bin\x86em\%langdir%			md ..\%arch_dir%\samples\wince\wce211\mspro\mailread\bin\x86em\%langdir%


rem wce211 PALM SIZE PC
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\palm\%langdir%\mips			md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\palm\%langdir%\mips
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\palm\%langdir%\sh				md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\palm\%langdir%\sh
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\palm\%langdir%\x86em			md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\palm\%langdir%\x86em

if not exist ..\%arch_dir%\samples\wince\wce211\palm\cetalk\bin\mips\%langdir%			md ..\%arch_dir%\samples\wince\wce211\palm\cetalk\bin\mips\%langdir%
if not exist ..\%arch_dir%\samples\wince\wce211\palm\cetalk\bin\sh\%langdir%			md ..\%arch_dir%\samples\wince\wce211\palm\cetalk\bin\sh\%langdir%
if not exist ..\%arch_dir%\samples\wince\wce211\palm\cetalk\bin\x86em\%langdir%			md ..\%arch_dir%\samples\wince\wce211\palm\cetalk\bin\x86em\%langdir%

if not exist ..\%arch_dir%\samples\wince\wce211\palm\dtsample\bin\mips\%langdir%		md ..\%arch_dir%\samples\wince\wce211\palm\dtsample\bin\mips\%langdir%
if not exist ..\%arch_dir%\samples\wince\wce211\palm\dtsample\bin\sh\%langdir%			md ..\%arch_dir%\samples\wince\wce211\palm\dtsample\bin\sh\%langdir%
if not exist ..\%arch_dir%\samples\wince\wce211\palm\dtsample\bin\x86em\%langdir%		md ..\%arch_dir%\samples\wince\wce211\palm\dtsample\bin\x86em\%langdir%


rem wce300 POCKET PC
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\xscale	md ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\xscale
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\arm	md ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\arm
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\mips	md ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\mips
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\sh	md ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\sh
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\x86em	md ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\x86em

if not exist ..\%arch_dir%\samples\wince\wce300\pocket\dtsample\bin\arm\%langdir%		md ..\%arch_dir%\samples\wince\wce300\pocket\dtsample\bin\arm\%langdir%
if not exist ..\%arch_dir%\samples\wince\wce300\pocket\dtsample\bin\mips\%langdir%		md ..\%arch_dir%\samples\wince\wce300\pocket\dtsample\bin\mips\%langdir%
if not exist ..\%arch_dir%\samples\wince\wce300\pocket\dtsample\bin\sh\%langdir%		md ..\%arch_dir%\samples\wince\wce300\pocket\dtsample\bin\sh\%langdir%
if not exist ..\%arch_dir%\samples\wince\wce300\pocket\dtsample\bin\x86em\%langdir%		md ..\%arch_dir%\samples\wince\wce300\pocket\dtsample\bin\x86em\%langdir%

if not exist ..\%arch_dir%\samples\wince\wce300\pocket\cetalk\bin\arm\%langdir%			md ..\%arch_dir%\samples\wince\wce300\pocket\cetalk\bin\arm\%langdir%
if not exist ..\%arch_dir%\samples\wince\wce300\pocket\cetalk\bin\mips\%langdir%		md ..\%arch_dir%\samples\wince\wce300\pocket\cetalk\bin\mips\%langdir%
if not exist ..\%arch_dir%\samples\wince\wce300\pocket\cetalk\bin\sh\%langdir%			md ..\%arch_dir%\samples\wince\wce300\pocket\cetalk\bin\sh\%langdir%
if not exist ..\%arch_dir%\samples\wince\wce300\pocket\cetalk\bin\x86em\%langdir%		md ..\%arch_dir%\samples\wince\wce300\pocket\cetalk\bin\x86em\%langdir%

if not exist ..\%arch_dir%\samples\wince\wce300\pocket\mailread\bin\arm\%langdir%		md ..\%arch_dir%\samples\wince\wce300\pocket\mailread\bin\arm\%langdir%
if not exist ..\%arch_dir%\samples\wince\wce300\pocket\mailread\bin\mips\%langdir%		md ..\%arch_dir%\samples\wince\wce300\pocket\mailread\bin\mips\%langdir%
if not exist ..\%arch_dir%\samples\wince\wce300\pocket\mailread\bin\sh\%langdir%		md ..\%arch_dir%\samples\wince\wce300\pocket\mailread\bin\sh\%langdir%
if not exist ..\%arch_dir%\samples\wince\wce300\pocket\mailread\bin\x86em\%langdir%		md ..\%arch_dir%\samples\wince\wce300\pocket\mailread\bin\x86em\%langdir%

rem wce300 HPC2000
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\%langdir%\arm	md ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\%langdir%\arm
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\%langdir%\mips	md ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\%langdir%\mips

if not exist ..\%arch_dir%\samples\wince\wce300\2000\dtsample\bin\arm\%langdir%		md ..\%arch_dir%\samples\wince\wce300\2000\dtsample\bin\arm\%langdir%
if not exist ..\%arch_dir%\samples\wince\wce300\2000\dtsample\bin\mips\%langdir%		md ..\%arch_dir%\samples\wince\wce300\2000\dtsample\bin\mips\%langdir%

if not exist ..\%arch_dir%\samples\wince\wce300\2000\cetalk\bin\arm\%langdir%			md ..\%arch_dir%\samples\wince\wce300\2000\cetalk\bin\arm\%langdir%
if not exist ..\%arch_dir%\samples\wince\wce300\2000\cetalk\bin\mips\%langdir%		md ..\%arch_dir%\samples\wince\wce300\2000\cetalk\bin\mips\%langdir%

if not exist ..\%arch_dir%\samples\wince\wce300\2000\mailread\bin\arm\%langdir%		md ..\%arch_dir%\samples\wince\wce300\2000\mailread\bin\arm\%langdir%
if not exist ..\%arch_dir%\samples\wince\wce300\2000\mailread\bin\mips\%langdir%		md ..\%arch_dir%\samples\wince\wce300\2000\mailread\bin\mips\%langdir%


rem -- setup directories
if not exist ..\%arch_dir%\%langdir%\install\instdec	md ..\%arch_dir%\%langdir%\install\instdec
if not exist ..\%arch_dir%\%langdir%\install\idisk		md ..\%arch_dir%\%langdir%\install\idisk
if not exist ..\%arch_dir%\%langdir%\install\wsetup		md ..\%arch_dir%\%langdir%\install\wsetup
if "%kitcopy_debug%"=="1" pause

rem -- kit directories

if not exist ..\%arch_dir%\%langdir%\install\wdisk1		md ..\%arch_dir%\%langdir%\install\wdisk1
if "%langdir%"=="la" goto skip_wdisk2
if "%langdir%"=="sp" goto skip_wdisk2
if not exist ..\%arch_dir%\%langdir%\install\wdisk2		md ..\%arch_dir%\%langdir%\install\wdisk2
:skip_wdisk2

rem copy all the required files to the install build area

if "%kitcopy_debug%"=="1" pause

if NOT "%langdir%"=="us" goto skip_dtmemory
echo ***************************************************************
echo %arch_dir%\%langdir%\INSTALL\DATA\AS_IS\SAMPLES\DTMEMORY
echo ***************************************************************

rem give source codes and exes for V4.4 and above per meeting 5/13/97 ckl
rem copy for dynamic links in installshield 6.0
copy ..\samples\dtmemory\*.h ..\%arch_dir%\samples\win\dtmemory
if NOT exist ..\%arch_dir%\samples\win\dtmemory\*.h echo file .\%arch_dir%\samples\win\dtmemory\*.h not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\dtmemory\*.c ..\%arch_dir%\samples\win\dtmemory
if NOT exist ..\%arch_dir%\samples\win\dtmemory\*.c echo file .\%arch_dir%\samples\win\dtmemory\*.c not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\dtmemory\*.ico ..\%arch_dir%\samples\win\dtmemory
if NOT exist ..\%arch_dir%\samples\win\dtmemory\*.ico echo file .\%arch_dir%\samples\win\dtmemory\*.ico not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\dtmemory\*.rc ..\%arch_dir%\samples\win\dtmemory
if NOT exist ..\%arch_dir%\samples\win\dtmemory\*.rc echo file .\%arch_dir%\samples\win\dtmemory\*.rc not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\dtmemory\%bld_path%\%langdir%\release\link\*.res ..\%arch_dir%\samples\win\dtmemory
if NOT exist ..\%arch_dir%\samples\win\dtmemory\*.res echo file .\%arch_dir%\samples\win\dtmemory\*.res not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\dtmemory\%bld_path%\%langdir%\release\dtmemory.exe .\%arch_dir%\samples\win\dtmemory
if NOT exist ..\%arch_dir%\samples\win\dtmemory\*.exe echo file .\%arch_dir%\samples\win\dtmemory\*.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\dtmemory\dtmemory.mak ..\%arch_dir%\samples\win\dtmemory
if NOT exist ..\%arch_dir%\samples\win\dtmemory\dtmemory.mak echo file .\%arch_dir%\samples\win\dtmemory\dtmemory.mak not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
:skip_dtmemory
if "%kitcopy_debug%"=="1" pause

echo ***************************************************************
echo %arch_dir%\%langdir%\INSTALL\DATA\AS_IS\SAMPLES\DTSAMPLE
echo ***************************************************************

if NOT "%langdir%"=="us" goto skip_dtsample
rem give source codes and exes for V4.4 and above per meeting 5/13/97 ckl
rem copy for dynamic links in installshield 6.0
copy ..\samples\dtsample\*.h ..\%arch_dir%\samples\win\dtsample
if NOT exist ..\%arch_dir%\samples\win\dtsample\*.h echo file .\%arch_dir%\samples\win\dtsample\*.h not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\dtsample\*.c ..\%arch_dir%\samples\win\dtsample
if NOT exist ..\%arch_dir%\samples\win\dtsample\*.c echo file .\%arch_dir%\samples\win\dtsample\*.c not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\dtsample\*.ico ..\%arch_dir%\samples\win\dtsample
if NOT exist ..\%arch_dir%\samples\win\dtsample\*.ico echo file .\%arch_dir%\samples\win\dtsample\*.ico not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\dtsample\*.rc ..\%arch_dir%\samples\win\dtsample
if NOT exist ..\%arch_dir%\samples\win\dtsample\*.rc echo file .\%arch_dir%\samples\win\dtsample\*.rc not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\dtsample\*.txt ..\%arch_dir%\samples\win\dtsample
if NOT exist ..\%arch_dir%\samples\win\dtsample\*.txt echo file .\%arch_dir%\samples\win\dtsample\*.txt not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\dtsample\%bld_path%\ml\release\link\*.res ..\%arch_dir%\samples\win\dtsample
if NOT exist ..\%arch_dir%\samples\win\dtsample\*.res echo file .\%arch_dir%\samples\win\dtsample\*.res not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\dtsample\%bld_path%\ml\release\*.exe ..\%arch_dir%\samples\win\dtsample
if NOT exist ..\%arch_dir%\samples\win\dtsample\*.exe echo file .\%arch_dir%\samples\win\dtsample\*.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\dtsample\dtsample.mak ..\%arch_dir%\samples\win\dtsample
if NOT exist ..\%arch_dir%\samples\win\dtsample\dtsample.mak echo file .\%arch_dir%\samples\win\dtsample\dtsample.mak not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
:skip_dtsample

if NOT "%langdir%"=="us" goto skip_say
echo ***************************************************************
echo %arch_dir%\%langdir%\INSTALL\DATA\AS_IS\SAMPLES\SAY
echo ***************************************************************

rem give source codes and exes for V4.4 and above per meeting 5/13/97 ckl
rem copy for dynamic links in install shield 6.0
copy ..\samples\say\say.c								..\%arch_dir%\samples\win\say
if NOT exist ..\%arch_dir%\samples\win\say\say.c echo file .\%arch_dir%\samples\win\say\say.c not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\say\%bld_path%\%langdir%\release\*.exe	..\%arch_dir%\samples\win\say
if NOT exist ..\%arch_dir%\samples\win\say\say.exe echo file .\%arch_dir%\samples\win\say\say.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\say\say.mak							..\%arch_dir%\samples\win\say
if NOT exist ..\%arch_dir%\samples\win\say\say.mak echo file .\%arch_dir%\samples\win\say\say.mak not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
:skip_say
if "%kitcopy_debug%"=="1" pause

if NOT "%langdir%"=="us" goto skip_ttstest
echo ***************************************************************
echo %arch_dir%\%langdir%\INSTALL\DATA\AS_IS\SAMPLES\TTSTEST
echo ***************************************************************

rem no ttstest sources, no objs, EXE ONLY per meeting 5/13/97 cjl
copy ..\samples\ttstest\%bld_path%\%langdir%\release\ttstest.exe ..\%arch_dir%\samples\win\ttstest
if NOT exist ..\%arch_dir%\samples\win\ttstest\ttstest.exe echo file .\%arch_dir%\samples\win\ttstest\ttstest.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
:skip_ttstest

if "%kitcopy_debug%"=="1" pause
if NOT "%langdir%"=="us" goto skip_vercheck
echo ***************************************************************
echo %arch_dir%\%langdir%\INSTALL\DATA\AS_IS\SAMPLES\VERCHECK
rem This component has no Language specific SOURCE
echo ***************************************************************

rem we do send the vercheck sources and exe, no objs per meeting 5/13/97 ckl
rem copy for dynamic links in install shield
copy ..\samples\vercheck\*.h	..\%arch_dir%\samples\win\vercheck
if NOT exist ..\%arch_dir%\samples\win\vercheck\*.h echo file .\%arch_dir%\samples\win\vercheck\*.h not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\vercheck\*.cpp	..\%arch_dir%\samples\win\vercheck
if NOT exist ..\%arch_dir%\samples\win\vercheck\*.cpp echo file .\%arch_dir%\samples\win\vercheck\*.cpp not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\vercheck\*.dsp	..\%arch_dir%\samples\win\vercheck
if NOT exist ..\%arch_dir%\samples\win\vercheck\*.dsp echo file .\%arch_dir%\samples\win\vercheck\*.dsp not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\vercheck\*.dsw	..\%arch_dir%\samples\win\vercheck
if NOT exist ..\%arch_dir%\samples\win\vercheck\*.dsw echo file .\%arch_dir%\samples\win\vercheck\*.dsw not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\vercheck\*.ico	..\%arch_dir%\samples\win\vercheck
if NOT exist ..\%arch_dir%\samples\win\vercheck\*.ico echo file .\%arch_dir%\samples\win\vercheck\*.ico not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\vercheck\*.rc*	..\%arch_dir%\samples\win\vercheck
if NOT exist ..\%arch_dir%\samples\win\vercheck\*.rc* echo file .\%arch_dir%\samples\win\vercheck\*.rc* not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\vercheck\*.txt	..\%arch_dir%\samples\win\vercheck
if NOT exist ..\%arch_dir%\samples\win\vercheck\*.txt echo file .\%arch_dir%\samples\win\vercheck\*.txt not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\vercheck\%bld_path%\release\vercheck.exe ..\%arch_dir%\samples\win\vercheck
if NOT exist ..\%arch_dir%\samples\win\vercheck\vercheck.exe echo file .\%arch_dir%\samples\win\vercheck\vercheck.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
:skip_vercheck
if "%kitcopy_debug%"=="1" pause

if NOT "%langdir%"=="us" goto skip_windic
echo ***************************************************************
echo %arch_dir%\%langdir%\INSTALL\DATA\AS_IS\SAMPLES\WINDIC
echo ***************************************************************

rem we do send the windic sources and exe per meeting 5/13/97 ckl
rem copy again for dynamic links in install shield 6.0
copy ..\samples\windic\*.c ..\%arch_dir%\samples\win\windic
if NOT exist ..\%arch_dir%\samples\win\windic\*.c echo file .\%arch_dir%\samples\win\windic\*.c not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\windic\*.h ..\%arch_dir%\samples\win\windic
if NOT exist ..\%arch_dir%\samples\win\windic\*.h echo file .\%arch_dir%\samples\win\windic\*.h not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\windic\*.def ..\%arch_dir%\samples\win\windic
if NOT exist ..\%arch_dir%\samples\win\windic\*.def echo File .\%arch_dir%\samples\win\windic\*.def not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\windic\*.ico ..\%arch_dir%\samples\win\windic
if NOT exist ..\%arch_dir%\samples\win\windic\*.ico echo File .\%arch_dir%\samples\win\windic\*.ico not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\windic\*.rc ..\%arch_dir%\samples\win\windic
if NOT exist ..\%arch_dir%\samples\win\windic\*.rc echo File .\%arch_dir%\samples\win\windic\*.rc not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\windic\*.bmp ..\%arch_dir%\samples\win\windic
if NOT exist ..\%arch_dir%\samples\win\windic\*.bmp echo File .\%arch_dir%\samples\win\windic\*.bmp not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\windic\%bld_path%\ml\release\link\*.res ..\%arch_dir%\samples\win\windic
if NOT exist ..\%arch_dir%\samples\win\windic\*.res echo File .\%arch_dir%\samples\win\windic\*.res not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\windic\%bld_path%\ml\release\windic.exe ..\%arch_dir%\samples\win\windic
if NOT exist ..\%arch_dir%\samples\win\windic\windic.exe echo File .\%arch_dir%\samples\win\windic\windic.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
:skip_windic

rem **************  CE SAMPLE CODE ************
if NOT "%langdir%"=="us" goto skip_ce_source
copy ..\samplece\cetalk\*.h			..\%arch_dir%\samples\wince\cetalk
if NOT exist ..\%arch_dir%\samples\wince\cetalk\*.h echo File .\%arch_dir%\samples\wince\cetalk\*.h not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\cetalk\*.cpp		..\%arch_dir%\samples\wince\cetalk
if NOT exist ..\%arch_dir%\samples\wince\cetalk\*.cpp echo File .\%arch_dir%\samples\wince\cetalk\*.cpp not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\cetalk\cetalk.mak   ..\%arch_dir%\samples\wince\cetalk
if NOT exist ..\%arch_dir%\samples\wince\cetalk\cetalk.mak echo File .\%arch_dir%\samples\wince\cetalk\cetalk.mak not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\cetalk\*.rc		..\%arch_dir%\samples\wince\cetalk
if NOT exist ..\%arch_dir%\samples\wince\cetalk\*.rc echo File .\%arch_dir%\samples\wince\cetalk\*.rc not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\cetalk\res\*.*		..\%arch_dir%\samples\wince\cetalk\res
if NOT exist ..\%arch_dir%\samples\wince\cetalk\res\*.* echo File .\%arch_dir%\samples\wince\cetalk\res\*.* not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\samplece\dtsample\*.h			..\%arch_dir%\samples\wince\dtsample
if NOT exist ..\%arch_dir%\samples\wince\dtsample\*.h echo File .\%arch_dir%\samples\wince\dtsample\*.h not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\dtsample\*.c			..\%arch_dir%\samples\wince\dtsample
if NOT exist ..\%arch_dir%\samples\wince\dtsample\*.c echo File .\%arch_dir%\samples\wince\dtsample\*.c not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\dtsample\*.cur			..\%arch_dir%\samples\wince\dtsample
if NOT exist ..\%arch_dir%\samples\wince\dtsample\*.cur echo File .\%arch_dir%\samples\wince\dtsample\*.cur not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\dtsample\*.bmp			..\%arch_dir%\samples\wince\dtsample
if NOT exist ..\%arch_dir%\samples\wince\dtsample\*.bmp echo File .\%arch_dir%\samples\wince\dtsample\*.bmp not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\dtsample\*.ico			..\%arch_dir%\samples\wince\dtsample
if NOT exist ..\%arch_dir%\samples\wince\dtsample\*.ico echo File .\%arch_dir%\samples\wince\dtsample\*.ico not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\dtsample\dtsample.mak    ..\%arch_dir%\samples\wince\dtsample
if NOT exist ..\%arch_dir%\samples\wince\dtsample\dtsample.mak echo File .\%arch_dir%\samples\wince\dtsample\dtsample.mak not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\dtsample\*.rc			..\%arch_dir%\samples\wince\dtsample
if NOT exist ..\%arch_dir%\samples\wince\dtsample\*.rc echo File .\%arch_dir%\samples\wince\dtsample\*.rc not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\samplece\mailread\*.h		..\%arch_dir%\samples\wince\mailread
if NOT exist ..\%arch_dir%\samples\wince\mailread\*.h echo File .\%arch_dir%\samples\wince\mailread\*.h not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\mailread\*.cpp		..\%arch_dir%\samples\wince\mailread
if NOT exist ..\%arch_dir%\samples\wince\mailread\*.cpp echo File .\%arch_dir%\samples\wince\mailread\*.cpp not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\mailread\*.rc		..\%arch_dir%\samples\wince\mailread
if NOT exist ..\%arch_dir%\samples\wince\mailread\*.rc echo File .\%arch_dir%\samples\wince\mailread\*.rc not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\mailread\res\*.*   ..\%arch_dir%\samples\wince\mailread\res
if NOT exist ..\%arch_dir%\samples\wince\mailread\res\*.* echo File .\%arch_dir%\samples\wince\mailread\res\*.* not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
:skip_ce_source

rem No source for windic for SDK

rem CE SAMPLES EXECUTIBLES
rem ******* wce200 *********
rem copy ..\samplece\cetalk\%bld_path%\Wce200\dll\mips\%langdir%\release\*.exe		..\%arch_dir%\samples\wince\wce200\cetalk\bin\mips\%langdir%
rem if NOT exist ..\%arch_dir%\samples\wince\wce200\cetalk\bin\mips\%langdir%\*.exe echo File .\%arch_dir%\samples\wince\wce200\cetalk\bin\mips\%langdir%\*.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
rem copy ..\samplece\cetalk\%bld_path%\Wce200\dll\sh\%langdir%\release\*.exe		..\%arch_dir%\samples\wince\wce200\cetalk\bin\sh\%langdir%
rem if NOT exist ..\%arch_dir%\samples\wince\wce200\cetalk\bin\sh\%langdir%\*.exe echo File .\%arch_dir%\samples\wince\wce200\cetalk\bin\sh\%langdir%\*.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
rem copy ..\samplece\cetalk\%bld_path%\Wce200\dll\x86em\%langdir%\release\*.exe		..\%arch_dir%\samples\wince\wce200\cetalk\bin\x86em\%langdir%
rem if NOT exist ..\%arch_dir%\samples\wince\wce200\cetalk\bin\x86em\%langdir%\*.exe echo File .\%arch_dir%\samples\wince\wce200\cetalk\bin\x86em\%langdir%\*.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem copy ..\samplece\dtsample\%bld_path%\Wce200\dll\mips\%langdir%\release\dtsample.exe   ..\%arch_dir%\samples\wince\wce200\dtsample\bin\mips\%langdir%
rem if NOT exist ..\%arch_dir%\samples\wince\wce200\dtsample\bin\mips\%langdir%\dtsample.exe echo File .\%arch_dir%\samples\wince\wce200\dtsample\bin\mips\%langdir%\dtsample.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log														
rem copy ..\samplece\dtsample\%bld_path%\Wce200\dll\sh\%langdir%\release\dtsample.exe  ..\%arch_dir%\samples\wince\wce200\dtsample\bin\sh\%langdir%
rem if NOT exist ..\%arch_dir%\samples\wince\wce200\dtsample\bin\sh\%langdir%\dtsample.exe echo File .\%arch_dir%\samples\wince\wce200\dtsample\bin\sh\%langdir%\dtsample.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
rem copy ..\samplece\dtsample\%bld_path%\Wce200\dll\x86em\%langdir%\release\dtsample.exe   ..\%arch_dir%\samples\wince\wce200\dtsample\bin\x86em\%langdir%
rem if NOT exist ..\%arch_dir%\samples\wince\wce200\dtsample\bin\x86em\%langdir%\dtsample.exe echo File .\%arch_dir%\samples\wince\wce200\dtsample\bin\x86em\%langdir%\dtsample.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem ******* WCE211 MS HPC PRO ************
copy ..\samplece\cetalk\%bld_path%\Wce211\mspro\dll\arm\%langdir%\release\dtalk_%langdir%.exe		..\%arch_dir%\samples\wince\wce211\mspro\cetalk\bin\arm\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\wce211\mspro\cetalk\bin\arm\%langdir%\dtalk_%langdir%.exe echo File .\%arch_dir%\samples\wince\wce211\mspro\cetalk\bin\arm\%langdir%\dtalk_%langdir%.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\cetalk\%bld_path%\Wce211\mspro\dll\mips\%langdir%\release\dtalk_%langdir%.exe    ..\%arch_dir%\samples\wince\wce211\mspro\cetalk\bin\mips\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\wce211\mspro\cetalk\bin\mips\%langdir%\dtalk_%langdir%.exe echo File .\%arch_dir%\samples\wince\wce211\mspro\cetalk\bin\mips\%langdir%\dtalk_%langdir%.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\cetalk\%bld_path%\Wce211\mspro\dll\sh\%langdir%\release\dtalk_%langdir%.exe		..\%arch_dir%\samples\wince\wce211\mspro\cetalk\bin\sh\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\wce211\mspro\cetalk\bin\sh\%langdir%\dtalk_%langdir%.exe echo File .\%arch_dir%\samples\wince\wce211\mspro\cetalk\bin\sh\%langdir%\dtalk_%langdir%.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\cetalk\%bld_path%\Wce211\mspro\dll\sh4\%langdir%\release\dtalk_%langdir%.exe		..\%arch_dir%\samples\wince\wce211\mspro\cetalk\bin\sh4\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\wce211\mspro\cetalk\bin\sh4\%langdir%\dtalk_%langdir%.exe echo File .\%arch_dir%\samples\wince\wce211\mspro\cetalk\bin\sh4\%langdir%\dtalk_%langdir%.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\cetalk\%bld_path%\Wce211\mspro\dll\x86em\%langdir%\release\dtalk_%langdir%.exe   ..\%arch_dir%\samples\wince\wce211\mspro\cetalk\bin\x86em\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\wce211\mspro\cetalk\bin\x86em\%langdir%\dtalk_%langdir%.exe echo File .\%arch_dir%\samples\wince\wce211\mspro\cetalk\bin\x86em\%langdir%\dtalk_%langdir%.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\samplece\dtsample\%bld_path%\Wce211\mspro\dll\arm\%langdir%\release\*.exe		..\%arch_dir%\samples\wince\wce211\mspro\dtsample\bin\arm\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\wce211\mspro\dtsample\bin\arm\%langdir%\*.exe echo File .\%arch_dir%\samples\wince\wce211\mspro\dtsample\bin\arm\%langdir%\*.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\dtsample\%bld_path%\Wce211\mspro\dll\mips\%langdir%\release\*.exe		..\%arch_dir%\samples\wince\wce211\mspro\dtsample\bin\mips\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\wce211\mspro\dtsample\bin\mips\%langdir%\*.exe echo File .\%arch_dir%\samples\wince\wce211\mspro\dtsample\bin\mips\%langdir%\*.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\dtsample\%bld_path%\Wce211\mspro\dll\sh\%langdir%\release\*.exe		..\%arch_dir%\samples\wince\wce211\mspro\dtsample\bin\sh\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\wce211\mspro\dtsample\bin\sh\%langdir%\*.exe echo File .\%arch_dir%\samples\wince\wce211\mspro\dtsample\bin\sh\%langdir%\*.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\dtsample\%bld_path%\Wce211\mspro\dll\sh4\%langdir%\release\*.exe		..\%arch_dir%\samples\wince\wce211\mspro\dtsample\bin\sh4\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\wce211\mspro\dtsample\bin\sh4\%langdir%\*.exe echo File .\%arch_dir%\samples\wince\wce211\mspro\dtsample\bin\sh4\%langdir%\*.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\dtsample\%bld_path%\Wce211\mspro\dll\x86em\%langdir%\release\*.exe		..\%arch_dir%\samples\wince\wce211\mspro\dtsample\bin\x86em\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\wce211\mspro\dtsample\bin\x86em\%langdir%\*.exe echo File .\%arch_dir%\samples\wince\wce211\mspro\dtsample\bin\x86em\%langdir%\*.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\samplece\mailread\%bld_path%\Wce211\mspro\dll\arm\us\release\*.exe		..\%arch_dir%\samples\wince\wce211\mspro\mailread\bin\arm\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\wce211\mspro\mailread\bin\arm\%langdir%\mailread.exe echo File .\%arch_dir%\samples\wince\wce211\mspro\mailread\bin\arm\%langdir%\mailread.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\mailread\%bld_path%\Wce211\mspro\dll\mips\us\release\*.exe		..\%arch_dir%\samples\wince\wce211\mspro\mailread\bin\mips\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\wce211\mspro\mailread\bin\mips\%langdir%\mailread.exe echo File .\%arch_dir%\samples\wince\wce211\mspro\mailread\bin\mips\%langdir%\mailread.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\mailread\%bld_path%\Wce211\mspro\dll\sh\us\release\*.exe		..\%arch_dir%\samples\wince\wce211\mspro\mailread\bin\sh\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\wce211\mspro\mailread\bin\sh\%langdir%\mailread.exe echo File .\%arch_dir%\samples\wince\wce211\mspro\mailread\bin\sh\%langdir%\mailread.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\mailread\%bld_path%\Wce211\mspro\dll\sh4\us\release\*.exe		..\%arch_dir%\samples\wince\wce211\mspro\mailread\bin\sh4\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\wce211\mspro\mailread\bin\sh4\%langdir%\mailread.exe echo File .\%arch_dir%\samples\wince\wce211\mspro\mailread\bin\sh4\%langdir%\mailread.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\mailread\%bld_path%\Wce211\mspro\dll\x86em\us\release\*.exe	..\%arch_dir%\samples\wince\wce211\mspro\mailread\bin\x86em\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\wce211\mspro\mailread\bin\x86em\%langdir%\mailread.exe echo File .\%arch_dir%\samples\wince\wce211\mspro\mailread\bin\x86em\%langdir%\mailread.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem copy ..\samplece\windic\%bld_path%\Wce211\mspro\dll\arm\%langdir%\release\windic.exe		..\%arch_dir%\samples\wince\wce211\mspro\windic\bin\arm\%langdir%
rem if NOT exist ..\%arch_dir%\samples\wince\wce211\mspro\windic\bin\arm\%langdir%\windic.exe echo File .\%arch_dir%\samples\wince\wce211\mspro\windic\bin\arm\%langdir%\windic.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
rem copy ..\samplece\windic\%bld_path%\Wce211\mspro\dll\mips\%langdir%\release\windic.exe    ..\%arch_dir%\samples\wince\wce211\mspro\windic\bin\mips\%langdir%
rem if NOT exist ..\%arch_dir%\samples\wince\wce211\mspro\windic\bin\mips\%langdir%\windic.exe echo File .\%arch_dir%\samples\wince\wce211\mspro\windic\bin\mips\%langdir%\windic.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
rem copy ..\samplece\windic\%bld_path%\Wce211\mspro\dll\sh\%langdir%\release\windic.exe		..\%arch_dir%\samples\wince\wce211\mspro\windic\bin\sh\%langdir%
rem if NOT exist ..\%arch_dir%\samples\wince\wce211\mspro\windic\bin\sh\%langdir%\windic.exe echo File .\%arch_dir%\samples\wince\wce211\mspro\windic\bin\sh\%langdir%\windic.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
rem copy ..\samplece\windic\%bld_path%\Wce211\mspro\dll\sh4\%langdir%\release\windic.exe		..\%arch_dir%\samples\wince\wce211\mspro\windic\bin\sh4\%langdir%
rem if NOT exist ..\%arch_dir%\samples\wince\wce211\mspro\windic\bin\sh4\%langdir%\windic.exe echo File .\%arch_dir%\samples\wince\wce211\mspro\windic\bin\sh4\%langdir%\windic.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
rem copy ..\samplece\windic\%bld_path%\Wce211\mspro\dll\x86em\%langdir%\release\windic.exe	..\%arch_dir%\samples\wince\wce211\mspro\windic\bin\x86em\%langdir%
rem if NOT exist ..\%arch_dir%\samples\wince\wce211\mspro\windic\bin\x86em\%langdir%\windic.exe echo File .\%arch_dir%\samples\wince\wce211\mspro\windic\bin\x86em\%langdir%\windic.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

if "%kitcopy_debug%"=="1" pause

rem ******** WCE211 PALM SIZE PC **********

copy ..\samplece\cetalk\%bld_path%\Wce211\palm\dll\mips\%langdir%\release\dtalk_%langdir%.exe		..\%arch_dir%\samples\wince\wce211\palm\cetalk\bin\mips\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\wce211\palm\cetalk\bin\mips\%langdir%\dtalk_%langdir%.exe echo File .\%arch_dir%\samples\wince\wce211\palm\cetalk\bin\mips\%langdir%\dtalk_%langdir%.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\cetalk\%bld_path%\Wce211\palm\dll\sh\%langdir%\release\dtalk_%langdir%.exe		..\%arch_dir%\samples\wince\wce211\palm\cetalk\bin\sh\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\wce211\palm\cetalk\bin\sh\%langdir%\dtalk_%langdir%.exe echo File .\%arch_dir%\samples\wince\wce211\palm\cetalk\bin\sh\%langdir%\dtalk_%langdir%.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\cetalk\%bld_path%\Wce211\palm\dll\x86em\%langdir%\release\dtalk_%langdir%.exe	..\%arch_dir%\samples\wince\wce211\palm\cetalk\bin\x86em\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\wce211\palm\cetalk\bin\x86em\%langdir%\dtalk_%langdir%.exe echo File .\%arch_dir%\samples\wince\wce211\palm\cetalk\bin\x86em\%langdir%\dtalk_%langdir%.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\samplece\dtsample\%bld_path%\Wce211\palm\dll\mips\%langdir%\release\dtsample.exe		..\%arch_dir%\samples\wince\Wce211\palm\dtsample\bin\mips\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\Wce211\palm\dtsample\bin\mips\%langdir%\dtsample.exe echo File .\%arch_dir%\samples\wince\Wce211\palm\dtsample\bin\mips\%langdir%\dtsample.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\dtsample\%bld_path%\Wce211\palm\dll\sh\%langdir%\release\dtsample.exe			..\%arch_dir%\samples\wince\Wce211\palm\dtsample\bin\sh\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\Wce211\palm\dtsample\bin\sh\%langdir%\dtsample.exe echo File .\%arch_dir%\samples\wince\Wce211\palm\dtsample\bin\sh\%langdir%\dtsample.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\dtsample\%bld_path%\Wce211\palm\dll\x86em\%langdir%\release\dtsample.exe		..\%arch_dir%\samples\wince\Wce211\palm\dtsample\bin\x86em\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\Wce211\palm\dtsample\bin\x86em\%langdir%\dtsample.exe echo File .\%arch_dir%\samples\wince\Wce211\palm\dtsample\bin\x86em\%langdir%\dtsample.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log


rem ********** ce sample code for Wce300 POCKET PC *********
copy ..\samplece\cetalk\%bld_path%\wce300\pocket\dll\arm\%langdir%\release\dtalk_%langdir%.exe		..\%arch_dir%\samples\wince\wce300\pocket\cetalk\bin\arm\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\wce300\pocket\cetalk\bin\arm\%langdir%\dtalk_%langdir%.exe echo File .\%arch_dir%\samples\wince\wce300\pocket\cetalk\bin\arm\%langdir%\dtalk_%langdir%.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\cetalk\%bld_path%\wce300\pocket\dll\mips\%langdir%\release\dtalk_%langdir%.exe		..\%arch_dir%\samples\wince\wce300\pocket\cetalk\bin\mips\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\wce300\pocket\cetalk\bin\mips\%langdir%\dtalk_%langdir%.exe echo File .\%arch_dir%\samples\wince\wce300\pocket\cetalk\bin\mips\%langdir%\dtalk_%langdir%.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\cetalk\%bld_path%\wce300\pocket\dll\sh\%langdir%\release\dtalk_%langdir%.exe		..\%arch_dir%\samples\wince\wce300\pocket\cetalk\bin\sh\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\wce300\pocket\cetalk\bin\sh\%langdir%\dtalk_%langdir%.exe echo File .\%arch_dir%\samples\wince\wce300\pocket\cetalk\bin\sh\%langdir%\dtalk_%langdir%.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\cetalk\%bld_path%\wce300\pocket\dll\x86em\%langdir%\release\dtalk_%langdir%.exe		..\%arch_dir%\samples\wince\wce300\pocket\cetalk\bin\x86em\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\wce300\pocket\cetalk\bin\x86em\%langdir%\dtalk_%langdir%.exe echo File .\%arch_dir%\samples\wince\wce300\pocket\cetalk\bin\x86em\%langdir%\dtalk_%langdir%.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\samplece\dtsample\%bld_path%\wce300\pocket\dll\arm\%langdir%\release\*.exe		..\%arch_dir%\samples\wince\wce300\pocket\dtsample\bin\arm\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\wce300\pocket\dtsample\bin\arm\%langdir%\dtsample.exe echo File .\%arch_dir%\samples\wince\wce300\pocket\dtsample\bin\arm\%langdir%\dtsample.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\dtsample\%bld_path%\wce300\pocket\dll\mips\%langdir%\release\*.exe	..\%arch_dir%\samples\wince\wce300\pocket\dtsample\bin\mips\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\wce300\pocket\dtsample\bin\mips\%langdir%\dtsample.exe echo File .\%arch_dir%\samples\wince\wce300\pocket\dtsample\bin\mips\%langdir%\dtsample.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\dtsample\%bld_path%\wce300\pocket\dll\sh\%langdir%\release\*.exe		..\%arch_dir%\samples\wince\wce300\pocket\dtsample\bin\sh\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\wce300\pocket\dtsample\bin\sh\%langdir%\dtsample.exe echo File .\%arch_dir%\samples\wince\wce300\pocket\dtsample\bin\sh\%langdir%\dtsample.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\dtsample\%bld_path%\wce300\pocket\dll\x86em\%langdir%\release\*.exe	..\%arch_dir%\samples\wince\wce300\pocket\dtsample\bin\x86em\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\wce300\pocket\dtsample\bin\x86em\%langdir%\dtsample.exe echo File .\%arch_dir%\samples\wince\wce300\pocket\dtsample\bin\x86em\%langdir%\dtsample.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\samplece\mailread\%bld_path%\wce300\pocket\dll\arm\us\release\mailread.exe		..\%arch_dir%\samples\wince\wce300\pocket\mailread\bin\arm\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\wce300\pocket\mailread\bin\arm\%langdir%\mailread.exe echo File .\%arch_dir%\samples\wince\wce300\pocket\mailread\bin\arm\%langdir%\mailread.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\mailread\%bld_path%\wce300\pocket\dll\mips\us\release\mailread.exe		..\%arch_dir%\samples\wince\wce300\pocket\mailread\bin\mips\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\wce300\pocket\mailread\bin\mips\%langdir%\mailread.exe echo File .\%arch_dir%\samples\wince\wce300\pocket\mailread\bin\mips\%langdir%\mailread.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\mailread\%bld_path%\wce300\pocket\dll\sh\us\release\mailread.exe			..\%arch_dir%\samples\wince\wce300\pocket\mailread\bin\sh\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\wce300\pocket\mailread\bin\sh\%langdir%\mailread.exe echo File .\%arch_dir%\samples\wince\wce300\pocket\mailread\bin\sh\%langdir%\mailread.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\mailread\%bld_path%\wce300\pocket\dll\x86em\us\release\mailread.exe		..\%arch_dir%\samples\wince\wce300\pocket\mailread\bin\x86em\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\wce300\pocket\mailread\bin\x86em\%langdir%\mailread.exe echo File .\%arch_dir%\samples\wince\wce300\pocket\mailread\bin\x86em\%langdir%\mailread.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log


rem ********** ce sample code for Wce300 HPC 2000 *********
copy ..\samplece\cetalk\%bld_path%\wce300\2000\dll\arm\%langdir%\release\dtalk_%langdir%.exe		..\%arch_dir%\samples\wince\wce300\2000\cetalk\bin\arm\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\wce300\2000\cetalk\bin\arm\%langdir%\dtalk_%langdir%.exe echo File .\%arch_dir%\samples\wince\wce300\2000\cetalk\bin\arm\%langdir%\dtalk_%langdir%.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\cetalk\%bld_path%\wce300\2000\dll\mips\%langdir%\release\dtalk_%langdir%.exe		..\%arch_dir%\samples\wince\wce300\2000\cetalk\bin\mips\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\wce300\2000\cetalk\bin\mips\%langdir%\dtalk_%langdir%.exe echo File .\%arch_dir%\samples\wince\wce300\2000\cetalk\bin\mips\%langdir%\dtalk_%langdir%.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\samplece\dtsample\%bld_path%\wce300\2000\dll\arm\%langdir%\release\*.exe		..\%arch_dir%\samples\wince\wce300\2000\dtsample\bin\arm\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\wce300\2000\dtsample\bin\arm\%langdir%\dtsample.exe echo File .\%arch_dir%\samples\wince\wce300\2000\dtsample\bin\arm\%langdir%\dtsample.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\dtsample\%bld_path%\wce300\2000\dll\mips\%langdir%\release\*.exe	..\%arch_dir%\samples\wince\wce300\2000\dtsample\bin\mips\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\wce300\2000\dtsample\bin\mips\%langdir%\dtsample.exe echo File .\%arch_dir%\samples\wince\wce300\2000\dtsample\bin\mips\%langdir%\dtsample.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\samplece\mailread\%bld_path%\wce300\2000\dll\arm\us\release\mailread.exe		..\%arch_dir%\samples\wince\wce300\2000\mailread\bin\arm\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\wce300\2000\mailread\bin\arm\%langdir%\mailread.exe echo File .\%arch_dir%\samples\wince\wce300\2000\mailread\bin\arm\%langdir%\mailread.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\mailread\%bld_path%\wce300\2000\dll\mips\us\release\mailread.exe		..\%arch_dir%\samples\wince\wce300\2000\mailread\bin\mips\%langdir%
if NOT exist ..\%arch_dir%\samples\wince\wce300\2000\mailread\bin\mips\%langdir%\mailread.exe echo File .\%arch_dir%\samples\wince\wce300\2000\mailread\bin\mips\%langdir%\mailread.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log




if "%kitcopy_debug%"=="1" pause
echo ***************************************************************
echo %arch_dir%\%langdir%\INSTALL\DATA\PROGRAM
echo %arch_dir%\%langdir%\INSTALL\WDATA\PROGRAM 
echo ***************************************************************


rem files for the dectalk program area
copy ..\samples\dtsample\%bld_path%\ml\release\dtsample.exe ..\%arch_dir%\%langdir%\install\data\program
if NOT exist ..\%arch_dir%\%langdir%\install\data\program\dtsample.exe echo File .\%arch_dir%\%langdir%\install\data\program\dtsample.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\speak\%bld_path%\%langdir%\release\speak.exe ..\%arch_dir%\%langdir%\install\data\program
if NOT exist ..\%arch_dir%\%langdir%\install\data\program\speak.exe echo File .\%arch_dir%\%langdir%\install\data\program\speak.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\windic\%bld_path%\ml\release\windic.exe ..\%arch_dir%\%langdir%\install\data\program
if NOT exist ..\%arch_dir%\%langdir%\install\data\program\windic.exe echo File .\%arch_dir%\%langdir%\install\data\program\windic.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

if "%langdir%"=="fr" goto skip_fr3
copy ..\samples\ttstest\%bld_path%\%langdir%\release\ttstest.exe ..\%arch_dir%\%langdir%\install\data\program
if NOT exist ..\%arch_dir%\%langdir%\install\data\program\ttstest.exe echo File .\%arch_dir%\%langdir%\install\data\program\ttstest.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem -- Willow Pond's version of TTSTEST --
copy ..\samples\wttstest\%bld_path%\%langdir%\release\wttstest.exe ..\%arch_dir%\%langdir%\install\wdata\program
if NOT exist ..\%arch_dir%\%langdir%\install\wdata\program\wttstest.exe echo File .\%arch_dir%\%langdir%\install\wdata\program\wttstest.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
:skip_fr3

if "%langdir%"=="fr" goto skip_fr4
echo ***************************************************************
echo %arch_dir%\%langdir%\INSTALL\DATA\SPEECH
echo %arch_dir%\%langdir%\INSTALL\WDATA\SPEECH
echo ***************************************************************
rem renamed dtlkttse_%langdir%.dll
copy ..\sapi\%bld_path%\dtlkttse\%langdir%\release\dtlkttse.dll ..\%arch_dir%\%langdir%\install\data\speech\dtlkttse_%langdir%.dll
if NOT exist ..\%arch_dir%\%langdir%\install\data\speech\dtlkttse_%langdir%.dll echo File .\%arch_dir%\%langdir%\install\data\speech\dtlkttse_%langdir%.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\sapi\%bld_path%\dtlkttse\%langdir%\release\dtlkttse.dll ..\%arch_dir%\%langdir%\install\data\speech\dtlkttse.dll
if NOT exist ..\%arch_dir%\%langdir%\install\data\speech\dtlkttse.dll echo File .\%arch_dir%\%langdir%\install\data\speech\dtlkttse.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
rem -- Willow Pond's version of DTLKTTSE.DLL --
copy ..\sapi\%bld_path%\wtlkttse\%langdir%\release\wtlkttse.dll ..\%arch_dir%\%langdir%\install\wdata\speech
if NOT exist ..\%arch_dir%\%langdir%\install\wdata\speech\wtlkttse.dll echo File .\%arch_dir%\%langdir%\install\wdata\speech\wtlkttse.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
:skip_fr4

if not "%langdir%"=="us" goto skip_sapi5
echo ***************************************************************
echo %arch_dir%\%langdir%\INSTALL\DATA\AS_IS\SAPI5
echo ***************************************************************

copy ..\sapi5\%bld_path%\%langdir%\release\sapi5.dll ..\%arch_dir%\%langdir%\install\data\as_is\sapi5
if NOT exist ..\%arch_dir%\%langdir%\install\data\as_is\sapi5\sapi5.dll echo File .\%arch_dir%\%langdir%\install\data\as_is\sapi5\sapi5.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
:skip_sapi5

if "%kitcopy_debug%"=="1" pause
if NOT "%langdir%"=="us" goto skip_help
echo ***************************************************************
echo %arch_dir%\HELP
echo ***************************************************************

rem help files
copy ..\help\dectalk.cnt ..\%arch_dir%\help
if NOT exist ..\%arch_dir%\help\dectalk.cnt echo File .\%arch_dir%\help\dectalk.cnt not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\help\dectalk.hlp ..\%arch_dir%\help
if NOT exist ..\%arch_dir%\help\dectalk.hlp echo File .\%arch_dir%\help\dectalk.hlp not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
:skip_help

echo ***************************************************************
echo %arch_dir%\%langdir%\static (Static PKG)
rem NOTE: This is for static builds
echo ***************************************************************

copy ..\dapi\%bld_path%\dtstatic\%langdir%\release\dtstatic.lib ..\%arch_dir%\%langdir%\static
if NOT exist ..\%arch_dir%\%langdir%\static\dtstatic.lib echo File .\%arch_dir%\%langdir%\static\dtstatic.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\dtdemo\%langdir%\release\dtdemo.exe ..\%arch_dir%\%langdir%\static
if NOT exist ..\%arch_dir%\%langdir%\static\dtdemo.exe echo File .\%arch_dir%\%langdir%\static\dtdemo.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\dtsample\%bld_path%\%langdir%\a32stat\dtaccess.exe ..\%arch_dir%\%langdir%\static
if NOT exist ..\%arch_dir%\%langdir%\static\dtaccess.exe echo File .\%arch_dir%\%langdir%\static\dtaccess.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\say\%bld_path%\%langdir%\static\*.exe ..\%arch_dir%\%langdir%\static
if NOT exist ..\%arch_dir%\%langdir%\static\*.exe echo File .\%arch_dir%\%langdir%\static\*.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\windic\%bld_path%\%langdir%\wdicstat\*.exe ..\%arch_dir%\%langdir%\static
if NOT exist ..\%arch_dir%\%langdir%\static\*.exe echo File .\%arch_dir%\%langdir%\static\*.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\dtalkdic\%langdir%\release\dtalk_%langdir%.dic ..\%arch_dir%\%langdir%\static\*.*
if NOT exist ..\%arch_dir%\%langdir%\static\dtalk_%langdir%.dic echo File .\%arch_dir%\%langdir%\static\dtalk_%langdir%.dic not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

echo *****************************************************************
echo %arch_dir%\%langdir%\staticce (Static PKG) Windows CE
echo *****************************************************************

rem copy dictionary
copy ..\dapi\%bld_path%\dtalkdic\%langdir%\release\dtalk_%langdir%.dic ..\%arch_dir%\%langdir%\staticce\*.*
if NOT exist ..\%arch_dir%\%langdir%\staticce\dtalk_%langdir%.dic echo File .\%arch_dir%\%langdir%\staticce\dtalk_%langdir%.dic not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\samples\windic\%bld_path%\%langdir%\wdicstat\*.exe ..\%arch_dir%\%langdir%\staticce
if NOT exist ..\%arch_dir%\%langdir%\staticce\*.exe echo File .\%arch_dir%\%langdir%\staticce\*.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem wce200
rem copy ..\dapi\%bld_path%\Wce200\cestatic\mips\%langdir%\release\dtstatic.lib	..\%arch_dir%\%langdir%\staticce\Wce200\mips
rem if NOT exist ..\%arch_dir%\%langdir%\staticce\Wce200\mips\dtstatic.lib echo File .\%arch_dir%\%langdir%\staticce\Wce200\mips\dtstatic.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
rem copy ..\dapi\%bld_path%\Wce200\cestatic\sh\%langdir%\release\dtstatic.lib		..\%arch_dir%\%langdir%\staticce\Wce200\sh
rem if NOT exist ..\%arch_dir%\%langdir%\staticce\Wce200\sh\dtstatic.lib echo File .\%arch_dir%\%langdir%\staticce\Wce200\sh\dtstatic.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
rem copy ..\dapi\%bld_path%\Wce200\cestatic\x86em\%langdir%\release\dtstatic.lib	..\%arch_dir%\%langdir%\staticce\Wce200\x86em
rem if NOT exist ..\%arch_dir%\%langdir%\staticce\Wce200\x86em\dtstatic.lib echo File .\%arch_dir%\%langdir%\staticce\Wce200\x86em\dtstatic.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem wce211 for MS HPC PRO
copy ..\dapi\%bld_path%\Wce211\mspro\cestatic\arm\%langdir%\release\dtstatic.lib	..\%arch_dir%\%langdir%\staticce\Wce211\mspro\arm
if NOT exist ..\%arch_dir%\%langdir%\staticce\Wce211\mspro\arm\dtstatic.lib echo File .\%arch_dir%\%langdir%\staticce\Wce211\mspro\arm\dtstatic.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\Wce211\mspro\cestatic\mips\%langdir%\release\dtstatic.lib	..\%arch_dir%\%langdir%\staticce\Wce211\mspro\mips
if NOT exist ..\%arch_dir%\%langdir%\staticce\Wce211\mspro\mips\dtstatic.lib echo File .\%arch_dir%\%langdir%\staticce\Wce211\mspro\mips\dtstatic.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\Wce211\mspro\cestatic\sh\%langdir%\release\dtstatic.lib	..\%arch_dir%\%langdir%\staticce\Wce211\mspro\sh
if NOT exist ..\%arch_dir%\%langdir%\staticce\Wce211\mspro\sh\dtstatic.lib echo File .\%arch_dir%\%langdir%\staticce\Wce211\mspro\sh\dtstatic.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\Wce211\mspro\cestatic\sh4\%langdir%\release\dtstatic.lib	..\%arch_dir%\%langdir%\staticce\Wce211\mspro\sh4
if NOT exist ..\%arch_dir%\%langdir%\staticce\Wce211\mspro\sh4\dtstatic.lib echo File .\%arch_dir%\%langdir%\staticce\Wce211\mspro\sh4\dtstatic.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\Wce211\mspro\cestatic\x86em\%langdir%\release\dtstatic.lib ..\%arch_dir%\%langdir%\staticce\Wce211\mspro\x86em
if NOT exist ..\%arch_dir%\%langdir%\staticce\Wce211\mspro\x86em\dtstatic.lib echo File .\%arch_dir%\%langdir%\staticce\Wce211\mspro\x86em\dtstatic.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem wce211 for PALM SIZE PC
copy ..\dapi\%bld_path%\wce211\palm\cestatic\mips\%langdir%\release\dtstatic.lib	..\%arch_dir%\%langdir%\staticce\wce211\palm\mips
if NOT exist ..\%arch_dir%\%langdir%\staticce\wce211\palm\mips\dtstatic.lib echo File .\%arch_dir%\%langdir%\staticce\wce211\palm\mips\dtstatic.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\wce211\palm\cestatic\sh\%langdir%\release\dtstatic.lib		..\%arch_dir%\%langdir%\staticce\wce211\palm\sh
if NOT exist ..\%arch_dir%\%langdir%\staticce\wce211\palm\sh\dtstatic.lib echo File .\%arch_dir%\%langdir%\staticce\wce211\palm\sh\dtstatic.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\wce211\palm\cestatic\x86em\%langdir%\release\dtstatic.lib	..\%arch_dir%\%langdir%\staticce\Wce211\palm\x86em
if NOT exist ..\%arch_dir%\%langdir%\staticce\wce211\palm\x86em\dtstatic.lib echo File .\%arch_dir%\%langdir%\staticce\wce211\palm\x86em\dtstatic.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem wce300 for POCKET PC
copy ..\dapi\%bld_path%\wce300\pocket\cestatic\xscale\%langdir%\release\dtstatic.lib		..\%arch_dir%\%langdir%\staticce\wce300\pocket\xscale
if NOT exist ..\%arch_dir%\%langdir%\staticce\wce300\pocket\xscale\dtstatic.lib echo File .\%arch_dir%\%langdir%\staticce\wce300\pocket\xscale\dtstatic.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\wce300\pocket\cestatic\arm\%langdir%\release\dtstatic.lib		..\%arch_dir%\%langdir%\staticce\wce300\pocket\arm
if NOT exist ..\%arch_dir%\%langdir%\staticce\wce300\pocket\arm\dtstatic.lib echo File .\%arch_dir%\%langdir%\staticce\wce300\pocket\arm\dtstatic.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\wce300\pocket\cestatic\mips\%langdir%\release\dtstatic.lib	..\%arch_dir%\%langdir%\staticce\wce300\pocket\mips
if NOT exist ..\%arch_dir%\%langdir%\staticce\wce300\pocket\mips\dtstatic.lib echo File .\%arch_dir%\%langdir%\staticce\wce300\pocket\mips\dtstatic.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\wce300\pocket\cestatic\sh\%langdir%\release\dtstatic.lib		..\%arch_dir%\%langdir%\staticce\wce300\pocket\sh
if NOT exist ..\%arch_dir%\%langdir%\staticce\wce300\pocket\sh\dtstatic.lib echo File .\%arch_dir%\%langdir%\staticce\wce300\pocket\sh\dtstatic.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\wce300\pocket\cestatic\x86em\%langdir%\release\dtstatic.lib	..\%arch_dir%\%langdir%\staticce\Wce300\pocket\x86em
if NOT exist ..\%arch_dir%\%langdir%\staticce\wce300\pocket\x86em\dtstatic.lib echo File .\%arch_dir%\%langdir%\staticce\wce300\pocket\x86em\dtstatic.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem wce300 for HPC 2000
copy ..\dapi\%bld_path%\wce300\2000\cestatic\arm\%langdir%\release\dtstatic.lib		..\%arch_dir%\%langdir%\staticce\wce300\2000\arm
if NOT exist ..\%arch_dir%\%langdir%\staticce\wce300\2000\arm\dtstatic.lib echo File .\%arch_dir%\%langdir%\staticce\wce300\2000\arm\dtstatic.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\wce300\2000\cestatic\mips\%langdir%\release\dtstatic.lib	..\%arch_dir%\%langdir%\staticce\wce300\2000\mips
if NOT exist ..\%arch_dir%\%langdir%\staticce\wce300\2000\mips\dtstatic.lib echo File .\%arch_dir%\%langdir%\staticce\wce300\2000\mips\dtstatic.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

if "%kitcopy_debug%"=="1" pause
if NOT "%langdir%"=="us" goto skip_microsoft
echo ***************************************************************
echo Speech.dll and Msvcrt.dll
echo ***************************************************************

copy ..\microsoft\%msdir%\speech.dll ..\%arch_dir%\microsoft
if NOT exist ..\%arch_dir%\microsoft\speech.dll echo File .\%arch_dir%\microsoft\speech.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\microsoft\%msdir%\msvcrt.dll ..\%arch_dir%\microsoft
if NOT exist ..\%arch_dir%\microsoft\msvcrt.dll echo File .\%arch_dir%\mircosoft\msvcrt.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

:skip_microsoft

if "%kitcopy_debug%"=="1" pause

copy ..\microsoft\%msdir%\speech.dll ..\%arch_dir%\%langdir%\install\wdata\speech
if NOT exist ..\%arch_dir%\%langdir%\install\wdata\speech\speech.dll echo File .\%arch_dir%\%langdir%\install\wdata\speech\speech.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

echo ***************************************************************
echo %arch_dir%\%angdir%\INSTALL\DATA\SPROGRAM
echo ***************************************************************

copy ..\samples\ttssrv\%bld_path%\%langdir%\release\ttssrv.exe ..\%arch_dir%\%langdir%\install\data\sprogram
if NOT exist ..\%arch_dir%\%langdir%\install\data\sprogram\ttssrv.exe echo File .\%arch_dir%\%langdir%\install\data\sprogram\ttssrv.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\"microsoft"\%msdir%\msvcrt.dll ..\%arch_dir%\%langdir%\install\wdata\sprogram
if NOT exist ..\%arch_dir%\%langdir%\install\wdata\sprogram\msvcrt.dll echo File .\%arch_dir%\%langdir%\install\wdata\sprogram\msvcrt.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

if "%kitcopy_debug%"=="1" pause
rem *****************************************************
rem dectalk.lib, dectalk.dll, and cpanel.dll goes together
rem dtlkstat.lib and wtlkstat.lib here??? (we made them but are not included)
rem *****************************************************

echo ***************************************************************
echo dectalk.lib, dectalk.dll, and cpanel.dll goes together
echo ***************************************************************

rem placed all files together that get installed in dectalk\%langdir%  in install\data\%langdir% folder for the windows install 
copy ..\dapi\%bld_path%\dectalk\%langdir%\release\dectalk.lib ..\%arch_dir%\%langdir%\install\data\as_is\%langdir%\*.*
if NOT exist ..\%arch_dir%\%langdir%\install\data\as_is\%langdir%\dectalk.lib echo File .\%arch_dir%\%langdir%\install\data\as_is\%langdir%\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\dectalk\%langdir%\release\dectalk.dll ..\%arch_dir%\%langdir%\install\data\as_is\%langdir%\*.*
if NOT exist ..\%arch_dir%\%langdir%\install\data\as_is\%langdir%\dectalk.dll echo File .\%arch_dir%\%langdir%\install\data\as_is\%langdir%\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

if "%langdir%"=="fr" goto skip_fr6
copy ..\sapi\%bld_path%\dtlkttse\%langdir%\release\dtlkttse.dll ..\%arch_dir%\%langdir%\install\data\as_is\%langdir%\dtlkttse.dll
if NOT exist ..\%arch_dir%\%langdir%\install\data\as_is\%langdir%\dtlkttse.dll echo File .\%arch_dir%\%langdir%\install\data\as_is\%langdir%\dtlkttse.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

echo ***************************************************************
echo %arch_dir%\%langdir%\INSTALL\DATA\SPEECH
echo %arch_dir%\%langdir%\INSTALL\WDATA\SPEECH
echo ***************************************************************
rem renamed dtlkttse_%langdir%.dll
copy ..\sapi\%bld_path%\dtlkttse\%langdir%\release\dtlkttse.dll ..\%arch_dir%\%langdir%\install\data\speech\dtlkttse_%langdir%.dll
if NOT exist ..\%arch_dir%\%langdir%\install\data\speech\dtlkttse_%langdir%.dll echo File .\%arch_dir%\%langdir%\install\data\speech\dtlkttse_%langdir%.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\sapi\%bld_path%\dtlkttse\%langdir%\release\dtlkttse.dll ..\%arch_dir%\%langdir%\install\data\speech\dtlkttse.dll
if NOT exist ..\%arch_dir%\%langdir%\install\data\speech\dtlkttse.dll echo File .\%arch_dir%\%langdir%\install\data\speech\dtlkttse.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
rem -- Willow Pond's version of DTLKTTSE.DLL --
copy ..\sapi\%bld_path%\wtlkttse\%langdir%\release\wtlkttse.dll ..\%arch_dir%\%langdir%\install\wdata\speech
if NOT exist ..\%arch_dir%\%langdir%\install\wdata\speech\wtlkttse.dll echo File .\%arch_dir%\%langdir%\install\wdata\speech\wtlkttse.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

:skip_fr6

copy ..\samples\say\%bld_path%\%langdir%\release\say.exe        ..\%arch_dir%\%langdir%\install\data\as_is\%langdir%\*.*
if NOT exist ..\%arch_dir%\%langdir%\install\data\as_is\%langdir%\say.exe echo File .\%arch_dir%\%langdir%\install\data\as_is\%langdir%\say.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\speak\%bld_path%\%langdir%\release\speak.exe	..\%arch_dir%\%langdir%\install\data\as_is
if NOT exist ..\%arch_dir%\%langdir%\install\data\as_is\speak.exe echo File .\%arch_dir%\%langdir%\install\data\as_is\speak.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\speak\%bld_path%\%langdir%\release\speak.exe    ..\%arch_dir%\%langdir%\install\data\as_is\%langdir%\speak_%langdir%.exe
if NOT exist ..\%arch_dir%\%langdir%\install\data\as_is\%langdir%\speak_%langdir%.exe echo File .\%arch_dir%\%langdir%\install\data\as_is\%langdir%\speak_%langdir%.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem copy for install shield 6.0
if not exist ..\%arch_dir%\us\install\data\windows\dectalk\speak.exe	copy ..\samples\speak\%bld_path%\%langdir%\release\speak.exe	..\%arch_dir%\us\install\data\windows\dectalk\speak.exe
if NOT exist ..\%arch_dir%\us\install\data\windows\dectalk\speak.exe echo File .\%arch_dir%\us\install\data\windows\dectalk\speak.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\ttssrv\%bld_path%\%langdir%\release\ttssrv.exe  ..\%arch_dir%\%langdir%\install\data\as_is\%langdir%\*.*
if NOT exist ..\%arch_dir%\%langdir%\install\data\as_is\%langdir%\ttssrv.exe echo File .\%arch_dir%\%langdir%\install\data\as_is\%langdir%\ttssrv.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\src\dic\user.tab  ..\%arch_dir%\%langdir%\install\data\as_is\%langdir%\user_%langdir%.tab
if NOT exist ..\%arch_dir%\%langdir%\install\data\as_is\%langdir%\user_%langdir%.tab echo File .\%arch_dir%\%langdir%\install\data\as_is\%langdir%\user_%langdir%.tab not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem windows, windows\system area
copy ..\dapi\%bld_path%\dectalk\%langdir%\release\dectalk.dll ..\%arch_dir%\%langdir%\install\data\as_is\sys_dir\dtalk_%langdir%.dll
if NOT exist ..\%arch_dir%\%langdir%\install\data\as_is\sys_dir\dtalk_%langdir%.dll echo File .\%arch_dir%\%langdir%\install\data\as_is\sys_dir\dtalk_%langdir%.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\dectalk\%langdir%\release\dectalk.dll ..\%arch_dir%\%langdir%\install\data\as_is\sys_dir\dectalk.dll
if NOT exist ..\%arch_dir%\%langdir%\install\data\as_is\sys_dir\dectalk.dll echo File .\%arch_dir%\%langdir%\install\data\as_is\sys_dir\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\dectalk\%langdir%\release\dectalk.dll ..\%arch_dir%\%langdir%\install\data\sprogram
if NOT exist ..\%arch_dir%\%langdir%\install\data\sprogram\dectalk.dll echo File .\%arch_dir%\%langdir%\install\data\sprogram\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
REM *** copy ..\cpanel\%bld_path%\release\cpanel.dll ..\%arch_dir%\%langdir%\install\data\sprogram
REM *** copy dtlkstat? to data\lib
REM *** copy wtlkstat? to wdata\wlib

echo ***************************************************************
echo dectalk.lib, dectalk.dll for Wce
echo ***************************************************************

rem Wce200 dll and lib files
rem copy ..\dapi\%bld_path%\Wce200\cedll\mips\%langdir%\release\dectalk.dll ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%langdir%\mips
rem if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%langdir%\mips\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%langdir%\mips\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
rem copy ..\dapi\%bld_path%\Wce200\cedll\mips\%langdir%\release\dectalk.lib ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%langdir%\mips
rem if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%langdir%\mips\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%langdir%\mips\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem copy ..\dapi\%bld_path%\Wce200\cedll\sh\%langdir%\release\dectalk.dll ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%langdir%\sh
rem if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%langdir%\sh\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%langdir%\sh\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
rem copy ..\dapi\%bld_path%\Wce200\cedll\sh\%langdir%\release\dectalk.lib ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%langdir%\sh
rem if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%langdir%\sh\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%langdir%\sh\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem copy ..\dapi\%bld_path%\Wce200\cedll\x86em\%langdir%\release\dectalk.dll ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%langdir%\x86em
rem if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%langdir%\x86em\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%langdir%\x86em\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
rem copy ..\dapi\%bld_path%\Wce200\cedll\x86em\%langdir%\release\dectalk.lib ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%langdir%\x86em
rem if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%langdir%\x86em\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%langdir%\x86em\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem Copy again for dynamic links in Install shield
rem copy ..\dapi\%bld_path%\Wce200\cedll\mips\%langdir%\release\dectalk.dll		..\%arch_dir%\%langdir%\install\cedata\wce200\dll_and_lib\%langdir%\mips
rem if NOT exist ..\%arch_dir%\%langdir%\install\cedata\wce200\dll_and_lib\%langdir%\mips\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\wce200\dll_and_lib\%langdir%\mips\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
rem copy ..\dapi\%bld_path%\Wce200\cedll\mips\%langdir%\release\dectalk.lib		..\%arch_dir%\%langdir%\install\cedata\wce200\dll_and_lib\%langdir%\mips
rem if NOT exist ..\%arch_dir%\%langdir%\install\cedata\wce200\dll_and_lib\%langdir%\mips\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\wce200\dll_and_lib\%langdir%\mips\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem copy ..\dapi\%bld_path%\Wce200\cedll\sh\%langdir%\release\dectalk.dll		..\%arch_dir%\%langdir%\install\cedata\wce200\dll_and_lib\%langdir%\sh
rem if NOT exist ..\%arch_dir%\%langdir%\install\cedata\wce200\dll_and_lib\%langdir%\sh\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\wce200\dll_and_lib\%langdir%\sh\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
rem copy ..\dapi\%bld_path%\Wce200\cedll\sh\%langdir%\release\dectalk.lib		..\%arch_dir%\%langdir%\install\cedata\wce200\dll_and_lib\%langdir%\sh
rem if NOT exist ..\%arch_dir%\%langdir%\install\cedata\wce200\dll_and_lib\%langdir%\sh\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\wce200\dll_and_lib\%langdir%\sh\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem copy ..\dapi\%bld_path%\Wce200\cedll\x86em\%langdir%\release\dectalk.dll	..\%arch_dir%\%langdir%\install\cedata\wce200\dll_and_lib\%langdir%\x86em
rem if NOT exist ..\%arch_dir%\%langdir%\install\cedata\wce200\dll_and_lib\%langdir%\x86em\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\wce200\dll_and_lib\%langdir%\x86em\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
rem copy ..\dapi\%bld_path%\Wce200\cedll\x86em\%langdir%\release\dectalk.lib	..\%arch_dir%\%langdir%\install\cedata\wce200\dll_and_lib\%langdir%\x86em
rem if NOT exist ..\%arch_dir%\%langdir%\install\cedata\wce200\dll_and_lib\%langdir%\x86em\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\wce200\dll_and_lib\%langdir%\x86em\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log


rem Wce211\mspro dll and lib files for MS HPC PRO
copy ..\dapi\%bld_path%\Wce211\mspro\cedll\arm\%langdir%\release\dectalk.dll	..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\arm
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\arm\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\arm\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\Wce211\mspro\cedll\arm\%langdir%\release\dectalk.lib	..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\arm
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\arm\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\arm\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\dapi\%bld_path%\Wce211\mspro\cedll\mips\%langdir%\release\dectalk.dll	..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\mips
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\mips\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\mips\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\Wce211\mspro\cedll\mips\%langdir%\release\dectalk.lib	..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\mips
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\mips\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\mips\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\dapi\%bld_path%\Wce211\mspro\cedll\sh\%langdir%\release\dectalk.dll		..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\sh
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\sh\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\sh\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\Wce211\mspro\cedll\sh\%langdir%\release\dectalk.lib		..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\sh
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\sh\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\sh\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\dapi\%bld_path%\Wce211\mspro\cedll\sh4\%langdir%\release\dectalk.dll	..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\sh4
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\sh4\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\sh4\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\Wce211\mspro\cedll\sh4\%langdir%\release\dectalk.lib	..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\sh4
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\sh4\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\sh4\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\dapi\%bld_path%\Wce211\mspro\cedll\x86em\%langdir%\release\dectalk.dll	..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\x86em
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\x86em\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\x86em\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\Wce211\mspro\cedll\x86em\%langdir%\release\dectalk.lib	..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\x86em
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\x86em\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%langdir%\x86em\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem Copy again for dynamic links in Install shield
copy ..\dapi\%bld_path%\Wce211\mspro\cedll\arm\%langdir%\release\dectalk.dll	..\%arch_dir%\%langdir%\install\cedata\Wce211\mspro\dll_and_lib\%langdir%\arm
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\Wce211\mspro\dll_and_lib\%langdir%\arm\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\Wce211\mspro\dll_and_lib\%langdir%\arm\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\Wce211\mspro\cedll\arm\%langdir%\release\dectalk.lib	..\%arch_dir%\%langdir%\install\cedata\Wce211\mspro\dll_and_lib\%langdir%\arm
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\Wce211\mspro\dll_and_lib\%langdir%\arm\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\Wce211\mspro\dll_and_lib\%langdir%\arm\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\dapi\%bld_path%\Wce211\mspro\cedll\mips\%langdir%\release\dectalk.dll	..\%arch_dir%\%langdir%\install\cedata\Wce211\mspro\dll_and_lib\%langdir%\mips
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\Wce211\mspro\dll_and_lib\%langdir%\mips\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\Wce211\mspro\dll_and_lib\%langdir%\mips\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\Wce211\mspro\cedll\mips\%langdir%\release\dectalk.lib	..\%arch_dir%\%langdir%\install\cedata\Wce211\mspro\dll_and_lib\%langdir%\mips
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\Wce211\mspro\dll_and_lib\%langdir%\mips\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\Wce211\mspro\dll_and_lib\%langdir%\mips\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\dapi\%bld_path%\Wce211\mspro\cedll\sh\%langdir%\release\dectalk.dll		..\%arch_dir%\%langdir%\install\cedata\Wce211\mspro\dll_and_lib\%langdir%\sh
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\Wce211\mspro\dll_and_lib\%langdir%\sh\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\Wce211\mspro\dll_and_lib\%langdir%\sh\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\Wce211\mspro\cedll\sh\%langdir%\release\dectalk.lib		..\%arch_dir%\%langdir%\install\cedata\Wce211\mspro\dll_and_lib\%langdir%\sh
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\Wce211\mspro\dll_and_lib\%langdir%\sh\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\Wce211\mspro\dll_and_lib\%langdir%\sh\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\dapi\%bld_path%\Wce211\mspro\cedll\sh4\%langdir%\release\dectalk.dll	..\%arch_dir%\%langdir%\install\cedata\Wce211\mspro\dll_and_lib\%langdir%\sh4
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\Wce211\mspro\dll_and_lib\%langdir%\sh4\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\Wce211\mspro\dll_and_lib\%langdir%\sh4\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\Wce211\mspro\cedll\sh4\%langdir%\release\dectalk.lib	..\%arch_dir%\%langdir%\install\cedata\Wce211\mspro\dll_and_lib\%langdir%\sh4
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\Wce211\mspro\dll_and_lib\%langdir%\sh4\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\Wce211\mspro\dll_and_lib\%langdir%\sh4\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\dapi\%bld_path%\Wce211\mspro\cedll\x86em\%langdir%\release\dectalk.dll	..\%arch_dir%\%langdir%\install\cedata\Wce211\mspro\dll_and_lib\%langdir%\x86em
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\Wce211\mspro\dll_and_lib\%langdir%\x86em\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\Wce211\mspro\dll_and_lib\%langdir%\x86em\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\Wce211\mspro\cedll\x86em\%langdir%\release\dectalk.lib	..\%arch_dir%\%langdir%\install\cedata\Wce211\mspro\dll_and_lib\%langdir%\x86em
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\Wce211\mspro\dll_and_lib\%langdir%\x86em\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\Wce211\mspro\dll_and_lib\%langdir%\x86em\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem Wce211\palm dll and lib files for PALM SIZE PC

copy ..\dapi\%bld_path%\Wce211\palm\cedll\mips\%langdir%\release\dectalk.dll	..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\palm\%langdir%\mips
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\palm\%langdir%\mips\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\palm\%langdir%\mips\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\Wce211\palm\cedll\mips\%langdir%\release\dectalk.lib	..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\palm\%langdir%\mips
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\palm\%langdir%\mips\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\palm\%langdir%\mips\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\dapi\%bld_path%\Wce211\palm\cedll\sh\%langdir%\release\dectalk.dll		..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\palm\%langdir%\sh
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\palm\%langdir%\sh\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\palm\%langdir%\sh\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\Wce211\palm\cedll\sh\%langdir%\release\dectalk.lib		..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\palm\%langdir%\sh
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\palm\%langdir%\sh\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\palm\%langdir%\sh\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\dapi\%bld_path%\Wce211\palm\cedll\x86em\%langdir%\release\dectalk.dll	..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\palm\%langdir%\x86em
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\palm\%langdir%\x86em\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\palm\%langdir%\x86em\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\Wce211\palm\cedll\x86em\%langdir%\release\dectalk.lib	..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\palm\%langdir%\x86em
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\palm\%langdir%\x86em\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\palm\%langdir%\x86em\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem Copy again for dynamic links in Install shield
copy ..\dapi\%bld_path%\Wce211\palm\cedll\mips\%langdir%\release\dectalk.dll	..\%arch_dir%\%langdir%\install\cedata\Wce211\palm\dll_and_lib\%langdir%\mips
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\Wce211\palm\dll_and_lib\%langdir%\mips\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\Wce211\palm\dll_and_lib\%langdir%\mips\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\Wce211\palm\cedll\mips\%langdir%\release\dectalk.lib	..\%arch_dir%\%langdir%\install\cedata\Wce211\palm\dll_and_lib\%langdir%\mips
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\Wce211\palm\dll_and_lib\%langdir%\mips\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\Wce211\palm\dll_and_lib\%langdir%\mips\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\dapi\%bld_path%\Wce211\palm\cedll\sh\%langdir%\release\dectalk.dll		..\%arch_dir%\%langdir%\install\cedata\Wce211\palm\dll_and_lib\%langdir%\sh
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\Wce211\palm\dll_and_lib\%langdir%\sh\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\Wce211\palm\dll_and_lib\%langdir%\sh\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\Wce211\palm\cedll\sh\%langdir%\release\dectalk.lib		..\%arch_dir%\%langdir%\install\cedata\Wce211\palm\dll_and_lib\%langdir%\sh
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\Wce211\palm\dll_and_lib\%langdir%\sh\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\Wce211\palm\dll_and_lib\%langdir%\sh\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\dapi\%bld_path%\Wce211\palm\cedll\x86em\%langdir%\release\dectalk.dll	..\%arch_dir%\%langdir%\install\cedata\Wce211\palm\dll_and_lib\%langdir%\x86em
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\Wce211\palm\dll_and_lib\%langdir%\x86em\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\Wce211\palm\dll_and_lib\%langdir%\x86em\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\Wce211\palm\cedll\x86em\%langdir%\release\dectalk.lib	..\%arch_dir%\%langdir%\install\cedata\Wce211\palm\dll_and_lib\%langdir%\x86em
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\Wce211\palm\dll_and_lib\%langdir%\x86em\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\Wce211\palm\dll_and_lib\%langdir%\x86em\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem Wce300 dll and lib files for POCKET PC
copy ..\dapi\%bld_path%\wce300\pocket\cedll\xscale\%langdir%\release\dectalk.dll	..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\xscale
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\xscale\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\xscale\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\wce300\pocket\cedll\xscale\%langdir%\release\dectalk.lib	..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\xscale
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\xscale\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\xscale\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\dapi\%bld_path%\wce300\pocket\cedll\arm\%langdir%\release\dectalk.dll	..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\arm
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\arm\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\arm\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\wce300\pocket\cedll\arm\%langdir%\release\dectalk.lib	..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\arm
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\arm\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\arm\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\dapi\%bld_path%\wce300\pocket\cedll\sh\%langdir%\release\dectalk.dll		..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\sh
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\sh\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\sh\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\wce300\pocket\cedll\sh\%langdir%\release\dectalk.lib		..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\sh
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\sh\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\sh\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\dapi\%bld_path%\wce300\pocket\cedll\mips\%langdir%\release\dectalk.dll	..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\mips
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\mips\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\mips\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\wce300\pocket\cedll\mips\%langdir%\release\dectalk.lib	..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\mips
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\mips\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\mips\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\dapi\%bld_path%\wce300\pocket\cedll\x86em\%langdir%\release\dectalk.dll	..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\x86em
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\x86em\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\x86em\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\wce300\pocket\cedll\x86em\%langdir%\release\dectalk.lib	..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\x86em
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\x86em\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%langdir%\x86em\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem Copy again for dynamic links in Install shield
copy ..\dapi\%bld_path%\wce300\pocket\cedll\xscale\%langdir%\release\dectalk.dll	..\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\xscale
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\xscale\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\xscale\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\wce300\pocket\cedll\xscale\%langdir%\release\dectalk.lib	..\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\xscale
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\xscale\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\xscale\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\dapi\%bld_path%\wce300\pocket\cedll\arm\%langdir%\release\dectalk.dll	..\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\arm
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\arm\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\arm\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\wce300\pocket\cedll\arm\%langdir%\release\dectalk.lib	..\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\arm
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\arm\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\arm\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\dapi\%bld_path%\wce300\pocket\cedll\sh\%langdir%\release\dectalk.dll		..\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\sh
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\sh\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\sh\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\wce300\pocket\cedll\sh\%langdir%\release\dectalk.lib		..\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\sh
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\sh\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\sh\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\dapi\%bld_path%\wce300\pocket\cedll\mips\%langdir%\release\dectalk.dll	..\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\mips
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\mips\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\mips\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\wce300\pocket\cedll\mips\%langdir%\release\dectalk.lib	..\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\mips
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\mips\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\mips\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\dapi\%bld_path%\wce300\pocket\cedll\x86em\%langdir%\release\dectalk.dll	..\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\x86em
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\x86em\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\x86em\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\wce300\pocket\cedll\x86em\%langdir%\release\dectalk.lib	..\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\x86em
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\x86em\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\wce300\pocket\dll_and_lib\%langdir%\x86em\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log



rem Wce300 dll and lib files for HPC2000
copy ..\dapi\%bld_path%\wce300\2000\cedll\arm\%langdir%\release\dectalk.dll	..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\%langdir%\arm
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\%langdir%\arm\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\%langdir%\arm\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\wce300\2000\cedll\arm\%langdir%\release\dectalk.lib	..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\%langdir%\arm
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\%langdir%\arm\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\%langdir%\arm\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\dapi\%bld_path%\wce300\2000\cedll\mips\%langdir%\release\dectalk.dll	..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\%langdir%\mips
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\%langdir%\mips\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\%langdir%\mips\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\wce300\2000\cedll\mips\%langdir%\release\dectalk.lib	..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\%langdir%\mips
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\%langdir%\mips\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\%langdir%\mips\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem Copy again for dynamic links in Install shield
copy ..\dapi\%bld_path%\wce300\2000\cedll\arm\%langdir%\release\dectalk.dll	..\%arch_dir%\%langdir%\install\cedata\wce300\2000\dll_and_lib\%langdir%\arm
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\wce300\2000\dll_and_lib\%langdir%\arm\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\wce300\2000\dll_and_lib\%langdir%\arm\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\wce300\2000\cedll\arm\%langdir%\release\dectalk.lib	..\%arch_dir%\%langdir%\install\cedata\wce300\2000\dll_and_lib\%langdir%\arm
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\wce300\2000\dll_and_lib\%langdir%\arm\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\wce300\2000\dll_and_lib\%langdir%\arm\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\dapi\%bld_path%\wce300\2000\cedll\mips\%langdir%\release\dectalk.dll	..\%arch_dir%\%langdir%\install\cedata\wce300\2000\dll_and_lib\%langdir%\mips
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\wce300\2000\dll_and_lib\%langdir%\mips\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\wce300\2000\dll_and_lib\%langdir%\mips\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\%bld_path%\wce300\2000\cedll\mips\%langdir%\release\dectalk.lib	..\%arch_dir%\%langdir%\install\cedata\wce300\2000\dll_and_lib\%langdir%\mips
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\wce300\2000\dll_and_lib\%langdir%\mips\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\wce300\2000\dll_and_lib\%langdir%\mips\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log




echo ***************************************************************
echo copy dictionary for for Wce
echo ***************************************************************
copy ..\dapi\%bld_path%\dtalkdic\%langdir%\release\dtalk_%langdir%*.dic					..\%arch_dir%\%langdir%\install\cedata\as_is\*.*
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\dtalk_%langdir%*.dic echo File .\%arch_dir%\%langdir%\install\cedata\as_is\dtalk_%langdir%*.dic not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

if "%dtlang%"=="GERMAN" copy ..\dapi\src\dic\dtalk_fl_%langdir%.dic		..\%arch_dir%\%langdir%\install\cedata\as_is\*.*
if "%dtlang%"=="GERMAN" if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\dtalk_fl_%langdir%.dic echo File .\%arch_dir%\%langdir%\install\cedata\as_is\dtalk_fl_%langdir%.dic not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log


echo ***************************************************************
echo copy windic executable win95 for Wce user dictionary creator
echo ***************************************************************
copy ..\samples\windic\%bld_path%\%langdir%\wdicstat\windic.exe ..\%arch_dir%\%langdir%\install\cedata\program\windic_%langdir%.exe
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\program\windic_%langdir%.exe echo File .\%arch_dir%\%langdir%\install\cedata\program\windic_%langdir%.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log


if "%kitcopy_debug%"=="1" pause
if NOT "%langdir%"=="us" goto skip_include
echo ***************************************************************
echo ttsapi.h ttsfeat to include directory.
echo ***************************************************************

copy ..\dapi\src\api\ttsapi.h	..\%arch_dir%\include
if NOT exist ..\%arch_dir%\include\ttsapi.h echo File .\%arch_dir%\include\ttsapi.h not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\dapi\src\api\ttsfeat.h	..\%arch_dir%\include
if NOT exist ..\%arch_dir%\include\ttsfeat.h echo File .\%arch_dir%\include\ttsfeat.h not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\dapi\src\dectalk.def	..\%arch_dir%\include
if NOT exist ..\%arch_dir%\include\dectalk.def echo File .\%arch_dir%\include\dectalk.def not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
:skip_include

echo ***************************************************************
echo misc stuff
echo ***************************************************************

copy ..\dapi\%bld_path%\dtalkdic\%langdir%\release\dtalk_%langdir%.dic								..\%arch_dir%\%langdir%\install\data\as_is\*.*
if NOT exist ..\%arch_dir%\%langdir%\install\data\as_is\dtalk_%langdir%.dic echo File .\%arch_dir%\%langdir%\install\data\as_is\dtalk_%langdir%.dic not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem copy all dictionaries
copy ..\dapi\%bld_path%\dtalkdic\%langdir%\release\dtalk_%langdir%*.dic								..\%arch_dir%\%langdir%\install\data\as_is\%langdir%\*.*
if NOT exist ..\%arch_dir%\%langdir%\install\data\as_is\%langdir%\dtalk_%langdir%*.dic echo File .\%arch_dir%\%langdir%\install\data\as_is\%langdir%\dtalk_%langdir%*.dic not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

if "%dtlang%"=="GERMAN" copy ..\dapi\src\dic\dtalk_fl_%langdir%.dic ..\%arch_dir%\%langdir%\install\data\as_is\%langdir%\*.*
if "%dtlang%"=="GERMAN" if NOT exist ..\%arch_dir%\%langdir%\install\data\as_is\%langdir%\dtalk_fl_%langdir%.dic echo File .\%arch_dir%\%langdir%\install\data\as_is\%langdir%\dtalk_fl_%langdir%.dic not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\dapi\%bld_path%\dtalkdic\%langdir%\release\dtalk_%langdir%*.dic ..\%arch_dir%\%langdir%\install\wdata\as_is\*.*
if NOT exist ..\%arch_dir%\%langdir%\install\wdata\as_is\dtalk_%langdir%*.dic echo File .\%arch_dir%\%langdir%\install\wdata\as_is\dtalk_%langdir%*.dic not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dapi\src\dic\user.tab ..\%arch_dir%\%langdir%\install\data\as_is
if NOT exist ..\%arch_dir%\%langdir%\install\data\as_is\user.tab echo File .\%arch_dir%\%langdir%\install\data\as_is\user.tab not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

if NOT "%langdir%"=="us" goto skip_user_tab
rem dynamic link in install shield 6.0
if not exist ..\%arch_dir%\us\install\data\windows\dectalk\user.tab	copy ..\dapi\src\dic\user.tab ..\%arch_dir%\us\install\data\windows\dectalk
if NOT exist ..\%arch_dir%\us\install\data\windows\dectalk\user.tab echo File .\%arch_dir%\us\install\data\windows\dectalk\user.tab not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
:skip_user_tab

copy ..\dapi\src\dic\user.tab ..\%arch_dir%\%langdir%\install\wdata\as_is
if NOT exist ..\%arch_dir%\%langdir%\install\wdata\as_is\user.tab echo File .\%arch_dir%\%langdir%\install\wdata\as_is\user.tab not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\samples\say\%bld_path%\%langdir%\release\say.exe ..\%arch_dir%\%langdir%\install\data\sprogram
if NOT exist ..\%arch_dir%\%langdir%\install\data\sprogram\say.exe echo File .\%arch_dir%\%langdir%\install\data\sprogram\say.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

if "%kitcopy_debug%"=="1" pause
if NOT "%langdir%"=="us" goto skip_install_files1
echo ***************************************************************
echo putting the *.TXT files in place
echo ***************************************************************

copy readme.txt ..\%arch_dir%\install_files
if NOT exist ..\%arch_dir%\install_files\readme.txt echo File .\%arch_dir%\install_files\readme.txt not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy license.txt ..\%arch_dir%\install_files
if NOT exist ..\%arch_dir%\install_files\license.txt echo File .\%arch_dir%\install_files\license.txt not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy word.txt ..\%arch_dir%\%langdir%\install\data\as_is
if NOT exist ..\%arch_dir%\%langdir%\install\data\as_is\word.txt echo File .\%arch_dir%\%langdir%\install\data\as_is\word.txt not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem copy appendix1.txt ..\%arch_dir%\install_files
rem if NOT exist ..\%arch_dir%\install_files\appendix1.txt echo File .\%arch_dir%\install_files\appendix1.txt not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy appendix2.txt ..\%arch_dir%\install_files
if NOT exist ..\%arch_dir%\install_files\appendix2.txt echo File .\%arch_dir%\install_files\appendix2.txt not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem 22oct97  cjl   Add Appendix3.txt to the sdk disk1.
copy appendix3.txt ..\%arch_dir%\install_files
if NOT exist ..\%arch_dir%\install_files\appendix3.txt echo File .\%arch_dir%\install_files\appendix3.txt not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy appendix4.txt ..\%arch_dir%\install_files
if NOT exist ..\%arch_dir%\install_files\appendix4.txt echo File .\%arch_dir%\install_files\appendix4.txt not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
:skip_install_files1


copy readme.txt ..\%arch_dir%\%langdir%\install\wdata\as_is
if NOT exist ..\%arch_dir%\%langdir%\install\wdata\as_is\readme.txt echo File .\%arch_dir%\%langdir%\install\wdata\as_is\readme.txt not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy word.txt ..\%arch_dir%\%langdir%\install\wdata\as_is
if NOT exist ..\%arch_dir%\%langdir%\install\wdata\as_is\word.txt echo File .\%arch_dir%\%langdir%\install\wdata\as_is\word.txt not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem copy appendix1.txt ..\%arch_dir%\%langdir%\install\wdata\as_is
rem if NOT exist ..\%arch_dir%\%langdir%\install\wdata\as_is\appendix1.txt echo File .\%arch_dir%\%langdir%\install\wdata\as_is\appendix1.txt not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy appendix2.txt ..\%arch_dir%\%langdir%\install\wdata\as_is
if NOT exist ..\%arch_dir%\%langdir%\install\wdata\as_is\appendix2.txt echo File .\%arch_dir%\%langdir%\install\wdata\as_is\appendix2.txt not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem 22oct97  cjl   Add Appendix3.txt to the sdk disk1.
copy appendix3.txt ..\%arch_dir%\%langdir%\install\wdata\as_is
if NOT exist ..\%arch_dir%\%langdir%\install\wdata\as_is\appendix3.txt echo File .\%arch_dir%\%langdir%\install\wdata\as_is\appendix3.txt not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem 22may98  cjl   Add Appendix4.txt to the sdk disk1.
copy appendix4.txt ..\%arch_dir%\%langdir%\install\wdata\as_is
if NOT exist ..\%arch_dir%\%langdir%\install\wdata\as_is\appendix4.txt echo File .\%arch_dir%\%langdir%\install\wdata\as_is\appendix4.txt not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
if "%kitcopy_debug%"=="1" pause

rem ***************************************************************
rem putting the Install, programming and reference guide files for
rem txt,pdf and ps in install_files directory
rem ***************************************************************
if NOT "%langdir%"=="us" goto skip_install_files2

copy ..\docs\dtk_pg_5_0.pdf ..\%arch_dir%\install_files
copy ..\docs\dtk_ig_5_0.pdf ..\%arch_dir%\install_files
copy ..\docs\dtk_rg_5_0.pdf ..\%arch_dir%\install_files

copy ..\docs\dtk_pg_5_0.ps ..\%arch_dir%\install_files
copy ..\docs\dtk_ig_5_0.ps ..\%arch_dir%\install_files
copy ..\docs\dtk_rg_5_0.ps ..\%arch_dir%\install_files

goto skip_install_files2

rem copy ..\docsosf\pdf\dtk_reference_guide.pdf ..\%arch_dir%\install_files
if NOT exist ..\%arch_dir%\install_files\dtk_reference_guide.pdf echo File .\%arch_dir%\install_files\dtk_reference_guide.pdf not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
rem copy ..\docsosf\ps\dtk_reference_guide.ps ..\%arch_dir%\install_files
rem if NOT exist ..\%arch_dir%\install_files\dtk_reference_guide.ps echo File .\%arch_dir%\install_files\dtk_reference_guide.ps not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\docsosf\txt\dtk_reference_guide.txt ..\%arch_dir%\install_files
if NOT exist ..\%arch_dir%\install_files\dtk_reference_guide.txt echo File .\%arch_dir%\install_files\dtk_reference_guide.txt not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\docsosf\pdf\dtk_prog_guide.pdf ..\%arch_dir%\install_files
if NOT exist ..\%arch_dir%\install_files\dtk_prog_guide.pdf echo File .\%arch_dir%\install_files\dtk_prog_guide.pdf not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
rem copy ..\docsosf\ps\dtk_prog_guide.ps ..\%arch_dir%\install_files
rem if NOT exist ..\%arch_dir%\install_files\dtk_prog_guide.ps echo File .\%arch_dir%\install_files\dtk_prog_guide.ps not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\docsosf\txt\dtk_prog_guide.txt ..\%arch_dir%\install_files
if NOT exist ..\%arch_dir%\install_files\dtk_prog_guide.txt echo File .\%arch_dir%\install_files\dtk_prog_guide.txt not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\docsosf\pdf\dtk_install_guide.pdf ..\%arch_dir%\install_files
if NOT exist ..\%arch_dir%\install_files\dtk_install_guide.pdf echo File .\%arch_dir%\install_files\dtk_install_guide.pdf not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
rem copy ..\docsosf\ps\dtk_install_guide.ps ..\%arch_dir%\install_files
rem if NOT exist ..\%arch_dir%\install_files\dtk_install_guide.ps echo File .\%arch_dir%\install_files\dtk_install_guide.ps not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\docsosf\txt\dtk_install_guide.txt ..\%arch_dir%\install_files
if NOT exist ..\%arch_dir%\install_files\dtk_install_guide.txt echo File .\%arch_dir%\install_files\dtk_install_guide.txt not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
:skip_install_files2

rem *****************************************************
rem the following is for getting misc items
rem in the correct place
rem *****************************************************

rem getting Willow Pond's setup ready
xcopy /e/c/q ..\%arch_dir%\include ..\%arch_dir%\%langdir%\install\wdata\as_is\include\
rem xcopy /e/c/q ..\%arch_dir%\%langdir%\install\data\as_is\lib ..\%arch_dir%\%langdir%\install\wdata\as_is\lib\
if not errorlevel 0 goto bug_end

if "%kitcopy_debug%"=="1" pause

set fp=%bld_path%\release\

if "%langdir%"=="ml" goto finfo_ml
if "%langdir%"=="fr" goto finfo_ml
echo ***************************************************************
echo DECtalk Software version %1 (%dtlkid%) > wtalkver.txt
echo ***************************************************************

REM -- Willow Pond stuff ---
echo Willow Pond Files > wtalkver.txt
if "%langdir%"=="us" echo English US Dictionary: >> wtalkver.txt
if "%langdir%"=="uk" echo English UK Dictionary: >> wtalkver.txt
if "%langdir%"=="sp" echo Castilian Spanish Dictionary: >> wtalkver.txt
if "%langdir%"=="la" echo Latin american Spanish Dictionary: >> wtalkver.txt
if "%langdir%"=="gr" echo German Dictionary: >> wtalkver.txt
%fp%finfo ..\%arch_dir%\%langdir%\install\wdata\as_is\dtalk_%langdir%.dic >> wtalkver.txt


REM *** %fp%finfo ..\%arch_dir%\%langdir%\install\wdata\as_is\w%langdir%\wtlkstat.lib >> wtalkver.txt
%fp%finfo ..\%arch_dir%\%langdir%\install\wdata\speech\wtlkttse.dll >> wtalkver.txt

%fp%finfo ..\%arch_dir%\%langdir%\install\wdata\program\wttstest.exe >> wtalkver.txt
:finfo_ml

if NOT "%langdir%"=="ml" goto finfo_lang
echo ***************************************************************
echo DECtalk Software version %1 (%dtlkid%) > dtalkver.txt
echo ***************************************************************

REM *** %fp%finfo ..\%arch_dir%\%langdir%\install\data\lib\dtlkstat.lib >> dtalkver.txt
%fp%finfo ..\%arch_dir%\us\install\data\as_is\user.tab >> dtalkver.txt
%fp%finfo ..\%arch_dir%\us\install\data\as_is\word.txt >> dtalkver.txt

%fp%finfo ..\%arch_dir%\us\install\data\as_is\dtalk_us.dic >> dtalkver.txt
%fp%finfo ..\%arch_dir%\us\install\data\as_is\dtalk_uss.dic >> dtalkver.txt
%fp%finfo ..\%arch_dir%\us\install\data\as_is\dtalk_usm.dic >> dtalkver.txt
%fp%finfo ..\%arch_dir%\uk\install\data\as_is\dtalk_uk.dic >> dtalkver.txt
%fp%finfo ..\%arch_dir%\uk\install\data\as_is\dtalk_uks.dic >> dtalkver.txt
%fp%finfo ..\%arch_dir%\sp\install\data\as_is\dtalk_sp.dic >> dtalkver.txt
%fp%finfo ..\%arch_dir%\la\install\data\as_is\dtalk_la.dic >> dtalkver.txt
%fp%finfo ..\%arch_dir%\gr\install\data\as_is\dtalk_gr.dic >> dtalkver.txt
%fp%finfo ..\%arch_dir%\gr\install\data\as_is\dtalk_grs.dic >> dtalkver.txt
%fp%finfo ..\%arch_dir%\fr\install\data\as_is\dtalk_fr.dic >> dtalkver.txt

%fp%finfo ..\%arch_dir%\us\install\data\program\ttstest.exe >> dtalkver.txt
%fp%finfo ..\%arch_dir%\us\install\data\program\speak.exe >> dtalkver.txt
%fp%finfo ..\%arch_dir%\us\install\data\program\windic.exe >> dtalkver.txt
%fp%finfo ..\%arch_dir%\us\install\data\program\vercheck.exe >> dtalkver.txt
%fp%finfo ..\%arch_dir%\us\install\data\program\dtsample.exe >> dtalkver.txt
%fp%finfo ..\%arch_dir%\us\install\data\sprogram\ttssrv.exe >> dtalkver.txt
%fp%finfo ..\%arch_dir%\us\install\data\sprogram\say.exe >> dtalkver.txt

%fp%finfo ..\%arch_dir%\us\install\data\speech\dtlkttse_us.dll >> dtalkver.txt
%fp%finfo ..\%arch_dir%\uk\install\data\speech\dtlkttse_uk.dll >> dtalkver.txt
%fp%finfo ..\%arch_dir%\sp\install\data\speech\dtlkttse_sp.dll >> dtalkver.txt
%fp%finfo ..\%arch_dir%\la\install\data\speech\dtlkttse_la.dll >> dtalkver.txt
%fp%finfo ..\%arch_dir%\gr\install\data\speech\dtlkttse_gr.dll >> dtalkver.txt

%fp%finfo ..\microsoft\%msdir%\speech.dll >> dtalkver.txt
%fp%finfo ..\microsoft\%msdir%\msvcrt.dll >> dtalkver.txt

%fp%finfo ..\%arch_dir%\us\install\data\as_is\us\dectalk.lib >> dtalkver.txt

%fp%finfo ..\%arch_dir%\us\install\data\as_is\include\ttsapi.h >> dtalkver.txt
%fp%finfo ..\%arch_dir%\us\install\data\as_is\include\ttsfeat.h >> dtalkver.txt


REM -- Regular stuff ---
%fp%finfo ..\%arch_dir%\us\install\data\as_is\sys_dir\dtalk_us.dll >> dtalkver.txt
%fp%finfo ..\%arch_dir%\uk\install\data\as_is\sys_dir\dtalk_uk.dll >> dtalkver.txt
%fp%finfo ..\%arch_dir%\sp\install\data\as_is\sys_dir\dtalk_sp.dll >> dtalkver.txt
%fp%finfo ..\%arch_dir%\la\install\data\as_is\sys_dir\dtalk_la.dll >> dtalkver.txt
%fp%finfo ..\%arch_dir%\gr\install\data\as_is\sys_dir\dtalk_gr.dll >> dtalkver.txt
%fp%finfo ..\%arch_dir%\fr\install\data\as_is\sys_dir\dtalk_fr.dll >> dtalkver.txt
:finfo_lang

echo ***************************************************************
echo Put it where it belongs
echo ***************************************************************

if "%langdir%"=="ml" goto skip_finfo_ml
copy dtalkver.txt ..\%arch_dir%\us\install\data\as_is
if NOT exist ..\%arch_dir%\us\install\data\as_is\dtalkver.txt echo File .\%arch_dir%\us\install\data\as_is\dtalkver.txt not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

if "%langdir%"=="fr" goto skip_finfo_ml
copy wtalkver.txt ..\%arch_dir%\%langdir%\install\wdata\as_is
if NOT exist ..\%arch_dir%\%langdir%\install\wdata\as_is\wtalkver.txt echo File .\%arch_dir%\%langdir%\install\wdata\as_is\wtalkver.txt not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
:skip_finfo_ml


rem *****************************************************
rem cleaning up files for kit release
rem *****************************************************

rem echo ***************************************************************
rem echo CLEANING up the sources in SAMPLES\DTSAMPLE for regular kit builds.
rem echo ***************************************************************

rem copy ..\tools\preproc\%bld_path%\release\preproc.exe ..\%arch_dir%\%langdir%\install\data\as_is\samples\dtsample
rem if NOT exist ..\%arch_dir%\%langdir%\install\data\as_is\samples\dtsample\preproc.exe echo File .\%arch_dir%\%langdir%\install\data\as_is\samples\dtsample\proeproc.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
rem cd ..\%arch_dir%\%langdir%\install\data\as_is\samples\dtsample
rem preproc -i dtsample.c -x ACCESS32
rem preproc -i dtsample.h -x ACCESS32
rem del preproc.exe
rem cd ..\..\..\..\..\..\..\kitting

if "%kitcopy_debug%"=="1" pause
if "%langdir%"=="fr" goto skip_willow_pond
rem **********************************************************
rem INSTALL SHIELD SETUP
rem   Copying the needed files to the install directory
rem **********************************************************

echo ***************************************************************
echo INSTALL SHIELD SETUP
echo ***************************************************************
rem -- For Willow Pond kit build --
copy ..\install\src\setup\setup.rul ..\%arch_dir%\%langdir%\install\wsetup
if NOT exist ..\%arch_dir%\%langdir%\install\wsetup\setup.rul echo File .\%arch_dir%\%langdir%\install\wsetup\setup.rul not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

if "%kitcopy_debug%"=="1" pause
copy ..\install\src\setup\force.bmp ..\%arch_dir%\%langdir%\install\instdec
if NOT exist ..\%arch_dir%\%langdir%\install\instdec\force.bmp echo File .\%arch_dir%\%langdir%\install\instdec\force.bmp not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy license.txt ..\%arch_dir%\%langdir%\install\instdec
if NOT exist ..\%arch_dir%\%langdir%\install\instdec\license.txt echo File .\%arch_dir%\%langdir%\install\instdec\license.txt not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy "%is3drv%%is3path%\program\uninst.exe" ..\%arch_dir%\%langdir%\install\instdec
if NOT exist ..\%arch_dir%\%langdir%\install\instdec\uninst.exe echo File .\%arch_dir%\%langdir%\install\instdec\uninst.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy "%is3drv%%is3path%\program\_isres.dll" ..\%arch_dir%\%langdir%\install\instdec
if NOT exist ..\%arch_dir%\%langdir%\install\instdec\_isres.dll echo File .\%arch_dir%\%langdir%\install\instdec\_isres.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy "%is3drv%%is3path%\program\ctl3d32.dll" ..\%arch_dir%\%langdir%\install\instdec
if NOT exist ..\%arch_dir%\%langdir%\install\instdec\ctl3d32.dll echo File .\%arch_dir%\%langdir%\install\instdec\ctl3d32.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

if "%kitcopy_debug%"=="1" pause

echo ***************************************************************
echo INSTALL SHIELD -- FILE COMPRESSING
echo ***************************************************************

"%is3drv%%is3path%\program\icomp" ..\%arch_dir%\%langdir%\install\instdec\*.* ..\%arch_dir%\%langdir%\install\idisk\_setup.lib

if "%kitcopy_debug%"=="1" pause

echo ***************************************************************
echo INSTALL SHIELD SETUP (More Files)
echo ***************************************************************

copy "%is3drv%%is3path%\program\_isdel.exe" ..\%arch_dir%\%langdir%\install\idisk
if NOT exist ..\%arch_dir%\%langdir%\install\idisk\_isdel.exe echo File .\%arch_dir%\%langdir%\install\idisk\_isdel.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy "%is3drv%%is3path%\program\_setup.dll" ..\%arch_dir%\%langdir%\install\idisk
if NOT exist ..\%arch_dir%\%langdir%\install\idisk\_setup.dll echo File .\%arch_dir%\%langdir%\install\idisk\_setup.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy "%is3drv%%is3path%\program\setup.exe" ..\%arch_dir%\%langdir%\install\idisk
if NOT exist ..\%arch_dir%\%langdir%\install\idisk\setup.exe echo File .\%arch_dir%\%langdir%\install\idisk\setup.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy "%is3drv%%is3path%\program\_inst32i.ex_" ..\%arch_dir%\%langdir%\install\idisk
if NOT exist ..\%arch_dir%\%langdir%\install\idisk\_inst32i.ex_ echo File .\%arch_dir%\%langdir%\install\idisk\_inst32i.ex_ not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
if "%kitcopy_debug%"=="1" pause

rem -- For Willow Pond kit build --
rem compile the install script..
copy "%is3drv%%is3path%\program\compile.exe" ..\%arch_dir%\%langdir%\install\wsetup
if NOT exist ..\%arch_dir%\%langdir%\install\wsetup\compile.exe echo File .\%arch_dir%\%langdir%\install\wsetup\compile.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy "%is3drv%%is3path%\program\packlist.exe" ..\%arch_dir%\%langdir%\install\wsetup
if NOT exist ..\%arch_dir%\%langdir%\install\wsetup\packlist.exe echo File .\%arch_dir%\%langdir%\install\wsetup\packlist.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log


if "%kitcopy_debug%"=="1" pause
rem **********************************************************
rem INSTALL SHIELD - Final Step -- For Willow Pond
rem   Compiling and splitting the files in the install directory
rem **********************************************************

echo ***************************************************************
echo BUILDING DECtalk (WILLOWPOND) KIT
echo ***************************************************************

cd ..\%arch_dir%\%langdir%\install\wsetup

compile setup.rul /D%dtlang% /D_WILLOWPOND /DSAPI_MULTI_LANGUAGE_SUPPORT
if not errorlevel 0 goto bug_end
rem compress all the actual kit files..
echo rem compress all the actual kit files.. 2
if "%kitcopy_debug%"=="1" pause

"%is3drv%%is3path%\program\icomp" -i ..\wdata\*.* ..\wdata\dectalk.Z
if not errorlevel 0 goto bug_end
rem split the compressed file..

rem 17-feb-1998 cjl     Change disk1 size to 600 from 700
"%is3drv%%is3path%\program\split" ..\wdata\dectalk.Z -f1370 -D1@600 -c
if not errorlevel 0 goto bug_end
if "%kitcopy_debug%"=="1" pause

rem deal with the packaging list
echo 1; > setup.lst
echo ..\wdata\dectalk.Z >> setup.lst
packlist setup.lst
if not errorlevel 0 goto bug_end

rem moved del here 
del ..\wdata\dectalk.Z

if "%kitcopy_debug%"=="1" pause
rem go back..
cd ..\..\..\..\kitting
echo ***************************************************************
echo Copy the files to their final destinations.
echo ***************************************************************

if not errorlevel 0 goto bug_end
if "%kitcopy_debug%"=="1" pause


if "%kitcopy_debug%"=="1" pause
rem **********************************************************
rem Copy the files to their final destinations.
rem -- For Willow Pond kit build --
rem **********************************************************

echo ***************************************************************
echo Copy the files to their final destinations. (Willow Pond)
echo ***************************************************************

copy ..\%arch_dir%\%langdir%\install\idisk\*.* ..\%arch_dir%\%langdir%\install\wdisk1
if NOT exist ..\%arch_dir%\%langdir%\install\wdisk1\*.* echo File .\%arch_dir%\%langdir%\install\wdisk1\*.* not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\%arch_dir%\%langdir%\install\wsetup\setup.ins ..\%arch_dir%\%langdir%\install\wdisk1\setup.ins
if NOT exist ..\%arch_dir%\%langdir%\install\wdisk1\setup.ins echo File .\%arch_dir%\%langdir%\install\wdisk1\setup.ins not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\%arch_dir%\%langdir%\install\wsetup\setup.pkg ..\%arch_dir%\%langdir%\install\wdisk1
if NOT exist ..\%arch_dir%\%langdir%\install\wdisk1\setup.pkg echo File .\%arch_dir%\%langdir%\install\wdisk1\setup.pkg not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\%arch_dir%\%langdir%\install\wsetup\dectalk.1 ..\%arch_dir%\%langdir%\install\wdisk1
if NOT exist ..\%arch_dir%\%langdir%\install\wdisk1\dectalk.1 echo File .\%arch_dir%\%langdir%\install\wdisk1\dectalk.1 not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
echo disk1 > ..\%arch_dir%\%langdir%\install\wdisk1\disk1.id
if NOT exist ..\%arch_dir%\%langdir%\install\wdisk1\disk1.id echo File .\%arch_dir%\%langdir%\install\wdisk1\disk1.id not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
if exist ..\%arch_dir%\%langdir%\install\wsetup\dectalk.2 copy ..\%arch_dir%\%langdir%\install\wsetup\dectalk.2 ..\%arch_dir%\%langdir%\install\wdisk2
if exist ..\%arch_dir%\%langdir%\install\wsetup\dectalk.2 if NOT exist ..\%arch_dir%\%langdir%\install\wdisk2\dectalk.2 echo File .\%arch_dir%\%langdir%\install\wdisk2\dectalk.2 not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
if exist ..\%arch_dir%\%langdir%\install\wdisk2  echo disk2 > ..\%arch_dir%\%langdir%\install\wdisk2\disk2.id
if exist ..\%arch_dir%\%langdir%\install\wdisk2 if NOT exist ..\%arch_dir%\%langdir%\install\wdisk2\disk2.id echo File .\%arch_dir%\%langdir%\install\wdisk2\dectalk.2 not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
rem if "%kitcopy_debug%"=="1" pause

rem uncompressed stuff..? (this may have to change)
copy readme.txt ..\%arch_dir%\%langdir%\install\wdisk1
if NOT exist ..\%arch_dir%\%langdir%\install\wdisk1\readme.txt echo File .\%arch_dir%\%langdir%\install\wdisk1\readme.txt not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
rem copy appendix1.txt ..\%arch_dir%\%langdir%\install\wdisk1
rem if NOT exist ..\%arch_dir%\%langdir%\install\wdisk1\appendix1.txt echo File .\%arch_dir%\%langdir%\install\wdisk1\appendix1.txt not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy appendix2.txt ..\%arch_dir%\%langdir%\install\wdisk1
if NOT exist ..\%arch_dir%\%langdir%\install\wdisk1\appendix2.txt echo File .\%arch_dir%\%langdir%\install\wdisk1\appendix2.txt not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
rem 22oct97  cjl   Add Appendix3.txt to the sdk disk1.
copy appendix3.txt ..\%arch_dir%\%langdir%\install\wdisk1
if NOT exist ..\%arch_dir%\%langdir%\install\wdisk1\appendix3.txt echo File .\%arch_dir%\%langdir%\install\wdisk1\appendix3.txt not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
rem 22may98  cjl   Add Appendix4.txt to the sdk disk1.
copy appendix4.txt ..\%arch_dir%\%langdir%\install\wdisk1
if NOT exist ..\%arch_dir%\%langdir%\install\wdisk1\appendix4.txt echo File .\%arch_dir%\%langdir%\install\wdisk1\appendix4.txt not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\help\dtkmsapi.txt ..\%arch_dir%\%langdir%\install\wdisk1
if NOT exist ..\%arch_dir%\%langdir%\install\wdisk1\dtkmsapi.txt echo File .\%arch_dir%\%langdir%\install\wdisk1\dtkmsapi.txt not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

:skip_willow_pond

if "%kitcopy_debug%"=="1" pause
if NOT "%langdir%"=="us" goto skip_license
rem *****************************************************
rem arch_dir\lock_mgr
rem arch_dir\lock_mgr\standard
rem arch_dir\lock_mgr\wpond
rem *****************************************************

echo ***************************************************************
echo Copy the lock manager stuff into place
echo ***************************************************************

copy ..\license\liceninc\%bld_path%\licenin1\release\licenin1.exe ..\%arch_dir%\lock_mgr\standard
if NOT exist ..\%arch_dir%\lock_mgr\standard\licenin1.exe echo File .\%arch_dir%\lock_mgr\standard\licenin1.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\license\liceninc\%bld_path%\licenin3\release\licenin3.exe ..\%arch_dir%\lock_mgr\standard
if NOT exist ..\%arch_dir%\lock_mgr\standard\licenin3.exe echo File .\%arch_dir%\lock_mgr\standard\licenin3.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\license\liceninc\%bld_path%\licenin7\release\licenin7.exe ..\%arch_dir%\lock_mgr\standard
if NOT exist ..\%arch_dir%\lock_mgr\standard\licenin7.exe echo File .\%arch_dir%\lock_mgr\standard\licenin7.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\license\licenseu\%bld_path%\release\licenseu.exe		   ..\%arch_dir%\lock_mgr\standard
if NOT exist ..\%arch_dir%\lock_mgr\standard\licenseu.exe echo File .\%arch_dir%\lock_mgr\standard\licenseu.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
if "%kitcopy_debug%"=="1" pause

copy ..\license\liceninc\%wpbld_path%\licenin1\release\licenin1.exe ..\%arch_dir%\lock_mgr\wpond
if NOT exist ..\%arch_dir%\lock_mgr\wpond\licenin1.exe echo File .\%arch_dir%\lock_mgr\wpond\licenin1.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\license\liceninc\%wpbld_path%\licenin3\release\licenin3.exe ..\%arch_dir%\lock_mgr\wpond
if NOT exist ..\%arch_dir%\lock_mgr\wpond\licenin3.exe echo File .\%arch_dir%\lock_mgr\wpond\licenin3.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\license\liceninc\%wpbld_path%\licenin7\release\licenin7.exe ..\%arch_dir%\lock_mgr\wpond
if NOT exist ..\%arch_dir%\lock_mgr\wpond\licenin7.exe echo File .\%arch_dir%\lock_mgr\wpond\licenin7.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\license\licenseu\%wpbld_path%\release\*.exe ..\%arch_dir%\lock_mgr\wpond
if NOT exist ..\%arch_dir%\lock_mgr\wpond\licenseu.exe echo File .\%arch_dir%\lock_mgr\wpond\licenseu.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
:skip_license

goto exit

echo ***************************************************************
echo THIS IS THE ML KITTING AREA
echo ***************************************************************

:ml_kits
if not exist ..\%arch_dir%	md ..\%arch_dir%
if not exist ..\%arch_dir%\%langdir%\install\data\windows\samples\mldemo\mldemo\res		md ..\%arch_dir%\%langdir%\install\data\windows\samples\mldemo\mldemo\res
if not exist ..\%arch_dir%\%langdir%\install\data\as_is									md ..\%arch_dir%\%langdir%\install\data\as_is
if not exist ..\%arch_dir%\%langdir%\install\data\as_is\%syslangdir%					md ..\%arch_dir%\%langdir%\install\data\as_is\%syslangdir%
if not exist ..\%arch_dir%\%langdir%\install\data\as_is\samples							md ..\%arch_dir%\%langdir%\install\data\as_is\samples
if not exist ..\%arch_dir%\%langdir%\install\data\as_is\samples\vercheck				md ..\%arch_dir%\%langdir%\install\data\as_is\samples\vercheck
if not exist ..\%arch_dir%\%langdir%\install\data\as_is\samples\mldemo\res				md ..\%arch_dir%\%langdir%\install\data\as_is\samples\mldemo\res
if not exist ..\%arch_dir%\%langdir%\install\data\as_is\sys_dir							md ..\%arch_dir%\%langdir%\install\data\as_is\sys_dir
if not exist ..\%arch_dir%\%langdir%\install\data\program								md ..\%arch_dir%\%langdir%\install\data\program
if not exist ..\%arch_dir%\%langdir%\install\data\sprogram								md ..\%arch_dir%\%langdir%\install\data\sprogram

rem md ..\%arch_dir%\%langdir%\install\cedata\as_is\%syslangdir%

rem wce200
rem if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%syslangdir%\mips		md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%syslangdir%\mips
rem if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%syslangdir%\sh		md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%syslangdir%\sh
rem if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%syslangdir%\x86em		md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%syslangdir%\x86em

rem if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample\bin\mips\%syslangdir%		md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample\bin\mips\%syslangdir%
rem if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample\bin\sh\%syslangdir%		md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample\bin\sh\%syslangdir%
rem if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample\bin\x86em\%syslangdir%	md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample\bin\x86em\%syslangdir%

rem wce211 for MS HPC PRO
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\arm		md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\arm
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\x86em	md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\x86em
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\sh		md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\sh
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\sh4		md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\sh4
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\mips	md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\mips

if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\samples\dtsample\bin\arm\%syslangdir%		md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\samples\dtsample\bin\arm\%syslangdir%
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\samples\dtsample\bin\x86em\%syslangdir%		md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\samples\dtsample\bin\x86em\%syslangdir%
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\samples\dtsample\bin\sh\%syslangdir%			md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\samples\dtsample\bin\sh\%syslangdir%
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\samples\dtsample\bin\sh4\%syslangdir%		md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\samples\dtsample\bin\sh4\%syslangdir%
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\samples\dtsample\bin\mips\%syslangdir%		md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\samples\dtsample\bin\mips\%syslangdir%

rem wce211 for PALM SIZE PC
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\palm\%syslangdir%\x86em	md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\palm\%syslangdir%\x86em
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\palm\%syslangdir%\sh		md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\palm\%syslangdir%\sh
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\palm\%syslangdir%\mips		md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\palm\%syslangdir%\mips

if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\palm\samples\dtsample\bin\mips\%syslangdir%		md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\palm\samples\dtsample\bin\mips\%syslangdir%
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\palm\samples\dtsample\bin\sh\%syslangdir%			md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\palm\samples\dtsample\bin\sh\%syslangdir%
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\palm\samples\dtsample\bin\x86em\%syslangdir%		md ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\palm\samples\dtsample\bin\x86em\%syslangdir%

rem wce300 for POCKET PC
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%syslangdir%\xscale		md ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%syslangdir%\xscale 
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%syslangdir%\arm		md ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%syslangdir%\arm
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%syslangdir%\x86em		md ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%syslangdir%\x86em
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%syslangdir%\sh		md ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%syslangdir%\sh
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%syslangdir%\mips		md ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%syslangdir%\mips

if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\samples				md ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\samples
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\samples\dtsample		md ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\samples\dtsample
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\samples\dtsample\bin	md ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\samples\dtsample\bin
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\samples\dtsample\bin\arm\%syslangdir%		md ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\samples\dtsample\bin\arm\%syslangdir%
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\samples\dtsample\bin\mips\%syslangdir%		md ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\samples\dtsample\bin\mips\%syslangdir%
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\samples\dtsample\bin\sh\%syslangdir%		md ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\samples\dtsample\bin\sh\%syslangdir%
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\samples\dtsample\bin\x86em\%syslangdir%	md ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\samples\dtsample\bin\x86em\%syslangdir%

rem wce300 for HPC2000
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\%syslangdir%\arm		md ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\%syslangdir%\arm
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\%syslangdir%\mips		md ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\%syslangdir%\mips

if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\samples				md ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\samples
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\samples\dtsample		md ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\samples\dtsample
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\samples\dtsample\bin	md ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\samples\dtsample\bin
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\samples\dtsample\bin\arm\%syslangdir%		md ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\samples\dtsample\bin\arm\%syslangdir%
if not exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\samples\dtsample\bin\mips\%syslangdir%		md ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\samples\dtsample\bin\mips\%syslangdir%

if "%kitcopy_debug%"=="1" pause

echo ***************************************************************
echo arch_dir\language\INSTALL\DATA\SAMPLEML\MLDEMO
echo This component has no Language specific SOURCE
echo ***************************************************************

rem give source codes and exe
copy ..\sampleml\mldemo\res\*.*						..\%arch_dir%\%langdir%\install\data\as_is\samples\mldemo\res
if NOT exist ..\%arch_dir%\%langdir%\install\data\as_is\samples\mldemo\res\*.* echo File .\%arch_dir%\%langdir%\install\data\as_is\samples\mldemo\res\*.* not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\sampleml\mldemo\*.cpp						..\%arch_dir%\%langdir%\install\data\as_is\samples\mldemo
if NOT exist ..\%arch_dir%\%langdir%\install\data\as_is\samples\mldemo\*.cpp echo File .\%arch_dir%\%langdir%\install\data\as_is\samples\mldemo\*.cpp not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\sampleml\mldemo\*.dsp						..\%arch_dir%\%langdir%\install\data\as_is\samples\mldemo
if NOT exist ..\%arch_dir%\%langdir%\install\data\as_is\samples\mldemo\*.dsp echo File .\%arch_dir%\%langdir%\install\data\as_is\samples\mldemo\*.dsp not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\sampleml\mldemo\*.dsw						..\%arch_dir%\%langdir%\install\data\as_is\samples\mldemo
if NOT exist ..\%arch_dir%\%langdir%\install\data\as_is\samples\mldemo\*.dsw echo File .\%arch_dir%\%langdir%\install\data\as_is\samples\mldemo\*.dsw not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\sampleml\mldemo\%bld_path%\release\*.exe	..\%arch_dir%\%langdir%\install\data\as_is\samples\mldemo
if NOT exist ..\%arch_dir%\%langdir%\install\data\as_is\samples\mldemo\*.exe echo File .\%arch_dir%\%langdir%\install\data\as_is\samples\mldemo\*.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\sampleml\mldemo\*.h							..\%arch_dir%\%langdir%\install\data\as_is\samples\mldemo
if NOT exist ..\%arch_dir%\%langdir%\install\data\as_is\samples\mldemo\*.h echo File .\%arch_dir%\%langdir%\install\data\as_is\samples\mldemo\*.h not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\sampleml\mldemo\*.rc						..\%arch_dir%\%langdir%\install\data\as_is\samples\mldemo
if NOT exist ..\%arch_dir%\%langdir%\install\data\as_is\samples\mldemo\*.rc echo File .\%arch_dir%\%langdir%\install\data\as_is\samples\mldemo\*.rc not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\sampleml\mldemo\%bld_path%\release\*.exe	..\%arch_dir%\%langdir%\install\data\program
if NOT exist ..\%arch_dir%\%langdir%\install\data\program\*.exe echo File .\%arch_dir%\%langdir%\install\data\program\*.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem copy again for dynamic links in install shield 6.0
copy ..\sampleml\mldemo\res\*.*						..\%arch_dir%\%langdir%\install\data\windows\samples\mldemo\mldemo\res
if NOT exist ..\%arch_dir%\%langdir%\install\data\windows\samples\mldemo\mldemo\res\*.* echo File .\%arch_dir%\%langdir%\install\data\windows\samples\mldemo\mldemo\res\*.* not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\sampleml\mldemo\*.cpp						..\%arch_dir%\%langdir%\install\data\windows\samples\mldemo\mldemo
if NOT exist ..\%arch_dir%\%langdir%\install\data\windows\samples\mldemo\mldemo\*.cpp echo File .\%arch_dir%\%langdir%\install\data\windows\samples\mldemo\mldemo\*.cpp not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\sampleml\mldemo\*.dsp						..\%arch_dir%\%langdir%\install\data\windows\samples\mldemo\mldemo
if NOT exist ..\%arch_dir%\%langdir%\install\data\windows\samples\mldemo\mldemo\*.dsp echo File .\%arch_dir%\%langdir%\install\data\windows\samples\mldemo\mldemo\*.dsp not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\sampleml\mldemo\*.dsw						..\%arch_dir%\%langdir%\install\data\windows\samples\mldemo\mldemo
if NOT exist ..\%arch_dir%\%langdir%\install\data\windows\samples\mldemo\mldemo\*.dsw echo File .\%arch_dir%\%langdir%\install\data\windows\samples\mldemo\mldemo\*.dsw not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\sampleml\mldemo\%bld_path%\release\*.exe	..\%arch_dir%\%langdir%\install\data\windows\samples\mldemo\mldemo
if NOT exist ..\%arch_dir%\%langdir%\install\data\windows\samples\mldemo\mldemo\*.exe echo File .\%arch_dir%\%langdir%\install\data\windows\samples\mldemo\mldemo\*.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\sampleml\mldemo\*.h							..\%arch_dir%\%langdir%\install\data\windows\samples\mldemo\mldemo
if NOT exist ..\%arch_dir%\%langdir%\install\data\windows\samples\mldemo\mldemo\*.h echo File .\%arch_dir%\%langdir%\install\data\windows\samples\mldemo\mldemo\*.h not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\sampleml\mldemo\*.rc						..\%arch_dir%\%langdir%\install\data\windows\samples\mldemo\mldemo
if NOT exist ..\%arch_dir%\%langdir%\install\data\windows\samples\mldemo\mldemo\*.rc echo File .\%arch_dir%\%langdir%\install\data\windows\samples\mldemo\mldemo\*.rc not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

if "%kitcopy_debug%"=="1" pause

echo ***************************************************************
echo arch_dir\language\INSTALL\DATA\SAMPLES\VERCHECK
echo This component has no Language specific SOURCE
echo ***************************************************************

rem we do send the vercheck sources and exe, no objs per meeting 5/13/97 ckl
copy ..\samples\vercheck\*.h	..\%arch_dir%\%langdir%\install\data\as_is\samples\vercheck
if NOT exist ..\%arch_dir%\%langdir%\install\data\as_is\samples\vercheck\*.h echo File .\%arch_dir%\%langdir%\install\data\as_is\samples\vercheck\*.h not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\vercheck\*.cpp	..\%arch_dir%\%langdir%\install\data\as_is\samples\vercheck
if NOT exist ..\%arch_dir%\%langdir%\install\data\as_is\samples\vercheck\*.cpp echo File .\%arch_dir%\%langdir%\install\data\as_is\samples\vercheck\*.cpp not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\vercheck\*.dsp	..\%arch_dir%\%langdir%\install\data\as_is\samples\vercheck
if NOT exist ..\%arch_dir%\%langdir%\install\data\as_is\samples\vercheck\*.dsp echo File .\%arch_dir%\%langdir%\install\data\as_is\samples\vercheck\*.dsp not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\vercheck\*.dsw	..\%arch_dir%\%langdir%\install\data\as_is\samples\vercheck
if NOT exist ..\%arch_dir%\%langdir%\install\data\as_is\samples\vercheck\*.dsw echo File .\%arch_dir%\%langdir%\install\data\as_is\samples\vercheck\*.dsw not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\vercheck\*.ico	..\%arch_dir%\%langdir%\install\data\as_is\samples\vercheck
if NOT exist ..\%arch_dir%\%langdir%\install\data\as_is\samples\vercheck\*.ico echo File .\%arch_dir%\%langdir%\install\data\as_is\samples\vercheck\*.ico not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\vercheck\*.rc*	..\%arch_dir%\%langdir%\install\data\as_is\samples\vercheck
if NOT exist ..\%arch_dir%\%langdir%\install\data\as_is\samples\vercheck\*.rc echo File .\%arch_dir%\%langdir%\install\data\as_is\samples\vercheck\*.rc not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\vercheck\*.txt	..\%arch_dir%\%langdir%\install\data\as_is\samples\vercheck
if NOT exist ..\%arch_dir%\%langdir%\install\data\as_is\samples\vercheck\*.txt echo File .\%arch_dir%\%langdir%\install\data\as_is\samples\vercheck\*.txt not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\vercheck\%bld_path%\release\*.exe ..\%arch_dir%\%langdir%\install\data\as_is\samples\vercheck
if NOT exist ..\%arch_dir%\%langdir%\install\data\as_is\samples\vercheck\*.exe echo File .\%arch_dir%\%langdir%\install\data\as_is\samples\vercheck\*.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samples\vercheck\%bld_path%\release\vercheck.exe ..\%arch_dir%\%langdir%\install\data\program
if NOT exist ..\%arch_dir%\%langdir%\install\data\program\vercheck.exe echo File .\%arch_dir%\%langdir%\install\data\program\vercheck.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

echo ***************************************************************
echo dectalk.lib and dectalk.dll goes together ML
echo ***************************************************************

copy ..\dtalkml\%bld_path%\release\dectalk.lib ..\%arch_dir%\%langdir%\install\data\as_is\%syslangdir%
if NOT exist ..\%arch_dir%\%langdir%\install\data\as_is\%syslangdir%\dectalk.lib echo File .\%arch_dir%\%langdir%\install\data\as_is\%syslangdir%\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dtalkml\%bld_path%\release\dectalk.dll ..\%arch_dir%\%langdir%\install\data\as_is\%syslangdir%
if NOT exist ..\%arch_dir%\%langdir%\install\data\as_is\%syslangdir%\dectalk.dll echo File .\%arch_dir%\%langdir%\install\data\as_is\%syslangdir%\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dtalkml\%bld_path%\release\dectalk.dll ..\%arch_dir%\%langdir%\install\data\sprogram
if NOT exist ..\%arch_dir%\%langdir%\install\data\sprogram\dectalk.dll echo File .\%arch_dir%\%langdir%\install\data\as_is\%syslangdir%\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem windows, windows\system area
copy ..\dtalkml\%bld_path%\release\dectalk.dll ..\%arch_dir%\%langdir%\install\data\sprogram
if NOT exist ..\%arch_dir%\%langdir%\install\data\sprogram\dectalk.dll echo File .\%arch_dir%\%langdir%\install\data\sprogram\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem for install shield 6.0
copy ..\dtalkml\%bld_path%\release\dectalk.dll		..\%arch_dir%\%langdir%\install\data\as_is\sys_dir
if NOT exist ..\%arch_dir%\%langdir%\install\data\as_is\sys_dir\dectalk.dll echo File .\%arch_dir%\%langdir%\install\data\as_is\sys_dir\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem wce200
rem copy ..\dtalkml\%bld_path%\Wce200\ce\sh\release\dectalk.dll	..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%syslangdir%\sh
rem if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%syslangdir%\sh\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%syslangdir%\sh\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
rem copy ..\dtalkml\%bld_path%\Wce200\ce\sh\release\dectalk.lib	..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%syslangdir%\sh
rem if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%syslangdir%\sh\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%syslangdir%\sh\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem copy ..\dtalkml\%bld_path%\Wce200\ce\mips\release\dectalk.dll	..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%syslangdir%\mips
rem if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%syslangdir%\mips\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%syslangdir%\mips\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
rem copy ..\dtalkml\%bld_path%\Wce200\ce\mips\release\dectalk.lib	..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%syslangdir%\mips
rem if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%syslangdir%\mips\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%syslangdir%\mips\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem copy ..\dtalkml\%bld_path%\Wce200\ce\x86em\release\dectalk.dll ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%syslangdir%\x86em
rem if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%syslangdir%\x86em\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%syslangdir%\x86em\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
rem copy ..\dtalkml\%bld_path%\Wce200\ce\x86em\release\dectalk.lib ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%syslangdir%\x86em
rem if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%syslangdir%\x86em\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\%syslangdir%\x86em\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem wce211 for MS HPC PC
copy ..\dtalkml\%bld_path%\Wce211\mspro\ce\arm\release\dectalk.dll		..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\arm
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\arm\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\arm\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dtalkml\%bld_path%\Wce211\mspro\ce\arm\release\dectalk.lib		..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\arm
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\arm\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\arm\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\dtalkml\%bld_path%\Wce211\mspro\ce\mips\release\dectalk.dll	..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\mips
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\mips\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\mips\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dtalkml\%bld_path%\Wce211\mspro\ce\mips\release\dectalk.lib	..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\mips
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\mips\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\mips\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\dtalkml\%bld_path%\Wce211\mspro\ce\sh\release\dectalk.dll		..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\sh
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\sh\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\sh\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dtalkml\%bld_path%\Wce211\mspro\ce\sh\release\dectalk.lib		..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\sh
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\sh\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\sh\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\dtalkml\%bld_path%\Wce211\mspro\ce\sh4\release\dectalk.dll		..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\sh4
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\sh4\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\sh4\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dtalkml\%bld_path%\Wce211\mspro\ce\sh4\release\dectalk.lib		..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\sh4
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\sh4\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\sh4\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\dtalkml\%bld_path%\Wce211\mspro\ce\x86em\release\dectalk.dll	..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\x86em
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\x86em\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\x86em\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dtalkml\%bld_path%\Wce211\mspro\ce\x86em\release\dectalk.lib	..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\x86em
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\x86em\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\%syslangdir%\x86em\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem wce211 for PALM SIZE PC

copy ..\dtalkml\%bld_path%\wce211\palm\ce\mips\release\dectalk.dll		..\%arch_dir%\%langdir%\install\cedata\as_is\wce211\palm\%syslangdir%\mips
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce211\palm\%syslangdir%\mips\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce211\palm\%syslangdir%\mips\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dtalkml\%bld_path%\wce211\palm\ce\mips\release\dectalk.lib		..\%arch_dir%\%langdir%\install\cedata\as_is\wce211\palm\%syslangdir%\mips
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce211\palm\%syslangdir%\mips\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce211\palm\%syslangdir%\mips\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\dtalkml\%bld_path%\wce211\palm\ce\sh\release\dectalk.dll		..\%arch_dir%\%langdir%\install\cedata\as_is\wce211\palm\%syslangdir%\sh
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce211\palm\%syslangdir%\sh\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce211\palm\%syslangdir%\sh\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dtalkml\%bld_path%\wce211\palm\ce\sh\release\dectalk.lib		..\%arch_dir%\%langdir%\install\cedata\as_is\wce211\palm\%syslangdir%\sh
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce211\palm\%syslangdir%\sh\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce211\palm\%syslangdir%\sh\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\dtalkml\%bld_path%\wce211\palm\ce\x86em\release\dectalk.dll	..\%arch_dir%\%langdir%\install\cedata\as_is\wce211\palm\%syslangdir%\x86em
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce211\palm\%syslangdir%\x86em\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce211\palm\%syslangdir%\x86em\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dtalkml\%bld_path%\wce211\palm\ce\x86em\release\dectalk.lib	..\%arch_dir%\%langdir%\install\cedata\as_is\wce211\palm\%syslangdir%\x86em
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce211\palm\%syslangdir%\x86em\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce211\palm\%syslangdir%\x86em\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem wce300 for POCKET PC
copy ..\dtalkml\%bld_path%\wce300\pocket\ce\arm\release\dectalk.dll		..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%syslangdir%\arm
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%syslangdir%\arm\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%syslangdir%\arm\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dtalkml\%bld_path%\wce300\pocket\ce\arm\release\dectalk.lib		..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%syslangdir%\arm
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%syslangdir%\arm\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%syslangdir%\arm\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\dtalkml\%bld_path%\wce300\pocket\ce\mips\release\dectalk.dll		..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%syslangdir%\mips
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%syslangdir%\mips\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%syslangdir%\mips\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dtalkml\%bld_path%\wce300\pocket\ce\mips\release\dectalk.lib		..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%syslangdir%\mips
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%syslangdir%\mips\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%syslangdir%\mips\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\dtalkml\%bld_path%\wce300\pocket\ce\sh\release\dectalk.dll		..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%syslangdir%\sh
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%syslangdir%\sh\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%syslangdir%\sh\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dtalkml\%bld_path%\wce300\pocket\ce\sh\release\dectalk.lib		..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%syslangdir%\sh
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%syslangdir%\sh\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%syslangdir%\sh\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\dtalkml\%bld_path%\wce300\pocket\ce\x86em\release\dectalk.dll		..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%syslangdir%\x86em
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%syslangdir%\x86em\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%syslangdir%\x86em\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dtalkml\%bld_path%\wce300\pocket\ce\x86em\release\dectalk.lib		..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%syslangdir%\x86em
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%syslangdir%\x86em\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\%syslangdir%\x86em\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log


rem wce300 for HPC2000
copy ..\dtalkml\%bld_path%\wce300\2000\ce\arm\release\dectalk.dll		..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\%syslangdir%\arm
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\%syslangdir%\arm\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\%syslangdir%\arm\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dtalkml\%bld_path%\wce300\2000\ce\arm\release\dectalk.lib		..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\%syslangdir%\arm
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\%syslangdir%\arm\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\%syslangdir%\arm\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

copy ..\dtalkml\%bld_path%\wce300\2000\ce\mips\release\dectalk.dll		..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\%syslangdir%\mips
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\%syslangdir%\mips\dectalk.dll echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\%syslangdir%\mips\dectalk.dll not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\dtalkml\%bld_path%\wce300\2000\ce\mips\release\dectalk.lib		..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\%syslangdir%\mips
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\%syslangdir%\mips\dectalk.lib echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\%syslangdir%\mips\dectalk.lib not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log



rem wce200
rem copy ..\samplece\dtsample\%bld_path%\Wce200\dll\mips\us\release\*.exe   ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample\bin\mips\%syslangdir%
rem if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample\bin\mips\%syslangdir%\*.exe echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample\bin\mips\%syslangdir%\*.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
rem copy ..\samplece\dtsample\%bld_path%\Wce200\dll\sh\us\release\*.exe		..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample\bin\sh\%syslangdir%
rem if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample\bin\sh\%syslangdir%\*.exe echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample\bin\sh\%syslangdir%\*.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
rem copy ..\samplece\dtsample\%bld_path%\Wce200\dll\x86em\us\release\*.exe	..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample\bin\x86em\%syslangdir%
rem if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample\bin\x86em\%syslangdir%\*.exe echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce200\samples\dtsample\bin\x86em\%syslangdir%\*.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log

rem wce211 for MS HPC PRO
copy ..\samplece\dtsample\%bld_path%\Wce211\mspro\dll\arm\us\release\*.exe		..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\samples\dtsample\bin\arm\%syslangdir%
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\samples\dtsample\bin\arm\%syslangdir%\dtsample.exe echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\samples\dtsample\bin\arm\%syslangdir%\dtsample.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\dtsample\%bld_path%\Wce211\mspro\dll\mips\us\release\*.exe		..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\samples\dtsample\bin\mips\%syslangdir%
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\samples\dtsample\bin\mips\%syslangdir%\dtsample.exe echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\samples\dtsample\bin\mips\%syslangdir%\dtsample.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\dtsample\%bld_path%\Wce211\mspro\dll\sh\us\release\*.exe		..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\samples\dtsample\bin\sh\%syslangdir%
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\samples\dtsample\bin\sh\%syslangdir%\dtsample.exe echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\samples\dtsample\bin\sh\%syslangdir%\dtsample.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\dtsample\%bld_path%\Wce211\mspro\dll\sh4\us\release\*.exe		..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\samples\dtsample\bin\sh4\%syslangdir%
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\samples\dtsample\bin\sh4\%syslangdir%\dtsample.exe echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\samples\dtsample\bin\sh4\%syslangdir%\dtsample.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\dtsample\%bld_path%\Wce211\mspro\dll\x86em\us\release\*.exe	..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\samples\dtsample\bin\x86em\%syslangdir%
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\samples\dtsample\bin\x86em\%syslangdir%\dtsample.exe echo File .\%arch_dir%\%langdir%\install\cedata\as_is\Wce211\mspro\samples\dtsample\bin\x86em\%syslangdir%\dtsample.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log


rem wce211 for PALM SIZE PC
copy ..\samplece\dtsample\%bld_path%\wce211\palm\dll\mips\us\release\*.exe		..\%arch_dir%\%langdir%\install\cedata\as_is\wce211\palm\samples\dtsample\bin\mips\%syslangdir%
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce211\palm\samples\dtsample\bin\mips\%syslangdir%\dtsample.exe echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce211\palm\samples\dtsample\bin\mips\%syslangdir%\dtsample.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\dtsample\%bld_path%\wce211\palm\dll\sh\us\release\*.exe		..\%arch_dir%\%langdir%\install\cedata\as_is\wce211\palm\samples\dtsample\bin\sh\%syslangdir%
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce211\palm\samples\dtsample\bin\sh\%syslangdir%\dtsample.exe echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce211\palm\samples\dtsample\bin\sh\%syslangdir%\dtsample.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\dtsample\%bld_path%\wce211\palm\dll\x86em\us\release\*.exe		..\%arch_dir%\%langdir%\install\cedata\as_is\wce211\palm\samples\dtsample\bin\x86em\%syslangdir%
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce211\palm\samples\dtsample\bin\x86em\%syslangdir%\dtsample.exe echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce211\palm\samples\dtsample\bin\x86em\%syslangdir%\dtsample.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log


rem wce300 for POCKET PC
copy ..\samplece\dtsample\%bld_path%\wce300\pocket\dll\arm\us\release\*.exe		..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\samples\dtsample\bin\arm\%syslangdir%
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\samples\dtsample\bin\arm\%syslangdir%\dtsample.exe echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\samples\dtsample\bin\arm\%syslangdir%\dtsample.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\dtsample\%bld_path%\wce300\pocket\dll\mips\us\release\*.exe		..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\samples\dtsample\bin\mips\%syslangdir%
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\samples\dtsample\bin\mips\%syslangdir%\dtsample.exe echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\samples\dtsample\bin\mips\%syslangdir%\dtsample.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\dtsample\%bld_path%\wce300\pocket\dll\sh\us\release\*.exe			..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\samples\dtsample\bin\sh\%syslangdir%
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\samples\dtsample\bin\sh\%syslangdir%\dtsample.exe echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\samples\dtsample\bin\sh\%syslangdir%\dtsample.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\dtsample\%bld_path%\wce300\pocket\dll\x86em\us\release\*.exe		..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\samples\dtsample\bin\x86em\%syslangdir%
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\samples\dtsample\bin\x86em\%syslangdir%\dtsample.exe echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce300\pocket\samples\dtsample\bin\x86em\%syslangdir%\dtsample.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
if "%kitcopy_debug%"=="1" pause


rem wce300 for HPC2000
copy ..\samplece\dtsample\%bld_path%\wce300\2000\dll\arm\us\release\*.exe		..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\samples\dtsample\bin\arm\%syslangdir%
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\samples\dtsample\bin\arm\%syslangdir%\dtsample.exe echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\samples\dtsample\bin\arm\%syslangdir%\dtsample.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\dtsample\%bld_path%\wce300\2000\dll\mips\us\release\*.exe		..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\samples\dtsample\bin\mips\%syslangdir%
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\samples\dtsample\bin\mips\%syslangdir%\dtsample.exe echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\samples\dtsample\bin\mips\%syslangdir%\dtsample.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\dtsample\%bld_path%\wce300\2000\dll\sh\us\release\*.exe			..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\samples\dtsample\bin\sh\%syslangdir%
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\samples\dtsample\bin\sh\%syslangdir%\dtsample.exe echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\samples\dtsample\bin\sh\%syslangdir%\dtsample.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
copy ..\samplece\dtsample\%bld_path%\wce300\2000\dll\x86em\us\release\*.exe		..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\samples\dtsample\bin\x86em\%syslangdir%
if NOT exist ..\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\samples\dtsample\bin\x86em\%syslangdir%\dtsample.exe echo File .\%arch_dir%\%langdir%\install\cedata\as_is\wce300\2000\samples\dtsample\bin\x86em\%syslangdir%\dtsample.exe not build >> %blddrv%%bldpath%\build_log\errors\kit%index%.log
if "%kitcopy_debug%"=="1" pause



rem <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

if "%kitcopy_debug%"=="1" pause

REM DONE!!!

goto exit

:noargs
echo NOTE:
echo ------------------------------------------------
echo      Usage: kitcopy version id language clean
echo ------------------------------------------------
goto end

:bug_setvar
echo Error! Setvar was not run
goto end

:bug_end
echo Error in BUILD process: KitCopy.BAT *****************************
echo Build process was terminated because of a system error
goto end

:exit
echo ***** BUILD process: KitCopy.BAT COMPLETED SUCCESSFULLY *****

:end

