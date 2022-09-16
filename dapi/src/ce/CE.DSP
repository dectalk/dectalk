# Microsoft Developer Studio Project File - Name="CE" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 5.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (WCE SH) Static Library" 0x0904
# TARGTYPE "Win32 (WCE MIPS) Static Library" 0x0a04
# TARGTYPE "Win32 (WCE x86em) Static Library" 0x0b04

CFG=CE - Win32 (WCE MIPS) Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "CE.MAK".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "CE.MAK" CFG="CE - Win32 (WCE MIPS) Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "CE - Win32 (WCE MIPS) Release" (based on\
 "Win32 (WCE MIPS) Static Library")
!MESSAGE "CE - Win32 (WCE MIPS) Debug" (based on\
 "Win32 (WCE MIPS) Static Library")
!MESSAGE "CE - Win32 (WCE SH) Release" (based on\
 "Win32 (WCE SH) Static Library")
!MESSAGE "CE - Win32 (WCE SH) Debug" (based on "Win32 (WCE SH) Static Library")
!MESSAGE "CE - Win32 (WCE x86em) Release" (based on\
 "Win32 (WCE x86em) Static Library")
!MESSAGE "CE - Win32 (WCE x86em) Debug" (based on\
 "Win32 (WCE x86em) Static Library")
!MESSAGE "CE - Win32 (WCE SH) Release English UK" (based on\
 "Win32 (WCE SH) Static Library")
!MESSAGE 

# Begin Project
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
# PROP WCE_Configuration "H/PC Ver. 2.00"

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "WMIPSRel"
# PROP BASE Intermediate_Dir "WMIPSRel"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "\work\rnd\dapi\build\cestatic\mips\release"
# PROP Intermediate_Dir "\work\rnd\dapi\build\cestatic\mips\release\link"
# PROP Target_Dir ""
CPP=clmips.exe
# ADD BASE CPP /nologo /ML /W3 /O2 /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D "UNDER_CE" /D "UNICODE" /D _WIN32_WCE=200 /YX /QMRWCE /c
# ADD CPP /nologo /ML /W3 /O2 /D "NDEBUG" /D "MIPS" /D "_MIPS_" /D "UNDER_CE" /D "UNICODE" /D _WIN32_WCE=200 /YX /QMRWCE /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "WMIPSDbg"
# PROP BASE Intermediate_Dir "WMIPSDbg"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "\work\rnd\dapi\build\cestatic\mips\debug"
# PROP Intermediate_Dir "\work\rnd\dapi\build\cestatic\mips\debug\link"
# PROP Target_Dir ""
CPP=clmips.exe
# ADD BASE CPP /nologo /MLd /W3 /Zi /Od /D "DEBUG" /D "MIPS" /D "_MIPS_" /D "UNDER_CE" /D "UNICODE" /D _WIN32_WCE=200 /YX /QMRWCE /c
# ADD CPP /nologo /MLd /W3 /Zi /Od /D "DEBUG" /D "MIPS" /D "_MIPS_" /D "UNDER_CE" /D "UNICODE" /D _WIN32_WCE=200 /YX /QMRWCE /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "WCESHRel"
# PROP BASE Intermediate_Dir "WCESHRel"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "\work\rnd\dapi\build\cestatic\sh\release"
# PROP Intermediate_Dir "\work\rnd\dapi\build\cestatic\sh\release\link"
# PROP Target_Dir ""
CPP=shcl.exe
# ADD BASE CPP /nologo /ML /W3 /O2 /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D "UNDER_CE" /D "UNICODE" /D _WIN32_WCE=200 /YX /c
# ADD CPP /nologo /MT /W3 /O2 /I ".\acna" /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "c:\devstudio\wce\include\wce200" /I "..\.." /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D "WIN32" /D "UNDER_CE" /D "UNICODE" /D _WIN32_WCE=200 /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /D "ENGLISH" /D "STATIC_BUILD" /YX /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "WCESHDbg"
# PROP BASE Intermediate_Dir "WCESHDbg"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "\work\rnd\dapi\build\cestatic\sh\debug"
# PROP Intermediate_Dir "\work\rnd\dapi\build\cestatic\sh\debug\link"
# PROP Target_Dir ""
CPP=shcl.exe
# ADD BASE CPP /nologo /MLd /W3 /Zi /Od /D "DEBUG" /D "SH3" /D "_SH3_" /D "UNDER_CE" /D "UNICODE" /D _WIN32_WCE=200 /YX /c
# ADD CPP /nologo /MLd /W3 /Zi /Od /D "DEBUG" /D "SH3" /D "_SH3_" /D "UNDER_CE" /D "UNICODE" /D _WIN32_WCE=200 /YX /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "x86emRel"
# PROP BASE Intermediate_Dir "x86emRel"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "\work\rnd\dapi\build\cestatic\x86\release"
# PROP Intermediate_Dir "\work\rnd\dapi\build\cestatic\x86\release\link"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /O2 /D "UNDER_CE" /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=200 /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /YX /c
# ADD CPP /nologo /W3 /O2 /D "UNDER_CE" /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=200 /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "NDEBUG" /D "x86" /D "i486" /D "_x86_" /YX /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "x86emDbg"
# PROP BASE Intermediate_Dir "x86emDbg"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "\work\rnd\dapi\build\cestatic\x86\debug"
# PROP Intermediate_Dir "\work\rnd\dapi\build\cestatic\x86\debug\link"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /W3 /Z7 /Od /D "UNDER_CE" /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=200 /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "_DEBUG" /D "x86" /D "i486" /D "_x86_" /YX /c
# ADD CPP /nologo /W3 /Z7 /Od /D "UNDER_CE" /D "UNICODE" /D "_UNICODE" /D "WIN32" /D "STRICT" /D _WIN32_WCE=200 /D "_WIN32_WCE_EMULATION" /D "INTERNATIONAL" /D "USA" /D "INTLMSG_CODEPAGE" /D "_DEBUG" /D "x86" /D "i486" /D "_x86_" /YX /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "CE___Win"
# PROP BASE Intermediate_Dir "CE___Win"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "\work\rnd\dapi\build\cestatic\shuk\release"
# PROP Intermediate_Dir "\work\rnd\dapi\build\cestatic\shuk\release\link"
# PROP Target_Dir ""
CPP=shcl.exe
# ADD BASE CPP /nologo /MT /W3 /O2 /I ".\acna" /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D "WIN32" /D "UNDER_CE" /D "UNICODE" /D _WIN32_WCE=200 /D "BLD_DECTALK_DLL" /D "ENGLISH_US" /D "ENGLISH" /YX /c
# ADD CPP /nologo /MT /W3 /O2 /I ".\acna" /I ".\api" /I ".\cmd" /I ".\lts" /I ".\ph" /I ".\vtm" /I ".\kernel" /I ".\nt" /I ".\include" /I ".\protos" /I "c:\devstudio\wce\include\wce200" /D "NDEBUG" /D "SHx" /D "SH3" /D "_SH3_" /D "WIN32" /D "UNDER_CE" /D "UNICODE" /D _WIN32_WCE=200 /D "BLD_DECTALK_DLL" /D "ENGLISH_UK" /D "ENGLISH" /YX /c
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo

