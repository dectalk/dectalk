;+
; File: m1.asm
;
; Purpose: microPOST, prepare to enter protected mode
;
; Edits:
;
; 001 07-Dec-1991 RAO Creation, adapted from rootpram.asm
; 002 08-Dec-1991 RAO Added cs descriptor based at 32 bit segments
; 003 10-Dec-1991 RAO Save cpu id after reset
; 004 17-Dec-1991 RAO Change gdt table init
; 005 26-Dec-1991 RAO Fixed selector choice in IDT gates
; 007 27-Dec-1991 RAO Added CS gdt entry to cover loadable code units
; 008 08-Jan-1992 RAO Fix idt ptr to default prot_handler address
; 009 24-Jan-1992 RAO Added function interrupt ptr
;	16jul93	tek	initial for PD
;	21mar96	tek	fix RAM preconditioning.
;	09apr96	tek	jam default values into the int controller to
;			mask all ints.
;	22apr96	tek	fix address of PIC1
;-
	title	micrPOST m1
	.xlist
	include am00.inc
	include	am05.inc
	include	am07.inc
	include	amsegs32.inc
	include	limits.inc
	include	segass16.inc
	include	82C315A.inc
	include com.inc
	.list

IRQ0_VEC	equ	020h		; irq0 vector..

PIC0		equ	020h		; interrupt controllers.
PIC1		equ	0a0h

BIT0		equ	001h
BIT1		equ	002h
BIT2		equ	004h


	public	xfer		; allows jump from m0 module
	public	gdt_base,gdt_end
	public	xx

ROM_Code	SEGMENT

	extrn	real_int_table:near
	extrn	pint_00:near,pint_01:near,pint_02:near,pint_03:near,pint_04:near
	extrn	pint_05:near,pint_06:near,pint_07:near,pint_08:near,pint_09:near
	extrn	pint_10:near,pint_11:near,pint_12:near,pint_13:near,pint_14:near
	extrn	pint_15:near,pint_16:near,pint_17:near
	extrn	pint_reserved:near,pint_user:near
	extrn	pint_funcs:near

	extrn	start_prot:near
	extrn	chip_id:near,base_32bit:near	; in low ram
	extrn	base_of_ram:near
;+
; Assumptions about entering protected mode:
;
;	* microPOST will use flat model with...
;		no paging
;		no multi-tasking
;	* GDT is created which contains:
;		Code segment descriptor
;		Data segment descriptor
;	* Base address/limit for GDT loaded into GDTR
;	* IDT, gate for NMI interrupt handler created
;	* Base address/limit for IDT loaded into IDTR
;	* Set PE bit in CR0
;	* Jmp to flush pre-fetch/decode
;	* Reload all seg registers (actually in the m2 module)
;	* Continue at CPL 0
;-

;+
; The gdt[1] entry is the descriptor for the code segment
;
; at base 0ffff0000	(watch out for offsets in cs)
; granularity = 4096,
; default size = 32 bits
; present
; dpl = 0
; data/code
; type = execute/read, accessed
; segment limit = 16 (16*4096=64K)
;
;
; The gdt[2] entry is the descriptor for the data segment
;
; at base 000000
; type = read/write,accessed
; segment limit = fffff (16*ffff => 4 gigabytes)
;
; The gdt[3] entry is the descriptor for 32bit code which may reside
; anywhere in the address space. Useful for loadable code sequences.
;
; at base 00000000
; granularity = 4096
; default size = 32 bits
; present
; dpl = 0
; type = execute/read, accessed
; data/code
; segment limit = fffff (16*ffff => 4 gigabytes)
;
; The gdt[4] entry is the descriptor for the 32bit code segment
;
; at base 0ffff0000 + offset start_prot
; granularity = 1 byte
; default size = 32 bits
; present
; dpl = 0
; data/code
; type = execute/read, accessed
; segment limit = 64K - offset start_prot
;
; To access the selectors, try these record expressions:
;
;	Rselector	<1,0,0>		; index = 1, gdt, rpl = 0
;	Rselector	<2,0,0>		; index = 2, gdt, rpl = 0
;	Rselector	<3,0,0>		; index = 3, gdt, rpl = 0
;	Rselector	<4,0,0>		; index = 3, gdt, rpl = 0
;-

;+
; gdt gets built here, in ROM, some hacks are required
;-

gdt_base	dd	0	; null selector
gdt_base_1	dd	0	; null selector
;
; ------- Code segment (based at ffff0000), used for 16bit segs
;
	dw	0fh		; segment limit
	dw	0		; segment base (low bits)
