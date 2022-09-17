# Microsoft Visual C++ generated build script - Do not modify

PROJ = DTTEST
DEBUG = 1
PROGTYPE = 6
CALLER = 
ARGS = voice.tst
DLLS = 
D_RCDEFINES = -d_DEBUG
R_RCDEFINES = -dNDEBUG
ORIGIN = MSVC
ORIGIN_VER = 1.00
PROJPATH = F:\TRUNG\DTTEST\
USEMFC = 0
CC = cl
CPP = cl
CXX = cl
CCREATEPCHFLAG = 
CPPCREATEPCHFLAG = 
CUSEPCHFLAG = 
CPPUSEPCHFLAG = 
FIRSTC = DTT_IN.C    
FIRSTCPP =             
RC = rc
CFLAGS_D_DEXE = /nologo /G2 /W3 /Zi /AM /Od /D "_DEBUG" /D "_DOS" /FR /Fd"DTTEST.PDB"
CFLAGS_R_DEXE = /nologo /Gs /G2 /W3 /AM /Ox /D "NDEBUG" /D "_DOS" /FR 
LFLAGS_D_DEXE = /NOLOGO /NOI /STACK:30000 /ONERROR:NOEXE /CO 
LFLAGS_R_DEXE = /NOLOGO /NOI /STACK:5120 /ONERROR:NOEXE 
LIBS_D_DEXE = oldnames mlibce 
LIBS_R_DEXE = oldnames mlibce 
RCFLAGS = /nologo
RESFLAGS = /nologo
RUNFLAGS = 
OBJS_EXT = 
LIBS_EXT = 
!if "$(DEBUG)" == "1"
CFLAGS = $(CFLAGS_D_DEXE)
LFLAGS = $(LFLAGS_D_DEXE)
LIBS = $(LIBS_D_DEXE)
MAPFILE = nul
RCDEFINES = $(D_RCDEFINES)
!else
CFLAGS = $(CFLAGS_R_DEXE)
LFLAGS = $(LFLAGS_R_DEXE)
LIBS = $(LIBS_R_DEXE)
MAPFILE = nul
RCDEFINES = $(R_RCDEFINES)
!endif
!if [if exist MSVC.BND del MSVC.BND]
!endif
SBRS = DTT_IN.SBR \
		DTT_INT.SBR \
		DTT_MAIN.SBR \
		DTT_OUT.SBR \
		DTT_PRO.SBR \
		DTT_UTIL.SBR


DTT_IN_DEP = f:\trung\dttest\dtt_data.h \
	f:\trung\dttest\dttsr.h \
	f:\trung\dttest\dtstart.h \
	f:\trung\dttest\dtstarp.h \
	f:\trung\dttest\dtt_defs.h \
	f:\trung\dttest\dtt_prot.h


DTT_INT_DEP = f:\trung\dttest\dtt_data.h \
	f:\trung\dttest\dttsr.h \
	f:\trung\dttest\dtstart.h \
	f:\trung\dttest\dtstarp.h \
	f:\trung\dttest\dtt_defs.h \
	f:\trung\dttest\dtt_prot.h \
	f:\trung\dttest\ttsapi.h


DTT_MAIN_DEP = f:\trung\dttest\dtt_data.h \
	f:\trung\dttest\dttsr.h \
	f:\trung\dttest\dtstart.h \
	f:\trung\dttest\dtstarp.h \
	f:\trung\dttest\dtt_defs.h \
	f:\trung\dttest\dtt_prot.h


DTT_OUT_DEP = f:\trung\dttest\dtt_data.h \
	f:\trung\dttest\dttsr.h \
	f:\trung\dttest\dtstart.h \
	f:\trung\dttest\dtstarp.h \
	f:\trung\dttest\dtt_defs.h \
	f:\trung\dttest\dtt_prot.h


DTT_PRO_DEP = f:\trung\dttest\dtt_data.h \
	f:\trung\dttest\dttsr.h \
	f:\trung\dttest\dtstart.h \
	f:\trung\dttest\dtstarp.h \
	f:\trung\dttest\dtt_defs.h \
	f:\trung\dttest\dtt_prot.h


DTT_UTIL_DEP = f:\trung\dttest\dtt_data.h \
	f:\trung\dttest\dttsr.h \
	f:\trung\dttest\dtstart.h \
	f:\trung\dttest\dtstarp.h \
	f:\trung\dttest\dtt_defs.h \
	f:\trung\dttest\dtt_prot.h


all:	$(PROJ).EXE $(PROJ).BSC

DTT_IN.OBJ:	DTT_IN.C $(DTT_IN_DEP)
	$(CC) $(CFLAGS) $(CCREATEPCHFLAG) /c DTT_IN.C

DTT_INT.OBJ:	DTT_INT.C $(DTT_INT_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c DTT_INT.C

DTT_MAIN.OBJ:	DTT_MAIN.C $(DTT_MAIN_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c DTT_MAIN.C

DTT_OUT.OBJ:	DTT_OUT.C $(DTT_OUT_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c DTT_OUT.C

DTT_PRO.OBJ:	DTT_PRO.C $(DTT_PRO_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c DTT_PRO.C

DTT_UTIL.OBJ:	DTT_UTIL.C $(DTT_UTIL_DEP)
	$(CC) $(CFLAGS) $(CUSEPCHFLAG) /c DTT_UTIL.C

$(PROJ).EXE::	DTT_IN.OBJ DTT_INT.OBJ DTT_MAIN.OBJ DTT_OUT.OBJ DTT_PRO.OBJ DTT_UTIL.OBJ $(OBJS_EXT) $(DEFFILE)
	echo >NUL @<<$(PROJ).CRF
DTT_IN.OBJ +
DTT_INT.OBJ +
DTT_MAIN.OBJ +
DTT_OUT.OBJ +
DTT_PRO.OBJ +
DTT_UTIL.OBJ +
$(OBJS_EXT)
$(PROJ).EXE
$(MAPFILE)
e:\msvc\lib\+
e:\msvc\mfc\lib\+
$(LIBS)
$(DEFFILE);
<<
	link $(LFLAGS) @$(PROJ).CRF

run: $(PROJ).EXE
	$(PROJ) $(RUNFLAGS)


$(PROJ).BSC: $(SBRS)
	bscmake @<<
/o$@ $(SBRS)
<<
