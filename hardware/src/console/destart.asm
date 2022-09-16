TITLE	DECtalk Express preload init and interrupt passthru    z
	NAME	Startup
; 20mar96	...tek	don't use GS to save the loader cookie.
;			add some guard words
;
;  This file does some simple checks and gets us into the land of
;  'c' as soon as possible ...
;
	.386P
;	.model  flat
;	dosseg
	include tss.asm
	include	de.asm



; force the ordering..
codeseg
cseg	ENDS
dataseg
dseg	ENDS


	; macro for generating the interrupt reflect entry code..
reftab	MACRO	start, count
	herel=start
	sizel=0
	align	4
int_table:
	REPT	count
	last=$
	push	eax
	mov   	eax, herel
	jmp	NEAR PTR reflect_int
	
	sizel = $-last
	herel = herel+1
	ENDM
ENDM


START_LOAD_ADDR	equ 	0400h
CODE_ROM	equ	0c00000h
DATA_ROM1	equ	0d00000h
DATA_ROM2	equ	0e00000h

;
;
;  Keep the linker, locator, etc, happy (I hate warning messages)...
;
dataseg
;	.data
	public	start_prot_data, end_prot_data
start_prot_data	dw	0
public	GDTlow, IDTlow, TSSsel, start_cs, l0stack, _tss
	; tek 3/20/96 move this stuff ahead of the TSS to fill the align
	; block..
	dd	0badfeedh	; guard
	align	16	; just to be nice..
GDTlow	DW	0	; limit
GDThi	dd	0	; base

	dd 	01badfeedh	; guard
	align	16	; nice again
IDTlow	DW	0	; limit
IDThi	dd	0	; base

	dd	2badfeedh 	; more guard/nice
	align	16
TSSsel	DW	0

	dd	3badfeedh 	; more guard/nice
	align	16
temp	dd	0
	DW	0

	dd	4badfeedh 	; more guard/nice



	align	128
_tss	TSS <>		; this is the tss

	dd	5badfeedh 	; more guard/nice
	dd	0
	align	16

; handy temp qword..
temp2	DQ	0
; so that we can use the MUL instruction..
factor	DB	0
temp2a	DW	0

	align	4
; load image info
start_cs	dw	0
start_ip	dw	0
start_ss	dw	0
start_sp	dw	0
start_image	dd	0
image_size	dd	0

	align	4
what_vec	dw	0

	align	4
call_ax	DW	0
call_bx	DW	0
call_cx	DW	0
call_dx	DW	0
call_di	DW	0
call_si	DW	0

; this is where the stacks go. These stacks aren't really used for
; much, just the interface between protected and v86 mode; so, they
; can be pretty small..
	   

	dd	10 DUP (6badfeedh)
	align	16
	dd	7badfeedh
	dd	128 DUP (0)	; the stack..
l0stack dd	10 DUP (0)
	dd	8badfeedh
end_of_lstack	dw (0)
end_prot_data	dw	0


dseg	ENDS

codeseg
;        .code				

	ASSUME	CS:cseg, DS:dseg
	public	herewego

;
; we got here by being loaded in some random part of memory. There is still
; a GDT and IDT, as well as a stack, defined for us.  Assume that the caller
; set up and tested memory for us. This code contains the interrupt
; reflection code, so it must still exist when the system is running. 
; So, load it waaaay up in the top of memory, above the stacks.    The 
; segment regs are already set up for us.
;


		public	pcdt_start
pcdt_start	proc	far

	cli

done_ram:

		public       _pcdt_init
_pcdt_init	proc 	far

; stomp on the vectors in the IDT for the interrupts that we want
; to reflect. Point these at the reflector code toward the end of this
; module.

; in order to get the size of the vectors (really the stride), we have
; to define the interrupt table before we access it. So, jump
; around it and then come back..

	jmp	load_vecs
	.LALL
	reftab	 020H, 020H	; here's the interrupt pre-dispatch..
	; that left 'sizel' defined equal to the size of a dispatch
	; block..

load_vecs:
	
	; go find the IDT..
	sidt	pword ptr temp2
	mov	eax, dword ptr temp2[2]	; eax = base of IDT.
	add	eax, (020h*8)		; start at the 020h'th entry
	mov	esi, eax		; esi = first IDT we're writing.
	xor	ebx, ebx		; zero the count
	mov	factor,sizel		; the handler scale factor..
loadv:
	mov	eax, ebx		; choose the current entry
	mul	factor			; scale for length
	movzx	ecx,ax
	add	ecx, offset int_table	; addr of the handler.
	mov	eax, ebx		; figure out where to putit
	shl	eax,3			; *8=size of an idt entry
	mov	word ptr [eax][esi], cx; addr 15..0
	sar	ecx,16			; shift the upper bitz down
	mov	word ptr 6[eax][esi], cx; addr 31..16
	mov	cx, cs			; the cs
	mov	word ptr 2[eax][esi], cx; cs
