# Microsoft Developer Studio Project File - Name="d2static" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Static Library" 0x0104

CFG=d2static - Win32 Debug United Kingdom
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "d2static.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "d2static.mak" CFG="d2static - Win32 Debug United Kingdom"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "d2static - Win32 Release" (based on "Win32 (x86) Static Library")
!MESSAGE "d2static - Win32 Debug" (based on "Win32 (x86) Static Library")
!MESSAGE "d2static - Win32 Release Spanish" (based on "Win32 (x86) Static Library")
!MESSAGE "d2static - Win32 Release German" (based on "Win32 (x86) Static Library")
!MESSAGE "d2static - Win32 Release Latin American" (based on "Win32 (x86) Static Library")
!MESSAGE "d2static - Win32 Debug Spanish" (based on "Win32 (x86) Static Library")
!MESSAGE "d2static - Win32 Debug German" (based on "Win32 (x86) Static Library")
!MESSAGE "d2static - Win32 Debug Latin American" (based on "Win32 (x86) Static Library")
!MESSAGE "d2static - Win32 Release French" (based on "Win32 (x86) Static Library")
!MESSAGE "d2static - Win32 Debug French" (based on "Win32 (x86) Static Library")
!MESSAGE "d2static - Win32 Release United Kingdom" (based on "Win32 (x86) Static Library")
!MESSAGE "d2static - Win32 Debug United Kingdom" (based on "Win32 (x86) Static Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "d2static - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\d2static\us\release"
# PROP Intermediate_Dir ".\..\build\d2static\us\release\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /FD /c
# ADD CPP /nologo /W3 /GX /O2 /I ".\acna" /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /D "ENGLISH" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "d2static - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\d2static\us\debug"
# PROP Intermediate_Dir ".\..\build\d2static\us\debug\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /Z7 /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /FD /c
# ADD CPP /nologo /W3 /GX /Z7 /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "ENGLISH_US" /D "ENGLISH" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "d2static - Win32 Release Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release Spanish"
# PROP BASE Intermediate_Dir "Release Spanish"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\d2static\sp\release"
# PROP Intermediate_Dir ".\..\build\d2static\sp\release\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /YX /FD /c
# ADD CPP /nologo /W3 /GX /O2 /I ".\acna" /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "SPANISH_SP" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "d2static - Win32 Release German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release German"
# PROP BASE Intermediate_Dir "Release German"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\d2static\gr\release"
# PROP Intermediate_Dir ".\..\build\d2static\gr\release\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /YX /FD /c
# ADD CPP /nologo /W3 /GX /O2 /I ".\acna" /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "GERMAN" /YX /FD /Zm200 /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "d2static - Win32 Release Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release Latin American"
# PROP BASE Intermediate_Dir "Release Latin American"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\d2static\la\release"
# PROP Intermediate_Dir ".\..\build\d2static\la\release\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /I ".\api" /I ".\acna" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /YX /FD /c
# ADD CPP /nologo /W3 /GX /O2 /I ".\acna" /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "SPANISH" /D "SPANISH_LA" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "d2static - Win32 Debug Spanish"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug Spanish"
# PROP BASE Intermediate_Dir "Debug Spanish"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\d2static\sp\debug"
# PROP Intermediate_Dir ".\..\build\d2static\sp\debug\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /Z7 /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "ENGLISH_US" /YX /FD /c
# ADD CPP /nologo /W3 /GX /Z7 /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "SPANISH" /D "SPANISH_SP" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "d2static - Win32 Debug German"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug German"
# PROP BASE Intermediate_Dir "Debug German"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\d2static\gr\debug"
# PROP Intermediate_Dir ".\..\build\d2static\gr\debug\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /Z7 /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "ENGLISH_US" /YX /FD /c
# ADD CPP /nologo /W3 /GX /Z7 /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "GERMAN" /YX /FD /Zm200 /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "d2static - Win32 Debug Latin American"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug Latin American"
# PROP BASE Intermediate_Dir "Debug Latin American"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\d2static\la\debug"
# PROP Intermediate_Dir ".\..\build\d2static\la\debug\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /Z7 /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "ENGLISH_US" /YX /FD /c
# ADD CPP /nologo /W3 /GX /Z7 /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "SPANISH" /D "SPANISH_LA" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "d2static - Win32 Release French"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "d2static___Win32_Release_French"
# PROP BASE Intermediate_Dir "d2static___Win32_Release_French"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\d2static\fr\release"
# PROP Intermediate_Dir ".\..\build\d2static\fr\release\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /I ".\acna" /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /W3 /GX /O2 /I ".\acna" /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "FRENCH" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "d2static - Win32 Debug French"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "d2static___Win32_Debug_French"
# PROP BASE Intermediate_Dir "d2static___Win32_Debug_French"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\d2static\fr\debug"
# PROP Intermediate_Dir ".\..\build\d2static\fr\debug\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /Z7 /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "ENGLISH_US" /YX /FD /c
# ADD CPP /nologo /W3 /GX /Z7 /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "FRENCH" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "d2static - Win32 Release United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "d2static___Win32_Release_United_Kingdom"
# PROP BASE Intermediate_Dir "d2static___Win32_Release_United_Kingdom"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\..\build\d2static\uk\release"
# PROP Intermediate_Dir ".\..\build\d2static\uk\release\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /I ".\acna" /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /W3 /GX /O2 /I ".\acna" /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "ENGLISH_UK" /D "ENGLISH" /YX /FD /c
# ADD BASE RSC /l 0x409
# ADD RSC /l 0x409
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "d2static - Win32 Debug United Kingdom"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "d2static___Win32_Debug_United_Kingdom"
# PROP BASE Intermediate_Dir "d2static___Win32_Debug_United_Kingdom"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\..\build\d2static\uk\debug"
# PROP Intermediate_Dir ".\..\build\d2static\uk\debug\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /Z7 /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "ENGLISH_US" /D "ENGLISH" /YX /FD /c
# ADD CPP /nologo /W3 /GX /Z7 /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "..\.." /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "i386" /D "BLD_DECTALK_DLL" /D "PRINTFDEBUG" /D "ENGLISH_UK" /D "ENGLISH" /YX /FD /c
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

# Name "d2static - Win32 Release"
# Name "d2static - Win32 Debug"
# Name "d2static - Win32 Release Spanish"
# Name "d2static - Win32 Release German"
# Name "d2static - Win32 Release Latin American"
# Name "d2static - Win32 Debug Spanish"
# Name "d2static - Win32 Debug German"
# Name "d2static - Win32 Debug Latin American"
# Name "d2static - Win32 Release French"
# Name "d2static - Win32 Debug French"
# Name "d2static - Win32 Release United Kingdom"
# Name "d2static - Win32 Debug United Kingdom"
# Begin Source File

SOURCE=.\CMD\cm_char.c
# End Source File
# Begin Source File

SOURCE=.\CMD\cm_cmd.c
# End Source File
# Begin Source File

SOURCE=.\CMD\cm_copt.c
# End Source File
# Begin Source File

SOURCE=.\CMD\cm_main.c
# End Source File
# Begin Source File

SOURCE=.\CMD\cm_pars.c
# End Source File
# Begin Source File

SOURCE=.\CMD\cm_phon.c
# End Source File
# Begin Source File

SOURCE=.\CMD\cm_text.c
# End Source File
# Begin Source File

SOURCE=.\CMD\cm_util.c
# End Source File
# Begin Source File

SOURCE=.\CMD\Cmd_init.c
# End Source File
# Begin Source File

SOURCE=.\CMD\cmd_wav.c
# End Source File
# Begin Source File

SOURCE=.\API\CRYPT2.C
# End Source File
# Begin Source File

SOURCE=.\NT\dbgwins.c
# End Source File
# Begin Source File

SOURCE=.\API\DECSTD97.C
# End Source File
# Begin Source File

SOURCE=.\dectalk.def
# End Source File
# Begin Source File

SOURCE=.\LTS\loaddict.c
# End Source File
# Begin Source File

SOURCE=.\LTS\ls_chari.c
# End Source File
# Begin Source File

SOURCE=.\LTS\ls_dict.c
# End Source File
# Begin Source File

SOURCE=.\LTS\ls_homo.c
# End Source File
# Begin Source File

SOURCE=.\LTS\ls_math.c
# End Source File
# Begin Source File

SOURCE=.\LTS\ls_proc.c
# End Source File
# Begin Source File

SOURCE=.\LTS\ls_spel.c
# End Source File
# Begin Source File

SOURCE=.\LTS\ls_speli.c
# End Source File
# Begin Source File

SOURCE=.\LTS\ls_suff.c
# End Source File
# Begin Source File

SOURCE=.\LTS\ls_suffi.c
# End Source File
# Begin Source File

SOURCE=.\LTS\LSA_ADJU.C
# End Source File
# Begin Source File

SOURCE=.\LTS\lsa_coni.c
# End Source File
# Begin Source File

SOURCE=.\LTS\lsa_fr.c
# End Source File
# Begin Source File

SOURCE=.\LTS\lsa_gr.c
# End Source File
# Begin Source File

SOURCE=.\LTS\lsa_ir.c
# End Source File
# Begin Source File

SOURCE=.\LTS\lsa_it.c
# End Source File
# Begin Source File

SOURCE=.\LTS\lsa_ja.c
# End Source File
# Begin Source File

SOURCE=.\LTS\lsa_rtbi.c
# End Source File
# Begin Source File

SOURCE=.\LTS\lsa_rule.c
# End Source File
# Begin Source File

SOURCE=.\LTS\lsa_sl.c
# End Source File
# Begin Source File

SOURCE=.\LTS\lsa_sp.c
# End Source File
# Begin Source File

SOURCE=.\LTS\lsa_task.c
# End Source File
# Begin Source File

SOURCE=.\LTS\lsa_us.c
# End Source File
# Begin Source File

SOURCE=.\LTS\lsa_util.c
# End Source File
# Begin Source File

SOURCE=.\LTS\lsw_main.c
# End Source File
# Begin Source File

SOURCE=.\NT\mmalloc.c
# End Source File
# Begin Source File

SOURCE=.\NT\opthread.c
# End Source File
# Begin Source File

SOURCE=.\CMD\par_ambi.c
# End Source File
# Begin Source File

SOURCE=.\CMD\par_char.c
# End Source File
# Begin Source File

SOURCE=.\CMD\par_dict.c
# End Source File
# Begin Source File

SOURCE=.\CMD\par_pars.c
# End Source File
# Begin Source File

SOURCE=.\CMD\par_rule.c
# End Source File
# Begin Source File

SOURCE=.\PH\ph_aloph.c
# End Source File
# Begin Source File

SOURCE=.\PH\ph_claus.c
# End Source File
# Begin Source File

SOURCE=.\PH\ph_draw.c
# End Source File
# Begin Source File

SOURCE=.\PH\ph_drwt0.c
# End Source File
# Begin Source File

SOURCE=.\PH\ph_inton.c
# End Source File
# Begin Source File

SOURCE=.\PH\ph_main.c
# End Source File
# Begin Source File

SOURCE=.\PH\ph_romi.c
# End Source File
# Begin Source File

SOURCE=.\PH\ph_setar.c
# End Source File
# Begin Source File

SOURCE=.\PH\ph_sort.c
# End Source File
# Begin Source File

SOURCE=.\PH\ph_syl.c
# End Source File
# Begin Source File

SOURCE=.\PH\ph_syntx.c
# End Source File
# Begin Source File

SOURCE=.\PH\ph_task.c
# End Source File
# Begin Source File

SOURCE=.\PH\ph_timng.c
# End Source File
# Begin Source File

SOURCE=.\PH\ph_vdefi.c
# End Source File
# Begin Source File

SOURCE=.\PH\ph_vset.c
# End Source File
# Begin Source File

SOURCE=.\PH\phinit.c
# End Source File
# Begin Source File

SOURCE=.\PH\phlog.c
# End Source File
# Begin Source File

SOURCE=.\NT\pipe.c
# End Source File
# Begin Source File

SOURCE=.\NT\playaud.c
# End Source File
# Begin Source File

SOURCE=.\VTM\playtone.c
# End Source File
# Begin Source File

SOURCE=.\KERNEL\services.c
# End Source File
# Begin Source File

SOURCE=.\NT\spc.c
# End Source File
# Begin Source File

SOURCE=.\VTM\sync.c
# End Source File
# Begin Source File

SOURCE=.\API\ttsapi.c
# End Source File
# Begin Source File

SOURCE=.\KERNEL\Usa_init.c
# End Source File
# Begin Source File

SOURCE=.\VTM\vtm.c
# End Source File
# Begin Source File

SOURCE=.\VTM\vtmiont.c
# End Source File
# End Target
# End Project
