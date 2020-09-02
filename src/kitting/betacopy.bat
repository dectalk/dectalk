@echo on
rem pause control
set dpause=0
goto skip_comment

rem betacopy.bat
rem 25-jun-1997
rem Carl Leeber
rem
rem Modified:   21-aug-97:      Add Static and Alpha Builds.
rem Modified:   27-aug-97:      Add DTPC1, DTPC2 and DTEX.
rem Modified:   26-nov-97:      Add control definitions.
rem Modified:   29-dec-97:      Add ENGLISH_UK definitions.
rem Modified:   28-jan-98:      Add ML definitions.
rem                             Add access32 and static copy.
rem Modified:   02-feb-98:      Fix 32/16bit and local/server control symbols.
rem Modified:   02-feb-98:      Changed B002 to B003.
rem Modified:   03-feb-98:      Add NWSNOAA to backups.
rem Modified:   19-feb-98:      Add Intel disk3 to copy steps.
rem Modified:   11-mar-98:      Change B003 to R004.
rem Modified:   13-jul-98:      Change R004 to R005.
rem Modified:   20-aug-98:      Change R005 to B001.
rem Modified:   26-aug-98:      Add Copy Of StaticS Non-Access32 Area.
rem Modified:   26-jan-99:      Change B001 to B002, Add CE.
rem Modified:   25-feb-99:      Add Varable Defs & Correct ML Label Bug.
rem Modified:   28-apr-99:      Chg NWSNOAA to NWSNOAAUS; Add NWSNOAALA.
rem Modified:   15-jun-99:      Change R003 to R004, NWS ONLY.
rem Modified:   02-jul-99:      Change R004 to R005, NWS RELEASE ONLY.
rem Modified:   22-oct-99:      Change R005 to R006
rem Modified:	 22-dec-99:      added Windows CE support
rem Modified:   11-jan-00:      DTPC1/DTPC2/DTex copy only needed files for SDK
rem Modified:   23-mar-00:      added sh and sh4 Windows CE 211 support
rem Modified:   23-mar-00:      added full access32 support for windows CE
rem Modified:   03-apr-00:      now copies demos to server
rem Modified:	17-nov-00:		1. Removed msdpath and msddrv variables not used anymore
rem Modified:					2. Change to 4.61 and B002
rem 							3. Removed variable AlpDrv, %AlpCode% and %AlpWpd% as well as entire directory		
rem								4. Added PALM SIZE PC and POCKET PC
rem				27-nov-00		1. Added Sapi5 
rem								2. Added license to windows and ce
rem Modified:	1-dec-00		Removed disk# for ce and windows
rem cab			24-jan-01		Added French
rem				17-apr-01		1. Changed to R002
rem								2. Added new location of demos directory and install modification
rem								3. Added skip_comment label
rem				19-apr-01		1. Fixed missing path, script error, & removed fr for wdisk
rem cab			26-jun-01		Removed variable %bld_mach%	
rem	cab			17-jul-01		1. Removed access32
rem								2. Changed license to be copy from swi95nt
rem								3. Changed statics to static
:skip_comment

echo ***** Error log for betacopy.bat **** >> %blddrv%%bldpath%\build_log\errors\win%index%.log

rem copy control definitions; 0 is disabled, 1 is enabled.
rem 32 bit copies to server (Y:).
set TTbitsup=1

rem 16 bit copies to server (Y:).
set STbitsup=1

rem 32 bit copies to local backup (F:).
set TTbitlup=0

rem 16 bit copies to local backup (G:).
set STbitlup=0

rem pause control
set dpause=0
set lang_brief=us
set lang_verbose=ENGLISH_US

rem ussp, spus control
set us_sp=0

rem **********************
rem Use Setvar.bat
rem **********************
echo Use Setvar.bat

if NOT "%setvar%"=="" goto goodtogo

:nogood
echo WARNING: Setvar not defined.
echo WARNING: Using default build drive (d:).
set blddrv=d:
echo WARNING: Using current path as default build path (.)
echo WARNING: Using default tool path (\work\tools)
set tool_path =\work\tools
goto setdef

