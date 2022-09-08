# Microsoft Developer Studio Project File - Name="armltsfr" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Static Library" 0x0104

CFG=armltsfr - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "armltsfr.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "armltsfr.mak" CFG="armltsfr - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "armltsfr - Win32 Release" (based on "Win32 (x86) Static Library")
!MESSAGE "armltsfr - Win32 Debug" (based on "Win32 (x86) Static Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "armltsfr - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_MBCS" /D "_LIB" /YX /FD /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_MBCS" /D "_LIB" /YX /FD /c
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "armltsfr - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "armltsfr___Win32_Debug"
# PROP BASE Intermediate_Dir "armltsfr___Win32_Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "..\build\armltsfr\fr\debug"
# PROP Intermediate_Dir "..\build\armltsfr\fr\debug\link"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_MBCS" /D "_LIB" /YX /FD /GZ /c
# ADD CPP /nologo /W3 /Gm /GX /ZI /Od /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I "..\.." /I ".\hlsyn" /I ".\arm7" /D "_MBCS" /D "_LIB" /D "BLD_DECTALK_DLL" /D "ARM7" /D "ARM7_NOSWI" /D "FRENCH" /D "i386" /D "EPSON_ARM7" /D "CHEESY_DICT_COMPRESSION" /D "WIN32_TEST" /YX /FD /GZ /c
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ENDIF 

# Begin Target

# Name "armltsfr - Win32 Release"
# Name "armltsfr - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
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

SOURCE=.\LTS\maindict.c
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# End Group
# End Target
# End Project
