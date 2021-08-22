<html>
<body>
<pre>
<h1>Build Log</h1>
<h3>
--------------------Configuration: CEtalk - Win32 (WCE SH4) Release German dll--------------------
</h3>
<h3>Command Lines</h3>
Creating command line "rc.exe /l 0x407 /fo".\build\dll\sh4\gr\release\link/CEtalk.res" /d "SHx" /d "SH4" /d "_SH4_" /d UNDER_CE=211 /d _WIN32_WCE=211 /d "UNICODE" /d "NDEBUG" /r "D:\work\rnd\samplece\CEtalk\CEtalk.rc"" 
Creating temporary file "C:\DOCUME~1\berrios\LOCALS~1\Temp\RSP1224.tmp" with contents
[
/nologo /W3 /I ".\..\..\dapi\src\api" /D _WIN32_WCE=211 /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=211 /D "UNICODE" /D "WIN32_PLATFORM_HPCPRO" /D "_UNICODE" /Fp".\build\dll\sh4\gr\release\link/CEtalk.pch" /Yu"stdafx.h" /Fo".\build\dll\sh4\gr\release\link/" /Qsh4 /MC /c 
"D:\work\rnd\samplece\CEtalk\CEtalk.cpp"
"D:\work\rnd\samplece\CEtalk\CEtalkDlg.cpp"
]
Creating command line "shcl.exe @C:\DOCUME~1\berrios\LOCALS~1\Temp\RSP1224.tmp" 
Creating temporary file "C:\DOCUME~1\berrios\LOCALS~1\Temp\RSP1225.tmp" with contents
[
/nologo /W3 /I ".\..\..\dapi\src\api" /D _WIN32_WCE=211 /D "NDEBUG" /D "SHx" /D "SH4" /D "_SH4_" /D UNDER_CE=211 /D "UNICODE" /D "WIN32_PLATFORM_HPCPRO" /D "_UNICODE" /Fp".\build\dll\sh4\gr\release\link/CEtalk.pch" /Yc"stdafx.h" /Fo".\build\dll\sh4\gr\release\link/" /Qsh4 /MC /c 
"D:\work\rnd\samplece\CEtalk\StdAfx.cpp"
]
Creating command line "shcl.exe @C:\DOCUME~1\berrios\LOCALS~1\Temp\RSP1225.tmp" 
Creating temporary file "C:\DOCUME~1\berrios\LOCALS~1\Temp\RSP1226.tmp" with contents
[
.\..\..\dapi\build\cedll\sh4\gr\release\dectalk.lib /nologo /entry:"wWinMainCRTStartup" /incremental:no /pdb:".\build\dll\sh4\gr\release/Dtalk_gr.pdb" /nodefaultlib:"libc.lib /nodefaultlib:libcd.lib /nodefaultlib:libcmt.lib /nodefaultlib:libcmtd.lib /nodefaultlib:msvcrt.lib /nodefaultlib:msvcrtd.lib /nodefaultlib:oldnames.lib" /out:".\build\dll\sh4\gr\release/Dtalk_gr.exe" /machine:SH4 /subsystem:windowsce,2.0 
.\build\dll\sh4\gr\release\link\CEtalk.obj
.\build\dll\sh4\gr\release\link\CEtalkDlg.obj
.\build\dll\sh4\gr\release\link\StdAfx.obj
.\build\dll\sh4\gr\release\link\CEtalk.res
]
Creating command line "link.exe @C:\DOCUME~1\berrios\LOCALS~1\Temp\RSP1226.tmp"
<h3>Output Window</h3>
Compiling resources...
Compiling...
StdAfx.cpp
Compiling...
CEtalk.cpp
CEtalkDlg.cpp
Generating Code...
Linking...
   Creating library .\build\dll\sh4\gr\release/Dtalk_gr.lib and object .\build\dll\sh4\gr\release/Dtalk_gr.exp



<h3>Results</h3>
Dtalk_gr.exe - 0 error(s), 0 warning(s)
</pre>
</body>
</html>