if %dpause%==1 pause

:goodtogo
if NOT EXIST %setvar% echo WARNING: Path %setvar% is not defined.
if NOT EXIST %setvar% goto nogood
if "%setvardone%"=="1" echo SETVAR.BAT already done.
if "%setvardone%"=="1" goto setdef
call %setvar%

:setdef

rem **********************
rem Set Vars Not Set Setvar.bat
rem **********************
echo Set Vars Not Set Setvar.bat

rem bldpath set in setvar.bat
set IntDrv=%blddrv%
set SrvDrv=y:

set SrvRoot=DTPC_95
set SdkArea=Sdk_461
set RelVer=R002
set IntCode=w95-nt-i
set CECode=ce
set IntWpd=wpond_i

rem demos directory
set ce_bld_path=demos\cedemos
set demo_dir=demos\windemos

:top
if %lang_verbose%==ENGLISH_UK set lang_brief=uk
if %lang_verbose%==SPANISH set lang_brief=sp
if %lang_verbose%==SPANISH_LA set lang_brief=la
if %lang_verbose%==FRENCH set lang_brief=fr
if %lang_verbose%==GERMAN set lang_brief=gr
if %lang_verbose%==ML set lang_brief=ml

if not "%STbitsup%"=="1" goto nonwsnoaa
if %lang_verbose%==NWSNOAAUS set lang_brief=nws_us
if %lang_verbose%==NWSNOAALA set lang_brief=nws_la
:nonwsnoaa
if %lang_verbose%==ML set lang_brief=ml

echo lang_brief = %lang_brief%
echo lang_verbose = %lang_verbose%
if %dpause%==1 pause

rem if a 32 bit AND a server back up
if %TTbitsup%==0 goto STbtdt

rem if a 32 bit AND a server back up
if %lang_brief%==nws_us goto STbtdt
if %lang_brief%==nws_la goto STbtdt

rem
rem create CE directories for Standard DECtalk SDK on server on Y drive

%SrvDrv%

if not "%lang_brief%"=="us" goto skip_md1
if not exist %SrvRoot%\%SdkArea%\%RelVer%\%CECode%	md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%
:skip_md1

if "%lang_brief%"=="ml" goto skipml13
if not exist %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief% md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%

if not "%lang_brief%"=="us" goto skip_md2
if not exist %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\lock_mgr md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\lock_mgr
:skip_md2

if not exist %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce200\mips md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce200\mips
if not exist %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce200\sh md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce200\sh
if not exist %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce200\x86em md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce200\x86em

if not exist %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\mspro\arm md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\mspro\arm
if not exist %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\mspro\mips md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\mspro\mips
if not exist %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\mspro\sh md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\mspro\sh
if not exist %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\mspro\sh4 md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\mspro\sh4
if not exist %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\mspro\x86em md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\mspro\x86em

if not exist %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\palm\mips  md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\palm\mips
if not exist %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\palm\sh md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\palm\sh
if not exist %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\palm\x86em md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\palm\x86em

if not exist %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce300\arm md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce300\arm
if not exist %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce300\mips md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce300\mips
if not exist %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce300\sh md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce300\sh
if not exist %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce300\x86em md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce300\x86em

if not "%lang_brief%"=="us" goto skip_md3
if not exist %SrvRoot%\%SdkArea%\%RelVer%\demos md %SrvRoot%\%SdkArea%\%RelVer%\demos
if not exist %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode% md %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%

if not exist %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce200\mips  md %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce200\mips
if not exist %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce200\sh md %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce200\sh
if not exist %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce200\x86em md %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce200\x86em

if not exist %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\arm md %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\arm
if not exist %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\mips md %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\mips
if not exist %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\sh md %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\sh
if not exist %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\sh4 md %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\sh4
if not exist %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\x86em md %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\x86em

