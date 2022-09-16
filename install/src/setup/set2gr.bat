ECHO OFF

REM ************************************
REM This file will setup GERMAN DECtalk.
REM ************************************

set language=gr

copy ..\%language%\dectalk.dll %windir%\system\.
copy ..\%language%\dtlkttse.dll %windir%\speech\.
copy ..\%language%\dectalk.dic ..\system\.
