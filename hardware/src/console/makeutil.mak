#
!INCLUDE dtpcmacr.mak
#
#
# need to point these at the watcom and phar-lap tools..
wcc = $(WATCOM_PATH)\bin\wcc386p
winclude = $(WATCOM_PATH)\h
wlib = $(WATCOM_PATH)\lib386\dos
plink = $(PHAR_PATH)\bin\386link
disasm = $(WATCOM_PATH)\binb\wdisasm
asm = $(PHAR_PATH)\bin\386asm


.suffixes:


all : destart.flr blast.flr pd_test2.flr fastload.hxo


destart.flr : destart.exp exp2flr.exe
	exp2flr -i destart.exp -o destart.flr -b 71000

blast.flr : blast.exp exp2flr.exe
	exp2flr -i blast.exp -o blast.flr -b 70000

pd_test2.flr : pd_test2.exp exp2flr.exe
	exp2flr -i pd_test2.exp -o pd_test2.flr -b 72000

fastload.hxo : fastload.exp exp2hex2.exe
	exp2hex2 -i fastload.exp -o fastload.hxo -b 90000

exp2flr.exe : exp2flr.c
	cl -AC exp2flr.c

exp2hex2.exe : exp2hex2.c
	cl -AC exp2hex2.c


fastload.obj : fastload.c
	$(wcc) /d1/mf/3s/oi/s/zl/i=$(winclude)   fastload.c

fastload.exp : fastload.obj
	$(plink) fastload -nostub -386 -offset 090000h -map fastload -sw -fullseg -nochecksum -libpath $(wlib)
	$(disasm) /l /s=fastload.c fastload.obj


# we assume we'll have to link here.. 
blast.exp : blast.c  pd.h
	$(wcc) /d1/mf/3s/oi/s/zl/i=$(winclude) blast.c
	$(plink) blast -nostub -386 -offset fe000h -map blast -sw -fullseg -nochecksum -libpath $(wlib)
	$(disasm) /l /s=blast.c blast.obj


destart.exp : destart.asm tss.asm de.asm
	$(asm) destart.asm -LIST destart.lst
	$(plink) destart -nostub -386 -offset fe000h -map destart -sw -fullseg -nochecksum -libpath $(wlib)

pd_test2.exp : pd_test2.c pd.h
	$(wcc) /d1/mf/3s/oi/s/zl/i=$(winclude) pd_test2.c
	$(plink) pd_test2 -nostub -386 -offset fe000h -map pd_test2 -sw -fullseg -nochecksum -libpath $(wlib)
	$(disasm) /l /s=pd_test2.c pd_test2.obj


	