if not exist %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\palm\mips md %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\palm\mips
if not exist %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\palm\sh md %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\palm\sh
if not exist %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\palm\x86em md %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\palm\x86em

if not exist %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce300\arm md %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce300\arm
if not exist %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce300\mips md %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce300\mips
if not exist %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce300\sh md %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce300\sh
if not exist %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce300\x86em md %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce300\x86em
:skip_md3

:skipml13
if %dpause%==1 pause

rem copy standard DECtalk Windows CE SDK to server on Y drive

if not "%lang_brief%"=="us" goto skip_ce_install
if "%lang_brief%"=="ml" goto skipmlc13

copy %blddrv%%bldpath%\swi95nt\lock_mgr\standard\*.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\lock_mgr
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\lock_mgr\licen*.exe echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\lock_mgr\licen*.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
:skip_ce_install

if "%lang_brief%"=="ml" goto skip_staticce
copy %blddrv%%bldpath%\swi95nt\%lang_brief%\staticce\Wce200\mips\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce200\mips\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce200\mips\dtstatic.lib echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce200\mips\dtstatic.lib not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy %blddrv%%bldpath%\swi95nt\%lang_brief%\staticce\Wce200\sh\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce200\sh\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce200\sh\dtstatic.lib echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce200\sh\dtstatic.lib not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy %blddrv%%bldpath%\swi95nt\%lang_brief%\staticce\Wce200\x86em\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce200\x86em\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce200\x86em\dtstatic.lib echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce200\x86em\dtstatic.lib not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

copy %blddrv%%bldpath%\swi95nt\%lang_brief%\staticce\Wce211\mspro\arm\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\mspro\arm\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\mspro\arm\dtstatic.lib echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\mspro\arm\dtstatic.lib not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy %blddrv%%bldpath%\swi95nt\%lang_brief%\staticce\Wce211\mspro\mips\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\mspro\mips\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\mspro\mips\dtstatic.lib echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\mspro\mips\dtstatic.lib not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy %blddrv%%bldpath%\swi95nt\%lang_brief%\staticce\Wce211\mspro\sh\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\mspro\sh\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\mspro\sh\dtstatic.lib echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\mspro\sh\dtstatic.lib not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy %blddrv%%bldpath%\swi95nt\%lang_brief%\staticce\Wce211\mspro\sh4\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\mspro\sh4\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\mspro\sh4\dtstatic.lib echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\mspro\sh4\dtstatic.lib not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy %blddrv%%bldpath%\swi95nt\%lang_brief%\staticce\Wce211\mspro\x86em\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\mspro\x86em\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\mspro\x86em\dtstatic.lib echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\mspro\x86em\dtstatic.lib not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

copy %blddrv%%bldpath%\swi95nt\%lang_brief%\staticce\Wce211\palm\mips\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\palm\mips\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\palm\mips\dtstatic.lib echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\palm\mips\dtstatic.lib not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy %blddrv%%bldpath%\swi95nt\%lang_brief%\staticce\Wce211\palm\sh\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\palm\sh\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\palm\sh\dtstatic.lib echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\palm\sh\dtstatic.lib not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy %blddrv%%bldpath%\swi95nt\%lang_brief%\staticce\Wce211\palm\x86em\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\palm\x86em\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\palm\x86em\dtstatic.lib echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce211\palm\x86em\dtstatic.lib not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

copy %blddrv%%bldpath%\swi95nt\%lang_brief%\staticce\Wce300\arm\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce300\arm\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce300\arm\dtstatic.lib echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce300\arm\dtstatic.lib not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy %blddrv%%bldpath%\swi95nt\%lang_brief%\staticce\Wce300\mips\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce300\mips\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce300\mips\dtstatic.lib echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce300\mips\dtstatic.lib not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy %blddrv%%bldpath%\swi95nt\%lang_brief%\staticce\Wce300\sh\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce300\sh\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce300\sh\dtstatic.lib echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce300\sh\dtstatic.lib not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy %blddrv%%bldpath%\swi95nt\%lang_brief%\staticce\Wce300\x86em\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce300\x86em\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce300\x86em\dtstatic.lib echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\Wce300\x86em\dtstatic.lib not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

