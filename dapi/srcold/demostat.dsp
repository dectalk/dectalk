# Microsoft Developer Studio Project File - Name="demostat" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Static Library" 0x0104

CFG=demostat - Win32 Debug United Kingdom
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "demostat.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "demostat.mak" CFG="demostat - Win32 Debug United Kingdom"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "demostat - Win32 Release" (based on "Win32 (x86) Static Library")
!MESSAGE "demostat - Win32 Debug" (based on "Win32 (x86) Static Library")
!MESSAGE "demostat - Win32 Release Spanish" (based on "Win32 (x86) Static Library")
!MESSAGE "demostat - Win32 Release German" (based on "Win32 (x86) Static Library")
!MESSAGE "demostat - Win32 Release Latin American" (based on "Win32 (x86) Static Library")
!MESSAGE "demostat - Win32 Debug Spanish" (based on "Win32 (x86) Static Library")
!MESSAGE "demostat - Win32 Debug German" (based on "Win32 (x86) Static Library")
!MESSAGE "demostat - Win32 Debug Latin American" (based on "Win32 (x86) Static Library")
!MESSAGE "demostat - Win32 Release French" (based on "Win32 (x86) Static Library")
!MESSAGE "demostat - Win32 Debug French" (based on "Win32 (x86) Static Library")
!MESSAGE "demostat - Win32 Release United Kingdom" (based on "Win32 (x86) Static Library")
!MESSAGE "demostat - Win32 Debug United Kingdom" (based on "Win32 (x86) Static Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "demostat - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\WinRel"
# PROP BASE Intermediate_Dir ".\WinRel"
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\demostat\us\release"
# PROP Intermediate_Dir ".\..\build\demostat\us\release\link"
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /FR /YX /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\WinDebug"
# PROP BASE Intermediate_Dir ".\WinDebug"
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\demostat\us\debug"
# PROP Intermediate_Dir ".\..\build\demostat\us\debug\link"
# ADD BASE CPP /nologo /W3 /GX /Z7 /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /YX /c
# ADD CPP /nologo /MTd /W3 /GX /Z7 /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\demosta0"
# PROP BASE Intermediate_Dir ".\demosta0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\demostat\sp\release"
# PROP Intermediate_Dir ".\..\build\demostat\sp\release\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /I "api" /I "acna" /I "lts" /I "vtm" /I "ph" /I "kernel" /I "nt" /I "cmd" /I "include" /I "protos" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "SPANISH_SP" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "demostat - Win32 Release German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\demosta1"
# PROP BASE Intermediate_Dir ".\demosta1"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\demostat\gr\release"
# PROP Intermediate_Dir ".\..\build\demostat\gr\release\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /I "api" /I "acna" /I "lts" /I "vtm" /I "ph" /I "kernel" /I "nt" /I "cmd" /I "include" /I "protos" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "GERMAN" /YX /FD /Zm200 /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "demostat - Win32 Release Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\demosta0"
# PROP BASE Intermediate_Dir ".\demosta0"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\demostat\la\release"
# PROP Intermediate_Dir ".\..\build\demostat\la\release\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /I "api" /I "acna" /I "lts" /I "vtm" /I "ph" /I "kernel" /I "nt" /I "cmd" /I "include" /I "protos" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "SPANISH" /YX /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "SPANISH_LA" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\demosta1"
# PROP BASE Intermediate_Dir ".\demosta1"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\demostat\sp\debug"
# PROP Intermediate_Dir ".\..\build\demostat\sp\debug\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /Z7 /O2 /I "api" /I "acna" /I "lts" /I "vtm" /I "ph" /I "kernel" /I "nt" /I "cmd" /I "include" /I "protos" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /MTd /W3 /GX /Z7 /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "SPANISH_SP" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\demosta2"
# PROP BASE Intermediate_Dir ".\demosta2"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\demostat\gr\debug"
# PROP Intermediate_Dir ".\..\build\demostat\gr\debug\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /Z7 /O2 /I "api" /I "acna" /I "lts" /I "vtm" /I "ph" /I "kernel" /I "nt" /I "cmd" /I "include" /I "protos" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /MTd /W3 /GX /Z7 /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "GERMAN" /YX /FD /Zm200 /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\demosta3"
# PROP BASE Intermediate_Dir ".\demosta3"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\demostat\la\debug"
# PROP Intermediate_Dir ".\..\build\demostat\la\debug\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /Z7 /O2 /I "api" /I "acna" /I "lts" /I "vtm" /I "ph" /I "kernel" /I "nt" /I "cmd" /I "include" /I "protos" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /YX /c
# ADD CPP /nologo /MTd /W3 /GX /Z7 /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "SPANISH_LA" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "demostat - Win32 Release French"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "demostat___Win32_Release_French"
# PROP BASE Intermediate_Dir "demostat___Win32_Release_French"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\demostat\fr\release"
# PROP Intermediate_Dir ".\..\build\demostat\fr\release\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "GERMAN" /YX /FD /Zm200 /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "FRENCH" /YX /FD /Zm200 /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug French"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "demostat___Win32_Debug_French"
# PROP BASE Intermediate_Dir "demostat___Win32_Debug_French"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\demostat\fr\debug"
# PROP Intermediate_Dir ".\..\build\demostat\fr\debug\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MTd /W3 /GX /Z7 /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "GERMAN" /YX /FD /Zm200 /c
# ADD CPP /nologo /MTd /W3 /GX /Zi /Od /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "FRENCH" /YX /FD /Zm200 /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "demostat - Win32 Release United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "demostat___Win32_Release_United_Kingdom"
# PROP BASE Intermediate_Dir "demostat___Win32_Release_United_Kingdom"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\demostat\uk\release"
# PROP Intermediate_Dir ".\..\build\demostat\uk\release\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "ENGLISH_UK" /D "ENGLISH" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "demostat - Win32 Debug United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "demostat___Win32_Debug_United_Kingdom"
# PROP BASE Intermediate_Dir "demostat___Win32_Debug_United_Kingdom"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\demostat\uk\debug"
# PROP Intermediate_Dir ".\..\build\demostat\uk\debug\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MTd /W3 /GX /Z7 /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /D "ENGLISH" /D "ACNA" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /GX /Z7 /O2 /I ".\api" /I ".\acna" /I ".\lts" /I ".\vtm" /I ".\ph" /I ".\kernel" /I ".\nt" /I ".\cmd" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "BLD_DECTALK_DLL" /D "ENGLISH_UK" /D "ENGLISH" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ENDIF 

# Begin Target

# Name "demostat - Win32 Release"
# Name "demostat - Win32 Debug"
# Name "demostat - Win32 Release Spanish"
# Name "demostat - Win32 Release German"
# Name "demostat - Win32 Release Latin American"
# Name "demostat - Win32 Debug Spanish"
# Name "demostat - Win32 Debug German"
# Name "demostat - Win32 Debug Latin American"
# Name "demostat - Win32 Release French"
# Name "demostat - Win32 Debug French"
# Name "demostat - Win32 Release United Kingdom"
# Name "demostat - Win32 Debug United Kingdom"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=.\Cmd\cm_char.c
# End Source File
# Begin Source File

SOURCE=.\Cmd\cm_cmd.c
# End Source File
# Begin Source File

SOURCE=.\Cmd\cm_copt.c
# End Source File
# Begin Source File

SOURCE=.\Cmd\cm_main.c
# End Source File
# Begin Source File

SOURCE=.\Cmd\cm_pars.c
# End Source File
# Begin Source File

SOURCE=.\Cmd\cm_phon.c
# End Source File
# Begin Source File

SOURCE=.\Cmd\cm_text.c
# End Source File
# Begin Source File

SOURCE=.\Cmd\cm_util.c
# End Source File
# Begin Source File

SOURCE=.\Cmd\Cmd_init.c
# End Source File
# Begin Source File

SOURCE=.\Cmd\cmd_wav.c
# End Source File
# Begin Source File

SOURCE=.\Api\Decstd97.c
# End Source File
# Begin Source File

SOURCE=.\Lts\loaddict.c
# End Source File
# Begin Source File

SOURCE=.\Lts\ls_chari.c
# End Source File
# Begin Source File

SOURCE=.\Lts\ls_dict.c
# End Source File
# Begin Source File

SOURCE=.\Lts\ls_homo.c
# End Source File
# Begin Source File

SOURCE=.\Lts\ls_math.c
# End Source File
# Begin Source File

SOURCE=.\Lts\ls_proc.c
# End Source File
# Begin Source File

SOURCE=.\Lts\ls_spel.c
# End Source File
# Begin Source File

SOURCE=.\Lts\ls_speli.c
# End Source File
# Begin Source File

SOURCE=.\Lts\ls_suff.c
# End Source File
# Begin Source File

SOURCE=.\Lts\ls_suffi.c
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

SOURCE=.\Lts\lsa_main.c
# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_rtbi.c
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

SOURCE=.\Lts\lsa_task.c
# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_us.c
# End Source File
# Begin Source File

SOURCE=.\Lts\lsa_util.c
# End Source File
# Begin Source File

SOURCE=.\Lts\lsw_main.c
# End Source File
# Begin Source File

SOURCE=.\Cmd\par_ambi.c
# End Source File
# Begin Source File

SOURCE=.\Cmd\par_char.c
# End Source File
# Begin Source File

SOURCE=.\Cmd\par_dict.c
# End Source File
# Begin Source File

SOURCE=.\Cmd\par_pars.c
# End Source File
# Begin Source File

SOURCE=.\Cmd\par_rule.c
# End Source File
# Begin Source File

SOURCE=.\Ph\ph_aloph.c
# End Source File
# Begin Source File

SOURCE=.\Ph\ph_claus.c
# End Source File
# Begin Source File

SOURCE=.\Ph\ph_draw.c
# End Source File
# Begin Source File

SOURCE=.\Ph\ph_drwt0.c
# End Source File
# Begin Source File

SOURCE=.\Ph\ph_inton.c
# End Source File
# Begin Source File

SOURCE=.\Ph\ph_main.c
# End Source File
# Begin Source File

SOURCE=.\Ph\ph_romi.c
# End Source File
# Begin Source File

SOURCE=.\Ph\ph_setar.c
# End Source File
# Begin Source File

SOURCE=.\Ph\ph_sort.c
# End Source File
# Begin Source File

SOURCE=.\Ph\ph_syl.c
# End Source File
# Begin Source File

SOURCE=.\Ph\ph_syntx.c
# End Source File
# Begin Source File

SOURCE=.\Ph\ph_task.c
# End Source File
# Begin Source File

SOURCE=.\Ph\ph_timng.c
# End Source File
# Begin Source File

SOURCE=.\Ph\ph_vdefi.c
# End Source File
# Begin Source File

SOURCE=.\Ph\ph_vset.c
# End Source File
# Begin Source File

SOURCE=.\Ph\phinit.c
# End Source File
# Begin Source File

SOURCE=.\Ph\phlog.c
# End Source File
# Begin Source File

SOURCE=.\Kernel\services.c
# End Source File
# Begin Source File

SOURCE=.\Api\ttsapi.c
# End Source File
# Begin Source File

SOURCE=.\Kernel\Usa_init.c
# End Source File
# Begin Source File

SOURCE=.\Vtm\vtm.c
# End Source File
# Begin Source File

SOURCE=.\Vtm\vtmiont.c
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl;fi;fd"
# Begin Source File

SOURCE=.\include\186.h
# End Source File
# Begin Source File

SOURCE=.\include\audioapi.h
# End Source File
# Begin Source File

SOURCE=.\Include\Audiodef.h
# End Source File
# Begin Source File

SOURCE=.\Cmd\Cm_copt.h
# End Source File
# Begin Source File

SOURCE=.\Cmd\Cm_util.h
# End Source File
# Begin Source File

SOURCE=.\include\cmd.h
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

SOURCE=.\include\ger_err.tab
# End Source File
# Begin Source File

SOURCE=.\include\ger_phon.tab
# End Source File
# Begin Source File

SOURCE=.\include\ger_type.tab
# End Source File
# Begin Source File

SOURCE=.\include\hardw.h
# End Source File
# Begin Source File

SOURCE=.\include\iso_char.h
# End Source File
# Begin Source File

SOURCE=.\include\kernel.h
# End Source File
# Begin Source File

SOURCE=.\Include\L_com_ph.h
# End Source File
# Begin Source File

SOURCE=.\Include\L_gr_ph.h
# End Source File
# Begin Source File

SOURCE=.\Include\L_sp_ph.h
# End Source File
# Begin Source File

SOURCE=.\Include\L_us_ph.h
# End Source File
# Begin Source File

SOURCE=.\Lts\Ls_dict.h
# End Source File
# Begin Source File

SOURCE=.\include\ls_feat.tab
# End Source File
# Begin Source File

SOURCE=.\include\ls_fold.tab
# End Source File
# Begin Source File

SOURCE=.\Lts\Ls_homo.h
# End Source File
# Begin Source File

SOURCE=.\include\ls_lower.tab
# End Source File
# Begin Source File

SOURCE=.\include\ls_upper.tab
# End Source File
# Begin Source File

SOURCE=.\include\mulawi.h
# End Source File
# Begin Source File

SOURCE=.\Cmd\Par_rule.h
# End Source File
# Begin Source File

SOURCE=.\include\pcport.h
# End Source File
# Begin Source File

SOURCE=.\Include\Pipe.h
# End Source File
# Begin Source File

SOURCE=.\include\port.h
# End Source File
# Begin Source File

SOURCE=.\include\spa_def.h
# End Source File
# Begin Source File

SOURCE=.\include\spa_err.tab
# End Source File
# Begin Source File

SOURCE=.\include\spa_phon.tab
# End Source File
# Begin Source File

SOURCE=.\include\spa_type.tab
# End Source File
# Begin Source File

SOURCE=.\api\ttsapi.h
# End Source File
# Begin Source File

SOURCE=.\include\usa_def.h
# End Source File
# Begin Source File

SOURCE=.\include\usa_err.tab
# End Source File
# Begin Source File

SOURCE=.\include\usa_phon.tab
# End Source File
# Begin Source File

SOURCE=.\include\usa_type.tab
# End Source File
# Begin Source File

SOURCE=.\include\version.h
# End Source File
# Begin Source File

SOURCE=.\Vtm\Vtm.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;cnt;rtf;gif;jpg;jpeg;jpe"
# End Group
# End Target
# End Project
