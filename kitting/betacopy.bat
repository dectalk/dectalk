echo off

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
rem Modified:   06-jun-00:      Change R009 to P010
rem Modified:	18-Aug-00:	Change P010 to R011

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
echo WARNING: Using default MSDEV drive (c:).
set msddrv=c:
echo WARNING: Using default MSDEV path (\msdev).
set msdpath=\msdev
echo WARNING: Using default machine build (x86).
set bld_mach=i386
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
set AlpDrv=v:

set SrvDrv=y:

set SrvRoot=DTPC_95
set SdkArea=Sdk_460
set RelVer=R011
set IntCode=w95-nt-i
set CECode=ce
set IntWpd=wpond_i
set AlpCode=nt-a
set AlpWpd=wpond_a

:top

if %lang_verbose%==ENGLISH_UK set lang_brief=uk
if %lang_verbose%==SPANISH set lang_brief=sp
if %lang_verbose%==SPANISH_LA set lang_brief=la
if %lang_verbose%==GERMAN set lang_brief=gr
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

md %SrvRoot%
md %SrvRoot%\%SdkArea%
md %SrvRoot%\%SdkArea%\%RelVer%
md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%
md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%
md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\disk1
if "%lang_brief%"=="ml" goto skipml13
md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\disk2
md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\disk3


if "%lang_brief%"=="uk" goto douk13
goto skipuk13
:douk13
md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\disk4
:skipuk13

if "%lang_brief%"=="us" goto dous13
goto skipus13
:dous13
md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\disk4
:skipus13

if "%lang_brief%"=="gr" goto dogr13
goto skipgr13
:dogr13
md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\disk4
md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\disk5
md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\disk6
:skipgr13

md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\lock_mgr

rem md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\access32\smiten

md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\access32
md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\access32\Wce200
md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\access32\Wce200\mips\smiten
md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\access32\Wce200\sh\smiten
md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\access32\Wce200\x86em\smiten
md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\access32\Wce211
md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\access32\Wce211\sh\smiten
md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\access32\Wce211\sh4\smiten
md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\access32\Wce211\arm\smiten
md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\access32\Wce211\mips\smiten
md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\access32\Wce211\x86em\smiten


md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\staticS
md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\staticS\Wce200
md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\staticS\Wce200\mips
md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\staticS\Wce200\sh
md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\staticS\Wce200\x86em
md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\staticS\Wce211
md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\staticS\Wce211\sh
md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\staticS\Wce211\sh4
md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\staticS\Wce211\arm
md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\staticS\Wce211\mips
md %SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\staticS\Wce211\x86em

md %SrvRoot%\%SdkArea%\%RelVer%\demos
md %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%
md %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce200
md %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce200\mips
md %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce200\sh
md %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce200\x86em
md %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211
md %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\arm
md %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mips
md %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\sh
md %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\sh4
md %SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\x86em
:skipml13

rem copy standard DECtalk Windows CE SDK to server on Y drive
%IntDrv%
copy %bldpath%\swi95nt\%lang_brief%\install\cedisk1\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\disk1\*.*
if "%lang_brief%"=="ml" goto skipmlc13
copy %bldpath%\swi95nt\%lang_brief%\install\cedisk2\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\disk2\*.*
copy %bldpath%\swi95nt\%lang_brief%\install\cedisk3\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\disk3\*.*

copy %bldpath%\license\LICENINC\build\licenin1\release\*.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\lock_mgr\*.*
copy %bldpath%\license\LICENINC\build\licenin3\release\*.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\lock_mgr\*.*
copy %bldpath%\license\LICENINC\build\licenin7\release\*.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\lock_mgr\*.*
copy %bldpath%\license\LICENSEU\build\release\*.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\lock_mgr\*.*



if "%lang_brief%"=="uk" goto doukc13
goto skipukc13
:doukc13
copy %bldpath%\swi95nt\%lang_brief%\install\cedisk4\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\disk4\*.*
:skipukc13

if "%lang_brief%"=="us" goto dousc13
goto skipusc13
:dousc13
copy %bldpath%\swi95nt\%lang_brief%\install\cedisk4\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\disk4\*.*
:skipusc13