copy %blddrv%%bldpath%\swi95nt\%lang_brief%\staticce\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\static\*.*
:skip_staticce

if "%lang_brief%"=="ml" goto skip_cedemodata
copy %blddrv%%bldpath%\swi95nt\%ce_bld_path%\wce200\mips\%lang_brief%\%lang_brief%mip20.exe		%SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce200\mips\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce200\mips\%lang_brief%mip20.exe echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce200\mips\%lang_brief%mip20.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy %blddrv%%bldpath%\swi95nt\%ce_bld_path%\wce200\sh\%lang_brief%\%lang_brief%sh20.exe		%SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce200\sh\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce200\sh\%lang_brief%sh20.exe echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce200\sh\%lang_brief%mip20.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy %blddrv%%bldpath%\swi95nt\%ce_bld_path%\wce200\x86em\%lang_brief%\%lang_brief%x8620.exe	%SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce200\x86em\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce200\x86em\%lang_brief%x8620.exe echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce200\x86em\%lang_brief%x8620.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

copy %blddrv%%bldpath%\swi95nt\%ce_bld_path%\wce211\mspro\arm\%lang_brief%\%lang_brief%arm21pro.exe		%SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\arm\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\arm\%lang_brief%arm21pro.exe echo %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\arm\%lang_brief%arm21pro.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy %blddrv%%bldpath%\swi95nt\%ce_bld_path%\wce211\mspro\mips\%lang_brief%\%lang_brief%mip21pro.exe	%SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\mips\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\mips\%lang_brief%mip21pro.exe echo %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\mips\%lang_brief%mip21pro.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy %blddrv%%bldpath%\swi95nt\%ce_bld_path%\wce211\mspro\sh\%lang_brief%\%lang_brief%sh21pro.exe		%SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\sh\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\sh\%lang_brief%sh21pro.exe echo %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\sh\%lang_brief%sh21pro.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy %blddrv%%bldpath%\swi95nt\%ce_bld_path%\wce211\mspro\sh4\%lang_brief%\%lang_brief%sh421pro.exe		%SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\sh4\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\sh4\%lang_brief%sh421pro.exe echo %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\sh4\%lang_brief%sh421pro.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy %blddrv%%bldpath%\swi95nt\%ce_bld_path%\wce211\mspro\x86em\%lang_brief%\%lang_brief%x8621pro.exe	%SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\x86em\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\x86em\%lang_brief%x8621pro.exe echo %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\x86em\%lang_brief%x8621pro.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

copy %blddrv%%bldpath%\swi95nt\%ce_bld_path%\wce211\palm\mips\%lang_brief%\%lang_brief%mip21palm.exe	%SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\palm\mips\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\palm\mips\%lang_brief%mip21palm.exe echo %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\palm\mips\%lang_brief%mip21palm.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy %blddrv%%bldpath%\swi95nt\%ce_bld_path%\wce211\palm\sh\%lang_brief%\%lang_brief%sh21palm.exe		%SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\palm\sh\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\palm\sh\%lang_brief%sh21palm.exe echo %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\palm\sh\%lang_brief%sh21palm.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy %blddrv%%bldpath%\swi95nt\%ce_bld_path%\wce211\palm\x86em\%lang_brief%\%lang_brief%x8621palm.exe	%SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\palm\x86em\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\palm\x86em\%lang_brief%x8621palm.exe echo %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\palm\x86em\%lang_brief%x8621palm.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

