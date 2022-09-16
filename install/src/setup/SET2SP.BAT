ECHO OFF

REM *************************************
REM This file will setup SPANISH DECtalk.
REM *************************************

set language=sp

copy ..\%language%\dectalk.dll %windir%\system\.
copy ..\%language%\dtlkttse.dll %windir%\speech\.
copy ..\%language%\dectalk.dic ..\system\.