!ENDIF 

# Begin Target

# Name "CE - Win32 (WCE MIPS) Release"
# Name "CE - Win32 (WCE MIPS) Debug"
# Name "CE - Win32 (WCE SH) Release"
# Name "CE - Win32 (WCE SH) Debug"
# Name "CE - Win32 (WCE x86em) Release"
# Name "CE - Win32 (WCE x86em) Debug"
# Name "CE - Win32 (WCE SH) Release English UK"
# Begin Source File

SOURCE=.\CMD\cm_char.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_CM_CH=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\CMD\cm_data.h"\
	".\CMD\cm_def.h"\
	".\CMD\cm_defs.h"\
	".\CMD\cm_prot.h"\
	".\CMD\par_bin.h"\
	".\CMD\par_def.h"\
	".\CMD\par_def1.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CH=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_CM_CH=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\CMD\cm_data.h"\
	".\CMD\cm_def.h"\
	".\CMD\cm_defs.h"\
	".\CMD\cm_prot.h"\
	".\CMD\par_def.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CH=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\CMD\cm_cmd.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_CM_CM=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\CMD\cm_data.h"\
	".\CMD\cm_def.h"\
	".\CMD\cm_defs.h"\
	".\CMD\cm_prot.h"\
	".\CMD\par_bin.h"\
	".\CMD\par_def.h"\
	".\CMD\par_def1.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CM=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_CM_CM=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\CMD\cm_data.h"\
	".\CMD\cm_def.h"\
	".\CMD\cm_defs.h"\
	".\CMD\cm_prot.h"\
	".\CMD\par_def.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CM=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\CMD\cm_copt.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_CM_CO=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\CMD\c_us_cde.h"\
	".\CMD\cm_cdef.h"\
	".\CMD\cm_copt.h"\
	".\CMD\cm_data.h"\
	".\CMD\cm_def.h"\
	".\CMD\cm_defs.h"\
	".\CMD\cm_prot.h"\
	".\CMD\par_bin.h"\
	".\CMD\par_def.h"\
	".\CMD\par_def1.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\include\version.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CO=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_CM_CO=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\CMD\c_us_cde.h"\
	".\CMD\cm_cdef.h"\
	".\CMD\cm_copt.h"\
	".\CMD\cm_data.h"\
	".\CMD\cm_def.h"\
	".\CMD\cm_defs.h"\
	".\CMD\cm_prot.h"\
	".\CMD\par_def.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\include\version.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_CO=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\CMD\cm_main.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_CM_MA=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\CMD\cm_data.h"\
	".\CMD\cm_def.h"\
	".\CMD\cm_defs.h"\
	".\CMD\cm_prot.h"\
	".\CMD\par_bin.h"\
	".\CMD\par_def.h"\
	".\CMD\par_def1.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_MA=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_CM_MA=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\CMD\cm_data.h"\
	".\CMD\cm_def.h"\
	".\CMD\cm_defs.h"\
	".\CMD\cm_prot.h"\
	".\CMD\par_def.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_MA=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\CMD\cm_pars.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_CM_PA=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\CMD\cm_data.h"\
	".\CMD\cm_def.h"\
	".\CMD\cm_defs.h"\
	".\CMD\cm_prot.h"\
	".\CMD\par_bin.h"\
	".\CMD\par_def.h"\
	".\CMD\par_def1.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\pcport.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\NT\dbgwins.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_PA=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_CM_PA=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\CMD\cm_data.h"\
	".\CMD\cm_def.h"\
	".\CMD\cm_defs.h"\
	".\CMD\cm_prot.h"\
	".\CMD\par_def.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\pcport.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\NT\dbgwins.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_PA=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\CMD\cm_phon.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_CM_PH=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\CMD\cm_data.h"\
	".\CMD\cm_def.h"\
	".\CMD\cm_defs.h"\
	".\CMD\cm_prot.h"\
	".\CMD\par_bin.h"\
	".\CMD\par_def.h"\
	".\CMD\par_def1.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_PH=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_CM_PH=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\CMD\cm_data.h"\
	".\CMD\cm_def.h"\
	".\CMD\cm_defs.h"\
	".\CMD\cm_prot.h"\
	".\CMD\par_def.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_PH=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\CMD\cm_text.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_CM_TE=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\CMD\cm_data.h"\
	".\CMD\cm_def.h"\
	".\CMD\cm_defs.h"\
	".\CMD\cm_prot.h"\
	".\CMD\par_bin.h"\
	".\CMD\par_def.h"\
	".\CMD\par_def1.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_TE=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_CM_TE=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\CMD\cm_data.h"\
	".\CMD\cm_def.h"\
	".\CMD\cm_defs.h"\
	".\CMD\cm_prot.h"\
	".\CMD\par_def.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_TE=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\CMD\cm_util.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_CM_UT=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\CMD\cm_data.h"\
	".\CMD\cm_def.h"\
	".\CMD\cm_defs.h"\
	".\CMD\cm_prot.h"\
	".\CMD\cm_util.h"\
	".\CMD\par_bin.h"\
	".\CMD\par_def.h"\
	".\CMD\par_def1.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_UT=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_CM_UT=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\CMD\cm_data.h"\
	".\CMD\cm_def.h"\
	".\CMD\cm_defs.h"\
	".\CMD\cm_prot.h"\
	".\CMD\cm_util.h"\
	".\CMD\par_def.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\hardw.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CM_UT=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\CMD\Cmd_init.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_CMD_I=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\CMD\cm_data.h"\
	".\CMD\cm_def.h"\
	".\CMD\cm_defs.h"\
	".\CMD\cm_prot.h"\
	".\CMD\par_bin.h"\
	".\CMD\par_def.h"\
	".\CMD\par_def1.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_I=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_CMD_I=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\CMD\cm_data.h"\
	".\CMD\cm_def.h"\
	".\CMD\cm_defs.h"\
	".\CMD\cm_prot.h"\
	".\CMD\par_def.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_I=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\CMD\cmd_wav.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_CMD_W=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\CMD\cm_data.h"\
	".\CMD\cm_def.h"\
	".\CMD\cm_defs.h"\
	".\CMD\cm_prot.h"\
	".\CMD\par_bin.h"\
	".\CMD\par_def.h"\
	".\CMD\par_def1.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cemm.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\mulawi.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_W=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	".\CMD\dtmmiodefs.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_CMD_W=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\CMD\cm_data.h"\
	".\CMD\cm_def.h"\
	".\CMD\cm_defs.h"\
	".\CMD\cm_prot.h"\
	".\CMD\par_def.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\mulawi.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_CMD_W=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	".\CMD\cemm.h"\
	".\CMD\dtmmiodefs.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\API\CRYPT2.C

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\NT\dbgwins.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_DBGWI=\
	"..\..\dectalkf.h"\
	".\NT\dbgwins.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_DBGWI=\
	".\NT\dbgwins.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\API\DECSTD97.C

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\dectalk.def
# End Source File
# Begin Source File