copy %blddrv%%bldpath%\swi95nt\%ce_bld_path%\wce300\arm\%lang_brief%\%lang_brief%arm30.exe		%SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce300\arm\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce300\arm\%lang_brief%arm30.exe echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce300\arm\%lang_brief%arm30.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy %blddrv%%bldpath%\swi95nt\%ce_bld_path%\wce300\mips\%lang_brief%\%lang_brief%mip30.exe		%SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce300\mips\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce300\mips\%lang_brief%mip30.exe echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce300\mips\%lang_brief%mip30.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy %blddrv%%bldpath%\swi95nt\%ce_bld_path%\wce300\sh\%lang_brief%\%lang_brief%sh30.exe		%SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce300\sh\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce300\sh\%lang_brief%sh30.exe echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce300\sh\%lang_brief%sh30.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy %blddrv%%bldpath%\swi95nt\%ce_bld_path%\wce300\x86em\%lang_brief%\%lang_brief%x8630.exe	%SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce300\x86em\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce300\x86em\%lang_brief%x8630.exe echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce300\x86em\%lang_brief%x8630.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
:skip_cedemodata

if NOT "%lang_brief%"=="us" goto skipCEall
copy %blddrv%%bldpath%\swi95nt\%ce_bld_path%\wce200\mips\alldemo\allmip20.exe	%SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce200\mips\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce200\mips\allmip20.exe echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce200\mips\allmip20.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy %blddrv%%bldpath%\swi95nt\%ce_bld_path%\wce200\sh\alldemo\allsh20.exe		%SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce200\sh\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce200\sh\allsh20.exe echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce200\sh\allsh20.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy %blddrv%%bldpath%\swi95nt\%ce_bld_path%\wce200\x86em\alldemo\allx8620.exe	%SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce200\x86em\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce200\x86em\allx8620.exe echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce200\x86em\allx8620.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

copy %blddrv%%bldpath%\swi95nt\%ce_bld_path%\wce211\mspro\arm\alldemo\allarm21pro.exe	%SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\arm\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\arm\allarm21pro.exe echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\arm\allarm21pro.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy %blddrv%%bldpath%\swi95nt\%ce_bld_path%\wce211\mspro\mips\alldemo\allmip21pro.exe	%SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\mips\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\mips\allmip21pro.exe echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\mips\allmip21pro.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy %blddrv%%bldpath%\swi95nt\%ce_bld_path%\wce211\mspro\sh\alldemo\allsh21pro.exe		%SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\sh\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\sh\allsh21pro.exe echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\sh\allsh21pro.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy %blddrv%%bldpath%\swi95nt\%ce_bld_path%\wce211\mspro\sh4\alldemo\allsh421pro.exe	%SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\sh4\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\sh4\allsh421pro.exe echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\sh4\allsh421pro.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy %blddrv%%bldpath%\swi95nt\%ce_bld_path%\wce211\mspro\x86em\alldemo\allx8621pro.exe	%SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\x86em\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\x86em\allx8621pro.exe echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mspro\x86em\allx8621pro.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

copy %blddrv%%bldpath%\swi95nt\%ce_bld_path%\wce211\palm\mips\alldemo\allmip21palm.exe	%SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\palm\mips\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\palm\mips\allmip21palm.exe echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\palm\mips\allmip21palm.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy %blddrv%%bldpath%\swi95nt\%ce_bld_path%\wce211\palm\sh\alldemo\allsh21palm.exe		%SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\palm\sh\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\palm\sh\allsh21palm.exe echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\palm\sh\allsh21palm.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy %blddrv%%bldpath%\swi95nt\%ce_bld_path%\wce211\palm\x86em\alldemo\allx8621palm.exe	%SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\palm\x86em\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\palm\x86em\allx8621palm.exe echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\palm\x86em\allx8621palm.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

