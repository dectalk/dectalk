;+
; File: mt.asm
;
; Purpose: microPOST, mt command
;
; Edits:
;
; 001 19-Dec-1991 RAO Creation, fix loop, allow L (assume dword scale)
; 002 24-Dec-1991 RAO After stopme call, differentiate between ^O and ^C
; 003 26-Dec-1991 RAO Use pusha/popa
;-
	title	microPOST mt command
	.xlist
	include am00.inc
	include	am05.inc
	include	am07.inc
	include	amsegs32.inc
	include	limits.inc
	include	segass32.inc
	include	proto.inc
	.list

	extrn	line_buf1:near,parse_top:near
	extrn	edit_tokens1:near,edit_buf1:near
	extrn	addr_low:near,addr_high:near,last_addr:near,last_dropped:near
	public	cmd_mt

ROM_CodeP	SEGMENT
	assume	ds:ROM_DataP
;+
; locally used strings
;-
bad_hex	db	CR,LF,'? Bad number format',0
m_1	db	CR,LF,'testing ',0
m_2	db	'..',0
m_ok	db	' [ok]',0
m_err	db	CR,LF,'[',0
m_err1	db	'] = ',0
m_err2	db	', base value = ',0

;+
;	On entry, the command line is in line_buf1.
;	The tokenized list is in tok_list1.
;	The number of tokens are in tok_count1.
;-
cmd_mt:
	pusha
	invoke	getaddr_range,4		; fill addr_low,addr_high (L=4 bytes)
					; actually, only use the low_addr
					; part of this...
	cmp	ebx,0
	jne	@f
	invoke	putstr_cs,addr bad_hex
	jmp	cmd_ret2		; stop now

@@:	mov	esi,dword ptr addr_low	; get addr_low value
	and	esi,not 111111y		; make mod 64 bytes
	invoke	putstr_cs,addr m_1	; progress info
	invoke	puthex8,esi		; addr1
	invoke	putstr_cs,addr m_2
	mov	eax,dword ptr addr_high	; address limit
	and	eax,not 111111y		; mod 64
	add	eax,60			; last allowable address in block
	mov	edi,eax			; save it
	invoke	puthex8,eax
	invoke	space
;+
; Ok, here's the strategy...
;
; Init:
;	esi <- base address
;	ecx <- loop counter
;	ebx <- [esi]	; used as base value for later compares
;	edx <- 0	; error flag
; Loop:
;	while(cx != 0)
;
;		eax <- [esi]
;		if(eax != ebx)
;			complain... and set edx <- 1
;		eax <- [esi+40000h]
;		eax <- [esi+80000h]
;		esi <- esi + 4
;		cx <- cx - 1
;		loop
;-	
cmd_mt30:
	mov	ebx,[esi]		; baseline value
	mov	ecx,edi			; high address
	sub	ecx,esi			; low address
	shr	ecx,2			; make into dword
	inc	ecx			; adjust loop count
	xor	edx,edx			; clear error flag
	mov	edi,edx			; output flush flag

cmd_mt40:
	mov	eax,[esi]		; read RAM
	cmp	eax,ebx			; equal to base?
	je	@f			; yes, fine

	inc	edx			; bump error flag
	invoke	putstr_cs,addr m_err	; error message starts
	invoke	puthex8,esi		; current address
	invoke	putstr_cs,addr m_err1
	invoke	puthex8,eax		; failing value
	cmp	edx,1			; 1st error in this group?
	jne	@f			; no, forget it

	invoke	putstr_cs,addr m_err2	; yes, show base value, too
	invoke	puthex8,ebx

@@:
	mov	eax,[esi+40000h]	; flush
	mov	eax,[esi+80000h]	; flush
	add	esi,4			; next dword
	invoke	stopme
	jnc	@f			; no interrupts from user
	cmp	byte ptr last_dropped,C_CTRLO
	jne	cmd_ret2		; must be attention, not ^O
	mov	edi,1			; set output off flag (^O)

@@:
	loop	cmd_mt40		; do loop

	cmp	edx,0			; error free?
	jne	cmd_ret2		; no, don't adjust last_addr

	invoke	putstr_cs,addr m_ok	; error free message

cmd_ret:
;+
; common return
;-
	mov	dword ptr last_addr,esi	; save the address we would have
cmd_ret2:					; dumped for next time
	popa

	jmp	parse_top		; return to parser

ROM_CodeP	ENDS
	end