SOURCE=.\LTS\loaddict.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_LOADD=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\LTS\ls_acna.h"\
	".\LTS\ls_char.h"\
	".\LTS\ls_cons.h"\
	".\LTS\ls_data.h"\
	".\LTS\ls_def.h"\
	".\LTS\ls_defs.h"\
	".\LTS\ls_dict.h"\
	".\LTS\ls_prot.h"\
	".\LTS\lsa_cons.h"\
	".\LTS\lsa_prot.h"\
	".\LTS\mn_char.h"\
	".\NT\dbgwins.h"\
	".\NT\mmalloc.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LOADD=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_LOADD=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\LTS\ls_acna.h"\
	".\LTS\ls_char.h"\
	".\LTS\ls_cons.h"\
	".\LTS\ls_data.h"\
	".\LTS\ls_def.h"\
	".\LTS\ls_defs.h"\
	".\LTS\ls_dict.h"\
	".\LTS\ls_prot.h"\
	".\LTS\lsa_cons.h"\
	".\LTS\lsa_prot.h"\
	".\LTS\mn_char.h"\
	".\NT\dbgwins.h"\
	".\NT\mmalloc.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LOADD=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\LTS\ls_chari.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_LS_CH=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\ls_feat.tab"\
	".\include\ls_fold.tab"\
	".\include\ls_lower.tab"\
	".\include\ls_upper.tab"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_cha.c"\
	".\LTS\l_us_ph.h"\
	".\LTS\ls_acna.h"\
	".\LTS\ls_char.h"\
	".\LTS\ls_cons.h"\
	".\LTS\ls_data.h"\
	".\LTS\ls_def.h"\
	".\LTS\ls_defs.h"\
	".\LTS\ls_dict.h"\
	".\LTS\ls_prot.h"\
	".\LTS\lsa_cons.h"\
	".\LTS\lsa_prot.h"\
	".\LTS\mn_char.h"\
	".\NT\dbgwins.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_CH=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_LS_CH=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\ls_feat.tab"\
	".\include\ls_fold.tab"\
	".\include\ls_lower.tab"\
	".\include\ls_upper.tab"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_cha.c"\
	".\LTS\l_us_ph.h"\
	".\LTS\ls_acna.h"\
	".\LTS\ls_char.h"\
	".\LTS\ls_cons.h"\
	".\LTS\ls_data.h"\
	".\LTS\ls_def.h"\
	".\LTS\ls_defs.h"\
	".\LTS\ls_dict.h"\
	".\LTS\ls_prot.h"\
	".\LTS\lsa_cons.h"\
	".\LTS\lsa_prot.h"\
	".\LTS\mn_char.h"\
	".\NT\dbgwins.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_CH=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\LTS\ls_dict.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_LS_DI=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\LTS\ls_acna.h"\
	".\LTS\ls_char.h"\
	".\LTS\ls_cons.h"\
	".\LTS\ls_data.h"\
	".\LTS\ls_def.h"\
	".\LTS\ls_defs.h"\
	".\LTS\ls_dict.h"\
	".\LTS\ls_prot.h"\
	".\LTS\lsa_cons.h"\
	".\LTS\lsa_prot.h"\
	".\LTS\mn_char.h"\
	".\NT\dbgwins.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_DI=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_LS_DI=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\LTS\ls_acna.h"\
	".\LTS\ls_char.h"\
	".\LTS\ls_cons.h"\
	".\LTS\ls_data.h"\
	".\LTS\ls_def.h"\
	".\LTS\ls_defs.h"\
	".\LTS\ls_dict.h"\
	".\LTS\ls_prot.h"\
	".\LTS\lsa_cons.h"\
	".\LTS\lsa_prot.h"\
	".\LTS\mn_char.h"\
	".\NT\dbgwins.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_DI=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\LTS\ls_homo.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_LS_HO=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\LTS\ls_acna.h"\
	".\LTS\ls_char.h"\
	".\LTS\ls_cons.h"\
	".\LTS\ls_data.h"\
	".\LTS\ls_def.h"\
	".\LTS\ls_defs.h"\
	".\LTS\ls_dict.h"\
	".\LTS\ls_homo.h"\
	".\LTS\ls_prot.h"\
	".\LTS\lsa_cons.h"\
	".\LTS\lsa_prot.h"\
	".\LTS\mn_char.h"\
	".\NT\dbgwins.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_HO=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_LS_HO=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\LTS\ls_acna.h"\
	".\LTS\ls_char.h"\
	".\LTS\ls_cons.h"\
	".\LTS\ls_data.h"\
	".\LTS\ls_def.h"\
	".\LTS\ls_defs.h"\
	".\LTS\ls_dict.h"\
	".\LTS\ls_homo.h"\
	".\LTS\ls_prot.h"\
	".\LTS\lsa_cons.h"\
	".\LTS\lsa_prot.h"\
	".\LTS\mn_char.h"\
	".\NT\dbgwins.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_HO=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\LTS\ls_main.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_LS_MA=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\LTS\ls_acna.h"\
	".\LTS\ls_char.h"\
	".\LTS\ls_cons.h"\
	".\LTS\ls_data.h"\
	".\LTS\ls_def.h"\
	".\LTS\ls_defs.h"\
	".\LTS\ls_dict.h"\
	".\LTS\ls_prot.h"\
	".\LTS\lsa_cons.h"\
	".\LTS\lsa_prot.h"\
	".\LTS\mn_char.h"\
	".\NT\dbgwins.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_MA=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_LS_MA=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\LTS\ls_acna.h"\
	".\LTS\ls_char.h"\
	".\LTS\ls_cons.h"\
	".\LTS\ls_data.h"\
	".\LTS\ls_def.h"\
	".\LTS\ls_defs.h"\
	".\LTS\ls_dict.h"\
	".\LTS\ls_prot.h"\
	".\LTS\lsa_cons.h"\
	".\LTS\lsa_prot.h"\
	".\LTS\mn_char.h"\
	".\NT\dbgwins.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_MA=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\LTS\ls_math.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_LS_MAT=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ma1.c"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ma1.c"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_uk_ma1.c"\
	".\LTS\l_us_ma1.c"\
	".\LTS\l_us_ph.h"\
	".\LTS\ls_acna.h"\
	".\LTS\ls_char.h"\
	".\LTS\ls_cons.h"\
	".\LTS\ls_data.h"\
	".\LTS\ls_def.h"\
	".\LTS\ls_defs.h"\
	".\LTS\ls_dict.h"\
	".\LTS\ls_math1.c"\
	".\LTS\ls_prot.h"\
	".\LTS\lsa_cons.h"\
	".\LTS\lsa_prot.h"\
	".\LTS\mn_char.h"\
	".\NT\dbgwins.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_MAT=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_LS_MAT=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ma1.c"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ma1.c"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_uk_ma1.c"\
	".\LTS\l_us_ma1.c"\
	".\LTS\l_us_ph.h"\
	".\LTS\ls_acna.h"\
	".\LTS\ls_char.h"\
	".\LTS\ls_cons.h"\
	".\LTS\ls_data.h"\
	".\LTS\ls_def.h"\
	".\LTS\ls_defs.h"\
	".\LTS\ls_dict.h"\
	".\LTS\ls_math1.c"\
	".\LTS\ls_prot.h"\
	".\LTS\lsa_cons.h"\
	".\LTS\lsa_prot.h"\
	".\LTS\mn_char.h"\
	".\NT\dbgwins.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_MAT=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\LTS\ls_proc.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_LS_PR=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_gr_pr1.c"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_sp_pr1.c"\
	".\LTS\l_uk_pr1.c"\
	".\LTS\l_us_ph.h"\
	".\LTS\l_us_pr1.c"\
	".\LTS\ls_acna.h"\
	".\LTS\ls_char.h"\
	".\LTS\ls_cons.h"\
	".\LTS\ls_data.h"\
	".\LTS\ls_def.h"\
	".\LTS\ls_defs.h"\
	".\LTS\ls_dict.h"\
	".\LTS\ls_prot.h"\
	".\LTS\lsa_cons.h"\
	".\LTS\lsa_prot.h"\
	".\LTS\mn_char.h"\
	".\NT\dbgwins.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_PR=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_LS_PR=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_gr_pr1.c"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_sp_pr1.c"\
	".\LTS\l_uk_pr1.c"\
	".\LTS\l_us_ph.h"\
	".\LTS\l_us_pr1.c"\
	".\LTS\ls_acna.h"\
	".\LTS\ls_char.h"\
	".\LTS\ls_cons.h"\
	".\LTS\ls_data.h"\
	".\LTS\ls_def.h"\
	".\LTS\ls_defs.h"\
	".\LTS\ls_dict.h"\
	".\LTS\ls_prot.h"\
	".\LTS\lsa_cons.h"\
	".\LTS\lsa_prot.h"\
	".\LTS\mn_char.h"\
	".\NT\dbgwins.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_PR=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\LTS\ls_spel.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_LS_SP=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_gr_sp1.c"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_sp_sp1.c"\
	".\LTS\l_uk_sp1.c"\
	".\LTS\l_us_ph.h"\
	".\LTS\l_us_sp1.c"\
	".\LTS\ls_acna.h"\
	".\LTS\ls_char.h"\
	".\LTS\ls_cons.h"\
	".\LTS\ls_data.h"\
	".\LTS\ls_def.h"\
	".\LTS\ls_defs.h"\
	".\LTS\ls_dict.h"\
	".\LTS\ls_prot.h"\
	".\LTS\ls_spel1.c"\
	".\LTS\lsa_cons.h"\
	".\LTS\lsa_prot.h"\
	".\LTS\mn_char.h"\
	".\NT\dbgwins.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_SP=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_LS_SP=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_gr_sp1.c"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_sp_sp1.c"\
	".\LTS\l_uk_sp1.c"\
	".\LTS\l_us_ph.h"\
	".\LTS\l_us_sp1.c"\
	".\LTS\ls_acna.h"\
	".\LTS\ls_char.h"\
	".\LTS\ls_cons.h"\
	".\LTS\ls_data.h"\
	".\LTS\ls_def.h"\
	".\LTS\ls_defs.h"\
	".\LTS\ls_dict.h"\
	".\LTS\ls_prot.h"\
	".\LTS\ls_spel1.c"\
	".\LTS\lsa_cons.h"\
	".\LTS\lsa_prot.h"\
	".\LTS\mn_char.h"\
	".\NT\dbgwins.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_SP=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\LTS\ls_speli.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_LS_SPE=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_uk_spe.c"\
	".\LTS\l_us_ph.h"\
	".\LTS\l_us_spe.c"\
	".\LTS\ls_acna.h"\
	".\LTS\ls_char.h"\
	".\LTS\ls_cons.h"\
	".\LTS\ls_data.h"\
	".\LTS\ls_def.h"\
	".\LTS\ls_defs.h"\
	".\LTS\ls_dict.h"\
	".\LTS\ls_prot.h"\
	".\LTS\lsa_cons.h"\
	".\LTS\lsa_prot.h"\
	".\LTS\mn_char.h"\
	".\NT\dbgwins.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_SPE=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	".\LTS\l_gr_spe.c"\
	".\LTS\l_sp_spe.c"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_LS_SPE=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_uk_spe.c"\
	".\LTS\l_us_ph.h"\
	".\LTS\l_us_spe.c"\
	".\LTS\ls_acna.h"\
	".\LTS\ls_char.h"\
	".\LTS\ls_cons.h"\
	".\LTS\ls_data.h"\
	".\LTS\ls_def.h"\
	".\LTS\ls_defs.h"\
	".\LTS\ls_dict.h"\
	".\LTS\ls_prot.h"\
	".\LTS\lsa_cons.h"\
	".\LTS\lsa_prot.h"\
	".\LTS\mn_char.h"\
	".\NT\dbgwins.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_SPE=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	".\LTS\l_gr_spe.c"\
	".\LTS\l_sp_spe.c"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\LTS\ls_suff.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_LS_SU=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\LTS\ls_acna.h"\
	".\LTS\ls_char.h"\
	".\LTS\ls_cons.h"\
	".\LTS\ls_data.h"\
	".\LTS\ls_def.h"\
	".\LTS\ls_defs.h"\
	".\LTS\ls_dict.h"\
	".\LTS\ls_prot.h"\
	".\LTS\lsa_cons.h"\
	".\LTS\lsa_prot.h"\
	".\LTS\mn_char.h"\
	".\NT\dbgwins.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_SU=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_LS_SU=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\LTS\ls_acna.h"\
	".\LTS\ls_char.h"\
	".\LTS\ls_cons.h"\
	".\LTS\ls_data.h"\
	".\LTS\ls_def.h"\
	".\LTS\ls_defs.h"\
	".\LTS\ls_dict.h"\
	".\LTS\ls_prot.h"\
	".\LTS\lsa_cons.h"\
	".\LTS\lsa_prot.h"\
	".\LTS\mn_char.h"\
	".\NT\dbgwins.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LS_SU=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\LTS\ls_suffi.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_LS_SUF=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\LTS\l_gr_suf.c"\
	".\LTS\l_uk_suf.c"\
	".\LTS\l_us_suf.c"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaudd.h"\
	
