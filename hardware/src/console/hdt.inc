;+
; File: hdt.inc
;
; Purpose: macros and things useful for writing a simple debugger
;
; Edits:
;
; 001 23-Nov-1991 RAO Creation
; 002 24-Nov-1991 RAO Added register use lines
;-

TempLabel	MACRO
;+
; Generate unique temp label tempxmit
;-
tcount=tcount+1
tempxmit	textequ	@CatStr(<Hello>,<%(tcount)>)

	ENDM

gethexLabels	MACRO
;+
; Generate unique temp labels gh10,11,12,14,40,90
;-
ghcount=ghcount+1
gh10	textequ	@CatStr(<gh10L>,<%(ghcount)>)
gh11	textequ	@CatStr(<gh11L>,<%(ghcount)>)
gh12	textequ	@CatStr(<gh12L>,<%(ghcount)>)
gh14	textequ	@CatStr(<gh14L>,<%(ghcount)>)
gh40	textequ	@CatStr(<gh40L>,<%(ghcount)>)
gh90	textequ	@CatStr(<gh90L>,<%(ghcount)>)

	ENDM

gethexhLabels	MACRO
;+
; Generate unique temp labels ghh10,11,12,14,40,90
;-
ghhcount=ghhcount+1
ghh10	textequ	@CatStr(<ghh10L>,<%(ghhcount)>)
ghh11	textequ	@CatStr(<ghh11L>,<%(ghhcount)>)
ghh12	textequ	@CatStr(<ghh12L>,<%(ghhcount)>)
ghh14	textequ	@CatStr(<ghh14L>,<%(ghhcount)>)
ghh40	textequ	@CatStr(<ghh40L>,<%(ghhcount)>)
ghh90	textequ	@CatStr(<ghh90L>,<%(ghhcount)>)

	ENDM

gethexspLabels	MACRO
;+
; Generate unique temp labels ghsp09,10,11,12,14,40,90
;-
ghspcount=ghspcount+1
ghsp09	textequ	@CatStr(<ghsp09L>,<%(ghspcount)>)
ghsp10	textequ	@CatStr(<ghsp10L>,<%(ghspcount)>)
ghsp11	textequ	@CatStr(<ghsp11L>,<%(ghspcount)>)
ghsp12	textequ	@CatStr(<ghsp12L>,<%(ghspcount)>)
ghsp14	textequ	@CatStr(<ghsp14L>,<%(ghspcount)>)
ghsp40	textequ	@CatStr(<ghsp40L>,<%(ghspcount)>)
ghsp90	textequ	@CatStr(<ghsp90L>,<%(ghspcount)>)

	ENDM

puthexLabels	MACRO
;+
; Generate unique temp label ph10
;-
phcount=phcount+1
ph10	textequ	@CatStr(<ph10L>,<%(phcount)>)

	ENDM

ComInit	MACRO
;+
; Init the com port (comes from err.asm), use no RAM...
;
; Hey: use memory mapped I/O. Use DS as base of local CSRs. Then
; add in the offset for com1_addr and the required UART regs...
;
; Side effects:
;	cli
;	fs contains base of com port (for later putc and putstr use)
;
; Com port initialized
;
; Registers used:
;
;
; RegUse* ComInit macro: ax,bx,di,es,fs
;-
	cli				; just in case
	mov	ax,LOCAL_CSR_SEG	; base of local csr registers
	mov	ds,ax

	mov	ax,LOCAL_CSR_OFF + com1_addr ; base IO address for the com port
	mov	fs,ax		; save this in fs
	mov	bx,ax		;
;+
; set DLAB bit in LSR on so that we can set the baud rate
;-
	add	bx,com_line_ctl 	;POINT TO LINE CONTROL REG
	mov	al,lcr_dlab		;SET DLAB BIT
	mov	[bx],al			;  AND WRITE IT
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
	mov	bx,fs			; get base address
	add	bx,com_dl_lsb		;  and point to divisor latch lsb
	mov	[bx],al			; update register

	mov	bx,fs
	add	bx,com_dl_msb		; get divisor latch msb register ptr
	xchg	ah,al			; get msb of divisor value
	mov	[bx],al			; update register

	mov	bx,fs
	add	bx,com_line_ctl		; lcr ptr
	mov	ax,di			; get init values from before
	xchg	ah,al
	and	al,1Fh			;TURN OFF BAUD RATE BITS
	mov	[bx],al			;SET PARITY, STOP & DATA BITS
					;  AND SET DLAB OFF
	mov	bx,fs
	add	bx,com_int_enab		; ier
	mov	al,0
	mov	[bx],al			; disable all sources of interrupts

	ENDM