if "%lang_brief%"=="gr" goto dogrc13
goto skipgrc13
:dogrc13
copy %bldpath%\swi95nt\%lang_brief%\install\cedisk4\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\disk4\*.*
copy %bldpath%\swi95nt\%lang_brief%\install\cedisk5\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\disk5\*.*
copy %bldpath%\swi95nt\%lang_brief%\install\cedisk6\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\disk6\*.*
:skipgrc13

copy %bldpath%\swi95nt\%lang_brief%\staticSce\Wce200\mips\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\staticS\Wce200\mips\*.*
copy %bldpath%\swi95nt\%lang_brief%\staticSce\Wce200\sh\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\staticS\Wce200\sh\*.*
copy %bldpath%\swi95nt\%lang_brief%\staticSce\Wce200\x86em\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\staticS\Wce200\x86em\*.*
copy %bldpath%\swi95nt\%lang_brief%\staticSce\Wce211\sh\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\staticS\Wce211\sh\*.*
copy %bldpath%\swi95nt\%lang_brief%\staticSce\Wce211\sh4\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\staticS\Wce211\sh4\*.*
copy %bldpath%\swi95nt\%lang_brief%\staticSce\Wce211\mips\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\staticS\Wce211\mips\*.*
copy %bldpath%\swi95nt\%lang_brief%\staticSce\Wce211\arm\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\staticS\Wce211\arm\*.*
copy %bldpath%\swi95nt\%lang_brief%\staticSce\Wce211\x86em\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\staticS\Wce211\x86em\*.*
copy %bldpath%\swi95nt\%lang_brief%\staticSce\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\staticS\*.*

copy %bldpath%\swi95nt\%lang_brief%\accessCE\Wce200\mips\smiten\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\access32\Wce200\mips\smiten\*.*
copy %bldpath%\swi95nt\%lang_brief%\accessCE\Wce200\sh\smiten\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\access32\Wce200\sh\smiten\*.*
copy %bldpath%\swi95nt\%lang_brief%\accessCE\Wce200\x86em\smiten\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\access32\Wce200\x86em\smiten\*.*
copy %bldpath%\swi95nt\%lang_brief%\accessCE\Wce211\sh4\smiten\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\access32\Wce211\sh4\smiten\*.*
copy %bldpath%\swi95nt\%lang_brief%\accessCE\Wce211\mips\smiten\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\access32\Wce211\mips\smiten\*.*
copy %bldpath%\swi95nt\%lang_brief%\accessCE\Wce211\sh\smiten\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\access32\Wce211\sh\smiten\*.*
copy %bldpath%\swi95nt\%lang_brief%\accessCE\Wce211\arm\smiten\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\access32\Wce211\arm\smiten\*.*
copy %bldpath%\swi95nt\%lang_brief%\accessCE\Wce211\x86em\smiten\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%CECode%\%lang_brief%\access32\Wce211\x86em\smiten\*.*

copy %bldpath%\cedemodata\wce200\mips\%lang_brief%\d%lang_brief%mip00.exe	%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce200\mips\*.*
copy %bldpath%\cedemodata\wce200\sh\%lang_brief%\d%lang_brief%sh00.exe		%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce200\sh\*.*
copy %bldpath%\cedemodata\wce200\x86em\%lang_brief%\d%lang_brief%x8600.exe	%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce200\x86em\*.*
copy %bldpath%\cedemodata\wce211\mips\%lang_brief%\d%lang_brief%mip11.exe	%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mips\*.*
copy %bldpath%\cedemodata\wce211\arm\%lang_brief%\d%lang_brief%arm11.exe	%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\arm\*.*
copy %bldpath%\cedemodata\wce211\sh\%lang_brief%\d%lang_brief%sh11.exe		%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\sh\*.*
copy %bldpath%\cedemodata\wce211\sh4\%lang_brief%\d%lang_brief%sh411.exe	%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\sh4\*.*
copy %bldpath%\cedemodata\wce211\x86em\%lang_brief%\d%lang_brief%x8611.exe	%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\x86em\*.*

