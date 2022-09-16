;+
; File: c0.asm
;
; Purpose: microPOST, basic com port routines, protected mode
;
; Edits:
;
; 19jul93	...tek		initial for PD
;-
	title	microPOST c0 module
	.xlist
	include am00.inc
	include	am05.inc
	include	am07.inc
	include	amsegs32.inc
	include	limits.inc
	include	segass32.inc
	include	com.inc
	include	proto.inc
	.list

	extrn	addr_low:near,addr_high:near,tok_count1:near,tok_list1:near
	extrn	last_addr:near,last_dropped:near,history_len:near

;+
; here is how we got DELAY_COUNT to be fixed point value
;
;	1/(16 bytes/line * 240nS / byte) ===>
;-

DELAY_COUNT	equ	1000000000/(240*16)

ROM_CodeP	SEGMENT
;+
; locally used strings
;-

attn_str	db	'<attn>',0
ctrlo_str	db	'<output off>',0
dmptk_str	db	'dmptokens: ',0
m_instr		db	'Instruction',0
m_dataw		db	'Data Writes',0
m_datarw	db	'Data Read/W',0
m_confused	db	'???????????',0
m_global	db	'  Global',0
m_local		db	'  Local',0
m_none		db	'   *off*',0

m_cls		db	C_ESC,'[2J',0		; erase entire screen
m_home		db	C_ESC,'[H',0		; move cursor Home
m_eraseline	db	C_ESC,'[2K',0		; erase entire current line
m_up_line	db	C_ESC,'[1A',0		; move cursor up one line
m_eflags	db	'AC VM RF NT IOPL OF DF IF TF SF ZF AF PF CF',CR,LF,0
m_2space	db	'  ',0

;+
; Routine: ComSet	(the 32bit, protected mode version of ComInit macro)
;
; Args:
;	Init word...
;
; Make sure output has settled if calling this on running debug session
;
;-
ComSet	PROC	NEAR32	uses eax ebx edx,initword:WORD
	cli					; just in case
	xor	eax,eax
;+
; set DLAB bit in LSR on so that we can set the baud rate
;-
	mov	al,lcr_dlab			;set DLAB bit
	mov	edx,COMPORT			; base of com port
	add	dx, com_line_ctl
	out	dx,al		;  and write it
;+
;	Now figure out the new value to stuff into the LCR
;	for the desired baud rate.
;-

	mov	ax,initword		; get setup value
	mov	edi,eax			; init values saved
	mov	bl,ah			; get a copy to work with
	rol	bl,4			; move baud rate to lowest 3 bits +1
	and	bx,0Eh			; isolate the bits
	add	ebx,offset cs:br_table_prot	; point into baud rate table(kak)
	mov	ax,cs:[bx]		; load divisor (word value)

	mov	edx,COMPORT		; base of com port
	add	dx, com_dl_lsb
	out	dx,al			; update register
	mov	al, ah

	mov	edx,COMPORT		; base of com port
	add	dx, com_line_ctl
	out	dx,al		; update register

	mov	eax,edi			; get init values from before
	xchg	ah,al
	and	al,1Fh			; turn off baud rate bits

	mov	edx,COMPORT			; base of com port
	add	dx, com_line_ctl
	out	dx, al

	mov	al,0

	mov	edx,COMPORT			; base of com port
	add	dx, com_int_enab
	out	dx, al

	ret

ComSet	endp
;+
; Routine: setmcr
;
; Inputs:
;
;	MCR_BITS:	output bits (look at chip spec, bits are inverted)
;			dword, just uses low byte
;-

setmcr	PROC	NEAR32	uses eax edx,
mcrbits:DWORD

	mov	edx,COMPORT+com_modem_ctl	; base of com port
	mov	eax,mcrbits			; desired bits
	out	dx,al				; set them
	ret

setmcr	endp
;+
; Routine: getmsr
;
; Purpose: reads the modem status register bits
;
; Returns: msr bits in al (rest of eax clear)
;-
getmsr	PROC	NEAR32	uses edx
	mov	edx,COMPORT+com_modem_status	; base of com port
	xor	eax,eax
	in	al, dx				; get them
	ret
getmsr	endp

;+
; Routine: getc
;
; Purpose: get one char from the console port
;-

getc	PROC	NEAR32  uses edx