NODEP_CPP_LS_SUF=\
	".\LTS\l_sp_suf.c"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_LS_SUF=\
	".\include\port.h"\
	".\LTS\l_gr_suf.c"\
	".\LTS\l_uk_suf.c"\
	".\LTS\l_us_suf.c"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaudd.h"\
	
NODEP_CPP_LS_SUF=\
	".\LTS\l_sp_suf.c"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\LTS\LSA_ADJU.C

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_LSA_A=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ad1.c"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ad1.c"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_uk_ad1.c"\
	".\LTS\l_us_ad1.c"\
	".\LTS\l_us_ph.h"\
	".\LTS\ls_acna.h"\
	".\LTS\ls_adju.c"\
	".\LTS\ls_adju1.c"\
	".\LTS\ls_char.h"\
	".\LTS\ls_cons.h"\
	".\LTS\ls_data.h"\
	".\LTS\ls_def.h"\
	".\LTS\ls_defs.h"\
	".\LTS\ls_dict.h"\
	".\LTS\ls_prot.h"\
	".\LTS\lsa_cons.h"\
	".\LTS\lsa_prot.h"\
	".\LTS\mn_char.h"\
	".\NT\dbgwins.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_A=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_LSA_A=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ad1.c"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ad1.c"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_uk_ad1.c"\
	".\LTS\l_us_ad1.c"\
	".\LTS\l_us_ph.h"\
	".\LTS\ls_acna.h"\
	".\LTS\ls_adju.c"\
	".\LTS\ls_adju1.c"\
	".\LTS\ls_char.h"\
	".\LTS\ls_cons.h"\
	".\LTS\ls_data.h"\
	".\LTS\ls_def.h"\
	".\LTS\ls_defs.h"\
	".\LTS\ls_dict.h"\
	".\LTS\ls_prot.h"\
	".\LTS\lsa_cons.h"\
	".\LTS\lsa_prot.h"\
	".\LTS\mn_char.h"\
	".\NT\dbgwins.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_A=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\LTS\lsa_coni.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_LSA_C=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_ac_con.c"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_con.c"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_con.c"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_uk_con.c"\
	".\LTS\l_us_con.c"\
	".\LTS\l_us_ph.h"\
	".\LTS\ls_acna.h"\
	".\LTS\ls_char.h"\
	".\LTS\ls_cons.h"\
	".\LTS\ls_consi.c"\
	".\LTS\ls_data.h"\
	".\LTS\ls_def.h"\
	".\LTS\ls_defs.h"\
	".\LTS\ls_dict.h"\
	".\LTS\ls_prot.h"\
	".\LTS\lsa_cons.h"\
	".\LTS\lsa_prot.h"\
	".\LTS\mn_char.h"\
	".\NT\dbgwins.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_C=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_LSA_C=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_ac_con.c"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_con.c"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_con.c"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_uk_con.c"\
	".\LTS\l_us_con.c"\
	".\LTS\l_us_ph.h"\
	".\LTS\ls_acna.h"\
	".\LTS\ls_char.h"\
	".\LTS\ls_cons.h"\
	".\LTS\ls_consi.c"\
	".\LTS\ls_data.h"\
	".\LTS\ls_def.h"\
	".\LTS\ls_defs.h"\
	".\LTS\ls_dict.h"\
	".\LTS\ls_prot.h"\
	".\LTS\lsa_cons.h"\
	".\LTS\lsa_prot.h"\
	".\LTS\mn_char.h"\
	".\NT\dbgwins.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_C=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\LTS\lsa_fr.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_LSA_F=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaudd.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_LSA_F=\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaudd.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\LTS\lsa_gr.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_LSA_G=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaudd.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_LSA_G=\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaudd.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\LTS\lsa_ir.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_LSA_I=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaudd.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_LSA_I=\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaudd.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\LTS\lsa_it.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_LSA_IT=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaudd.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_LSA_IT=\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaudd.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\LTS\lsa_ja.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_LSA_J=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaudd.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_LSA_J=\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaudd.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\LTS\lsa_rtbi.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_LSA_R=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\LTS\l_gr_rta.c"\
	".\LTS\l_uk_rta.c"\
	".\LTS\l_us_rta.c"\
	".\LTS\ls_rtabi.c"\
	".\LTS\lsa_rta.c"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaudd.h"\
	