if NOT "%lang_brief%"=="us" goto :skipCEall
copy %bldpath%\cedemodata\wce200\mips\alldemo\allmip00.exe	%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce200\mips\*.*
copy %bldpath%\cedemodata\wce200\sh\alldemo\allsh00.exe		%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce200\sh\*.*
copy %bldpath%\cedemodata\wce200\x86em\alldemo\allx8600.exe	%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce200\x86em\*.*
copy %bldpath%\cedemodata\wce211\mips\alldemo\allmip11.exe	%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\mips\*.*
copy %bldpath%\cedemodata\wce211\arm\alldemo\allarm11.exe	%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\arm\*.*
copy %bldpath%\cedemodata\wce211\sh\alldemo\allsh11.exe		%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\sh\*.*
copy %bldpath%\cedemodata\wce211\sh4\alldemo\allsh411.exe	%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\sh4\*.*
copy %bldpath%\cedemodata\wce211\x86em\alldemo\allx8611.exe	%SrvRoot%\%SdkArea%\%RelVer%\demos\%CECode%\wce211\x86em\*.*
:skipCEall

:skipmlc13


rem create directories for standard DECtalk SDK on server on Y drive
%SrvDrv%
md %SrvRoot%
md %SrvRoot%\%SdkArea%
md %SrvRoot%\%SdkArea%\%RelVer%
md %SrvRoot%\%SdkArea%\%RelVer%\demos
md %SrvRoot%\%SdkArea%\%RelVer%\demos\%IntCode%
md %SrvRoot%\%SdkArea%\%RelVer%\%IntCode%
md %SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%
md %SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\disk1
if "%lang_brief%"=="ml" goto skipml1
md %SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\disk2
md %SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\disk3
md %SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\lock_mgr
md %SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static
md %SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\staticS
:skipml1
if %dpause%==1 pause

rem copy standard DECtalk SDK to server on Y drive
%IntDrv%
copy %bldpath%\swi95nt\%lang_brief%\install\disk1\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\disk1\*.*
if "%lang_brief%"=="ml" goto skipml2
copy %bldpath%\swi95nt\%lang_brief%\install\disk2\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\disk2\*.*
copy %bldpath%\swi95nt\%lang_brief%\install\disk3\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\disk3\*.*
copy %bldpath%\license\LICENINC\build\licenin1\release\*.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\lock_mgr\*.*
copy %bldpath%\license\LICENINC\build\licenin3\release\*.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\lock_mgr\*.*
copy %bldpath%\license\LICENINC\build\licenin7\release\*.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\lock_mgr\*.*
copy %bldpath%\license\LICENSEU\build\release\*.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\lock_mgr\*.*
copy %bldpath%\swi95nt\%lang_brief%\static\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\*.*
copy %bldpath%\samples\speak\text\order.txt %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\*.*
copy %bldpath%\samples\speak\text\command.txt %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\*.*
copy %bldpath%\samples\speak\text\email.txt %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\*.*
copy %bldpath%\samples\speak\text\demo.wav %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\*.*
copy %bldpath%\swi95nt\%lang_brief%\install\demodata\demo_%lang_brief%.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%IntCode%\*.*
copy %bldpath%\swi95nt\%lang_brief%\staticS\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\staticS\*.*

rem We only need to copy the 'all' demo once.. 'us' was just an arbitrary choice
if "%lang_brief%"=="us" copy %bldpath%\swi95nt\alldemo\demo_all.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\demos\%IntCode%


if "%lang_brief%"=="us" goto demoen
copy %bldpath%\samples\speak\text\demo.%lang_brief% %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\*.*
goto demononen
:demoen
copy %bldpath%\samples\speak\text\demo.en %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\static\*.*
:demononen
:skipml2
if %dpause%==1 pause

rem
rem create directories for Assistive DECtalk SDK on server on Y drive
%SrvDrv%
md %SrvRoot%
md %SrvRoot%\%SdkArea%
md %SrvRoot%\%SdkArea%\%RelVer%
md %SrvRoot%\%SdkArea%\%RelVer%\%IntCode%
if "%lang_brief%"=="ml" goto skipml3
md %SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%
md %SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\access32
:skipml3
rem
if %dpause%==1 pause

%IntDrv%
rem copy Assistive DECtalk SDK to server on Y drive
if "%lang_brief%"=="ml" goto skipml4
xcopy /s %bldpath%\swi95nt\%lang_brief%\access32\*.zip %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\access32
:skipml4

rem
if %dpause%==1 pause

