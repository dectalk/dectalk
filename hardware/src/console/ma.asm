;+
; File: ma.asm
;
; Purpose: microPOST, ma command
;
; Edits:
;
; 001 27-Dec-1991 RAO Creation
; 002 29-Dec-1991 RAO Changed format of output
; 003 05-Feb-1992 RAO Changed output off handler slightly
;-
	title	microPOST ma command
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
	public	cmd_ma

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

;+
;	On entry, the command line is in line_buf1.
;	The tokenized list is in tok_list1.
;	The number of tokens are in tok_count1.
;-
cmd_ma:
	pusha
	invoke	getaddr_range,4		; fill addr_low,addr_high (L=4 bytes)

	cmp	ebx,0
	jne	@f
	invoke	putstr_cs,addr bad_hex
	jmp	cmd_ret2		; stop now

@@:
	mov	esi,dword ptr addr_low	; get addr_low value
	mov	ecx,dword ptr addr_high	; get high value
	sub	ecx,esi			; difference
	shr	ecx,2			; scale for dwords
	inc	ecx			; +1 for loop value
	xor	edx,edx			; reset error flag
	mov	edi,edx			; output off cleared
;+
; Ok, here's the strategy...
;
; Init:
;	esi <- base address
;	ecx <- loop counter
;	edx <- 0	; error flag
; Loop:			; first fill with address as data
;	while(cx != 0)
;
;		[esi] <- esi
;		eax <- [esi+40000h]
;		eax <- [esi+80000h]
;		esi <- esi + 4
;		cx <- cx - 1
;		loop
; Second Init:
;	esi <- base address
;	ecx <- loop counter
; Loop2:			; verify contents
;	while(cx != 0)
;
;		cmp [esi], esi
;			if not equal, set error and complain
;		esi <- esi + 4
;		cx <- cx - 1
;		loop
;-	
cmd_ma30:
	mov	[esi],esi		; write address into address
	mov	eax,[esi+40000h]	; flush
	mov	eax,[esi+80000h]	; flush
	add	esi,4			; next dword address
	loop	cmd_ma30		; complete the fill loop

;+
; Note:
;	In the previous fill loop, ^C is ignored. If you specify a large
;	span of memory, you could be here a while (fix this or leave it as
;	a feature ?)
;-
	mov	esi,dword ptr addr_low	; get addr_low value
	mov	ecx,dword ptr addr_high	; get high value
	sub	ecx,esi			; difference
	shr	ecx,2			; scale for dwords
	inc	ecx			; +1 for loop value

cmd_ma40:
	mov	ebx,[esi]		; fetch value, save in ebx
	cmp	ebx,esi			; address = data?
	je	@f			; yes, ok

	inc	edx			; no, error; bump error flag
	cmp	edi,0			; output off?
	jne	@f			; yes, don't show errors

	invoke	putstr_cs,addr m_err	; error message starts
	invoke	puthex8,esi		; current address
	invoke	putstr_cs,addr m_err1
	invoke	puthex8,ebx		; failing value

@@:
	add	esi,4			; next dword
	invoke	stopme
	jnc	@f			; no interrupts from user
	cmp	byte ptr last_dropped,C_CTRLO
	jne	cmd_ret2		; must be attention, not ^O
	mov	edi,1			; set output off flag (^O)

@@:
	loop	cmd_ma40		; do loop

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
