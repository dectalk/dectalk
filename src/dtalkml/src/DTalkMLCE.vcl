<html>
<body>
<pre>
<h1>Build Log</h1>
<h3>
--------------------Configuration: DTalkML - Win32 (WCE ARM) Release--------------------
</h3>
<h3>Command Lines</h3>
Creating temporary file "C:\DOCUME~1\berrios\LOCALS~1\Temp\RSP1721.tmp" with contents
[
/nologo /W3 /O2 /I "..\..\dapi\src\include" /I "..\..\dapi\src\nt" /I "..\..\dapi\src\api\\" /I "..\.." /D UNDER_CE=300 /D _WIN32_WCE=300 /D "NDEBUG" /D "ARM" /D "_ARM_" /D "WIN32" /D "ENGLISH" /D "ENGLISH_US" /D "UNICODE" /D "_USRDLL" /D "BLD_DECTALK_DLL" /D "WIN32_PLATFORM_PSPC" /D "_UNICODE" /Fp".\..\Build\ce\arm\Release\link/DTalkMLCE.pch" /YX /Fo".\..\Build\ce\arm\Release\link/" /MC /c 
"D:\work\rnd\dtalkml\src\dtalk_ml.c"
]
Creating command line "clarm.exe @C:\DOCUME~1\berrios\LOCALS~1\Temp\RSP1721.tmp" 
Creating temporary file "C:\DOCUME~1\berrios\LOCALS~1\Temp\RSP1722.tmp" with contents
[
commctrl.lib coredll.lib /nologo /dll /incremental:no /pdb:".\..\Build\ce\arm\Release/dectalk.pdb" /nodefaultlib:"libc.lib /nodefaultlib:libcd.lib /nodefaultlib:libcmt.lib /nodefaultlib:libcmtd.lib /nodefaultlib:msvcrt.lib /nodefaultlib:msvcrtd.lib /nodefaultlib:oldnames.lib" /def:"..\..\dapi\src\dectalk.def" /out:".\..\build\ce\arm\Release/dectalk.dll" /implib:".\..\Build\ce\arm\Release/dectalk.lib" /machine:ARM /subsystem:windowsce,3.00 
\work\rnd\dtalkml\Build\ce\arm\Release\link\dtalk_ml.obj
]
Creating command line "link.exe @C:\DOCUME~1\berrios\LOCALS~1\Temp\RSP1722.tmp"
<h3>Output Window</h3>
Compiling...
dtalk_ml.c
D:\work\rnd\dtalkml\src\dtalk_ml.c(1395) : warning C4133: 'function' : incompatible types - from 'unsigned short *' to 'char *'
Linking...
..\..\dapi\src\dectalk.def : warning LNK4017: DESCRIPTION statement not supported for the target platform; ignored
   Creating library .\..\Build\ce\arm\Release/dectalk.lib and object .\..\Build\ce\arm\Release/dectalk.exp



<h3>Results</h3>
dectalk.dll - 0 error(s), 2 warning(s)
</pre>
</body>
</html>