rem create directories for WillowPond DECtalk SDK on server on Y drive
%SrvDrv%
if "%lang_brief%"=="ml" goto skipml5
md %SrvRoot%\%SdkArea%\%RelVer%\%IntWpd%
md %SrvRoot%\%SdkArea%\%RelVer%\%IntWpd%\%lang_brief%
md %SrvRoot%\%SdkArea%\%RelVer%\%IntWpd%\%lang_brief%\disk1
md %SrvRoot%\%SdkArea%\%RelVer%\%IntWpd%\lock_mgr
:skipml5
rem
if %dpause%==1 pause

%IntDrv%
rem copy WillowPond DECtalk SDK to server on Y drive
if "%lang_brief%"=="ml" goto skipml6
copy %bldpath%\swi95nt\%lang_brief%\install\wdisk1\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntWpd%\%lang_brief%\disk1\*.*
copy %bldpath%\license\LICENINC\build\licenin1\release\*.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntWpd%\lock_mgr\*.*
copy %bldpath%\license\LICENINC\build\licenin3\release\*.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntWpd%\lock_mgr\*.*
copy %bldpath%\license\LICENINC\build\licenin7\release\*.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntWpd%\lock_mgr\*.*
copy %bldpath%\license\LICENSEU\build\release\*.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntWpd%\lock_mgr\*.*
:skipml6
rem
if %dpause%==1 pause

rem create directories for Alpha standard DECtalk SDK on server on Y drive
%SrvDrv%
md %SrvRoot%
md %SrvRoot%\%SdkArea%
md %SrvRoot%\%SdkArea%\%RelVer%
md %SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%
md %SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%\%lang_brief%
md %SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%\%lang_brief%\disk1
if "%lang_brief%"=="ml" goto skipml7
md %SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%\%lang_brief%\disk2
md %SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%\%lang_brief%\disk3
md %SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%\lock_mgr
md %SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%\%lang_brief%\static
:skipml7
if %dpause%==1 pause

rem copy Alpha standard DECtalk SDK to server on Y drive
rem Assumes that the Alpha drive is mapped as the "%AlpDrv% " drive.
rem
%AlpDrv%
copy %bldpath%\sw_a_nt\%lang_brief%\install\disk1\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%\%lang_brief%\disk1\*.*
if "%lang_brief%"=="ml" goto skipml8
copy %bldpath%\sw_a_nt\%lang_brief%\install\disk2\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%\%lang_brief%\disk2\*.*
copy %bldpath%\sw_a_nt\%lang_brief%\install\disk3\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%\%lang_brief%\disk3\*.*
copy %bldpath%\license\LICENINC\alpha\licenin1\release\*.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%\lock_mgr\*.*
copy %bldpath%\license\LICENINC\alpha\licenin3\release\*.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%\lock_mgr\*.*
copy %bldpath%\license\LICENINC\alpha\licenin7\release\*.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%\lock_mgr\*.*
copy %bldpath%\license\LICENSEU\alpha\release\*.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%\lock_mgr\*.*
copy %bldpath%\sw_a_nt\%lang_brief%\static\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%\%lang_brief%\static\*.*
copy %bldpath%\samples\speak\text\order.txt %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%\%lang_brief%\static\*.*
copy %bldpath%\samples\speak\text\commands.txt %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%\%lang_brief%\static\*.*
copy %bldpath%\samples\speak\text\email.txt %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%\%lang_brief%\static\*.*
copy %bldpath%\samples\speak\text\demo.wav %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%\%lang_brief%\static\*.*
if "%lang_brief%"=="us" goto demoen1
copy %bldpath%\samples\speak\text\demo.%lang_brief% %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%\%lang_brief%\static\*.*
goto demonon1en
:demoen1
copy %bldpath%\samples\speak\text\demo.en %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%\%lang_brief%\static\*.*
:demonon1en
:skipml8
if %dpause%==1 pause

rem create directories for Alpha WillowPond DECtalk SDK on server on Y drive
%SrvDrv%
if "%lang_brief%"=="ml" goto skipml9
md %SrvRoot%
md %SrvRoot%\%SdkArea%
md %SrvRoot%\%SdkArea%\%RelVer%
md %SrvRoot%\%SdkArea%\%RelVer%\%AlpWpd%
md %SrvRoot%\%SdkArea%\%RelVer%\%AlpWpd%\%lang_brief%
md %SrvRoot%\%SdkArea%\%RelVer%\%AlpWpd%\%lang_brief%\disk1
md %SrvRoot%\%SdkArea%\%RelVer%\%AlpWpd%\%lang_brief%\disk2
md %SrvRoot%\%SdkArea%\%RelVer%\%AlpWpd%\lock_mgr
:skipml9
rem
if %dpause%==1 pause

