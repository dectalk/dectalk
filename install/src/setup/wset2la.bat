ECHO OFF

REM ***************************************
REM This file will setup US ENGLISH DECtalk.
REM ***************************************

set language=la

copy ..\%language%\wtlkttse.dll %windir%\speech\.
copy ..\%language%\dectalk.dic system\.
