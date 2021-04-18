<html>
<body>
<pre>
<h1>Build Log</h1>
<h3>
--------------------Configuration: Dtsample - Win32 (WCE MIPS) Debug--------------------
</h3>
<h3>Command Lines</h3>
Creating command line "rc.exe /l 0x409 /fo".\build\static\mips\us\debug\link/dtsample.res" /d UNDER_CE=300 /d _WIN32_WCE=300 /d "UNICODE" /d "_UNICODE" /d "NDEBUG" /d "WIN32_PLATFORM_PSPC" /d "MIPS" /d "_MIPS_" "D:\work\rnd023103DT500B002\samplece\DTSAMPLE\dtsample.rc"" 
Creating temporary file "C:\DOCUME~1\berrios\LOCALS~1\Temp\RSP65C.tmp" with contents
[
/nologo /W3 /Zi /Od /I ".\..\..\dapi\src\API" /I ".\..\..\dapi\src\include" /D _WIN32_WCE=300 /D "WIN32_PLATFORM_PSPC" /D "MIPS" /D "_MIPS_" /D UNDER_CE=300 /D "UNICODE" /D "_UNICODE" /D "NDEBUG" /Fo".\build\static\mips\us\debug\link/" /Fd".\build\static\mips\us\debug\link/"  /Gz /c 
"D:\work\rnd023103DT500B002\samplece\DTSAMPLE\dtsample.c"
]
Creating command line "clmips.exe @C:\DOCUME~1\berrios\LOCALS~1\Temp\RSP65C.tmp" 
Creating temporary file "C:\DOCUME~1\berrios\LOCALS~1\Temp\RSP65D.tmp" with contents
[
.\..\..\dapi\build\cestatic\mips\us\debug\dtstatic.lib commctrl.lib coredll.lib /nologo /base:"0x00010000" /stack:0x10000,0x1000 /entry:"WinMain" /subsystem:windows /incremental:no /pdb:".\build\static\mips\us\debug\link/Dtsample.pdb" /nodefaultlib:"libc.lib /nodefaultlib:libcd.lib /nodefaultlib:libcmt.lib /nodefaultlib:libcmtd.lib /nodefaultlib:msvcrt.lib /nodefaultlib:msvcrtd.lib /nodefaultlib:oldnames.lib" /nodefaultlib:"OLDNAMES.lib" /out:".\build\static\mips\us\debug\link/Dtsample.exe" /machine:I386 /windowsce:emulation 
.\build\static\mips\us\debug\link\dtsample.obj
.\build\static\mips\us\debug\link\dtsample.res
]
Creating command line "link.exe @C:\DOCUME~1\berrios\LOCALS~1\Temp\RSP65D.tmp"
<h3>Output Window</h3>
Compiling resources...
Compiling...
Command line warning D4002 : ignoring unknown option '/Gz'
dtsample.c
Linking...
.\build\static\mips\us\debug\link\dtsample.obj : fatal error LNK1112: module machine type "MIPS" conflicts with target machine type "IX86"
Error executing link.exe.



<h3>Results</h3>
Dtsample.exe - 1 error(s), 1 warning(s)
</pre>
</body>
</html>