%AlpDrv%
rem copy Alpha WillowPond DECtalk SDK to server on Y drive
if "%lang_brief%"=="ml" goto skipml10
copy %bldpath%\sw_a_nt\%lang_brief%\install\wdisk1\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%AlpWpd%\%lang_brief%\disk1\*.*
copy %bldpath%\sw_a_nt\%lang_brief%\install\wdisk2\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%AlpWpd%\%lang_brief%\disk2\*.*
copy %bldpath%\license\LICENINC\walpha\licenin1\release\*.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%AlpWpd%\lock_mgr\*.*
copy %bldpath%\license\LICENINC\walpha\licenin3\release\*.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%AlpWpd%\lock_mgr\*.*
copy %bldpath%\license\LICENINC\walpha\licenin7\release\*.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%AlpWpd%\lock_mgr\*.*
copy %bldpath%\license\LICENSEU\walpha\release\*.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%AlpWpd%\lock_mgr\*.*
:skipml10
rem
if %dpause%==1 pause

rem
rem create directories for Alpha Assistive DECtalk SDK on server on Y drive
%SrvDrv%
md %SrvRoot%
md %SrvRoot%\%SdkArea%
md %SrvRoot%\%SdkArea%\%RelVer%
md %SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%
if "%lang_brief%"=="ml" goto skipml11
md %SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%\%lang_brief%
md %SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%\%lang_brief%\access32
:skipml11

rem
if %dpause%==1 pause

%AlpDrv%
rem copy Alpha Assistive DECtalk SDK to server on Y drive
if "%lang_brief%"=="ml" goto skipml12
xcopy /s %bldpath%\sw_a_nt\%lang_brief%\access32\*.zip %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%\%lang_brief%\access32
:skipml12


rem copy CE standard DECtalk SDK to server on Y drive
rem Assumes that the CE drive is mapped as the "?: " drive.
rem
rem ?:
rem copy %bldpath%\sw_a_nt\%lang_brief%\install\disk1\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%\%lang_brief%\disk1\*.*
rem if "%lang_brief%"=="ml" goto skipml8
rem copy %bldpath%\sw_a_nt\%lang_brief%\install\disk2\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%\%lang_brief%\disk2\*.*
rem copy %bldpath%\sw_a_nt\%lang_brief%\install\disk3\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%\%lang_brief%\disk3\*.*
rem copy %bldpath%\license\LICENINC\alpha\licenin1\release\*.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%\lock_mgr\*.*
rem copy %bldpath%\license\LICENINC\alpha\licenin3\release\*.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%\lock_mgr\*.*
rem copy %bldpath%\license\LICENINC\alpha\licenin7\release\*.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%\lock_mgr\*.*
rem copy %bldpath%\license\LICENSEU\alpha\release\*.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%\lock_mgr\*.*
rem copy %bldpath%\sw_a_nt\%lang_brief%\static\*.* %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%\%lang_brief%\static\*.*
rem copy %bldpath%\samples\speak\text\order.txt %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%\%lang_brief%\static\*.*
rem copy %bldpath%\samples\speak\text\commands.txt %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%\%lang_brief%\static\*.*
rem copy %bldpath%\samples\speak\text\email.txt %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%\%lang_brief%\static\*.*
rem copy %bldpath%\samples\speak\text\demo.wav %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%\%lang_brief%\static\*.*
rem if "%lang_brief%"=="us" goto demoen1
rem copy %bldpath%\samples\speak\text\demo.%lang_brief% %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%\%lang_brief%\static\*.*
rem goto demonon1en
rem :demoen1
rem copy %bldpath%\samples\speak\text\demo.en %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%AlpCode%\%lang_brief%\static\*.*
rem :demonon1en
rem :skipml8
rem if %dpause%==1 pause

rem
if %dpause%==1 pause

%IntDrv%
rem copy Assistive DECtalk SDK to server on Y drive
if "%lang_brief%"=="ml" goto skipml14
xcopy /s %bldpath%\swi95nt\%lang_brief%\access32\*.zip %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\%IntCode%\%lang_brief%\access32
:skipml14