NODEP_CPP_LSA_R=\
	".\LTS\l_sp_rta.c"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_LSA_R=\
	".\include\port.h"\
	".\LTS\l_gr_rta.c"\
	".\LTS\l_uk_rta.c"\
	".\LTS\l_us_rta.c"\
	".\LTS\ls_rtabi.c"\
	".\LTS\lsa_rta.c"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaudd.h"\
	
NODEP_CPP_LSA_R=\
	".\LTS\l_sp_rta.c"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\LTS\lsa_rule.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_LSA_RU=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_gr_ru1.c"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_sp_ru1.c"\
	".\LTS\l_uk_ru1.c"\
	".\LTS\l_us_ph.h"\
	".\LTS\l_us_ru1.c"\
	".\LTS\ls_acna.h"\
	".\LTS\ls_char.h"\
	".\LTS\ls_cons.h"\
	".\LTS\ls_data.h"\
	".\LTS\ls_def.h"\
	".\LTS\ls_defs.h"\
	".\LTS\ls_dict.h"\
	".\LTS\ls_prot.h"\
	".\LTS\ls_rule.c"\
	".\LTS\ls_rule1.c"\
	".\LTS\ls_rule2.c"\
	".\LTS\lsa_cons.h"\
	".\LTS\lsa_prot.h"\
	".\LTS\mn_char.h"\
	".\NT\dbgwins.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_RU=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_LSA_RU=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_gr_ru1.c"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_sp_ru1.c"\
	".\LTS\l_uk_ru1.c"\
	".\LTS\l_us_ph.h"\
	".\LTS\l_us_ru1.c"\
	".\LTS\ls_acna.h"\
	".\LTS\ls_char.h"\
	".\LTS\ls_cons.h"\
	".\LTS\ls_data.h"\
	".\LTS\ls_def.h"\
	".\LTS\ls_defs.h"\
	".\LTS\ls_dict.h"\
	".\LTS\ls_prot.h"\
	".\LTS\ls_rule.c"\
	".\LTS\ls_rule1.c"\
	".\LTS\ls_rule2.c"\
	".\LTS\lsa_cons.h"\
	".\LTS\lsa_prot.h"\
	".\LTS\mn_char.h"\
	".\NT\dbgwins.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_RU=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\LTS\lsa_sl.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_LSA_S=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaudd.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_LSA_S=\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaudd.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\LTS\lsa_sp.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_LSA_SP=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaudd.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_LSA_SP=\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaudd.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\LTS\lsa_task.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_LSA_T=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\LTS\ls_acna.h"\
	".\LTS\ls_char.h"\
	".\LTS\ls_cons.h"\
	".\LTS\ls_data.h"\
	".\LTS\ls_def.h"\
	".\LTS\ls_defs.h"\
	".\LTS\ls_dict.h"\
	".\LTS\ls_prot.h"\
	".\LTS\ls_task.c"\
	".\LTS\lsa_cons.h"\
	".\LTS\lsa_prot.h"\
	".\LTS\mn_char.h"\
	".\NT\dbgwins.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_T=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_LSA_T=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\LTS\ls_acna.h"\
	".\LTS\ls_char.h"\
	".\LTS\ls_cons.h"\
	".\LTS\ls_data.h"\
	".\LTS\ls_def.h"\
	".\LTS\ls_defs.h"\
	".\LTS\ls_dict.h"\
	".\LTS\ls_prot.h"\
	".\LTS\ls_task.c"\
	".\LTS\lsa_cons.h"\
	".\LTS\lsa_prot.h"\
	".\LTS\mn_char.h"\
	".\NT\dbgwins.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_T=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\LTS\lsa_us.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_LSA_U=\
	"..\..\dectalkf.h"\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaudd.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_LSA_U=\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaudd.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\LTS\lsa_util.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_LSA_UT=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\LTS\ls_acna.h"\
	".\LTS\ls_char.h"\
	".\LTS\ls_cons.h"\
	".\LTS\ls_data.h"\
	".\LTS\ls_def.h"\
	".\LTS\ls_defs.h"\
	".\LTS\ls_dict.h"\
	".\LTS\ls_prot.h"\
	".\LTS\ls_util.c"\
	".\LTS\lsa_cons.h"\
	".\LTS\lsa_prot.h"\
	".\LTS\mn_char.h"\
	".\NT\dbgwins.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_UT=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_LSA_UT=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\LTS\ls_acna.h"\
	".\LTS\ls_char.h"\
	".\LTS\ls_cons.h"\
	".\LTS\ls_data.h"\
	".\LTS\ls_def.h"\
	".\LTS\ls_defs.h"\
	".\LTS\ls_dict.h"\
	".\LTS\ls_prot.h"\
	".\LTS\ls_util.c"\
	".\LTS\lsa_cons.h"\
	".\LTS\lsa_prot.h"\
	".\LTS\mn_char.h"\
	".\NT\dbgwins.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSA_UT=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\LTS\lsw_main.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_LSW_M=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\LTS\ls_acna.h"\
	".\LTS\ls_char.h"\
	".\LTS\ls_cons.h"\
	".\LTS\ls_data.h"\
	".\LTS\ls_def.h"\
	".\LTS\ls_defs.h"\
	".\LTS\ls_dict.h"\
	".\LTS\ls_prot.h"\
	".\LTS\lsa_cons.h"\
	".\LTS\lsa_prot.h"\
	".\LTS\mn_char.h"\
	".\NT\dbgwins.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSW_M=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_LSW_M=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\LTS\ls_acna.h"\
	".\LTS\ls_char.h"\
	".\LTS\ls_cons.h"\
	".\LTS\ls_data.h"\
	".\LTS\ls_def.h"\
	".\LTS\ls_defs.h"\
	".\LTS\ls_dict.h"\
	".\LTS\ls_prot.h"\
	".\LTS\lsa_cons.h"\
	".\LTS\lsa_prot.h"\
	".\LTS\mn_char.h"\
	".\NT\dbgwins.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_LSW_M=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\NT\mmalloc.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_MMALL=\
	"..\..\dectalkf.h"\
	".\NT\mmalloc.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\NT\shmalloc.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_MMALL=\
	".\NT\mmalloc.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\NT\shmalloc.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\NT\opthread.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_OPTHR=\
	".\NT\opthread.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_OPTHR=\
	".\NT\opthread.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\CMD\par_ambi.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_PAR_A=\
	"..\..\dectalkf.h"\
	".\CMD\par_ambi.tab"\
	".\CMD\par_bin.h"\
	".\CMD\par_def.h"\
	".\CMD\par_def1.h"\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaudd.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_PAR_A=\
	".\CMD\par_ambi.tab"\
	".\CMD\par_def.h"\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaudd.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\CMD\par_char.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_PAR_C=\
	"..\..\dectalkf.h"\
	".\CMD\par_bin.h"\
	".\CMD\par_def.h"\
	".\CMD\par_def1.h"\
	".\include\ls_lower.tab"\
	".\include\ls_upper.tab"\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaudd.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_PAR_C=\
	".\CMD\par_def.h"\
	".\include\ls_lower.tab"\
	".\include\ls_upper.tab"\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaudd.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\CMD\par_dict.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_PAR_D=\
	"..\..\dectalkf.h"\
	".\CMD\par_bin.h"\
	".\CMD\par_def.h"\
	".\CMD\par_def1.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_PAR_D=\
	".\CMD\par_def.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\CMD\par_pars.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_PAR_P=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\CMD\cm_data.h"\
	".\CMD\cm_defs.h"\
	".\CMD\compnoun.h"\
	".\CMD\par_bin.h"\
	".\CMD\par_def.h"\
	".\CMD\par_def1.h"\
	".\CMD\par_pars1.c"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\NT\dbgwins.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PAR_P=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_PAR_P=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\CMD\cm_data.h"\
	".\CMD\cm_defs.h"\
	".\CMD\par_def.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\kernel.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\NT\dbgwins.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PAR_P=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\CMD\par_rule.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_PAR_R=\
	"..\..\dectalkf.h"\
	".\CMD\co_gr_dict.h"\
	".\CMD\comp_dummy.h"\
	".\CMD\compnoun.h"\
	".\CMD\par_bin.h"\
	".\CMD\par_def.h"\
	".\CMD\par_def1.h"\
	".\CMD\par_nws.h"\
	".\CMD\par_nws1.h"\
	".\CMD\par_rule.h"\
	".\CMD\par_rule1.h"\
	".\CMD\par_rule2.h"\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaudd.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_PAR_R=\
	".\CMD\par_def.h"\
	".\CMD\par_nws.h"\
	".\CMD\par_rule.h"\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaudd.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\PH\ph_aloph.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_PH_AL=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_AL=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_PH_AL=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_AL=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\PH\ph_claus.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_PH_CL=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_CL=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_PH_CL=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_CL=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\PH\ph_draw.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_PH_DR=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\dbgwins.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\p_gr_dr1.c"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_draw1.c"\
	".\PH\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_DR=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_PH_DR=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\dbgwins.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\p_gr_dr1.c"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_draw1.c"\
	".\PH\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_DR=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\PH\ph_drwt0.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_PH_DRW=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_drwt01.c"\
	".\PH\ph_drwt02.c"\
	".\PH\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_DRW=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_PH_DRW=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_DRW=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\PH\ph_inton.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_PH_IN=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_inton1.c"\
	".\PH\ph_inton2.c"\
	".\PH\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_IN=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_PH_IN=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_IN=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\PH\ph_main.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_PH_MA=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_MA=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_PH_MA=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_MA=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\PH\ph_romi.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_PH_RO=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\p_gr_rom.c"\
	".\PH\p_sp_rom.c"\
	".\PH\p_uk_rom.c"\
	".\PH\p_us_rom.c"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_RO=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_PH_RO=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\p_gr_rom.c"\
	".\PH\p_sp_rom.c"\
	".\PH\p_uk_rom.c"\
	".\PH\p_us_rom.c"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_RO=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\PH\ph_setar.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_PH_SE=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\p_gr_st1.c"\
	".\PH\p_sp_st1.c"\
	".\PH\p_uk_st1.c"\
	".\PH\p_us_st1.c"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\PH\ph_sttr1.c"\
	".\PH\ph_sttr2.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_SE=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_PH_SE=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\p_gr_st1.c"\
	".\PH\p_sp_st1.c"\
	".\PH\p_uk_st1.c"\
	".\PH\p_us_st1.c"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\PH\ph_sttr1.c"\
	".\PH\ph_sttr2.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_SE=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\PH\ph_sort.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_PH_SO=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\p_gr_sr1.c"\
	".\PH\p_sp_sr1.c"\
	".\PH\p_uk_sr1.c"\
	".\PH\p_us_sr1.c"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\PH\ph_sort1.c"\
	".\PH\ph_sort2.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_SO=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_PH_SO=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\p_gr_sr1.c"\
	".\PH\p_sp_sr1.c"\
	".\PH\p_uk_sr1.c"\
	".\PH\p_us_sr1.c"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\PH\ph_sort1.c"\
	".\PH\ph_sort2.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_SO=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\PH\ph_syl.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_PH_SY=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\include\spa_def.h"\
	".\include\uk_def.h"\
	".\include\usa_def.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\p_sp_sy1.c"\
	".\PH\p_uk_sy1.c"\
	".\PH\p_us_sy1.c"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\PH\ph_syl1.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_SY=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_PH_SY=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\include\spa_def.h"\
	".\include\uk_def.h"\
	".\include\usa_def.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\p_sp_sy1.c"\
	".\PH\p_uk_sy1.c"\
	".\PH\p_us_sy1.c"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\PH\ph_syl1.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_SY=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\PH\ph_syntx.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_PH_SYN=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_SYN=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_PH_SYN=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_SYN=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\PH\ph_task.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_PH_TA=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_TA=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_PH_TA=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_TA=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\PH\ph_timng.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_PH_TI=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\p_gr_tim.c"\
	".\PH\p_sp_tim.c"\
	".\PH\p_uk_tim.c"\
	".\PH\p_us_tim.c"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\PH\ph_time1.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_TI=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_PH_TI=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\p_gr_tim.c"\
	".\PH\p_sp_tim.c"\
	".\PH\p_uk_tim.c"\
	".\PH\p_us_tim.c"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\PH\ph_time1.c"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_TI=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\PH\ph_vdefi.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_PH_VD=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\p_gr_vdf.c"\
	".\PH\p_gr_vdf1.c"\
	".\PH\p_sp_vdf.c"\
	".\PH\p_sp_vdf1.c"\
	".\PH\p_uk_vdf.c"\
	".\PH\p_uk_vdf1.c"\
	".\PH\p_us_vdf.c"\
	".\PH\p_us_vdf1.c"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_VD=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_PH_VD=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\p_gr_vdf.c"\
	".\PH\p_sp_vdf.c"\
	".\PH\p_uk_vdf.c"\
	".\PH\p_us_vdf.c"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_VD=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\PH\ph_vset.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_PH_VS=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_VS=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_PH_VS=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PH_VS=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\PH\phinit.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_PHINI=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PHINI=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_PHINI=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PHINI=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\PH\phlog.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_PHLOG=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\186.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PHLOG=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_PHLOG=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\186.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PHLOG=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\NT\pipe.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_PIPE_=\
	"..\..\dectalkf.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\pipe.h"\
	".\NT\playaudd.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_PIPE_=\
	".\include\pipe.h"\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\pipe.h"\
	".\NT\playaudd.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\NT\playaud.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_PLAYA=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\kernel.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\NT\mmalloc.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PLAYA=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_PLAYA=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\kernel.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\NT\mmalloc.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_PLAYA=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\VTM\playtone.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_PLAYT=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\kernel.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	".\VTM\sinetab.h"\
	