;	mov	cx, 08e00h		; attributes (dpl=0)
	mov	cx, 0ee00h		; attributes (dpl=3)
	mov	word ptr 4[eax][esi], cx; attributes
	inc	ebx			; next vector
	cmp	ebx, 020h		; done yet?
	jl	loadv

; here we have to hook in the special vector that gets us to the 
; protected-mode helper routines.. 
	sidt	pword ptr temp2
	mov	eax, dword ptr temp2[2]	; eax = base of IDT.
	add	eax, (pm_vector*8)		; the entry
	mov	esi, eax		; esi = IDT we're writing.
	lea	ecx, pm_stuff		; the target routine
	mov	word ptr [esi], cx	; addr 15..0
	sar	ecx,16			; shift the upper bitz down
	mov	word ptr 6[esi], cx	; addr 31..16
	mov	cx, cs			; the cs
	mov	word ptr 2[esi], cx	; cs
;	mov	cx, 08e00h		; attributes (dpl=0)
	mov	cx, 0ee00h		; attributes (dpl=3)
	mov	word ptr 4[esi], cx; attributes


;*** don't load the kernel, for now.. assume it's loaded. Put the starting
; ss:sp at 2:0, cs:ip at 6:4.
;	xor	ebx, ebx
;	mov	ax,word ptr 0[ebx]
; 	mov	start_sp, ax
;	mov	ax, word ptr 2[ebx]
;	mov	start_ss, ax
;	mov	ax, word ptr 4[ebx]
;	mov	start_ip, ax
;	mov	ax, word ptr 6[ebx]
;	mov	start_cs, ax
; 	jmp	kernel_loaded

; the fun begins. Load the kernel out of the ROM. 
; remember where the start address, ss, sp, etc are so that
; we can jam it into the TSS/stack and jump into it..

; first, we have to clear memory. Ancient lore says that this must
; be done before trying to run the DECtalk code..

; but we have to make sure we don't stomp on the verbose flag, which lives
; at location 3fe:3ff. 

	mov	ax, ds		; set up es..
	mov	es, ax
	mov	ebx, 03feh	; point to the verbose flag..
	mov 	bx, 0[ebx]	; get it.
	push	 bx		; stash it.
	xor	eax, eax	; move a 0
	xor	edi,edi		; start at 0
	mov	ecx, LAST_USER_ADDR	; the end of usable RAM
	shr	ecx, 2		; because we'll move words
	cld			; forwards
	rep	stosw

; put the verbose flag back..
	pop	ax
	mov	ebx,03feh
	mov	0[ebx],ax


; The first directory entry MUST be for KERNEL.BIN. We don't
; check, we just load.

	mov	ebx, CODE_ROM	; start of the rom
	lea	ebx, dword ptr 04h[ebx] ; start of first entry
	mov	ebx, dword ptr 012h[ebx] ; offset to first byte
	add	ebx, CODE_ROM		; absolute to first byte.
	mov	eax, dword ptr 0[ebx]
	mov	image_size,eax 

	mov	ax,word ptr 0ah[ebx]
	mov	start_ss,ax 
	mov	ax, word ptr 0ch[ebx]
	mov	start_sp,ax	
	mov	ax,word ptr 0eh[ebx]
	mov	start_cs,ax   
	mov	ax,word ptr 010h[ebx]
	mov	start_ip,ax   

	lea	ebx, 012h[ebx]	; now find the actual executable

; move the image. 
	mov	ecx, image_size	; count
	; round up to a full dd..
	add	ecx, 4
	and	ecx, 0fffffffch
	mov	ax, ds
	mov	es, ax		; which should be the same anyway
	mov	esi, ebx	; src
	mov	edi, START_LOAD_ADDR
	; does a string move use the extended regs?? I don't know.
	; so, do it manually for now..
loop1:	mov	edx, dword ptr [esi]
	mov	dword ptr [edi], edx
	add	edi, 4
	add	esi, 4
	sub	ecx, 4
	jnz	loop1	; works because we know its a multiple of 4