rem
if %dpause%==1 pause

:STbtdt
rem if a 16 bit AND a server back up
if %STbitsup%==0 goto langloop
if "%lang_brief%"=="ml" goto langloop
if "%lang_brief%"=="nws_us" goto dt2nwsnoaa
if "%lang_brief%"=="nws_la" goto dt2nwsnoaa


rem create directories for standard DTPC1 DECtalk SDK on server on Y drive
%SrvDrv%          
md %SrvRoot%
md %SrvRoot%\%SdkArea%
md %SrvRoot%\%SdkArea%\%RelVer%
md %SrvRoot%\%SdkArea%\%RelVer%\dtpc1
md %SrvRoot%\%SdkArea%\%RelVer%\dtpc1\%lang_brief%
md %SrvRoot%\%SdkArea%\%RelVer%\dtpc1\%lang_brief%\disk1
if %dpause%==1 pause

rem copy standard DTPC1 DECtalk SDK to server on Y drive
%IntDrv%

copy %bldpath%\hardware\src\dtpc1\%lang_brief%\release\demo_%lang_brief%.c %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc1\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc1\%lang_brief%\release\demo_%lang_brief%.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc1\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc1\%lang_brief%\release\dic_%lang_brief%.dic %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc1\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc1\%lang_brief%\release\start_%lang_brief%.c %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc1\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc1\%lang_brief%\release\start_%lang_brief%.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc1\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc1\%lang_brief%\release\lts_%lang_brief%.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc1\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc1\%lang_brief%\release\ph_%lang_brief%.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc1\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc1\%lang_brief%\release\%lang_brief%.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc1\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc1\%lang_brief%\release\udic_%lang_brief%.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc1\%lang_brief%\*.*

copy %bldpath%\hardware\src\dtpc1\%lang_brief%\release\dtstarp.h %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc1\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc1\%lang_brief%\release\dttsr.h %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc1\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc1\%lang_brief%\release\!dtc07ba.cfg %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc1\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc1\%lang_brief%\release\cmd.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc1\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc1\%lang_brief%\release\command.txt %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc1\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc1\%lang_brief%\release\dec.voc %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc1\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc1\%lang_brief%\release\dt_driv.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc1\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc1\%lang_brief%\release\dt_load.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc1\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc1\%lang_brief%\release\dt2.bat %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc1\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc1\%lang_brief%\release\dtcommon.c %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc1\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc1\%lang_brief%\release\dtdemo.h %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc1\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc1\%lang_brief%\release\dtstart.h %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc1\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc1\%lang_brief%\release\kernel.sys %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc1\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc1\%lang_brief%\release\plugplay.txt %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc1\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc1\%lang_brief%\release\readme.txt %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc1\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc1\%lang_brief%\release\uguide.txt %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc1\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc1\%lang_brief%\release\dtpc_437.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc1\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc1\%lang_brief%\release\dtpc_850.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc1\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc1\%lang_brief%\release\dtpc_863.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc1\%lang_brief%\*.*
rem copy %bldpath%\hardware\src\dtpc1\%lang_brief%\release\cdrom.txt %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc1\%lang_brief%\*.*
rem copy %bldpath%\hardware\src\dtpc1\%lang_brief%\release\hold2f.sys %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc1\%lang_brief%\*.*
rem copy %bldpath%\hardware\src\dtpc1\%lang_brief%\release\testdt2.bat %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc1\%lang_brief%\*.*
rem copy %bldpath%\hardware\src\dtpc1\%lang_brief%\release\dectalk.inf %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc1\%lang_brief%\*.*
rem copy %bldpath%\hardware\src\dtpc1\%lang_brief%\release\win_95.txt %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc1\%lang_brief%\*.*

rem
if %dpause%==1 pause

:dt2nwsnoaa
rem create directories for standard dtpc2 DECtalk SDK on server on Y drive
%SrvDrv%          
md %SrvRoot%
md %SrvRoot%\%SdkArea%
md %SrvRoot%\%SdkArea%\%RelVer%
md %SrvRoot%\%SdkArea%\%RelVer%\dtpc2
md %SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%
md %SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\disk1
if %dpause%==1 pause

