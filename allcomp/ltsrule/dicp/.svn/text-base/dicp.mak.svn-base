# Microsoft Developer Studio Generated NMAKE File, Format Version 40001
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

!IF "$(CFG)" == ""
CFG=dicp - Win32 Debug UK
!MESSAGE No configuration specified.  Defaulting to dicp - Win32 Debug UK.
!ENDIF 

!IF "$(CFG)" != "dicp - Win32 Debug UK"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "dicp.mak" CFG="dicp - Win32 Debug UK"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "dicp - Win32 Debug UK" (based on "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 
################################################################################
# Begin Project
# PROP Target_Last_Scanned "dicp - Win32 Debug UK"
CPP=cl.exe
RSC=rc.exe
# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug UK"
# PROP BASE Intermediate_Dir "Debug UK"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "h:\work\rnd\dapi\src\dicp\uk\debug"
# PROP Intermediate_Dir "h:\work\rnd\dapi\src\dicp\uk\debug"
# PROP Target_Dir ""
OUTDIR=h:\work\rnd\dapi\src\dicp\uk\debug
INTDIR=h:\work\rnd\dapi\src\dicp\uk\debug

ALL : "$(OUTDIR)\dicp.exe"

CLEAN : 
	-@erase ".\uk\debug\vc40.pdb"
	-@erase ".\uk\debug\vc40.idb"
	-@erase ".\uk\debug\dicp.exe"
	-@erase ".\uk\debug\Lts_dicp.obj"
	-@erase ".\uk\debug\Lts_util.obj"
	-@erase ".\uk\debug\dicp.ilk"
	-@erase ".\uk\debug\dicp.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /Zi /Od /I "..\include" /I "..\kernel" /I "..\api" /I "..\nt" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "ENGLISH" /D "ENGLISH_UK" /D "WORDLIST" /YX /c
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x809 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/dicp.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib /nologo /subsystem:console /incremental:yes\
 /pdb:"$(OUTDIR)/dicp.pdb" /debug /machine:I386 /out:"$(OUTDIR)/dicp.exe" 
LINK32_OBJS= \
	"$(INTDIR)/Lts_dicp.obj" \
	"$(INTDIR)/Lts_util.obj"

"$(OUTDIR)\dicp.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /I "..\include" /I "..\kernel" /I\
 "..\api" /I "..\nt" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "ENGLISH" /D\
 "ENGLISH_UK" /D "WORDLIST" /Fp"$(INTDIR)/dicp.pch" /YX /Fo"$(INTDIR)/"\
 /Fd"$(INTDIR)/" /c 
CPP_OBJS=h:\work\rnd\dapi\src\dicp\uk\debug/
CPP_SBRS=

.c{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.c{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

################################################################################
# Begin Target

# Name "dicp - Win32 Debug UK"
################################################################################
# Begin Source File

SOURCE=\work\rnd\dapi\src\Lts\Lts_util.h
# End Source File
################################################################################
# Begin Source File

SOURCE=\work\rnd\dapi\src\Lts\Lts_lang.h
# End Source File
################################################################################
# Begin Source File

SOURCE=\work\rnd\dapi\src\Lts\Lts_rule.h
# End Source File
################################################################################
# Begin Source File

SOURCE=\work\rnd\dapi\src\Lts\Lts_util.c
DEP_CPP_LTS_U=\
	".\..\Lts\Lts_util.h"\
	

"$(INTDIR)\Lts_util.obj" : $(SOURCE) $(DEP_CPP_LTS_U) "$(INTDIR)"
   $(CPP) $(CPP_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE=\work\rnd\dapi\src\Lts\Lts_dicp.c
DEP_CPP_LTS_D=\
	".\..\include\port.h"\
	".\..\Lts\Lts_rule.h"\
	".\..\Lts\Lts_util.h"\
	".\..\Lts\ls_defs.h"\
	".\..\include\defs.h"\
	".\..\include\dectalk.h"\
	

"$(INTDIR)\Lts_dicp.obj" : $(SOURCE) $(DEP_CPP_LTS_D) "$(INTDIR)"
   $(CPP) $(CPP_PROJ) $(SOURCE)


# End Source File
# End Target
# End Project
################################################################################