;
;************************
;
putstr	MACRO		target
;+
; Input:
;	label which is start of asciz string in CS
;
; Implicit inputs:
;
;	fs	contains base of com port (If you used ComInit before, ok)
;	ds	contains base segment of com port
;
; Side effects:
;
;	cld
;
; RegUse* putstr macro: ax,bx,si ImplicitIn: ds,fs
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
	mov	si,offset cs:target
	TempLabel		; make new label for tempxmit
%tempxmit:
	mov	bx,fs		; get base of com port
	add	bx,com_line_status	; lsr address

@@:
	test	byte ptr [bx],lsr_thre	; transmit holding reg empty?
	jz	@b		; wait until empty

;+
; ok to transmit
;-
	mov	al,cs:[si]	; get next byte
	inc	si		; update ptr
	cmp	al,0		; end of string
	je	@f		; yes, done

	mov	bx,fs
	add	bx,com_data	; data register
	mov	[bx],al		; write the character
	jmp	tempxmit	; get next
@@:
	ENDM
;
;***********************
;
putc	MACRO
;+
; Inputs:
;	al contains char to write
;
; Implicit input:
;	fs contains offset of com port
;	ds contains seg of com port
; Uses:
;	bx
;-
	mov	bx,fs
	add	bx,com_line_status

@@:
	test	byte ptr [bx],lsr_thre	; transmit hold reg empty?
	jz	@b		; no, wait for it

	mov	bx,fs
	add	bx,com_data	; data register
	mov	[bx],al		; write char to port
	ENDM
;
;***********************
;
getc	MACRO
;+
; Outputs:
;	al contains char read from com port
;
; Implicit input:
;	fs contains offset of com port
;	ds contains seg of com port
; Uses:
;	bx
;-
	mov	bx,fs
	add	bx,com_line_status	; lsr status

@@:
	test	byte ptr [bx],lsr_dr	; data ready?
	je	@b		; no, wait for data ready

	mov	bx,fs
	add	bx,com_data	; data register
	mov	al,[bx]		; get one data character from com port

	ENDM
;
;***********************
;
kbhit	MACRO
;+
; Outputs:
;	zero flag set if no input ready, else clear
;
; Implicit input:
;	fs contains offset of com port
;	ds contains seg of com port
; Uses:
;	bx
;
; Notes:
;	Does no input of the chacater, just checks if we could input it
;-
	mov	bx,fs
	add	bx,com_line_status	; lsr status

@@:
	test	byte ptr [bx],lsr_dr	; data ready?

	ENDM

gethex	MACRO
;+
; Inputs:
;	Uses getc to get ascii chars
;	cx is max number of digits you want to use (i.e. 2, 4 or 8)
;	return terminates number legally
;
; Outputs:
;
;	edx	binary version of ascii hex number
;
; Jmps:
;	if {rubout or attention class} char seen, jmp attention
;	if {bad hex char seen} jmp badhex
;	leading white space is cause for error
; Uses:
;	ax
;	calls putc (which uses some regs)
;
; Notes:
;	Check the value of cx afterwards to see if perhaps you got no
;	input chars (i. e. just a return)
;-
	gethexLabels		; generate unique label variants
	mov	edx,0
%gh10:
	getc			; get next hex digit
	jisattn attention	; abandon
	jisnl	gh90		; return
	cmp	al,C_RUBOUT	; erase?
	je	attention	; no

	putc			; echo it
	cmp	al,'a'
	jl	gh12
	cmp	al,'f'
	jg	gh12		; 'a'..'f'?
	sub	al,'a'		; yes
	add	al,10		; convert the nibble to binary
	jmp	gh40		; use it

%gh12:
	cmp	al,'A'
	jl	gh14
	cmp	al,'F'
	jg	gh14
	sub	al,'A'		; 'A'..'F'	
	add	al,10		; convert the nibble to binary
	jmp	gh40		; use it

%gh14:
	cmp	al,'0'
	jl	badhex		; bad
	cmp	al,'9'
	jg	badhex		; bad
	sub	al,'0'		; cvt to binary

%gh40:
	shl	edx,4		; make room for nibble
	and	al,0fh
	or	dl,al
	dec	cx
	jne	gh10		; get next hex char
				; if here, we got 4 digits, done
%gh90:				; return here from partial numbers
	ENDM