rem copy standard dtpc2 DECtalk SDK to server on Y drive
%IntDrv%

if %lang_brief%==nws_us goto DTPC2_nws_us
if %lang_brief%==nws_la goto DTPC2_nws_la

copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\demo_%lang_brief%.c %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\start_%lang_brief%.c %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\dic_%lang_brief%.dic %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\%lang_brief%.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\demo_%lang_brief%.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\lts_%lang_brief%.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\ph_%lang_brief%.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\start_%lang_brief%.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\udic_%lang_brief%.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*

goto skip_DTPC2_nws
:DTPC2_nws_us
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\demo_us.c %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\start_us.c %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\%lang_brief%.dic %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\demo_us.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\lts_us.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\ph_us.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\start_us.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\udic_us.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\us.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
goto skip_DTPC2_nws
:DTPC2_nws_la
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\demo_la.c %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\start_la.c %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\%lang_brief%.dic %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\demo_la.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\la.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\lts_la.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\ph_la.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\start_la.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\udic_la.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*

:skip_DTPC2_nws
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\dt2.bat %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\dtcommon.c %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\!dtc07ba.cfg %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\cmd.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\dt_driv.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\dt_load.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\dtpc_437.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\dtpc_850.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\dtpc_863.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\dtdemo.h %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\dtstarp.h %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\dtstart.h %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\dttsr.h %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\kernel.sys %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\command.txt %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\plugplay.txt %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\readme.txt %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\uguide.txt %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\dec.voc %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
rem copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\cdrom.txt %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
rem copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\dectalk.inf %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
rem copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\hold2f.sys %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
rem copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\testdt2.bat %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*
rem copy %bldpath%\hardware\src\dtpc2\%lang_brief%\release\win_95.txt %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtpc2\%lang_brief%\*.*


rem
if %dpause%==1 pause

if "%lang_brief%"=="nws_us" goto langloop
if "%lang_brief%"=="nws_la" goto langloop
rem create directories for standard dtex DECtalk SDK on server on Y drive

%SrvDrv%          
md %SrvRoot%
md %SrvRoot%\%SdkArea%
md %SrvRoot%\%SdkArea%\%RelVer%
md %SrvRoot%\%SdkArea%\%RelVer%\dtex
md %SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%
md %SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\disk1
md %SrvRoot%\%SdkArea%\%RelVer%\dtex\spus\disk1
md %SrvRoot%\%SdkArea%\%RelVer%\dtex\ussp\disk1
if %dpause%==1 pause

rem copy standard dtex DECtalk SDK to server on Y drive
%IntDrv%

:us_sp_handler
if %us_sp%==0 set lang_brief=ussp
if %us_sp%==1 set lang_brief=spus
if %us_sp%==2 set lang_brief=us

if %lang_brief%==ussp goto double_lang
if %lang_brief%==spus goto double_lang
goto normal_lang

:double_lang
copy %bldpath%\hardware\src\dtex\%lang_brief%\release\demo_la.c %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtex\%lang_brief%\release\demo_us.c %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtex\%lang_brief%\release\demo_la.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtex\%lang_brief%\release\demo_us.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtex\%lang_brief%\release\start_la.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtex\%lang_brief%\release\start_us.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*