copy %blddrv%%bldpath%\swi95nt\%ce_bld_path%\wce300\arm\alldemo\allarm30.exe	%SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce300\arm\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce300\arm\allarm30.exe echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce300\arm\allarm30.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy %blddrv%%bldpath%\swi95nt\%ce_bld_path%\wce300\mips\alldemo\allmip30.exe	%SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce300\mips\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce300\mips\allmip30.exe echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce300\mips\allmip30.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy %blddrv%%bldpath%\swi95nt\%ce_bld_path%\wce300\sh\alldemo\allsh30.exe		%SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce300\sh\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce300\sh\allsh30.exe echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce300\sh\allsh30.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy %blddrv%%bldpath%\swi95nt\%ce_bld_path%\wce300\x86em\alldemo\allx8630.exe	%SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce300\x86em\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce300\x86em\allx8630.exe echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce300\x86em\allx8630.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
:skipCEall

:skipmlc13

rem create directories for standard DECtalk SDK on server on Y drive
%SrvDrv%

if not "%lang_brief%"=="us" goto skip_md4
if not exist %SrvRoot% md %SrvRoot%
if not exist %SrvRoot%\%SdkArea% md %SrvRoot%\%SdkArea%
if not exist %SrvRoot%\%SdkArea%\%RelVer% md %SrvRoot%\%SdkArea%\%RelVer%
if not exist %SrvRoot%\%SdkArea%\%RelVer%\demos md %SrvRoot%\%SdkArea%\%RelVer%\demos
if not exist %SrvRoot%\%SdkArea%\%RelVer%\demos\%IntCode% md %SrvRoot%\%SdkArea%\%RelVer%\demos\%IntCode%
if not exist %SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\disk1 md %SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\disk1
if not exist %SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\disk1\license md %SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\disk1\license
if not exist %SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\disk1\sapi5 md %SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\disk1\sapi5
rem $md %SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%
if not exist %SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\lock_mgr md %SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\lock_mgr
:skip_md4

if "%lang_brief%"=="ml" goto skipml1
if not exist %SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static md %SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static
if not exist %SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\staticS md %SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\staticS
:skipml1
if %dpause%==1 pause

rem copy standard DECtalk SDK to server on Y drive

if not "%lang_brief%"=="us" goto skip_win_install
xcopy /s %blddrv%%bldpath%\swi95nt\install\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\disk1\*.*
if not exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\disk1\*.* echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\disk1\*.* not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
if "%lang_brief%"=="ml" goto skipml2

copy %blddrv%%bldpath%\swi95nt\lock_mgr\standard\licen*.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\lock_mgr
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\lock_mgr\licen*.exe echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\lock_mgr\licen*.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
:skip_win_install

if "%lang_brief%"=="ml" goto skip_ml2
copy %blddrv%%bldpath%\swi95nt\%lang_brief%\static\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\dtaccess.exe echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\dtaccess.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\dtalk_%lang_brief%.dic echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\dtalk_%lang_brief%.dic not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\dtdemo.exe echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\dtdemo.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\dtstatic.lib echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\dtstatic.lib not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\say.exe echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\say.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\windic.exe echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\windic.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

copy %blddrv%%bldpath%\samples\speak\text\order.txt %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\order.txt echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\order.txt not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy %blddrv%%bldpath%\samples\speak\text\command.txt %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\command.txt echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\command.txt not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy %blddrv%%bldpath%\samples\speak\text\email.txt %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\email.txt echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\email.txt not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
copy %blddrv%%bldpath%\samples\speak\text\demo.wav %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\demo.wav echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\demo.wav not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

copy %blddrv%%bldpath%\swi95nt\%demo_dir%\%lang_brief%\demo_%lang_brief%.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%IntCode%\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%IntCode%\demo_%lang_brief%.exe echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%IntCode%\demo_%lang_brief%.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

rem We only need to copy the 'all' demo once.. 'us' was just an arbitrary choice
if "%lang_brief%"=="us" copy %blddrv%%bldpath%\swi95nt\%demo_dir%\alldemo\demo_all.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%IntCode%
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%IntCode%\demo_all.exe echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%IntCode%\demo_all.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