getc10:
;+
; can we receive a character from the port?
;-
	mov	edx, COMPORT+com_line_status 	; com lsr
	in	al,dx		; get the bits
	test	al,lsr_or	; overrun?
	jne	trouble		; yes
	test	al,lsr_pe	; parity error?
	jne	trouble		; yes
	test	al,lsr_fe	; framing error?
	jne	trouble		; yes
	test	al,lsr_bi	; break interrupt?
	jne	trouble		; yes

;+
; no trouble indicated, but do we have a character to read?
;-
	test	al,lsr_dr	; data ready?
	jz	getc10		; no, wait for data ready

	mov	edx, COMPORT+com_data 	; com data reg..
	xor	eax,eax		; clear all the other bits..
	in	al, dx		; get one data character from com port

;+
; If the character is XON/XOFF handle as special case (later)
;-
;	cmp	al,XOFF
;	je	trouble
	jmp	getc90

trouble:
	mov	eax,'?'		; default for bad rcv status
	invoke	putc,eax
	jmp getc10		; again

getc90:
	ret
getc	endp
;+
; Routine: getcmdline
;
; Purpose:
;	Get one line into specified buffer, end input at end of buffer
;	or upon receipt of termination characters
;
; Returns:
;	carry clear if line ended ok
;	carry set for attn class or buffer filled class exits
;-

getcmdline	PROC	NEAR32  uses eax ebx ecx edx edi,target:DWORD
	mov	edi,target	; target string pointer
	xor	ecx,ecx		; counter for number of bytes stored

getcmdline5:

getcmdline10:
	invoke	kbhit
	jc	@f		; yes, got a character

	jne	getcmdline10	; wait some more

@@:
	invoke	getc		; we know that we have a char
	jisattn	getcmdline50	; end this line, signal attention char
	jisnl	getcmdline40	; end this line (normal CR conclusion)
	cmp	al,C_RUBOUT	; is user deleting a char?
	je	getcmdline30	; yes, process rubout

;+
; normal char, use it
;-
	stosb				; al->[edi++]
	inc	ecx			; bump length counter
	invoke	putc,eax		; echo it
	cmp	ecx,IN_BUFF_LENGTH-2	; end of buffer? (with room for 0)
	jne	getcmdline10		; no
	jmp	getcmdline50		; yes, done