:normal_lang
copy %bldpath%\hardware\src\dtex\%lang_brief%\release\dtexp.bat %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtex\%lang_brief%\release\load.bat %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtex\%lang_brief%\release\dtcommon.c %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtex\%lang_brief%\release\dt_driv.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtex\%lang_brief%\release\mfg_load.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtex\%lang_brief%\release\out.flr %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtex\%lang_brief%\release\dtdemp.h %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtex\%lang_brief%\release\dtstarp.h %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtex\%lang_brief%\release\dtstart.h %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtex\%lang_brief%\release\dttsr.h %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtex\%lang_brief%\release\mon.hex %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtex\%lang_brief%\release\fastload.hxo %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtex\%lang_brief%\release\command.txt %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtex\%lang_brief%\release\readme.txt %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtex\%lang_brief%\release\shrt_cmd.txt %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtex\%lang_brief%\release\uguide.txt %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtex\%lang_brief%\release\upgrade.txt %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
rem copy %bldpath%\hardware\src\dtex\%lang_brief%\release\c1.dbg %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
rem copy %bldpath%\hardware\src\dtex\%lang_brief%\release\comchk.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
rem copy %bldpath%\hardware\src\dtex\%lang_brief%\release\install.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
rem copy %bldpath%\hardware\src\dtex\%lang_brief%\release\power.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
rem copy %bldpath%\hardware\src\dtex\%lang_brief%\release\probe.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
rem copy %bldpath%\hardware\src\dtex\%lang_brief%\release\lowpwr.bat %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
rem copy %bldpath%\hardware\src\dtex\%lang_brief%\release\pwrsave.bat %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
rem copy %bldpath%\hardware\src\dtex\%lang_brief%\release\testdtex.bat %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
rem copy %bldpath%\hardware\src\dtex\%lang_brief%\release\verchk.bat %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
rem copy %bldpath%\hardware\src\dtex\%lang_brief%\release\hold2f.sys %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
rem copy %bldpath%\hardware\src\dtex\%lang_brief%\release\battcare.txt %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
rem copy %bldpath%\hardware\src\dtex\%lang_brief%\release\cdrom.txt %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
rem copy %bldpath%\hardware\src\dtex\%lang_brief%\release\com_port.txt %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
rem copy %bldpath%\hardware\src\dtex\%lang_brief%\release\dtxwin95.txt %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
rem copy %bldpath%\hardware\src\dtex\%lang_brief%\release\lowpwr.txt %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
rem copy %bldpath%\hardware\src\dtex\%lang_brief%\release\pccard.txt %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
rem copy %bldpath%\hardware\src\dtex\%lang_brief%\release\win.txt %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*

if %us_sp%==2 set us_sp=3
if %us_sp%==1 set us_sp=2
if %us_sp%==0 set us_sp=1
if %us_sp%==0 goto us_sp_handler
if %us_sp%==1 goto us_sp_handler
if %us_sp%==2 goto us_sp_handler

copy %bldpath%\hardware\src\dtex\%lang_brief%\release\demo_%lang_brief%.c %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtex\%lang_brief%\release\demo_%lang_brief%.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*
copy %bldpath%\hardware\src\dtex\%lang_brief%\release\start_%lang_brief%.exe %SrvDrv%\%SrvRoot%\%SdkArea%\%RelVer%\dtex\%lang_brief%\*.*

if %dpause%==1 pause

rem loop again...
:langloop

if %lang_brief%==us set lang_verbose=ENGLISH_UK
if %lang_brief%==us goto top
if %lang_brief%==uk set lang_verbose=SPANISH
if %lang_brief%==uk goto top
if %lang_brief%==sp set lang_verbose=SPANISH_LA
if %lang_brief%==sp goto top
if %lang_brief%==la set lang_verbose=GERMAN
if %lang_brief%==la goto top
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
xcopy /y /e /s %bldpath%\swi95nt\*.* f:\work_area\ad\swi95nt\*.*

rem deltree /y %IntDrv%%bldpath%\swi95nt
rem
%AlpDrv%
xcopy /y /e /s \sw_a_nt\*.* f:\work_area\ad\sw_a_nt\*.*

rem deltree /y %IntDrv%%bldpath%\sw_a_nt
rem

:STbtdta
rem if a 16 bit AND a local back up
if %STbitlup%==0 goto end

rem XCOPY the tree to G: for safe keeping
%IntDrv%
xcopy /y /e /s %bldpath%\hardware\src\dtpc1\*.* g:\work_area\ad\hardware\src\dtpc1\*.*

rem deltree /y %IntDrv%%bldpath%\hardware\src\dtpc1
rem
%IntDrv%
rem XCOPY the tree to G: for safe keeping
xcopy /y /e /s %bldpath%\hardware\src\dtpc2\*.* g:\work_area\ad\hardware\src\dtpc2\*.*

rem deltree /y %IntDrv%%bldpath%\hardware\src\dtpc2
rem
:dtfred2
%IntDrv%
rem XCOPY the tree to G: for safe keeping
xcopy /y /e /s %bldpath%\hardware\src\dtex\*.* g:\work_area\ad\hardware\src\dtex\*.*

rem deltree /y %IntDrv%%bldpath%\hardware\src\dtex
rem
goto end
:end_error
echo *** BETACOPY.BAT has encountered an error *******************
:end
%IntDrv%

