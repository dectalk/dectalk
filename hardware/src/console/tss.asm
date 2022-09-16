; this defines a TSS with an attached IOPB having the first 0x300
; ports accessible.



TSS	STRUC	;1	; a task-state segment
 link	DW	0
 	DW	0
 _esp0	DD	0
 _ss0	DW	0
 	DW	0
 _esp1	DD	0
 _ss1	DW	0
 	DW	0
 _esp2	DD	0
 _ss2	DW	0
 	DW	0
 _cr3	DD	0
 _eip	DD	0
 _eflags	DD	0
 _eax	DD	0
 _ecx	DD	0
 _edx	DD	0
 _ebx	DD	0
 _esp	DD	0
 _ebp	DD	0
 _esi	DD	0
 _edi	DD	0
 _es	DW	0
 	DW	0
 _cs	DW	0
 	DW	0
 _ss	DW	0
 	DW	0
 _ds	DW	0
 	DW	0
 _fs	DW	0
 	DW	0
 _gs	DW	0
 	DW	0
 _ldt	DW	0
 	DW	0
 tbit	DW	0
 iopb_o	DW	068h
 iopb	DB	((0300h/8)+1) dup (0)
	DB	0ffh	;386 restriction..
TSS	ENDS