gdt_csbits	dd	Rgdt_b	<0ffh,cdes_Gbit,cdes_Dbit,0,0,0,	\
			cdes_Pbit,cdes_DPL,cdes_Sbit,cdes_TYP,		\
			cdes_Abit,0ffh>
;
; ------- Data segment (all of memory space, 0 to ffffffff)
;

gdt_ds		dd	0ffffh	; gdt[2]
gdt_dsbits	dd	Rgdt_b	<0,ddes_Gbit,ddes_Dbit,0,0,0fh,		\
			ddes_Pbit,ddes_DPL,ddes_Sbit,ddes_Typ,		\
			ddes_Abit,0>
;
; ------- Code segment (all of memory space, 0 to ffffffff)
;
gdt_csload	dd	0ffffh	; gdt[3]
gdt_cslbits	dd	Rgdt_b	<0,cdes_Gbit,cdes_Dbit,0,0,0fh,		\
			cdes_Pbit,cdes_DPL,cdes_Sbit,cdes_TYP,		\
			cdes_Abit,0>

;
; ------- Code segment (based at ffff0000+ start_prot), used by 32bit segs
;
gdt_csp:	; next two words won't assemble...
;	dw	0ffffh - (offset start_prot) + 1; segment limit
;	dw	offset start_prot		; segment base (low bits)
	dw	0		; fixup later
	dw	0		; fixup later
gdt_cspbits	dd	Rgdt_b	<0ffh,0,cdes_Dbit,0,0,0,	\
			cdes_Pbit,cdes_DPL,cdes_Sbit,cdes_TYP,		\
			cdes_Abit,0ffh>

gdt_end	equ	this byte

gdt_ptr_limit	dw	(offset gdt_end)-(offset gdt_base)-1	; limit, 16 bits
gdt_ptr_base	dd	GDT_IN_RAM	; base address, 32 bits total

idt_ptr_limit	dw	(256*8)-1
idt_ptr_base	dd	IDT_IN_RAM	; base address, 32 bits total

;+
; ..... tables in the code space end here
;-
	EXTRN	setup_end:near

xfer:
	cli	; (tek) no interrupts please.
	xor	eax, eax			; get a 0 (tek)
	mov	cr0, eax			; clear cr0 (tek)
; note that we should already be in real mode when we get here; if somehow
; we weren't, we might well end up in the weeds when we turned paging/seg off.
; (tek)

	mov	ebx,edx				; save CPU id

; init the interrupt controller to a default setup and mask all ints.
; (tek 040996)
	;/* set up the interrupt controller to interrupt */
	mov	al, 011h
	out	PIC0, al	;/* ICW1: ICW4 needed*/
	
	;/* figure out the offset bits t7-t3 */
	mov	al, IRQ0_VEC
	and	al, 0f8h
	out	PIC0+1, al	;/* ICW2: set offset */

	;/* define the cascade IRQ */
	mov	al, BIT2
	out	PIC0+1, al	;/* ICW3: slave on irq2 */

	;/* set the mode.. */
	mov	al, BIT0
	out	PIC0+1, al	;/* ICW4: this is an 8086 */


	;/* same for the slave.. */
	;/* set up the interrupt controller to interrupt */
	mov	al, 011h
	out	PIC1, al	;/* ICW1: ICW4 needed*/
	
	;/* figure out the offset bits t7-t3 */
	mov	al, IRQ0_VEC+8
	and	al, 0f8h
	out	PIC1+1, al	;/* ICW2: set offset */

	;/* define the slave's IRQ */
	mov	al, 02h
	out	PIC1+1, al	;/* ICW3: slave on irq2 */

	;/* set the mode.. */
	mov	al, BIT0
	out	PIC1+1, al	;/* ICW4: this is an 8086 */


	;/* mask everything */
	mov	al, 0ffh
	out	PIC0+1, al
	out	PIC1+1, al



;+ (tek)
; we need to init the 82C315A here to get RAM. 
;-

	write315	C_RAMMAP,1	; 1 bank of 256kbit, no remap.
	write315	C_RAMSET,13h	; 1 wait state, page mode, 
					; no parity, extra RAS off.

	write315	C_REFCTL,4	; CBR refresh, 15us.
	write315	C_SLTPTR,010h	; everything above 1M is on the
					; SD bus

	write315	C_MCDCTL,0	; no PCMCIA cards.

