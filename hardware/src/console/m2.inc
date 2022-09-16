;+
; File: m2.inc
;
; Com routines for the module M2.ASM, which runs in real mode.
; This is all pretty much stolen from HDT.inc.
; 
; 26 Aug 93	...tek		Initial. Don't forget to add the 
;				_action routines to M2.asm!
; 26 aug 93	...tek		all macros now. Generates completely
;				inline code. Use sparingly.
;
;-




jishexdigit	MACRO	target
;+
; Inputs: al
;
; Jump to target if al contains hex ascii digit '0'..'9','a'..'f','A'..'F'
;
;-
	cmp	al,'0'
	jl	ih99		; no way
	cmp	al,'9'
	jle	target		; '0'..'9'

	cmp	al,'a'
	jl	ih20
	cmp	al,'f'
	jle	target		; 'a'..'f'

%ih20:
	cmp	al,'A'
	jl	ih99
	cmp	al,'F'
	jle	target
%ih99:	
	ENDM


ComInit	MACRO
;+
; Init the com port (comes from err.asm), use no RAM...
;
; ...tek	19jul93		modified for PD.
;				com port is at 02F8h
;
; Side effects:
;	cli
;
; Com port initialized
;
; Registers used:
;
; RegUse* ComInit macro: ax,bx,di
;-
	cli				; just in case

;+
; set DLAB bit in LSR on so that we can set the baud rate
;-
	mov	ebx, edx		; save DX.. 
	mov	dx,COMPORT+com_line_ctl
	mov	al,lcr_dlab		;SET DLAB BIT
	out	dx,al			;  AND WRITE IT
;+
;	Now figure out the new value to stuff into the LCR
;	for the desired baud rate.
;-
	mov	ax,COM_INIT_DEFAULT
	mov	di,ax			; init values saved
	mov	bl,ah			; get a copy to work with
	rol	bl,4			; move baud rate to lowest 3 bits +1
	and	bx,0Eh			;ISOLATE THE BITS
	add	bx,offset cs:br_table	;POINT INTO BAUD RATE TABLE
	mov	ax,cs:[bx]		; load divisor (word value)
	mov	dx,COMPORT + com_dl_lsb	;  and point to divisor latch lsb
	out	dx,al			; update register

	mov	dx,COMPORT + com_dl_msb	; get divisor latch msb register ptr
	xchg	ah,al			; get msb of divisor value
	out	dx,al			; update register

	mov	dx,COMPORT + com_line_ctl 	; lcr ptr
	mov	ax,di			; get init values from before
	xchg	ah,al
	and	al,1Fh			;TURN OFF BAUD RATE BITS
	out	dx,al			;SET PARITY, STOP & DATA BITS
					;  AND SET DLAB OFF
	mov	dx,COMPORT + com_int_enab	; ier
	mov	al,0
	out	dx,al			; disable all sources of interrupts

	mov	edx, ebx		; restore DX..
	ENDM
;
;************************
;
putstr	MACRO		string_target
	LOCAL	tempxmit, wait1, wedone
;+
; Input:
;	label which is start of asciz string in CS
;
; Implicit inputs:
;
;	ds	contains base segment of com port
;
; Side effects:
;
;	cld
;
; Example
;
;	myprog segment code
;
;	message	db 'hi there',0
;
;	start:
;
;		InitCom
;		Putstr		message
;
;	.
;	.
;	.
;-
	mov	si,offset cs:string_target

tempxmit:
	mov	dx, COMPORT + com_line_status	; lsr address

wait1:
	in	al,dx
	test	al,lsr_thre	; transmit holding reg empty?
	jz	wait1			; wait until empty

;+
; ok to transmit
;-
	mov	al,cs:[si]		; get next byte
	inc	si			; update ptr
	cmp	al,0			; end of string
	je	wedone			; yes, done

	mov	dx, COMPORT + com_data	; data register
	out	dx,al			; write the character
	jmp	tempxmit		; get next
wedone:
	ENDM



;
;***********************
;
putc	MACRO
	LOCAL	wait1
;+
; Inputs:
;	al contains char to write
;
; Implicit input:
;	ds contains seg of com port
;
; RegUse* putc macro: bx ImplicitIn: al,ds
;-
        mov	fs, ax			; save AX
	mov	bx, dx			; and DX
wait1:
	mov	dx, COMPORT + com_line_status	; lsr address

	in	al,dx
	test	al,lsr_thre	; transmit holding reg empty?
	jz	wait1			; wait until empty

	mov	dx,COMPORT + com_data	; data register
	mov	ax, fs			; get the char back..
	out	dx,al			; write char to port
	mov	dx, bx			; restore DX

	ENDM


puthex	MACRO
	LOCAL	ph10
;+
; Inputs:
;	eax is the number to print to the console
;	cx is the number of digits you want to output (2,4,8)
;
; RegUse* puthex macro: ebx,edx ImplicitIn: eax,cx,ds Calls: putc
;-
	xor	edi,edi
	mov	di,offset cs:edi10
	mov	edx,eax
	mov	ax,cx	
	dec	ax			; digits - 1
	shl	ax,2			; (digits - 1) * 4 (was shift cnt 4)
	xchg	cx,ax
	ror	edx,cl			; move highest useable nibble to dl
					; such that the next rol will be ok
	xchg	cx,ax			; keep count in cx
ph10:
	mov	ebx,edx			; order and move to ebx
	and	bx,0fh			; just one nibble

	mov	al,cs:binhextab[bx]	; get ascii char
	putc
	rol	edx,4			; get high order 4 bits into low

	dec	cx
	jnz	ph10			; do more
	ENDM