gethexh	MACRO
;+
; Inputs:
;	Uses getc to get ascii chars
;	cx is max number of digits you want to use (i.e. 2, 4 or 8)
;	return terminates number legally
;
; Outputs:
;
;	edx	binary version of ascii hex number
;
; Jmps:
;	if {rubout or attention class} char seen, jmp attention
;	if {bad hex char seen} jmp badhex
;
; Uses:
;	ax
;	calls putc (which uses some regs)
;
; Notes:
;	Check the value of cx afterwards to see if perhaps you got no
;	input chars (i. e. just a return)
;	This routine is just like gethex except that the 1st character
;	of the number you are converting is *already* in al when you
;	call this macro. This is convenient for parsing a line and
;	converting a number when you know it has started.
;-
	gethexhLabels		; generate unique label variants
	mov	edx,0
	jmp	ghh11		; we already have the 1st char, thank you
%ghh10:
	getc			; get next hex digit

%ghh11:
	jisattn attention	; abandon
	jisnl	ghh90		; return
	cmp	al,C_RUBOUT	; erase?
	je	attention	; no

	putc			; echo it
	cmp	al,'a'
	jl	ghh12
	cmp	al,'f'
	jg	ghh12		; 'a'..'f'?
	sub	al,'a'		; yes
	add	al,10		; convert the nibble to binary
	jmp	ghh40		; use it

%ghh12:
	cmp	al,'A'
	jl	ghh14
	cmp	al,'F'
	jg	ghh14
	sub	al,'A'		; 'A'..'F'	
	add	al,10		; convert the nibble to binary
	jmp	ghh40		; use it

%ghh14:
	cmp	al,'0'
	jl	badhex		; bad
	cmp	al,'9'
	jg	badhex		; bad
	sub	al,'0'		; cvt to binary

%ghh40:
	shl	edx,4		; make room for nibble
	and	al,0fh
	or	dl,al
	dec	cx
	jne	ghh10		; get next hex char
				; if here, we got 4 digits, done
%ghh90:				; return here from partial numbers

	ENDM

gethexsp	MACRO
;+
; Inputs:
;	Uses getc to get ascii chars
;	cx is max number of digits you want to use (i.e. 2, 4 or 8)
;	return terminates number legally
;
; Outputs:
;
;	edx	binary version of ascii hex number
;
; Jmps:
;	if {rubout or attention class} char seen, jmp attention
;	if {bad hex char seen} jmp badhex
;	leading white space is ignored ** unlike gethex **
; Uses:
;	ax
;	calls putc (which uses some regs)
;
; Notes:
;	Check the value of cx afterwards to see if perhaps you got no
;	input chars (i. e. just a return)
;-
	gethexspLabels		; generate unique label variants
	mov	edx,0
%ghsp11:				; eat/echo leading white spaces
	getc
	cmp	al,' '
	jne	ghsp09
	putc			; echo it
	jmp	ghsp11		; keep ignoring white space

%ghsp10:
	getc			; get next hex digit

%ghsp09:	jisattn attention	; abandon
	jisnl	ghsp90		; return
	cmp	al,C_RUBOUT	; erase?
	je	attention	; no

	putc			; echo it
	cmp	al,'a'
	jl	ghsp12
	cmp	al,'f'
	jg	ghsp12		; 'a'..'f'?
	sub	al,'a'		; yes
	add	al,10		; convert the nibble to binary
	jmp	ghsp40		; use it

%ghsp12:
	cmp	al,'A'
	jl	ghsp14
	cmp	al,'F'
	jg	ghsp14
	sub	al,'A'		; 'A'..'F'	
	add	al,10		; convert the nibble to binary
	jmp	ghsp40		; use it

%ghsp14:
	cmp	al,'0'
	jl	badhex		; bad
	cmp	al,'9'
	jg	badhex		; bad
	sub	al,'0'		; cvt to binary

%ghsp40:
	shl	edx,4		; make room for nibble
	and	al,0fh
	or	dl,al
	dec	cx
	jne	ghsp10		; get next hex char
				; if here, we got 4 digits, done
%ghsp90:				; return here from partial numbers

	ENDM

puthex	MACRO
;+
; Inputs:
;	eax is the number to print to the console
;	cx is the number of digits you want to output (2,4,8)
;
; Uses:
;	eax, ebx, edx
;	see putc for other regs that are clobbered
;-
	puthexLabels			; generate unique label
	mov	edx,eax
	mov	ax,cx	
	dec	ax			; digits - 1
	shl	ax,2			; (digits - 1) * 4 (was shift cnt 4)
	xchg	cx,ax
	ror	edx,cl			; move highest useable nibble to dl
					; such that the next rol will be ok
	xchg	cx,ax			; keep count in cx

%ph10:
	mov	ebx,edx			; order and move to ebx
	and	bx,0fh			; just one nibble

	mov	al,cs:binhextab[bx]	; get ascii char
	putc
	rol	edx,4			; get high order 4 bits into low

	dec	cx
	jnz	ph10			; do more

	ENDM
