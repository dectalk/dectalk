ECHO OFF

REM ***************************************
REM This file will setup UK ENGLISH DECtalk.
REM ***************************************

set language=uk

copy ..\%language%\wtlkttse.dll %windir%\speech\.
copy ..\%language%\dectalk.dic system\.