NODEP_CPP_PLAYT=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_PLAYT=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\kernel.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	".\VTM\sinetab.h"\
	
NODEP_CPP_PLAYT=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\KERNEL\services.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_SERVI=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_SERVI=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_SERVI=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_SERVI=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\NT\spc.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_SPC_C=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_SPC_C=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_SPC_C=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	
NODEP_CPP_SPC_C=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\VTM\sync.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_SYNC_=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	".\VTM\samprate.h"\
	".\VTM\vtm_f.h"\
	".\VTM\vtminst.h"\
	
NODEP_CPP_SYNC_=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	".\fvtm\fvtmasm.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_SYNC_=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	".\VTM\samprate.h"\
	".\VTM\vtminst.h"\
	
NODEP_CPP_SYNC_=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	".\fvtm\fvtmasm.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\API\ttsapi.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_TTSAP=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\API\ttserr.h"\
	".\API\ttsfeat.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\include\phonlist.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	".\VTM\samprate.h"\
	".\VTM\vtm_f.h"\
	".\VTM\vtminst.h"\
	
NODEP_CPP_TTSAP=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	".\fvtm\fvtmasm.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_TTSAP=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\API\ttserr.h"\
	".\API\ttsfeat.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\phonlist.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	".\VTM\samprate.h"\
	
