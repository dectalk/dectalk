@echo off
rem ***********************************************
rem dt.bat
rem 29-jun-1995
rem Digital Equipment Corporation
rem
rem Last Revised: 07-May-1996
rem ***********************************************
rem
dt_driv -r > NUL
dt_conf 
if errorlevel 1 goto error
dt_driv -c -v 
if errorlevel 1 goto error
dt_load kernel.sys sdtpcdic.dic\s slts.exe sph.exe cmd.exe spa.exe dtpc_850.exe > NUL
sdtstart
goto end
:error
pause
:end