;+ (tek)
; we should do a little more initialization too, before we get too far.
;-
        write315        C_ROMDMA, 058h  ; 1 ROMWS, 4 DMA8WS, 3 DMA16ws
                                        ; std MEMR timing, sysclk/2
        write315        C_CLKCTL, 03h   ; sysclk = tclk2 / 8
        write315        C_SLPCTL, 02dh  ; x/64 while sleeping
        write315        C_BUSCTL2, 085h ; clk2 in sleep, DMA power mgd, 
                                        ; extra WS for bus accesses.
        write315        C_KBDCTL, 042h  ; kbd ctl off

;+ (tek)
; fire up the timer for refresh..
;-
	; tek 3/21/96 set it to run real fast, and let it do the 
	; preconditioning cycles; then we'll set it to run slower.
	mov	al, 074h	; ctr 1, LSB first, mode 4
	mov	dx, 043h	; control word
	out	dx, al
	mov	al, 002h	; about 2us/refresh
	mov	dx, 041h	; Init Count 1
	out	dx, al	; lsB
	xor	ax,ax
	out	dx, al	; msB

	; hang out for at least 16us so that we get 8 cycles. A ROM
	; access takes around 200us, so we need to read the rom around
	; 80 times.. we're fetching from ROM, so 40 passes through a
	; ROM read loop should be enough..

	mov	ax, 40
@@:	nop
	nop
	nop
	nop
	dec	ax
	jnz	@b

	; now set the count for normal operation..
	mov	al, 074h	; ctr 1, LSB first, mode 4
	mov	dx, 043h	; control word
	out	dx, al
	mov	al, 010h	; 15.6us
	mov	dx, 041h	; Init Count 1
	out	dx, al	; lsB
	xor	ax,ax
	out	dx, al	; msB


myloop1:
	; turn on the DSP power, etc..
	xor	edx, edx
	mov	dx, GPIOPORT
	mov	al, gpio_dspreset	; v5b on, dspreset.
	out	dx, al
;
;
	; release the DSp reset
;	xor	edx, edx
;	mov	dx, GPIOPORT
;	mov	al, 0			; v5b on, no dspreset.
;	out	dx, al
;
;	jmp	myloop1


;+ (tek)
; OK, we should have the lower 640K of memory available.
; later, use the *AXS registers to get the last 384K enabled.
; Parity is off, so we don't have to write memory first to clean it
; up. None of the other stuff is set up yet.
;-

; need to turn on all but the last 64k of memory..
	write315	C_ABAXS, 0ffh
	write315	C_CAXS, 0ffh
	write315	C_DAXS, 0ffh
	write315	C_FEAXS, 00fh



; just to try to get rid of a nagging problem that seems to be related to
; an uninitialized variable *somewhere*, clear memory here.. (well, all but
; the last 64K..)

; if we got here on a reset from the code, then don't clear memory.
	; decide what to do.
	mov	edx,092h	; reset port. ('port A')
	in	al,dx
	and	al,1
	jnz	no_mem_init

	mov	edx,COMPORT+com_modem_status
	in	al,dx		; read the msr
	and	al,MSR_RI	; look at RI
	jnz	no_mem_init	; not if we took the backdoor..


	
	; although we have 32-bit registers, in real mode we have
	; to obey 8086 segment rules.. soo...
	cld			; go forward..
	xor	eax, eax
	mov	ebx, eax	; we'll update ES from here..
@@:	mov	es, bx		; start at seg 0..
	mov	edi, eax	; offset 0..
	mov	ecx, 08000h	; this many words..
	rep	stosw	
	add	ebx, 01000h	; next 64k
	cmp 	ebx, 0f000h	; limit
   	jl	@b

	
no_mem_init:
	
	
	
;+
; set stack (in case an int happens)
;
; copy idt entries from rom table <TBS> and just don't fault or INT
;
; Note: the usefulness of this effort is short-lived. We'll set the prot
; mode idt entries very soon...
;-
	mov	ax,0
	mov	ss,ax
	mov	sp,STACK_TOP			; real-mode stack at 0:fffc
	mov	es,ax				; target (0 based)

	assume	es:ROM_DataP

	xor	eax,eax
	mov	ax,offset chip_id
	mov	dx,offset base_of_ram		; hack to get offset in
	sub	ax,dx
	mov	es:[eax],ebx			; save cpu id

	assume	es:ROM_Data

	mov	ax,cs			; source
	mov	ds,ax			;   from rom table

	xor	esi,esi
	mov	edi,esi
	mov	si,offset real_int_table; source ptr (target ptr = 0)
	mov	ecx,256			; # of entries

	rep	movsd

