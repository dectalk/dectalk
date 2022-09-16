ECHO OFF

REM ***************************************
REM This file will setup UK ENGLISH DECtalk.
REM ***************************************

set language=uk

copy ..\%language%\dectalk.dll %windir%\system\.
copy ..\%language%\dtlkttse.dll %windir%\speech\.
copy ..\%language%\dectalk.dic ..\system\.
