#
!INCLUDE dtpcmacr.mak
# file: makefile for the DECtalk Express boot code
#
# system:
#	PC DOS
#	Microsoft MASM 6.0
#	NMAKE
#
JMPTARGET=4f00
JMPTARGET1=4f01
LINKOPTS=/CO
DBGLINKOPTS=/m
MONLINKOPTS=/m
#
# Note: If you have trouble getting list files with MASM when including
#	the LCA.ASM code (in some base modules), just make the nolist
#	condition a default.
#
#	Having some extented memory around will make it possible to get
#	through this problem as mlx is automatically invoked. Make sure
#	you have a current version of himem.sys loaded in config.sys before
#	any mlx stuff is tried. MASM has been known to hang with this
#	sort of problem.
#
# Next line is an option set which does not specify any LST files
#
#MLOPTS=-c -Sg -Zi -nologo 
#
# Next line calls for LST files to be generated
#
MLOPTS=-c -Fl -Sg -Zi -nologo -Sp66 -Sl132 
#MLOPTS=-c -Fl -Sg -Zi -nologo -Sp90 -Sl132
#OBJECTS=t00.obj t09.obj l0.obj l1.obj l2.obj l3.obj l4.obj l5.obj reset.obj menu.obj q0.obj h0.obj u01.obj u02.obj dump.obj
MONOBJ1=m0.obj r0.obj m1.obj m2.obj m3.obj dt.obj c0.obj p0.obj int.obj io.obj g.obj cp.obj b.obj his.obj sym.obj ld.obj
MONOBJ2=dmp.obj ex.obj st.obj hlp.obj ctl.obj t.obj lr.obj lw.obj fill.obj mt.obj x.obj pr.obj ma.obj mp.obj
incs=*.inc
#
MKROMLINKOPTS=/NOLOGO /M
HALINKOPTS=/NOLOGO /M
HAOBJECTS=ha.obj
EHLINKOPTS=/NOLOGO /M
EHOBJECTS=eh.obj
HOLINKOPTS=/NOLOGO /M
HOOBJECTS=ho.obj
LCADTOBJECTS=lcadate.obj
LCADTLINKOPTS=/NOLOGO /M

#
# mpost monitor ['mk all']
#
all : mon.hex


#
# local utilities ['mk utils']
#
utils : eh.exe 

#
# make mpost objects
#
objs : $(MONOBJ1) $(MONOBJ2)

#
# make mpost hex image
#
mon : mon.hex

#
# Local utility descriptions
#

eh.exe : $(EHOBJECTS)
	@echo **cl -Feeh.exe $(EHOBJECTS)
	@cl -Feeh.exe -nologo $(EHOBJECTS)

eh.obj : eh.h eh.c
	@echo **cl -c eh.c
	@cl -c -nologo eh.c


#
# real mode default int handler
#
r0.obj : r0.asm $(INCS)
	@echo **ml $(MLOPTS) r0.asm
        @$(MASM_PATH)\bin\ml $(MLOPTS) r0.asm

m0.obj : m0.asm lca.asm $(INCS)
	@echo **ml $(MLOPTS) m0.asm
        @$(MASM_PATH)\bin\ml $(MLOPTS) m0.asm

m1.obj : m1.asm $(INCS)
	@echo **ml $(MLOPTS) m1.asm
        @$(MASM_PATH)\bin\ml $(MLOPTS) m1.asm

m2.obj : m2.asm datetime.asm $(INCS) 
	@echo **ml $(MLOPTS) m2.asm
        @$(MASM_PATH)\bin\ml $(MLOPTS) m2.asm

m3.obj : m3.asm $(INCS)
	@echo **ml $(MLOPTS) m3.asm
        @$(MASM_PATH)\bin\ml $(MLOPTS) m3.asm

dt.obj : dt.asm $(INCS)
	@echo **ml $(MLOPTS) dt.asm
        @$(MASM_PATH)\bin\ml $(MLOPTS) dt.asm

p0.obj : p0.asm $(INCS)
	@echo **ml $(MLOPTS) p0.asm
        @$(MASM_PATH)\bin\ml $(MLOPTS) p0.asm

dmp.obj : dmp.asm $(INCS)
	@echo **ml $(MLOPTS) dmp.asm
        @$(MASM_PATH)\bin\ml $(MLOPTS) dmp.asm

ex.obj : ex.asm $(INCS)
	@echo **ml $(MLOPTS) ex.asm
        @$(MASM_PATH)\bin\ml $(MLOPTS) ex.asm

