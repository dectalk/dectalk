ECHO OFF

REM ********************************************
REM This file will setup LATIN AMERICAN DECtalk.
REM ********************************************

set language=la

copy ..\%language%\dectalk.dll %windir%\system\.
copy ..\%language%\dtlkttse.dll %windir%\speech\.
copy ..\%language%\dectalk.dic ..\system\.
