ECHO OFF

REM ***************************************
REM This file will setup US ENGLISH DECtalk.
REM ***************************************

set language=gr

copy ..\%language%\wtlkttse.dll %windir%\speech\.
copy ..\%language%\dectalk.dic system\.
