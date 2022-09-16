ECHO OFF

REM ***************************************
REM This file will setup US ENGLISH DECtalk.
REM ***************************************

set language=us

copy ..\%language%\dectalk.dll %windir%\system\.
copy ..\%language%\dtlkttse.dll %windir%\speech\.
copy ..\%language%\dectalk.dic ..\system\.