t.obj : t.asm $(INCS)
	@echo **ml $(MLOPTS) t.asm
        @$(MASM_PATH)\bin\ml $(MLOPTS) t.asm

ctl.obj : ctl.asm $(INCS)
	@echo **ml $(MLOPTS) ctl.asm
        @$(MASM_PATH)\bin\ml $(MLOPTS) ctl.asm

hlp.obj : hlp.asm $(INCS)
	@echo **ml $(MLOPTS) hlp.asm
        @$(MASM_PATH)\bin\ml $(MLOPTS) hlp.asm

st.obj : st.asm $(INCS)
	@echo **ml $(MLOPTS) st.asm
        @$(MASM_PATH)\bin\ml $(MLOPTS) st.asm

c0.obj : c0.asm $(INCS)
	@echo **ml $(MLOPTS) c0.asm
        @$(MASM_PATH)\bin\ml $(MLOPTS) c0.asm

fill.obj : fill.asm $(INCS)
	@echo **ml $(MLOPTS) fill.asm
        @$(MASM_PATH)\bin\ml $(MLOPTS) fill.asm

lr.obj : lr.asm $(INCS)
	@echo **ml $(MLOPTS) lr.asm
        @$(MASM_PATH)\bin\ml $(MLOPTS) lr.asm

lw.obj : lw.asm $(INCS)
	@echo **ml $(MLOPTS) lw.asm
        @$(MASM_PATH)\bin\ml $(MLOPTS) lw.asm

mt.obj : mt.asm $(INCS)
	@echo **ml $(MLOPTS) mt.asm
        @$(MASM_PATH)\bin\ml $(MLOPTS) mt.asm

ma.obj : ma.asm $(INCS)
	@echo **ml $(MLOPTS) ma.asm
        @$(MASM_PATH)\bin\ml $(MLOPTS) ma.asm

mp.obj : mp.asm $(INCS)
	@echo **ml $(MLOPTS) mp.asm
        @$(MASM_PATH)\bin\ml $(MLOPTS) mp.asm

io.obj : io.asm $(INCS)
	@echo **ml $(MLOPTS) io.asm
        @$(MASM_PATH)\bin\ml $(MLOPTS) io.asm

x.obj : x.asm $(INCS)
	@echo **ml $(MLOPTS) x.asm
        @$(MASM_PATH)\bin\ml $(MLOPTS) x.asm

g.obj : g.asm $(INCS)
	@echo **ml $(MLOPTS) g.asm
        @$(MASM_PATH)\bin\ml $(MLOPTS) g.asm

cp.obj : cp.asm $(INCS)
	@echo **ml $(MLOPTS) cp.asm
        @$(MASM_PATH)\bin\ml $(MLOPTS) cp.asm

int.obj : int.asm $(INCS)
	@echo **ml $(MLOPTS) int.asm
        @$(MASM_PATH)\bin\ml $(MLOPTS) int.asm

b.obj : b.asm $(INCS)
	@echo **ml $(MLOPTS) b.asm
        @$(MASM_PATH)\bin\ml $(MLOPTS) b.asm

pr.obj : pr.asm $(INCS)
	@echo **ml $(MLOPTS) pr.asm
        @$(MASM_PATH)\bin\ml $(MLOPTS) pr.asm

his.obj : his.asm $(INCS)
	@echo **ml $(MLOPTS) his.asm
        @$(MASM_PATH)\bin\ml $(MLOPTS) his.asm

ld.obj : ld.asm $(INCS)
	@echo **ml $(MLOPTS) ld.asm
        @$(MASM_PATH)\bin\ml $(MLOPTS) ld.asm

sym.obj : sym.asm $(INCS)
	@echo **ml $(MLOPTS) sym.asm
        @$(MASM_PATH)\bin\ml $(MLOPTS) sym.asm

#
# monitor objects linked
#

mon.exe : datetime $(MONOBJ1) $(MONOBJ2)
	@echo link $(MONLINKOPTS) @mon.lnk
	@link $(MONLINKOPTS) @mon.lnk

datetime :
        mkdate > datetime.asm


mon.hex : mon.exe
	@echo **eh -jmp $(JMPTARGET) -limit ROM_CODEP mon.exe mon.hex mon.map
	@eh -verbose -dhdr -kb 4ef0 -xadr 70000 -jmp $(JMPTARGET) -limit ROM_CODEP mon.exe mon.hex mon.map

