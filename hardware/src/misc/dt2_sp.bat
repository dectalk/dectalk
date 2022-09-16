rem copyright (c)1996,1998 Digital Equipment Corporation all rights reserved.
@echo off
cls
@echo off
dt_driv -r > NUL
echo M¢dulo DECtalk en estado de prueba propia, por favor espere.  
dt_driv -c -l -b 250 > NUL
if not errorlevel 1 goto load  
echo Prueba propia en progreso.  
dt_driv -c -l -b 250 > NUL
if errorlevel 1 goto error  
:load  
echo Prueba propia de DECtalk finalizo exitosamente.  
echo.  
echo Cargando archivos de DECtalk a la memoria.  
dt_load kernel.sys dic_sp.dic/sp lts_sp.exe ph_sp.exe cmd.exe sp.exe dtpc_850.exe  
if errorlevel 1 goto fail  
echo.  
start_sp
echo Instalaci¢n exitosa de DECtalk PC2.  
goto end  
:error  
echo.  
echo Falta en la prueba propia del m¢dulo DECtalk.  
echo.  
echo Por favor verifique la direcci¢n I-O del m¢dulo, y que el m¢dulo este  
echo sentado correctramente en el PC bus.  
echo.  
pause  
goto end  
:fail  
echo.  
echo Error en el cargador.  Vuelva a marchar el programa de instalaci¢n.  
echo.  
pause  
:end  


