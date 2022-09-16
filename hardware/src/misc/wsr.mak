# Microsoft Visual C++ generated build script - Do not modify

PROJ = WSR
DEBUG = 0
PROGTYPE = 0
CALLER = 
ARGS = 
DLLS = 
D_RCDEFINES = /d_DEBUG 
R_RCDEFINES = /dNDEBUG 
ORIGIN = MSVC
ORIGIN_VER = 1.00
PROJPATH = D:\WORK\RND_TEST\HARDWARE\SRC\RELEASE\
USEMFC = 0
CC = cl
CPP = cl
CXX = cl
CCREATEPCHFLAG = 
CPPCREATEPCHFLAG = 
CUSEPCHFLAG = 
CPPUSEPCHFLAG = 
FIRSTC = WSR_CHAR.C  
FIRSTCPP =             
RC = rc
CFLAGS_D_WEXE = /Fo$* /nologo /G2 /Gc /W3 /Zi /AM /Od /D "_DEBUG" /FR /GA /Fd"WSR.PDB"
CFLAGS_R_WEXE = /Fo$* /nologo /Gc /W3 /AM /O1 /D "NDEBUG" /FR /GA 
LFLAGS_D_WEXE = /NOLOGO /NOD /PACKC:61440 /STACK:10240 /ALIGN:16 /ONERROR:NOEXE /CO  
LFLAGS_R_WEXE = /NOLOGO /NOD /PACKC:61440 /STACK:10240 /ALIGN:16 /ONERROR:NOEXE  
LIBS_D_WEXE = oldnames libw mlibcew dll.lib commdlg.lib olecli.lib olesvr.lib shell.lib 
LIBS_R_WEXE = oldnames libw mlibcew dtpcw commdlg.lib olecli.lib olesvr.lib shell.lib 
RCFLAGS = /nologo 
RESFLAGS = /nologo 
RUNFLAGS = 
DEFFILE = WSR.DEF
OBJS_EXT = 
LIBS_EXT = 
!if "$(DEBUG)" == "1"
CFLAGS = $(CFLAGS_D_WEXE)
LFLAGS = $(LFLAGS_D_WEXE)
LIBS = $(LIBS_D_WEXE)
MAPFILE = nul
RCDEFINES = $(D_RCDEFINES)
!else
CFLAGS = $(CFLAGS_R_WEXE)
LFLAGS = $(LFLAGS_R_WEXE)
LIBS = $(LIBS_R_WEXE)
MAPFILE = nul
RCDEFINES = $(R_RCDEFINES)
!endif
!if [if exist MSVC.BND del MSVC.BND]
!endif
SBRS = WSR_CHAR.SBR \
		WSR_FILE.SBR \
		WSR_IND.SBR \
		WSR_MAIN.SBR \
		WSR_TTY.SBR


WSR_CHAR_DEP = d:\work\rnd_test\hardware\src\release\wsr.h \
	d:\work\rnd_test\hardware\src\release\wsr_prot.h \
	d:\work\rnd_test\hardware\src\release\user_dll.h \
	d:\work\rnd_test\hardware\src\release\wsr_rc.h \
	d:\work\rnd_test\hardware\src\release\wsr_dlg.h


WSR_FILE_DEP = d:\work\rnd_test\hardware\src\release\wsr.h \
	d:\work\rnd_test\hardware\src\release\wsr_prot.h \
	d:\work\rnd_test\hardware\src\release\user_dll.h \
	d:\work\rnd_test\hardware\src\release\wsr_rc.h \
	d:\work\rnd_test\hardware\src\release\wsr_dlg.h


WSR_IND_DEP = d:\work\rnd_test\hardware\src\release\wsr.h \
	d:\work\rnd_test\hardware\src\release\wsr_prot.h \
	d:\work\rnd_test\hardware\src\release\user_dll.h \
	d:\work\rnd_test\hardware\src\release\wsr_rc.h \
	d:\work\rnd_test\hardware\src\release\wsr_dlg.h


WSR_MAIN_DEP = d:\work\rnd_test\hardware\src\release\wsr.h \
	d:\work\rnd_test\hardware\src\release\wsr_prot.h \
	d:\work\rnd_test\hardware\src\release\user_dll.h \
	d:\work\rnd_test\hardware\src\release\wsr_rc.h \
	d:\work\rnd_test\hardware\src\release\wsr_dlg.h


WSR_TTY_DEP = d:\work\rnd_test\hardware\src\release\wsr.h \
	d:\work\rnd_test\hardware\src\release\wsr_prot.h \
	d:\work\rnd_test\hardware\src\release\user_dll.h \
	d:\work\rnd_test\hardware\src\release\wsr_rc.h \
	d:\work\rnd_test\hardware\src\release\wsr_dlg.h


WSR_RCDEP = d:\work\rnd_test\hardware\src\release\wsr_rc.h \
	d:\work\rnd_test\hardware\src\release\wsr_dlg.h \
	d:\work\rnd_test\hardware\src\release\wsr.ico \
	d:\work\rnd_test\hardware\src\release\output.dlg \
	d:\work\rnd_test\hardware\src\release\text.dlg


all:	$(PROJ).EXE $(PROJ).BSC

WSR_CHAR.OBJ:	WSR_CHAR.C $(WSR_CHAR_DEP)
	$(CC) $(CFLAGS) $(CCREATEPCHFLAG) /c WSR_CHAR.C

WSR_FILE.OBJ:	WSR_FILE.C $(WSR_FILE_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c WSR_FILE.C

WSR_IND.OBJ:	WSR_IND.C $(WSR_IND_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c WSR_IND.C

WSR_MAIN.OBJ:	WSR_MAIN.C $(WSR_MAIN_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c WSR_MAIN.C

WSR_TTY.OBJ:	WSR_TTY.C $(WSR_TTY_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c WSR_TTY.C

WSR.RES:	WSR.RC $(WSR_RCDEP)
	$(RC) $(RCFLAGS) $(RCDEFINES) -r WSR.RC


$(PROJ).EXE::	WSR.RES

$(PROJ).EXE::	WSR_CHAR.OBJ WSR_FILE.OBJ WSR_IND.OBJ WSR_MAIN.OBJ WSR_TTY.OBJ $(OBJS_EXT) $(DEFFILE)
	echo >NUL @<<$(PROJ).CRF
WSR_CHAR.OBJ +
WSR_FILE.OBJ +
WSR_IND.OBJ +
WSR_MAIN.OBJ +
WSR_TTY.OBJ +
$(OBJS_EXT)
$(PROJ).EXE
$(MAPFILE)
c:\msvc\lib\+
c:\msvc\mfc\lib\+
$(LIBS)
$(DEFFILE);
<<
	link $(LFLAGS) @$(PROJ).CRF
	$(RC) $(RESFLAGS) WSR.RES $@
	@copy $(PROJ).CRF MSVC.BND

$(PROJ).EXE::	WSR.RES
	if not exist MSVC.BND 	$(RC) $(RESFLAGS) WSR.RES $@

run: $(PROJ).EXE
	$(PROJ) $(RUNFLAGS)


$(PROJ).BSC: $(SBRS)
	bscmake @<<
/o$@ $(SBRS)
<<