kernel_loaded:
; build the TSS and its descriptor..

	lea	eax, l0stack
  	mov	_tss._esp0, eax
	mov	_tss._ss0, ss
	mov	eax, CR3
	mov	_tss._cr3, eax
	mov	_tss._ldt, 0

	; we have to set up a descriptor for the TSS..
	; assume there is enough space in the GDT to tag one on 
	; the end.. 
	sgdt	fword ptr GDTlow
	; the low word has the limit of the GDT and hi the base.
	; seeing as we're all flat, 1-1 mapped we can be pretty
	; cavalier with pointers here..
	; first off, we need to figure out the selector we'll
	; use for our new TSS

	mov	ax, GDTlow
	inc	ax
	mov	bx, ax		; we'll need this later
	mov	TSSsel, ax	; this is the TSS selector.

	; stretch the GDT
	add	GDTlow, 8	; 8 = size of a descriptor..

	; find the start of the descriptor we're writing
	mov	eax, GDThi	; the base..
	movzx	ebx, bx		; the offset from before
	add	eax, ebx	; this is a pointer to the descriptor.
	mov	esi, eax	; in the index register.

	; we'll assemble the upper dword in ecx, seeing as it's such
	; a mess..
	xor	ecx,ecx


	; load the descriptor.. what a pain in the neck..
	mov	DWORD PTR [esi],ecx	; empty it out ..
	mov	DWORD PTR 4[esi],ecx	; empty it out ..

	; load the limit..
	mov	word ptr [esi], ((SIZE _tss)-2) ; byte of 1s on the end!
	; we know bits 19-16 of the limit are zero, so don't bother 
	; setting them..

	; load the base..
	lea	eax, _tss
	mov	word ptr 2[esi], ax ; low 16 bits
	sar	eax, 16		   ; mid 8 bits
	mov	cx,ax			; into the temp..
	sal	eax,16		   ; shift it back up, filled w/0
	or	ecx,eax		   ; and the hi 8 where they belong.
	or	cx,08900h	   ; avail TSS, g=0, DPL=0

	; and finally write it..
	mov	dword ptr 4[esi], ecx

	; reload the GDT
	lgdt	fword ptr GDTlow



	


; jump into the 16-bit code, never to return (save for interrupts..)
; to do this, we have to build a TSS, put initial values for the 
; various registers in either the TSS or on the stack as appropriate, 
; and iret into the 16-bit code. This could take some work..
;
	;OK, we're ready to push the stuff on the stack and roll in 
	; v86-mode..
	; first, we have to hop over to the L3 stack ourselves..
	lea	eax, l0stack
	mov	dword ptr temp[0], eax
	mov	word ptr temp[4], ds

	lss	ESP, fword ptr temp

	; push the values for the various segment registers. I have 
	; no idea what they should be, so I'll make them 0.
	
	xor	eax,eax

	push	eax	;gs
	push	eax	;fs
;	mov	ax, DGROUP
	movzx	eax, start_cs	; ds = cs for this image..
	push	eax	;ds
	xor	eax,eax
	push	eax	;es
	
	; stack segment - ..
	movzx	eax, start_ss
	push	eax	;ss

	;stack ptr
	; this is a little strange. task_start expects a parameter of
	; 1 to tell it to start the kernel unstead of a generic task.
	; We have to push this on the target stack before calling.
	; It's not really clear exactly how this should be done, so we
	; push a few 1's..

	; again, its seg:off, so we need to account for that..
	movzx	ebx, start_sp
  	shl	eax, 4		; paras 2 bytes
	mov	esi, eax
	mov	word ptr [ebx+esi], 1
	sub	ebx, 2
	mov	word ptr [ebx+esi], 1
	sub	ebx, 2
	mov	word ptr [ebx+esi], 1
	sub	ebx, 2
	mov	word ptr [ebx+esi], 1
	sub	ebx, 2
	mov	word ptr [ebx+esi], 1
	push	ebx	; esp

	;EFLAGS, with the VM bit set..
	mov	eax, 023000h ;VM=1, NT=0, IOPL=3
	push	eax	;eflags



	; find the routine we're jumping to and load the info..
	movzx	eax, start_cs
	push	eax			; cs
	movzx	eax, start_ip
	push	eax			; eip

	; load the task register..
	mov 	ax, TSSsel
	ltr	ax

herewego:

; debug..
L$1:	
	; here we go... 
	NOP
	NOP
	IRETD

_pcdt_init	endp
pcdt_start	endp



