# Microsoft Visual C++ generated build script - Do not modify

PROJ = VTM
DEBUG = 0
PROGTYPE = 6
CALLER = 
ARGS = 
DLLS = 
D_RCDEFINES = -d_DEBUG
R_RCDEFINES = -dNDEBUG
ORIGIN = MSVC
ORIGIN_VER = 1.00
PROJPATH = D:\WORK\PRODUCT.461\DAPI\SRC\VTM\
USEMFC = 0
CC = cl
CPP = cl
CXX = cl
CCREATEPCHFLAG = 
CPPCREATEPCHFLAG = 
CUSEPCHFLAG = 
CPPUSEPCHFLAG = 
FIRSTC = VTM2.C      
FIRSTCPP =             
RC = rc
CFLAGS_D_DEXE = /nologo /G2 /W3 /Zi /AM /Od /D "_DEBUG" /D "DSPG_DOS" /D "ENGLISH" /D "ENGLISH_US" /U "ASM_FVTM" /U "FP_VTM" /FR /Fd"VTM.PDB"
CFLAGS_R_DEXE = /nologo /Gs /G2 /W3 /AM /Ox /D "NDEBUG" /D "DSPG_DOS" /D "ENGLISH" /D "ENGLISH_US" /U "ASM_FVTM" /U "FP_VTM" /I "..\..\.." /I "..\include" /I "..\nt" /FR 
LFLAGS_D_DEXE = /NOLOGO /ONERROR:NOEXE /NOI /CO /STACK:5120
LFLAGS_R_DEXE = /NOLOGO /ONERROR:NOEXE /NOI /STACK:5120
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
SBRS = VTM2.SBR


VTM2_DEP = d:\work\product.461\dapi\src\vtm\vtm_fa.c \
	d:\work\product.461\dapi\src\vtm\vtm_fdef.h \
	d:\work\product.461\dapi\src\vtm\vtm_f.h \
	d:\work\product.461\dapi\src\vtm\vfphdefs.h \
	d:\work\product.461\dapi\src\vtm\vtmtabf.h \
	d:\work\product.461\dapi\src\vtm\vfmfiltr.h \
	d:\work\product.461\dapi\src\vtm\vfmd2pol.h \
	d:\work\product.461\dapi\src\vtm\vtminst.h \
	d:\work\product.461\dapi\src\vtm\vtm.h \
	d:\work\product.461\dapi\src\vtm\vtmtable.h \
	d:\work\product.461\dapi\src\vtm\vtmfunc.h


all:	$(PROJ).EXE $(PROJ).BSC

VTM2.OBJ:	VTM2.C $(VTM2_DEP)
	$(CC) $(CFLAGS) $(CCREATEPCHFLAG) /c VTM2.C

$(PROJ).EXE::	VTM2.OBJ $(OBJS_EXT) $(DEFFILE)
	echo >NUL @<<$(PROJ).CRF
VTM2.OBJ +
$(OBJS_EXT)
$(PROJ).EXE
$(MAPFILE)
e:\msvc\lib\+
e:\msvc\mfc\lib\+
c:\msvc\lib\+
c:\msvc\mfc\lib\+
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
