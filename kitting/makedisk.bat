echo off
rem ****REMEMBER TO CHANGE BACK TO Y: SERVER****

set SrvDrv=d:
set SrvRoot=DTPC_95
set SdkArea=Sdk_460
set RelVer=B009
set device=dtex
set lang_brief=us
set lang_verbose=ENGLISH_US

rem ****Erase contains of disk****
del a:\*.*

:disk_language1
rem ****Copy newer file only****
xcopy \\atgserv\installs\intel\ddb\ddb.exe     %srvDrv%\%srvRoot%\%SdkArea%\%RelVer%\%device%\%lang_brief% /d
xcopy D:\work\ddb\ddb.cfg                      %srvDrv%\%srvRoot%\%SdkArea%\%RelVer%\%device%\%lang_brief% /d
xcopy \\atgserv\installs\intel\ddb\install.exe %srvDrv%\%srvRoot%\%SdkArea%\%RelVer%\%device%\%lang_brief% /d

start /i /wait /d%srvDrv%\%srvRoot%\%SdkArea%\%RelVer%\%device%\%lang_brief% ddb.exe

copy a:\*.* %srvDrv%\%srvRoot%\%SdkArea%\%RelVer%\%device%\%lang_brief%\disk1\*.*
del %srvDrv%\%srvRoot%\%SdkArea%\%RelVer%\%device%\%lang_brief%\ddb.exe
del a:\*.* /q

notepad %srvDrv%\%srvRoot%\%SdkArea%\%RelVer%\%device%\%lang_brief%\ddb.cfg

:lang_change1
if %lang_verbose%==ENGLISH_UK set lang_brief=uk
if %lang_verbose%==ENGLISH_UK goto lang_loop1
if %lang_verbose%==SPANISH set lang_brief=sp
if %lang_verbose%==SPANISH goto lang_loop1
if %lang_verbose%==SPANISH_LA set lang_brief=la
if %lang_verbose%==SPANISH_LA goto lang_loop1
if %lang_verbose%==GERMAN set lang_brief=gr
if %lang_verbose%==GERMAN goto lang_loop1
if %lang_verbose%==SPUS set lang_brief=spus
if %lang_verbose%==SPUS goto lang_loop1
if %lang_verbose%==USSP set lang_brief=ussp
if %lang_verbose%==USSP goto lang_loop1
if %lang_verbose%==NEXT_DEVICE goto next_device

:lang_loop1
if %lang_brief%==us set lang_verbose=ENGLISH_UK
if %lang_brief%==us goto lang_change1
if %lang_brief%==uk set lang_verbose=SPANISH
if %lang_brief%==uk goto disk_language1
if %lang_brief%==sp set lang_verbose=SPANISH_LA
if %lang_brief%==sp goto disk_language1
if %lang_brief%==la set lang_verbose=GERMAN
if %lang_brief%==la goto disk_language1
if %lang_brief%==gr set lang_verbose=SPUS
if %lang_brief%==gr goto disk_language1
if %lang_brief%==spus set lang_verbose=USSP
if %lang_brief%==spus goto disk_language1
if %lang_brief%==ussp set lang_verbose=NEXT_DEVICE
if %lang_brief%==ussp goto disk_language1


:next_device
rem ****Set parameters for new device****
set device=dtpc2
set lang_brief=us

:disk_language2
rem Copy newer file2 only
xcopy \\atgserv\installs\intel\ddb\ddb.exe      %srvDrv%\%srvRoot%\%SdkArea%\%RelVer%\%device%\%lang_brief% /d
xcopy D:\work\ddb\ddb.cfg                       %srvDrv%\%srvRoot%\%SdkArea%\%RelVer%\%device%\%lang_brief% /d
xcopy \\atgserv\installs\intel\ddb\install.exe  %srvDrv%\%srvRoot%\%SdkArea%\%RelVer%\%device%\%lang_brief% /d

start /i /wait /d%srvDrv%\%srvRoot%\%SdkArea%\%RelVer%\%device%\%lang_brief% ddb.exe

copy a:\*.* %srvDrv%\%srvRoot%\%SdkArea%\%RelVer%\%device%\%lang_brief%\disk1\*.*
del %srvDrv%\%srvRoot%\%SdkArea%\%RelVer%\%device%\%lang_brief%\ddb.exe
del a:\*.* /q

rem **** Open file to edit for file or configuration changes****
notepad %srvDrv%\%srvRoot%\%SdkArea%\%RelVer%\%device%\%lang_brief%\ddb.cfg

:lang_change2
if %lang_verbose%==ENGLISH_UK set lang_brief=uk
if %lang_verbose%==ENGLISH_UK goto lang_loop2
if %lang_verbose%==SPANISH set lang_brief=sp
if %lang_verbose%==SPANISH goto lang_loop2
if %lang_verbose%==SPANISH_LA set lang_brief=la
if %lang_verbose%==SPANISH_LA goto lang_loop2
if %lang_verbose%==GERMAN set lang_brief=gr
if %lang_verbose%==GERMAN goto lang_loop2
if %lang_verbose%==NWS_US set lang_brief=nws_us
if %lang_verbose%==NWS_US goto lang_loop2
if %lang_verbose%==NWS_LA set lang_brief=nws_la
if %lang_verbose%==NWS_LA goto lang_loop2
if %lang_verbose%==FINISHED goto end

:lang_loop2
if %lang_brief%==us set lang_verbose=ENGLISH_UK
if %lang_brief%==us goto lang_change2
if %lang_brief%==uk set lang_verbose=SPANISH
if %lang_brief%==uk goto disk_language2
if %lang_brief%==sp set lang_verbose=SPANISH_LA
if %lang_brief%==sp goto disk_language2
if %lang_brief%==la set lang_verbose=GERMAN
if %lang_brief%==la goto disk_language2
if %lang_brief%==gr set lang_verbose=NWS_US
if %lang_brief%==gr goto disk_language2
if %lang_brief%==nws_us set lang_verbose=NWS_LA
if %lang_brief%==nws_us goto disk_language2
if %lang_brief%==nws_la set lang_verbose=FINISHED
if %lang_brief%==nws_la goto disk_language2

:end
%IntDrv%