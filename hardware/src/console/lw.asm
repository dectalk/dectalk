;+
; File: lw.asm
;
; Purpose: microPOST, looped write commands
;
; Edits:
;
; 001 18-Dec-1991 RAO Creation; fix warning message, fix start loop
; 002 26-Dec-1991 RAO Use pusha/popa
;-
	title	microPOST looped write commands
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
	extrn	addr_low:near,addr_high:near,last_addr:near
	public	cmd_lwb,cmd_lww,cmd_lwd

ROM_CodeP	SEGMENT
	assume	ds:ROM_DataP
;+
; locally used strings
;-
bad_hex	db	CR,LF,'? Bad address value(s)',0 ; is better than none?
m_fill	db	CR,LF,'fill: ',0
m_warn	db	' [Loop Write Active, RESET to exit]...',0

;+
;	On entry, the command line is in line_buf1.
;	The tokenized list is in tok_list1.
;	The number of tokens are in tok_count1.
;-
cmd_lwb:
	pusha
	invoke	getaddr_range,1		; fill addr_low,addr_high (L=1 byte)
	cmp	ebx,0			; status ok?
	jne	@f
	invoke	putstr_cs,addr bad_hex
	jmp	cmd_ret2		; stop now

@@:	invoke	putstr_cs,addr m_fill	; prompt for fill value
	invoke	getcmdline,addr edit_buf1	; get a line (holds fill value)
	jc	cmd_ret			; no good
	invoke	strlen,addr edit_buf1	; how long is the line?
	cmp	eax,0			; just hit return?
	je	cmd_ret2		; yes, done
	invoke	tokenize,addr edit_tokens1,addr edit_buf1
	cmp	eax,0			; any tokens?
	je	cmd_ret2		; no
	invoke	hexbin32,addr edit_tokens1	; get hex number
	cmp	ebx,0
	jne	cmd_lwb30		; got it (in eax)

	invoke	putstr_cs,addr bad_hex
	jmp	cmd_ret2

cmd_lwb30:
	invoke	putstr_cs,addr m_warn
	mov	esi,dword ptr addr_low	; get addr_low value
	mov	ebx,dword ptr addr_high	; get high value
	sub	ebx,esi			; difference
	inc	ebx			; +1 for loop value

cmd_lwb40:
	mov	ecx,ebx			; loop counter
	mov	esi,dword ptr addr_low	; get addr_low value

@@:	mov	[esi],al
	inc	esi
	loop	@b
	jmp	cmd_lwb40		; repeat forever

cmd_lww:
	pusha
	invoke	getaddr_range,2		; fill addr_low,addr_high (L=2 bytes)
	cmp	ebx,0			; status ok?
	jne	@f
	invoke	putstr_cs,addr bad_hex
	jmp	cmd_ret2		; stop now

@@:	invoke	putstr_cs,addr m_fill	; prompt for fill value
	invoke	getcmdline,addr edit_buf1	; get a line (holds fill value)
	jc	cmd_ret			; no good
	invoke	strlen,addr edit_buf1	; how long is the line?
	cmp	eax,0			; just hit return?
	je	cmd_ret2		; yes, done
	invoke	tokenize,addr edit_tokens1,addr edit_buf1
	cmp	eax,0			; any tokens?
	je	cmd_ret2		; no
	invoke	hexbin32,addr edit_tokens1	; get hex number
	cmp	ebx,0
	jne	cmd_lww30		; got it (in eax)

	invoke	putstr_cs,addr bad_hex
	jmp	cmd_ret2

cmd_lww30:
	invoke	putstr_cs,addr m_warn
	mov	esi,dword ptr addr_low	; get addr_low value
	mov	ebx,dword ptr addr_high	; get high value
	sub	ebx,esi			; difference
	shr	ebx,1			; scale for words
	inc	ebx			; +1 for loop value

cmd_lww40:
	mov	ecx,ebx			; loop counter
	mov	esi,dword ptr addr_low	; get addr_low value

@@:	mov	[esi],ax
	add	esi,2
	loop	@b
	jmp	cmd_lww40		; repeat forever

cmd_lwd:
	pusha
	invoke	getaddr_range,4		; fill addr_low,addr_high (L=4 bytes)
	cmp	ebx,0			; status ok?
	jne	@f
	invoke	putstr_cs,addr bad_hex
	jmp	cmd_ret2		; stop now

@@:	invoke	putstr_cs,addr m_fill	; prompt for fill value
	invoke	getcmdline,addr edit_buf1	; get a line (holds fill value)
	jc	cmd_ret			; no good
	invoke	strlen,addr edit_buf1	; how long is the line?
	cmp	eax,0			; just hit return?
	je	cmd_ret2		; yes, done
	invoke	tokenize,addr edit_tokens1,addr edit_buf1
	cmp	eax,0			; any tokens?
	je	cmd_ret2		; no
	invoke	hexbin32,addr edit_tokens1	; get hex number
	cmp	ebx,0
	jne	cmd_lwd30		; got it (in eax)

	invoke	putstr_cs,addr bad_hex
	jmp	cmd_ret2

cmd_lwd30:
	invoke	putstr_cs,addr m_warn
	mov	esi,dword ptr addr_low	; get addr_low value
	mov	ebx,dword ptr addr_high	; get high value
	sub	ebx,esi			; difference
	shr	ebx,2			; scale for dwords
	inc	ebx			; +1 for loop value

cmd_lwd40:
	mov	ecx,ebx			; loop counter
	mov	esi,dword ptr addr_low	; get addr_low value

@@:	mov	[esi],eax
	add	esi,4
	loop	@b
	jmp	cmd_lwd40		; repeat forever

;+
; actually, we never get here
;-
cmd_ret:
;+
; common return
;-
	mov	dword ptr last_addr,esi	; save the address we would have
					; dumped for next time
cmd_ret2:
	popa
	jmp	parse_top		; return to parser

ROM_CodeP	ENDS
	end
