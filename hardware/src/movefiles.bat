
set SrvDrv=y:
set bldpath=hdplat
set SrvRoot=DTPC_95
set SdkArea=Sdk_461
set RelVer=R001
set device=dtex
set lang_brief=us
set lang_verbose=ENGLISH_USSP

rem Make directories for specfic hardware
goto make_dir

rem create directories for standard DTPC1 DECtalk SDK on server on Y drive

rem copy standard DTPC1 DECtalk SDK to server on Y drive
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



rem create directories for standard dtpc2 DECtalk SDK on server on Y drive
%SrvDrv%          
set device=dtpc2

md %SrvRoot%
md %SrvRoot%\%SdkArea%
md %SrvRoot%\%SdkArea%\%RelVer%
md %SrvRoot%\%SdkArea%\%RelVer%\%device%
md %SrvRoot%\%SdkArea%\%RelVer%\%device%\%lang_brief%
md %SrvRoot%\%SdkArea%\%RelVer%\%device%\%lang_brief%\disk1

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

:lang_change1
pause
if %lang_verbose%==ENGLISH_USSP set lang_brief=ussp
if %lang_verbose%==ENGLISH_USSP goto lang_loop1
if %lang_verbose%==ENGLISH_UK set lang_brief=uk
if %lang_verbose%==ENGLISH_UK goto lang_loop1
if %lang_verbose%==SPANISH set lang_brief=sp
if %lang_verbose%==SPANISH goto lang_loop1
if %lang_verbose%==SPANISH_SPUS set lang_brief=spus
if %lang_verbose%==SPANISH_SPUS goto lang_loop1
if %lang_verbose%==SPANISH_LA set lang_brief=la
if %lang_verbose%==SPANISH_LA goto lang_loop1
if %lang_verbose%==GERMAN set lang_brief=gr
if %lang_verbose%==GERMAN goto lang_loop1
if %lang_verbose%==NEXT_DEVICE goto next_device

:lang_loop1
if %lang_brief%==us set lang_verbose=ENGLISH_USSP
if %lang_brief%==us goto disk_language1
if %lang_brief%==ussp set lang_verbose=ENGLISH_UK
if %lang_brief%==ussp goto disk_language1
if %lang_brief%==uk set lang_verbose=SPANISH
if %lang_brief%==uk goto disk_language1
if %lang_brief%==sp set lang_verbose=SPANISH_SPUS
if %lang_brief%==sp goto disk_language1
if %lang_brief%==spus set lang_verbose=SPANISH_LA
if %lang_brief%==spus goto disk_language1
if %lang_brief%==la set lang_verbose=GERMAN
if %lang_brief%==la goto disk_language1
if %lang_brief%==gr set lang_verbose=NEXT_DEVICE
if %lang_brief%==gr goto disk_language1

if "%lang_brief%"=="nws_us" goto langloop
if "%lang_brief%"=="nws_la" goto langloop


:device_ex
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


:make_dir
%SrvDrv%          
md %SrvRoot%
md %SrvRoot%\%SdkArea%
md %SrvRoot%\%SdkArea%\%RelVer%
md %SrvRoot%\%SdkArea%\%RelVer%\%device%
md %SrvRoot%\%SdkArea%\%RelVer%\%device%\%lang_brief%
md %SrvRoot%\%SdkArea%\%RelVer%\%device%\%lang_brief%\disk1

if %device%=dtex goto device_ex
if %device%=dtpc2 goto device_pc2

:end