NODEP_CPP_TTSAP=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\KERNEL\Usa_init.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_USA_I=\
	"..\..\dectalkf.h"\
	".\include\cmd.h"\
	".\include\defs.h"\
	".\include\ger_def.h"\
	".\include\ger_err.tab"\
	".\include\ger_phon.tab"\
	".\include\ger_type.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\include\spa_def.h"\
	".\include\spa_err.tab"\
	".\include\spa_phon.tab"\
	".\include\spa_type.tab"\
	".\include\uk_def.h"\
	".\include\uk_err.tab"\
	".\include\uk_phon.tab"\
	".\include\uk_type.tab"\
	".\include\usa_def.h"\
	".\include\usa_err.tab"\
	".\include\usa_phon.tab"\
	".\include\usa_type.tab"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_USA_I=\
	".\include\cmd.h"\
	".\include\defs.h"\
	".\include\ger_def.h"\
	".\include\ger_err.tab"\
	".\include\ger_phon.tab"\
	".\include\ger_type.tab"\
	".\include\iso_char.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\include\spa_def.h"\
	".\include\spa_err.tab"\
	".\include\spa_phon.tab"\
	".\include\spa_type.tab"\
	".\include\uk_def.h"\
	".\include\uk_err.tab"\
	".\include\uk_phon.tab"\
	".\include\uk_type.tab"\
	".\include\usa_def.h"\
	".\include\usa_err.tab"\
	".\include\usa_phon.tab"\
	".\include\usa_type.tab"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaudd.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\VTM\vtm.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_VTM_C=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\API\ttserr.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	".\protos\vtm_fp.h"\
	".\VTM\samprate.h"\
	".\VTM\vfmd2pol.h"\
	".\VTM\vfmfiltr.h"\
	".\VTM\vfphdefs.h"\
	".\VTM\vtm.h"\
	".\VTM\vtm_f.h"\
	".\VTM\vtm_fa.c"\
	".\VTM\vtm_fdef.h"\
	".\VTM\vtmfunc.h"\
	".\VTM\vtminst.h"\
	".\VTM\vtmtabf.h"\
	".\VTM\vtmtable.h"\
	