;+
; load the gdtr after copying gdt to RAM
;-
	mov	ax,0
	mov	ds,ax

	xor	esi,esi
	mov	ecx,esi

	mov	si,offset gdt_base	; offset in CS
	mov	cx,(offset gdt_end)-(offset gdt_base)+1 ; # bytes to move
	mov	edx,GDT_IN_RAM		; gdt will reside in RAM at this loc
	; make sure we can access this in a 64K segment..
	xor	eax,eax
	mov	es,ax
	mov	eax, edx
	and	eax, 0000f0000h
	je	segok1			; in bottom 64k
	sar	eax,4			; calculate new seg..
	mov	es,ax			; use the ES register..
	and	edx, 0ffffh    		; bring into 64k range..

segok1:
@@:	mov	al,cs:[esi]
	mov	es:[edx],al
	inc	edx
	inc	esi
	loop	@b
	sub	edx,9			; reset ptr to base/limit of last
					; descriptor entry of gdt (in RAM)
					; (-1) for post increment loop
					; (-8) to get to the 1st word
;+
; fixup the base/limit of the last descriptor
;-
xx:
	xor	eax,eax
	mov	ebx,eax
	
	mov	ebx,offset start_prot	; ebx now contains start_prot
					; saved for later use
	assume	ds:ROM_DataP

	mov	edi,offset base_of_ram
	mov	eax,offset base_32bit
	sub	eax,edi			; hack to get address ROM_DataP
	; the usual segment crap..
	mov	ecx, eax
	and	ecx, 0f0000h
	sar	ecx,4			; paras..
	mov	fs, ecx
	and	eax, 0ffffh
	mov	fs:[eax],ebx		; save address of start_prot

	assume	ds:ROM_Data

	mov	eax,ebx			; start_prot
	neg	eax			; segment limit (-1 * start_prot)
	mov	es:[edx],ax		; [segment limit]->to gdt entry in RAM
	add	edx,2			; bump ptr
	mov	es:[edx],bx		; [segment base] (low bits) ->gdt entry
	add	edx,2

	lgdt	fword ptr cs:gdt_ptr_limit

;+
; Now, load the prot mode handlers
;-

	mov	edx,Rgate_b <0,1,0,0,CPU_INT_GATE,0,0>

	mov	ecx,256			; number of entries
	mov	eax,0			; index into target
	mov	ds,ax
	mov	es,ax			; assume first 64k for now

	mov	esi,IDT_IN_RAM		; base of target
	
	mov	eax, esi

	; check for segment problems..
	and	eax, 0000f0000h
	je	segok2
	; fix up ES
	sar	eax, 4			; paragraphs
	mov	es, ax
	; fix up the pointer to 64k
	mov	eax, esi
	and	eax, 0ffffh
	mov	esi, eax

segok2:

	xor	ebx,ebx
	mov	bx,Rselector	<4,0,0>		; index = 4, gdt, rpl = 0
	shl	ebx,16				; selector in high word

