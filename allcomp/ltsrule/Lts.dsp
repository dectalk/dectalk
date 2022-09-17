# Microsoft Developer Studio Project File - Name="lts" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

CFG=lts - Win32 Release
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "Lts.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "Lts.mak" CFG="lts - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "lts - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "lts - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE "lts - Win32 Debug German" (based on "Win32 (x86) Console Application")
!MESSAGE "lts - Win32 Win32 nonACNA Debug US" (based on "Win32 (x86) Console Application")
!MESSAGE "lts - Win32 Win32 nonACNA Debug UK" (based on "Win32 (x86) Console Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "lts - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\Release"
# PROP BASE Intermediate_Dir ".\Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\Release"
# PROP Intermediate_Dir ".\Release\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /I ".\api" /I ".\lts" /I ".\nt" /I ".\include" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /FD /c
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386 /out:".\us\Release\Lts.exe"

!ELSEIF  "$(CFG)" == "lts - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\Debug"
# PROP BASE Intermediate_Dir ".\Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\us\Debug"
# PROP Intermediate_Dir ".\us\Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\api" /I ".\lts" /I ".\nt" /I ".\include" /I "..\.." /I "..\..\..\ad\dapi\src\ph" /I "..\..\..\ad\dapi\src\cmd" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "ENGLISH_US" /D "LDS_BUILD" /D "ENGLISH" /D "ACNA" /FR /YX /FD /c
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386

!ELSEIF  "$(CFG)" == "lts - Win32 Debug German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\lts___Wi"
# PROP BASE Intermediate_Dir ".\lts___Wi"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\gr\debug"
# PROP Intermediate_Dir ".\gr\debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I ".\apI" /I ".\lts" /I ".\nt" /I ".\include" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "ENGLISH_US" /D "LDS_BUILD" /D "ACNA" /FR /YX /c
# ADD CPP /nologo /W3 /Gm /GX /ZI /Od /I ".\apI" /I ".\lts" /I ".\nt" /I ".\include" /I "..\.." /I "..\..\..\ad\dapi\src\ph" /I "..\..\..\ad\dapi\src\cmd" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "GERMAN" /D "LDS_BUILD" /FR /YX /FD /c
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386

!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug US"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\lts___Wi"
# PROP BASE Intermediate_Dir ".\lts___Wi"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\us_noac\Debug"
# PROP Intermediate_Dir ".\us_noac\Debug"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I ".\apI" /I ".\lts" /I ".\nt" /I ".\include" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "ENGLISH_US" /D "LDS_BUILD" /D "ACNA" /FR /YX /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\apI" /I ".\lts" /I ".\nt" /I ".\include" /I ".\kernel" /I ".\protos" /I "..\.." /I "..\..\..\ad\dapi\src\ph" /I "..\..\..\ad\dapi\src\cmd" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "i386" /D "ENGLISH_US" /D "ENGLISH" /D "LDS_BUILD" /D "NO_NOUN" /FR /FD /c
# SUBTRACT CPP /YX
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386

!ELSEIF  "$(CFG)" == "lts - Win32 Win32 nonACNA Debug UK"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\lts___Wi"
# PROP BASE Intermediate_Dir ".\lts___Wi"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\uk_noac\Debug"
# PROP Intermediate_Dir ".\uk_noac\Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /I ".\apI" /I ".\lts" /I ".\nt" /I ".\include" /I ".\kernel" /I ".\protos" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "i386" /D "ENGLISH_US" /D "ENGLISH" /D "LDS_BUILD" /FR /c
# SUBTRACT BASE CPP /YX
# ADD CPP /nologo /W3 /Gm /GX /ZI /Od /I ".\apI" /I ".\lts" /I ".\nt" /I ".\include" /I ".\kernel" /I ".\protos" /I "..\.." /I "..\..\..\ad\dapi\src\ph" /I "..\..\..\ad\dapi\src\cmd" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "i386" /D "ENGLISH_UK" /D "ENGLISH" /D "LDS_BUILD" /D "NO_NOUN" /FR /FD /c
# SUBTRACT CPP /YX
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386

!ENDIF 

# Begin Target

# Name "lts - Win32 Release"
# Name "lts - Win32 Debug"
# Name "lts - Win32 Debug German"
# Name "lts - Win32 Win32 nonACNA Debug US"
# Name "lts - Win32 Win32 nonACNA Debug UK"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=.\lts\cm_char.c
# End Source File
# Begin Source File

SOURCE=.\Nt\Dbgwins.c
# End Source File
# Begin Source File

SOURCE=.\Lts\Ls_chari.c
# End Source File
# Begin Source File

SOURCE=.\Lts\Ls_dict.c
# End Source File
# Begin Source File

SOURCE=.\Lts\Ls_homo.c
# End Source File
# Begin Source File

SOURCE=.\Lts\Ls_math.c
# End Source File
# Begin Source File

SOURCE=.\Lts\Ls_proc.c
# End Source File
# Begin Source File

SOURCE=.\Lts\Ls_spel.c
# End Source File
# Begin Source File

SOURCE=.\Lts\Ls_speli.c
# End Source File
# Begin Source File

SOURCE=.\Lts\Ls_suff.c
# End Source File
# Begin Source File

SOURCE=.\Lts\Ls_suffi.c
# End Source File
# Begin Source File

SOURCE=.\Lts\Lsa_adju.c
# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_coni.c
# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_fr.c
# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_gr.c
# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_ir.c
# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_it.c
# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_ja.c
# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_rule.c
# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_sl.c
# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_sp.c
# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_us.c
# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_util.c
# End Source File
# Begin Source File

SOURCE=.\Lts\Lsread.c
# End Source File
# Begin Source File

SOURCE=.\Lts\Lts.c
# End Source File
# Begin Source File

SOURCE=.\Lts\Lts_util.c
# End Source File
# Begin Source File

SOURCE=.\nt\mmalloc.c
# End Source File
# Begin Source File

SOURCE=.\lts\opthread.c
# End Source File
# Begin Source File

SOURCE=.\Nt\Pipe.c
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl;fi;fd"
# Begin Source File

SOURCE=.\include\audioapi.h
# End Source File
# Begin Source File

SOURCE=.\Include\audiodef.h
# End Source File
# Begin Source File

SOURCE=.\include\cmd.h
# End Source File
# Begin Source File

SOURCE=.\nt\dbgwins.h
# End Source File
# Begin Source File

SOURCE=.\include\dectalk.h
# End Source File
# Begin Source File

SOURCE=.\include\defs.h
# End Source File
# Begin Source File

SOURCE=.\include\esc.h
# End Source File
# Begin Source File

SOURCE=.\include\ger_def.h
# End Source File
# Begin Source File

SOURCE=.\include\ger_phon.tab
# End Source File
# Begin Source File

SOURCE=.\Include\iso_char.h
# End Source File
# Begin Source File

SOURCE=.\include\kernel.h
# End Source File
# Begin Source File

SOURCE=.\include\l_com_ph.h
# End Source File
# Begin Source File

SOURCE=.\include\l_gr_ph.h
# End Source File
# Begin Source File

SOURCE=.\include\l_sp_ph.h
# End Source File
# Begin Source File

SOURCE=.\Include\l_uk_ph.h
# End Source File
# Begin Source File

SOURCE=.\include\l_us_ph.h
# End Source File
# Begin Source File

SOURCE=.\Lts\ls_dict.h
# End Source File
# Begin Source File

SOURCE=.\include\ls_feat.tab
# End Source File
# Begin Source File

SOURCE=.\include\ls_fold.tab
# End Source File
# Begin Source File

SOURCE=.\Lts\ls_homo.h
# End Source File
# Begin Source File

SOURCE=.\include\ls_lower.tab
# End Source File
# Begin Source File

SOURCE=.\include\ls_upper.tab
# End Source File
# Begin Source File

SOURCE=.\Lts\lts_util.h
# End Source File
# Begin Source File

SOURCE=.\include\pipe.h
# End Source File
# Begin Source File

SOURCE=.\Nt\pipe.h
# End Source File
# Begin Source File

SOURCE=.\include\port.h
# End Source File
# Begin Source File

SOURCE=.\include\uk_def.h
# End Source File
# Begin Source File

SOURCE=.\include\uk_phon.tab
# End Source File
# Begin Source File

SOURCE=.\include\usa_def.h
# End Source File
# Begin Source File

SOURCE=.\include\usa_phon.tab
# End Source File
# Begin Source File

SOURCE=.\include\vms_port.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;cnt;rtf;gif;jpg;jpeg;jpe"
# End Group
# End Target
# End Project