if "%lang_brief%"=="us" goto demoen
copy %blddrv%%bldpath%\samples\speak\text\demo.%lang_brief% %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\demo.%lang_brief% echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\demo.%lang_brief% not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
goto demononen

:demoen
copy %blddrv%%bldpath%\samples\speak\text\demo.en %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\demo.en echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\demo.en not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
:demononen

:skip_ml2
if %dpause%==1 pause

rem create directories for WillowPond DECtalk SDK on server on Y drive
%SrvDrv%

if "%lang_brief%"=="ml" goto skipml5
if not exist %SrvRoot%\%SdkArea%\%RelVer%\%IntWpd%\%lang_brief%\disk1 md %SrvRoot%\%SdkArea%\%RelVer%\%IntWpd%\%lang_brief%\disk1
if not exist %SrvRoot%\%SdkArea%\%RelVer%\%IntWpd%\lock_mgr md %SrvRoot%\%SdkArea%\%RelVer%\%IntWpd%\lock_mgr
:skipml5
if %dpause%==1 pause

rem copy WillowPond DECtalk SDK to server on Y drive
if "%lang_brief%"=="ml" goto skipml6
if "%lang_brief%"=="fr" goto skipml6
copy %blddrv%%bldpath%\swi95nt\%lang_brief%\install\wdisk1\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntWpd%\%lang_brief%\disk1\*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntWpd%\%lang_brief%\disk1\*.* echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntWpd%\%lang_brief%\disk1\*.* not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log

if not "%lang_brief%"=="us" goto skip_m16
copy %blddrv%%bldpath%\swi95nt\lock_mgr\standard\licen*.exe		%SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntWpd%\lock_mgr\licen*.*
if NOT exist %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntWpd%\lock_mgr\licen*.exe echo File %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntWpd%\lock_mgr\licen*.exe not build >> %blddrv%%bldpath%\build_log\errors\win%index%.log
:skipml6

if %dpause%==1 pause

:STbtdt
rem if a 16 bit AND a server back up
if %STbitsup%==0 goto langloop

rem loop again...
:langloop
if %lang_brief%==us set lang_verbose=ENGLISH_UK
if %lang_brief%==us goto top
if %lang_brief%==uk set lang_verbose=SPANISH
if %lang_brief%==uk goto top
if %lang_brief%==sp set lang_verbose=SPANISH_LA
if %lang_brief%==sp goto top
if %lang_brief%==la set lang_verbose=FRENCH
if %lang_brief%==la goto top
if %lang_brief%==fr set lang_verbose=GERMAN
if %lang_brief%==fr goto top
if %lang_brief%==gr set lang_verbose=ML
if %lang_brief%==gr goto top
if %lang_brief%==ml goto done

if not "%STbitsup%"=="1" goto notnwsnoaa
if %lang_brief%==gr set lang_verbose=NWSNOAAUS
if %lang_brief%==gr goto top
if %lang_brief%==nws_us set lang_verbose=NWSNOAALA
if %lang_brief%==nws_us goto top
if %lang_brief%==nws_la set lang_verbose=ML
if %lang_brief%==nws_la goto top
if %lang_brief%==ml goto done

:notnwsnoaa
if %lang_brief%==gr set lang_verbose=ML
if %lang_brief%==gr goto top
if %lang_brief%==ml goto done

:error
echo Missing parameter required:
echo Usage: betacopy [version]
goto end

:done
if %dpause%==1 pause
rem

rem if a 32 bit AND a local back up
if %TTbitlup%==0 goto STbtdta

rem XCOPY the tree to F: for safe keeping
%IntDrv%
rem xcopy /y /e /s %blddrv%%bldpath%\swi95nt\*.* f:\work_area\ad\swi95nt\*.*
rem deltree /y %IntDrv%%bldpath%\swi95nt
rem

:STbtdta
rem if a 16 bit AND a local back up
if %STbitlup%==0 goto end

goto end

:end_error
echo *** BETACOPY.BAT has encountered an error *******************
:end
%IntDrv%