;
; fill idt with entries for interrupts 0..17
; (tek) this should be enough for us; we should limit the IDT to this
; (tek) size so we don't waste RAM..
;
	xor	eax, eax			; start at 0
	mov	bx,offset pint_00		; handler for one int
	sub	bx,offset start_prot		; offset relative to gdt[4]

	mov	es:[esi][eax*4],ebx		; move 1st part of gate descriptor
	inc	eax				; bump target index
	mov	es:[esi][eax*4],edx		; move 2nd part
	inc	eax				; bump target index

	mov	bx,offset pint_01		; handler for one int
	sub	bx,offset start_prot		; offset relative to gdt[4]

	mov	es:[esi][eax*4],ebx		; fill idt
	inc	eax
	mov	es:[esi][eax*4],edx
	inc	eax

	mov	bx,offset pint_02		; handler for one int
	sub	bx,offset start_prot		; offset relative to gdt[4]

	mov	es:[esi][eax*4],ebx		; fill idt
	inc	eax
	mov	es:[esi][eax*4],edx
	inc	eax

	mov	bx,offset pint_03		; handler for one int
	sub	bx,offset start_prot		; offset relative to gdt[4]
	mov	es:[esi][eax*4],ebx		; fill idt
	inc	eax
	mov	es:[esi][eax*4],edx
	inc	eax

	mov	bx,offset pint_04		; handler for one int
	sub	bx,offset start_prot		; offset relative to gdt[4]

	mov	es:[esi][eax*4],ebx		; fill idt
	inc	eax
	mov	es:[esi][eax*4],edx
	inc	eax

	mov	bx,offset pint_05		; handler for one int
	sub	bx,offset start_prot		; offset relative to gdt[4]

	mov	es:[esi][eax*4],ebx		; fill idt
	inc	eax
	mov	es:[esi][eax*4],edx
	inc	eax

	mov	bx,offset pint_06		; handler for one int
	sub	bx,offset start_prot		; offset relative to gdt[4]

	mov	es:[esi][eax*4],ebx		; fill idt
	inc	eax
	mov	es:[esi][eax*4],edx
	inc	eax

	mov	bx,offset pint_07		; handler for one int
	sub	bx,offset start_prot		; offset relative to gdt[4]

	mov	es:[esi][eax*4],ebx		; fill idt
	inc	eax
	mov	es:[esi][eax*4],edx
	inc	eax

	mov	bx,offset pint_08		; handler for one int
	sub	bx,offset start_prot		; offset relative to gdt[4]

	mov	es:[esi][eax*4],ebx		; fill idt
	inc	eax
	mov	es:[esi][eax*4],edx
	inc	eax

	mov	bx,offset pint_09		; handler for one int
	sub	bx,offset start_prot		; offset relative to gdt[4]

	mov	es:[esi][eax*4],ebx		; fill idt
	inc	eax
	mov	es:[esi][eax*4],edx
	inc	eax

	mov	bx,offset pint_10		; handler for one int
	sub	bx,offset start_prot		; offset relative to gdt[4]

	mov	es:[esi][eax*4],ebx		; fill idt
	inc	eax
	mov	es:[esi][eax*4],edx
	inc	eax

	mov	bx,offset pint_11		; handler for one int
	sub	bx,offset start_prot		; offset relative to gdt[4]

	mov	es:[esi][eax*4],ebx		; fill idt
	inc	eax
	mov	es:[esi][eax*4],edx
	inc	eax

	mov	bx,offset pint_12		; handler for one int
	sub	bx,offset start_prot		; offset relative to gdt[4]

	mov	es:[esi][eax*4],ebx		; fill idt
	inc	eax
	mov	es:[esi][eax*4],edx
	inc	eax

	mov	bx,offset pint_13		; handler for one int
	sub	bx,offset start_prot		; offset relative to gdt[4]

	mov	es:[esi][eax*4],ebx		; fill idt
	inc	eax
	mov	es:[esi][eax*4],edx
	inc	eax

	mov	bx,offset pint_14		; handler for one int
	sub	bx,offset start_prot		; offset relative to gdt[4]

	mov	es:[esi][eax*4],ebx		; fill idt
	inc	eax
	mov	es:[esi][eax*4],edx
	inc	eax

	mov	bx,offset pint_15		; handler for one int
	sub	bx,offset start_prot		; offset relative to gdt[4]

	mov	es:[esi][eax*4],ebx		; fill idt
	inc	eax
	mov	es:[esi][eax*4],edx
	inc	eax

	mov	bx,offset pint_16		; handler for one int
	sub	bx,offset start_prot		; offset relative to gdt[4]

	mov	es:[esi][eax*4],ebx		; fill idt
	inc	eax
	mov	es:[esi][eax*4],edx
	inc	eax

	mov	bx,offset pint_17		; handler for one int
	sub	bx,offset start_prot		; offset relative to gdt[4]

	mov	es:[esi][eax*4],ebx		; fill idt
	inc	eax
	mov	es:[esi][eax*4],edx
	inc	eax

;
; fill idt with entries for interrupts 18..32 (Intel reserved)
;

	mov	ecx,15				; 18..32 count
	mov	bx,offset pint_reserved		; handler for all reserved
	sub	bx,offset start_prot		; offset relative to gdt[4]

@@:	mov	es:[esi][eax*4],ebx		; fill idt
	inc	eax
	mov	es:[esi][eax*4],edx
	inc	eax
	loop	@b				; fill table with reserved

;
; fill idt with entries for interrupts 33..255 (user)
;
	mov	ecx,223				; 33..255 count
	mov	bx,offset pint_funcs		; handler for mPOST functions
	sub	bx,offset start_prot		; offset relative to gdt[4]

	mov	es:[esi][eax*4],ebx		; fill idt
	inc	eax
	mov	es:[esi][eax*4],edx
	inc	eax
	dec	ecx				; track loop count

	mov	bx,offset pint_user		; handler for general user ints
	sub	bx,offset start_prot		; offset relative to gdt[4]

@@:	mov	es:[esi][eax*4],ebx		; fill idt
	inc	eax
	mov	es:[esi][eax*4],edx
	inc	eax
	loop	@b				; fill table with user stuff

	mov	ax,gs
	mov	ds,ax				; restore for putstr

	lidt	fword ptr cs:idt_ptr_limit

	jmp	setup_end

ROM_Code	ENDS
	end