getcmdline30:
;+
; process rubout
;-
	cmp	ecx,0
	je	getcmdline10		; start of line (don't beep, please!)

	invoke	putc,C_BS
	invoke	putc,C_SPACE
	invoke	putc,C_BS		; we wiped out the previous char
					; *** we didn't handle tabs... ***
	sub	ecx,1			; update buffer counter
	sub	edi,1			; update buffer ptr
	jmp	getcmdline10		; loop

getcmdline40:
	clc				; clear carry (ok status)
	mov	byte ptr [edi],0	; maske string asciz
	jmp	getcmdline90

getcmdline50:
	mov	byte ptr [edi],0	; make string asciz
	invoke	putstr_cs,addr attn_str	; issue the attention string
	stc				; set carry for error return
	mov	edi,target		; get start of buffer
	mov	byte ptr [edi],0	; kill it
	jmp	getcmdline90

getcmdline90:
	ret
getcmdline	endp
;+
; Routine: getcmd_line
;
; Purpose:
;	Get one line into specified buffer, end input at end of buffer
;	or upon receipt of termination characters
;
; Inputs:
;	target points to buffer (may already be filled with asciz string)!
;	prompt points to optional prompt (assume offset CS relative)
;
; Note:
;	Both prompt and existing command line (if any) will be written to
;	console prior to getting any more (optional) characters
;
;	Processing of escape sequences for up and down arrow will cause
;	the history list to provide for buffer data
;
; Returns:
;	carry clear if line ended ok
;	carry set for attn class or buffer filled class exits
;-

getcmd_pline	PROC	NEAR32  uses eax ebx ecx edx esi edi,
	target:DWORD,prompt:DWORD

	mov	esi,0		; used to fetch history
;+
; first, write prompt and buffer
;-
getcmd_p_top:
	invoke	putstr_cs,prompt
	invoke	putstr,target

;+
; get actual length of buffer (could be empty, could have chars)
;-
	mov	edi,target	; target string pointer
	invoke	nextnull,edi
	mov	ecx,eax		; end of string (at null)
	sub	ecx,edi		; get length of string (not incl null)
	add	edi,ecx		; edi points at next empty (null) char
	mov	ebx,01y		; shows '01' on the leds

getcmd_pline5:

getcmd_pline10:
	invoke	kbhit
	jc	@f		; yes, got a character

	jne	getcmd_pline10	; wait some more

@@:
	invoke	getc		; we know that we have a char
	jisattn	getcmd_pline50	; end this line, signal attention char
	jisnl	getcmd_pline40	; end this line (normal CR conclusion)
	cmp	al,C_RUBOUT	; is user deleting a char?
	je	getcmd_pline30	; yes, process rubout
	cmp	al,C_CSI	; 8 bit sequence
	je	getcmd_pcsi	; process it
	cmp	al,C_ESC	; 7 bit sequence
	je	getcmd_pesc	; process it
;+
; normal char, use it
;-
	stosb				; al->[edi++]
	inc	ecx			; bump length counter
	invoke	putc,eax		; echo it
	cmp	ecx,IN_BUFF_LENGTH-2	; end of buffer? (with room for 0)
	jne	getcmd_pline10		; no
	jmp	getcmd_pline50		; yes, done

getcmd_pline30:
;+
; process rubout
;-
	cmp	ecx,0
	je	getcmd_pline10		; start of line (don't beep, please!)

	invoke	putc,C_BS
	invoke	putc,C_SPACE
	invoke	putc,C_BS		; we wiped out the previous char
					; *** we didn't handle tabs... ***
	sub	ecx,1			; update buffer counter
	sub	edi,1			; update buffer ptr
	jmp	getcmd_pline10		; loop

getcmd_pline40:
	clc				; clear carry (ok status)
	mov	byte ptr [edi],0	; maske string asciz
	jmp	getcmd_pline90

getcmd_pline50:
	mov	byte ptr [edi],0	; make string asciz
	invoke	putstr_cs,addr attn_str	; issue the attention string
	stc				; set carry for error return
	mov	edi,target		; get start of buffer
	mov	byte ptr [edi],0	; kill it
	jmp	getcmd_pline90

getcmd_pesc:
	invoke	getc
	cmp	al,'['			; lead in
	je	getcmd_pcsi		; yes
;+
; bad escape sequence
;-
	invoke	putc,C_BEL		; beep, but don't hang
	jmp	getcmd_pline10		; get more chars

getcmd_pcsi:
;+
; here we expect either up arrow or down arrow...
;
; we already have the CSI (either CSI or ESC [ )...
;
; up arrow: CSI A
; dn arrow: CSI B
;-
	invoke	getc
	cmp	al,'A'
	je	getcmd_p_up
	cmp	al,'B'
	je	getcmd_p_down

	invoke	putc,C_BEL		; warn
	jmp	getcmd_pline10		; but continue

getcmd_p_up:
;+
; get previous command
;-
	mov	edi,target
	inc	esi				; adjust
	cmp	esi,DWORD PTR history_len
	jle	@f
	mov	esi,DWORD PTR history_len	; cap value

@@:
	invoke	fetch_history,edi,esi		; esi is the fetch index
	jmp	getcmd_p_wipe

getcmd_p_down:
;+
; get next command
;-
	sub	esi,1			; opposite of previous
	cmp	esi,1
	jge	@f			; in range

	mov	esi,1			; force back in range

@@:
	mov	edi,target
	invoke	fetch_history,edi,esi	; esi is the fetch index

getcmd_p_wipe:
;+
; wipe of current line prior to re-prompt
;-
	invoke	putc,CR
	invoke	erase_line
	jmp	getcmd_p_top

getcmd_pline90:
	ret
getcmd_pline	endp
;+
; Routine: space
;
; Purpose: Write one space to debug com port
;
;-
space	PROC	NEAR32
	invoke	putc,' '
	ret
space	endp

;+
; Routine: crlf
;
; Purpose: Write cr,lf string to debug com port
;-
crlf	PROC	NEAR32
	invoke	putc,CR
	invoke	putc,LF
	ret
crlf	endp

;+
; Routine: cls
;
; Purpose: Clear screen (ANSI, 7-bit sequence)
;-
cls	PROC	NEAR32
	invoke	putstr_cs,addr m_cls
	invoke	putstr_cs,addr m_home
	ret
cls	endp

;+
; Routine: erase_line
;
; Purpose: Erase all characters on the present line (ANSI, 7-bit sequence)
;-
erase_line	PROC	NEAR32
	invoke	putstr_cs,addr m_eraseline
	ret
erase_line	endp

;+
; Routine: up_line
;
; Purpose: Move cursor up one line from current line (ANSI, 7-bit sequence)
;-
up_line	PROC	NEAR32
	invoke	putstr_cs,addr m_up_line
	ret
up_line	endp

;+
; Routine: putc
;
; Purpose: Write one char to debug com port
;
; Args:
;	One char (as dword on stack)
;-
putc	PROC	NEAR32  uses eax edx,
	one_char:DWORD

;+
; Com port already inited
;-
	mov	edx,COMPORT+com_line_status	; base of com port
@@:	in	al,dx		; got all the bits
	test	al,lsr_thre			; transmit holding reg empty?
	jz	@b				; wait until empty

	mov	edx,COMPORT+com_data		; base of com port
	mov	eax,one_char			; char to output
	out	dx,al		; write the character
	ret
putc	endp

;+
; Routine: xmitidle
;
; Purpose: return only when transmit holding register becomes empty
;-

xmitidle	PROC	NEAR32  uses edx eax

;+
; Com port already inited
;-
	mov	edx,COMPORT+com_line_status	; base of com port
@@:	in	al, dx
	test	al,lsr_thre	; empty?
	jz	@b				; wait until empty
;+
; just return when done transmit holding reg is empty
;-
	ret
xmitidle	endp

;+
; Routine: kbhit
;
; Purpose: determine if char is available to be read
;
; Returns:
;	Carry clear if not char available
;	Carry set if char is available
;-

kbhit	PROC	NEAR32  uses edx eax

	mov	edx,COMPORT+com_line_status	; base of com port

kb10:
;+
; can we receive a character from the port?
;-
	in	al, dx
	test	al,lsr_dr	; input char here?
	jz	kb80				; no, done
	stc					; yes, done
	jmp	kb90
kb80:
	clc
kb90:
	ret
kbhit	endp

;+
; Routine: stopme
;
; Purpose: determine if attention character has been typed
;
; Returns:
;	Carry clear if no attention char was hit
;	Carry set if attention char was hit
;
; Notes:
;	Eats typed ahead chars (even non-control chars)...
;-

stopme	PROC	NEAR32  uses eax edx

	invoke	kbhit
	jnc	st90			; no char, forget it
	invoke	getc			; what is it?
	mov	byte ptr last_dropped,al	; save it
	jisattn	st50			; attention?
	cmp	al,C_CTRLO		; output off?
	jne	st80			; no

	invoke	putstr_cs,addr ctrlo_str
	stc				; set flag
	jmp	st90			; leave

st50:
	invoke	putstr_cs,addr attn_str	;
	stc				; attention
	jmp	st90

st80:
	clc
st90:
	ret
stopme	endp

;+
; Routine: puthex8
;
; Purpose: Write arg as 8 digit hex value to debug com port
;
; Arg: Value to write as dword
;-

puthex8	PROC NEAR32 uses eax,
	aval:DWORD
	LOCAL	tstring [16]:BYTE

	invoke	binhex32,addr tstring[0],aval
	invoke	putstr,addr tstring[0]
	ret
puthex8	endp

;+
; Routine: puthex4
;
; Purpose: Write arg as 4 digit hex value to debug com port
;
; Arg: Value to write as dword
;-
puthex4	PROC NEAR32 uses eax,
	aval:DWORD
	LOCAL	tstring [8]:BYTE

	invoke	binhex16,addr tstring[0],aval
	invoke	putstr,addr tstring[0]
	ret
puthex4	endp

;+
; Routine: puthex2
;
; Purpose: Write arg as 2 digit hex value to debug com port
;
; Arg: Value to write as dword
;-
puthex2	PROC NEAR32 uses eax,
	aval:DWORD
	LOCAL	tstring [4]:BYTE

	invoke	binhex8,addr tstring[0],aval
	invoke	putstr,addr tstring[0]
	ret
puthex2	endp

;+
; Routine: show_eflags
;
; Purpose: Write formatted eflags to debug com port
;
; Args: dword value of eflags
;-
show_eflags	PROC uses eax ebx,
	val:DWORD
;+
; this seems like a hard way to format these bits...
;-
	mov	eax,val
	invoke	putstr_cs,addr m_eflags	; one line of field names
	invoke	show_1_field,eax,AC_BIT
	invoke	show_1_field,eax,VM_BIT
	invoke	show_1_field,eax,RF_BIT
	invoke	show_1_field,eax,NT_BIT

	invoke	putstr_cs,addr m_2space	; ...show IOPL field...
	mov	ebx,eax			; eflags
	shr	ebx,12			; get IOPL bits to lsb
	and	ebx,11y			; mask out all but IOPL field
	add	ebx,'0'			; make into decimal value 0..3
	invoke	putc,ebx
	invoke	putstr_cs,addr m_2space

	invoke	show_1_field,eax,OF_BIT	; more single bits...
	invoke	show_1_field,eax,DF_BIT
	invoke	show_1_field,eax,IF_BIT
	invoke	show_1_field,eax,TF_BIT
	invoke	show_1_field,eax,SF_BIT
	invoke	show_1_field,eax,ZF_BIT
	invoke	show_1_field,eax,AF_BIT
	invoke	show_1_field,eax,PF_BIT
	invoke	show_1_field,eax,CF_BIT
	ret

show_eflags endp

;+
; Routine: show_1_field
;
; Purpose: given 2 dwords, any matching bits causes '1' to be written to
;		console serial port, else write a '0'
;
; Notes:
;	Each field is preceded by 1 space and followed by 1 space
;
; Args:
;	va1,val2
;-
show_1_field	PROC	uses eax, val1:DWORD,val2:DWORD
	invoke	space
	mov	eax,val1
	and	eax,val2
	jz	@f

	invoke	putc,'1'
	jmp	show_1_end

@@:
	invoke	putc,'0'

show_1_end:
	invoke	space
	ret

show_1_field	endp

;
;+
; Routine: show_bkpts
;
; Purpose: Write formatted fields of dr0..dr3, dr7 to debug com port
;
; Args: none
;-
show_bkpts	PROC NEAR32 uses eax ebx ecx edx edi

	mov	edi,dr7			; get this value just once
	mov	ebx,0			; count of fields to process 0..3
	mov	edx,16			; shift count to lsb align r/w field

show_bkpts_loop:
	mov	eax,ebx			; current field index (0..3)
	add	eax,'0'
	invoke	putc,eax
	invoke	space
	cmp	ebx,0			; which dr1..dr3 to show?
	jne	@f
	mov	eax,dr0			; bkpt 0 physical address
	jmp	show_bkpts10

@@:
	cmp	ebx,1
	jne	@f
	mov	eax,dr1			; bkpt 1 physical address
	jmp	show_bkpts10

@@:
	cmp	ebx,2
	jne	@f
	mov	eax,dr2			; bkpt 2 physical address
	jmp	show_bkpts10

@@:
	mov	eax,dr3			; assume (how confident) ebx==3

show_bkpts10:

	invoke	puthex8,eax		; show it
	invoke	space
	mov	eax,edi			; dr7
	mov	ecx,edx			; shift count
	add	ecx,2			;  for len field
	shr	eax,cl			; get len0 aligned at lsb
	and	eax,11y			; mask
	cmp	eax,2			; undefined value for len?
	jne	@f			; no
	mov	eax,'?'			; yes
	jmp	show_bkpts20

@@:
	add	eax,'0'+1		; format length (1,2,4)

show_bkpts20:
	invoke	putc,eax
	invoke	space

	mov	eax,edi			; dr7
	mov	ecx,edx			; shift count
	shr	eax,cl			; get r/w0 aligned at lsb
	and	eax,11y			; mask
	cmp	eax,0			; 00 = instruction
	jne	show_bkpts26		; no
	invoke	putstr_cs,addr m_instr	; yes
	jmp	show_bkpts30

show_bkpts26:
	cmp	eax,01y			; 01 = data writes only
	jne	show_bkpts27		; no
	invoke	putstr_cs,addr m_dataw	; yes
	jmp	show_bkpts30

show_bkpts27:
	cmp	eax,11y			; 11 = data reads/writes
	jne	show_bkpts29		; no
	invoke	putstr_cs,addr m_datarw	;yes
	jmp	show_bkpts30

show_bkpts29:
	invoke	putstr_cs,addr m_confused

show_bkpts30:
	mov	ecx,ebx			; index (0..3)
	add	ecx,ecx			; double it for shift count
	mov	eax,edi			; dr7
	shr	eax,cl			; move enable bits to lsb
	test	eax,10y			; mask for Global Enable
	jz	@f			; not on
	invoke	putstr_cs,addr m_global	; show global as on

@@:
	test	eax,01y			; mask for Local Enable
	jz	@f			; not on
	invoke	putstr_cs,addr m_local	; show local as on

@@:
	test	eax,11y			; both off?
	jnz	@f			; no

	invoke	putstr_cs,addr m_none	; yes, disabled

@@:
	add	edx,4			; bump shift count
	inc	ebx			; bump bkpt index
	cmp	ebx,4
	jge	show_bkpts90		; done

	invoke	crlf
	jmp	show_bkpts_loop		; do more

show_bkpts90:
	ret

show_bkpts	endp
;+
; Routine: putdec16
;
; Purpose: Write arg as 5 digit decimal (unsigned) value to debug com port
;
; Arg: Value to write as dword
;-
putdec16	PROC NEAR32 uses eax,
	aval:DWORD
	LOCAL	tstring [8]:BYTE

	invoke	bindec16,addr tstring[0],aval
	invoke	putstr,addr tstring[0]
	ret
putdec16	endp

;+
; Routine: putdec8
;
; Purpose: Write arg as 3 digit decimal (unsigned) value to debug com port
;
; Arg: Value to write as dword
;-
putdec8		PROC NEAR32 uses eax,
	aval:DWORD
	LOCAL	tstring [4]:BYTE

	invoke	bindec8,addr tstring[0],aval
	invoke	putstr,addr tstring[0]
	ret
putdec8	endp

;+
; Routine: getaddr_range
;
; Purpose: grab addr range from a dump or enter class command
;
; Input:
;	Size of units (for L parameter, if present)
;
;	L <arg> must be interpreted according to byte size of values
;
;	Use 1 for bytes, 2 for words, 4 for dwords...
;
; Implicit Input:
;	line_buf1
;	tok_list1
;	last_addr	(if no tokens around)
;
; Implicit Output:
;	addr_low
;	addr_high
;
; Flags:
;	Carry clear if some form of address values were found
;	Carry set if not
;	ebx = 1 (ok)
;	ebx = 0 (formatting error)
;
; Notes:
;	Yes, extraneous args in the token list are just ignored. We really
;	ought to issue a warning about that.
;-
getaddr_range	PROC NEAR32 uses eax ecx esi,
	lsize:DWORD

	mov	ecx,dword ptr tok_count1	; how many tokens current?
	sub	ecx,1				; ecx >=1, always
	cmp	ecx,0				; must be > 0
	je	get50				; no, use last_addr...

;+
; try to get 1st hex address (addr_low)
;-
	invoke	nextnull,addr tok_list1	; find end of 1st token (cmd)
	inc	eax		; 1st char past null
	mov	esi,eax
	invoke	hexbin32,esi
	cmp	ebx,0
	je	getfail		; failed to get a number

	mov	dword ptr addr_low,eax	; save address value
	sub	ecx,1		; count down tokens
	jne	get30		; no

	mov	dword ptr addr_high,eax	; use same address for high/low
	clc			; status = ok
	jmp	get90		; exit

get30:
	invoke	nextnull,esi	; find end of 1st token (cmd)
	inc	eax		; 1st char past null
	mov	esi,eax

;+
; Here we are with the data for a line such as:
;
;	Case 1: db 1200 1400
;	Case 2: db 1200 L 200
;
; We will test for the presence of "L" as the next token. If so, get length
; value. If not, assume case 1.
;-
	cmp	byte ptr [esi],'l'
	je	get35			; ok, got it
	cmp	byte ptr [esi],"L"
	je	get35			; ok, got it
;+
; assume case 1 with addr1 and addr2
;-
	invoke	hexbin32,esi
	cmp	ebx,0
	jne	get40		; ok, got a number

getfail:
	stc
	jmp	get90		; exit with error, no address values

get35:
;+
; case 2: make sure we actually have just L and nothing else
;-
	cmp	byte ptr [esi+1],0	; look just past L
	jne	getfail			; not ok

get37:
	add	esi,2			; should be 1st char past "L"
	sub	ecx,1			; but first check arg count
	je	getfail			; no arg follows "L", bad news
	invoke	hexbin32,esi
	cmp	ebx,0
	je	getfail			; bad, failed to get a number
;+
; eax contains L
;-
	sub	eax,1			; adjust (L=1 implies this address)
	mov	ecx,lsize		; 1,2 or 4
	shr	ecx,1			; 0,1 or 2 (shift counts)

	shl	eax,cl			; scale L by 1,2 or 4
	add	eax,dword ptr addr_low	; L x scale + address_low
	mov	dword ptr addr_high,eax	; stored as upper limit
					; ok to fall throught here...

get40:
	mov	dword ptr addr_high,eax	; save address value
	clc
	mov	ebx,1
	jmp	get90		; exit with status = ok

get50:
	mov	eax,dword ptr last_addr	; use what we have...
	mov	dword ptr addr_low,eax
	mov	dword ptr addr_high,eax
	clc			; fall through to get90
	mov	ebx,1	
get90:
	ret
getaddr_range	endp

;+
; Routine: addrprompt
;
; Purpose: write an address prompt (i.e. F3001234:) to the debug com port
;
; Args:
;	address value as dword
;-
addrprompt	PROC NEAR32 aval:DWORD

	invoke	puthex8,aval
	invoke	putc,':'
	ret
addrprompt	endp

;+
; Routine: putstr
;
; Purpose: Write asciz message string to debug com port
;
; Args:
;	Address ptr (as dword, relative to ds selector based at 00000000)
;-
putstr	PROC	NEAR32  uses eax edx esi,
	msgstr:DWORD
	cld
	mov	edx,COMPORT+com_line_status	; base of com port
	mov	esi,msgstr			; string ptr
;+
; can we transmit?
;-
@@:	in	al,dx		; got all the bits
	test	al,lsr_thre	; transmit holding reg empty?
	jz	@b		; wait until empty
;+
; ok to transmit
;-
	lodsb			; get next char from string ptr
	cmp	al,0		; end of string (asciz)

	je	putstr90	; yes, done

	mov	edx,COMPORT+com_data	; base of com port
	out	dx,al		; write the character
	mov	edx,COMPORT+com_line_status	; base of com port
	jmp	@b		; get next char

putstr90:
	ret
putstr	endp

;+
; Routine: putstr_cs
;
; Purpose: Write asciz message string to debug com port
;
; Args:
;	Address ptr (as dword, relative to cs selector based at ROM_CodeP)
;-
putstr_cs	PROC	NEAR32  uses eax edx esi,
	msgstr:DWORD
	cld
	mov	esi,msgstr			; string ptr
;+
; can we transmit?
;-
@@:	mov	edx,COMPORT+com_line_status	; base of com port
	in	al,dx	; got all the bits
	test	al,lsr_thre	; transmit holding reg empty?
	jz	@b		; wait until empty
;+
; ok to transmit
;-
	mov	al,cs:[esi]	; get char from cs based string ptr
	inc	esi		; update ptr
	cmp	al,0		; end of string (asciz)

	je	putstr_cs90	; yes, done

	mov	edx,COMPORT+com_data	; base of com port
	out	dx,al		; write the character
	jmp	@b		; get next char

putstr_cs90:
	ret
putstr_cs	endp
;+
; Routine: dmptokens
;
; Purpose: Dump out tok_list1
;-
dmptokens	PROC	NEAR32 uses eax ecx esi

	invoke	putstr_cs,addr dmptk_str
	mov	ecx,dword ptr tok_count1
	invoke	puthex8,ecx
	invoke	putc,':'

	mov	esi,offset tok_list1	; start of tokens

@@:
	invoke	space
	invoke	putstr,esi		; print this token
	sub	ecx,1			; more?
	jle	dmp90			; no, done
	invoke	nextnull,esi		; point to end of string
	inc	eax			; next string starts here
	mov	esi,eax
	jmp	@b

dmp90:
	invoke	crlf
	ret

dmptokens	endp
;+
; messages, constants for this module
;-
br_table_prot	label	word
	dw	br_110	;110 baud
	dw	br_150	;150 baud
	dw	br_300	;300 baud
	dw	br_600	;600 baud
	dw	br_1200 ;1200 baud
	dw	br_2400 ;2400 baud
	dw	br_4800 ;4800 baud
	dw	br_9600 ;9600 baud
	dw	br_19200;19200 baud
ROM_CodeP	ENDS
	end