NODEP_CPP_VTM_C=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	".\fvtm\fvtmasm.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_VTM_C=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\API\ttserr.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	".\VTM\samprate.h"\
	".\VTM\vtm.h"\
	".\VTM\vtmfunc.h"\
	".\VTM\vtminst.h"\
	".\VTM\vtmtable.h"\
	
NODEP_CPP_VTM_C=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	".\fvtm\fvtmasm.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\VTM\vtmiont.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_VTMIO=\
	"..\..\dectalkf.h"\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\dt_abort.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pcport.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	".\VTM\samprate.h"\
	".\VTM\vtm_f.h"\
	".\VTM\vtminst.h"\
	
NODEP_CPP_VTMIO=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	".\fvtm\fvtmasm.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_VTMIO=\
	".\API\coop.h"\
	".\API\tts.h"\
	".\API\ttsapi.h"\
	".\include\audioapi.h"\
	".\include\audiodef.h"\
	".\include\cmd.h"\
	".\include\dectalk.h"\
	".\include\defs.h"\
	".\include\esc.h"\
	".\include\kernel.h"\
	".\include\l_com_ph.h"\
	".\include\l_gr_ph.h"\
	".\include\l_sp_ph.h"\
	".\include\l_uk_ph.h"\
	".\include\l_us_ph.h"\
	".\include\pipe.h"\
	".\include\port.h"\
	".\LTS\l_com_ph.h"\
	".\LTS\l_gr_ph.h"\
	".\LTS\l_sp_ph.h"\
	".\LTS\l_us_ph.h"\
	".\NT\opatype.h"\
	".\NT\opmmsys.h"\
	".\NT\opthread.h"\
	".\NT\playaud.h"\
	".\NT\playaudd.h"\
	".\PH\ph_data.h"\
	".\PH\ph_def.h"\
	".\PH\ph_defs.h"\
	".\PH\ph_prot.h"\
	".\protos\kernp.h"\
	".\protos\libp.h"\
	".\VTM\samprate.h"\
	".\VTM\vtminst.h"\
	
NODEP_CPP_VTMIO=\
	".\API\cpapi.h"\
	".\API\speech.h"\
	".\fvtm\fvtmasm.h"\
	

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\API\wince.c

!IF  "$(CFG)" == "CE - Win32 (WCE MIPS) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE MIPS) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release"

DEP_CPP_WINCE=\
	".\include\cemm.h"\
	

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Release"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE x86em) Debug"

!ELSEIF  "$(CFG)" == "CE - Win32 (WCE SH) Release English UK"

DEP_CPP_WINCE=\
	".\include\cemm.h"\
	

!ENDIF 

# End Source File
# End Target
# End Project