reflect_int	proc	far

	; 	The V86 IRET will work just like an 8086; this means
	; 	that we have to build an interrupt frame on the PL3
	;	stack that points back at the interrupted CS:IP, muck
	; 	with the CS:IP on the PL0 interrupt frame to point to
	;	the V86 handler (looked up in the vector table at 0),
	;	and then IRET to the handler. That handler, in turn,
	;	should IRET back to the instruction that interrupted
	;	us.

	; we enter with EAX pushed and the vector in (e)ax. 
	; unfortunately, we don't have a DS yet.. 8-(

	push	ax
	mov	ax, ss		; get a segment (hokey..)
				; we can get away with this because
				; everything maps to the same place..
	mov	ds, ax
	pop	ax		; ok, get the int number back.. 
	mov	what_vec, ax

	; push some registers to give us working room..
	push	ebx
	push	esi


	mov	esi, esp
	; find the PL3 stack..
	
	mov	eax, 24[esi]	; PL3 SP

	; but that's in V86 address space, so we gotta add in the
	; segment to get a linear address..
	movzx	ebx, word ptr 28[esi]
	shl	ebx,4		; paras -> bytes
	add	ebx, eax	; this is the stack.. (ebx)

	; put the flags on the stack..
	mov	eax, 20[esi]	; eflags
	sub	ebx,2		; push stack
	mov	[ebx], ax	; flags

	; put the return address on the stack..
	mov	eax, 16[esi]	; cs
	sub	ebx, 2		; push
	mov	[ebx], ax	; CS

	mov	eax, 12[esi]	; EIP
	sub	ebx, 2		; push
	mov	[ebx], ax	; IP

	; update the return stack pointer (32-bit)
	; assume the segment didn't change 8-)
	movzx	eax, word ptr 28[esi]	; the old SS
	shl	eax, 4
	sub	ebx, eax
	mov	24[esi], ebx

	; go get the vector..
	movzx	eax,  what_vec
	mov	ebx, [eax*4]
	; thats cs:ip in the register.
 	movzx	eax,bx
	mov	dword ptr 12[esi], eax	; EIP
	shr	ebx, 16
	mov	16[esi], bx		; CS

	; clear the interrupt flag on the stack (the flags
	; we pushed on the L3 stack will turn them back on 
	; later..
	and	word ptr 20[esi], 0fdffh	; ints off..

	; ok, we're ready.. clean up our temps..
	pop	esi
	pop	ebx
	pop	eax	; remember, this got pushed before entry..

	; this iret should land on the handler routine..


	
	nop
	nop
	
	iretd
	nop
	nop

reflect_int	endp


pm_stuff	proc	far
	; this is where the prot-mode helpers live.
	; the parameters arrive in registers, but they were
	; 16-bit registers when they were loaded.
	; we don't save registers, because this is called by
	; an _int86() call, which expects the registers to die.
	; we don't have a DS right now, but we know it's the 
	; same as SS..
	push	ss
	pop	ds
	; stash all the calling registers safely away..
	mov	call_ax, ax
	mov	call_bx, bx
	mov	call_cx, cx
	mov	call_dx, dx
	mov	call_di, di
	mov	call_si, si
	
	; figure out what we're here to do..
	cmp	al, ABORT
	je	pm_abort
	cmp	al, READROM
	je	pm_readrom
	cmp	al, READROMWORD
	je	pm_readromword
	cmp	al, GETBUFFER
	je	pm_getbuffer
	; not a valid function
	mov	ax, 0ffffh
	jmp	pm_exit

pm_abort:
	hlt
	jmp	pm_exit	

pm_readrom:
	; copy from the code rom to the specified buffer.
	; the base address of the code rom is added to the 
	; starting address, so a starting address of 0
	; get the first location in the ROM.

	; on entry:
	; dest addr	ah:bx	(24-bit flat)
	; src arr	cx:dx	(32-bit flat)
	; count		si	(16-bit unsigned)

	; we need an ES here..
	mov	ax, ds
	mov	es, ax

	movzx	ecx, call_si		; count
	movzx	eax, call_ax		; build the dest addr
	and	eax, 0ff00h		; only ah
	shl	eax,8
	mov	ax, call_bx		; the rest of the addr
	mov	edi, eax		; into the dest ptr
	movzx	eax, call_cx		; the src addr..
	shl	eax, 16
	mov	ax, call_dx
	mov	esi, eax		; into the src pointer
	cld				; Count up..
	; we'd like to move words for best performance, so 
	; we'll first conditionally move a byte to line up
	; the start of the transfer.. the source is probably
	; more important to line up than the dest, because the 
	; dest will be in RAM and will bank-hit the dump-and-run
	; write.. the ROM will get cycled for each byte, which
	; would be way slow..
	test	esi, 1			; odd?
	jz	pm1_even
	; move one byte..
	mov	al,byte ptr es:[esi]
	mov	byte ptr es:[edi], al
	dec	ecx
	inc	edi
	inc	esi
pm1_even:
	; now, we need to check that the length didn't
	; become odd, and if it did correctly deal with it
	; later.
	xor	eax, eax
	test	ecx, 1
	jz	pm1_even2
	inc	eax		; flag that we need to move one more
pm1_even2:
	; move by words, so shift the count down.
	shr	ecx,1
	; move 'em..
	rep	movsw
	; and, if needed, move the last byte.
	cmp	al,0
	jz	pm1_done
	mov	al,byte ptr es:[esi]
	mov	byte ptr es:[edi], al

pm1_done:
	xor	ax, ax
	jmp	pm_exit

pm_readromword:
	mov	ax, 0ffffh	; not implemented
	jmp	pm_exit

pm_getbuffer:
	; send back the address of the scratch area. 
;stopped here.

pm_exit:
	iretd

pm_stuff	endp

prot_end	dw	0

cseg	ENDS
		end pcdt_start

