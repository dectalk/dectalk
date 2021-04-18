REM
REM make a full instalation kit -mfg
REM


REM build  installations

call .\"Windows CE DECTalk"\build.bat
call .\"Windows DECTalk"\build.bat

REM Create media

mkdir DTmedia
mkdir DTmedia\license
mkdir DTmedia\wince
mkdir DTmedia\wince\license
mkdir DTmedia\linux
mkdir DTmedia\sapi5
mkdir DTmedia\solaris

copy /y .\"Windows CE DECTalk"\Media\"Windows CE"\"Disk Images"\Disk1\* .\DTmedia\wince
copy /y .\"Windows CE DECTalk"\Media\"Windows CE"\"Disk Images"\Disk1\license\* .\DTmedia\wince\license


copy /y .\"Windows DECTalk"\Media\Windows\"Disk Images"\Disk1\* .\DTmedia
copy /y .\"Windows DECTalk"\Media\Windows\"Disk Images"\Disk1\license\* .\DTmedia\license


copy /y .\"Sapi 500"\"DECtalk Sapi5"\Build\DiskImages\DISK1\* .\DTmedia\sapi5

copy /y .\autorun.inf .\DTmedia