;+
; File: lr.asm
;
; Purpose: microPOST, looped read commands
;
; Edits:
;
; 001 18-Dec-1991 RAO Creation; fix warning, fix starting address init
; 002 26-Dec-1991 RAO Use pusha/popa
;-
	title	microPOST looped read commands
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
	public	cmd_lrb,cmd_lrw,cmd_lrd

ROM_CodeP	SEGMENT
	assume	ds:ROM_DataP
;+
; locally used strings
;-
bad_hex	db	CR,LF,'? Bad address value(s)',0 ; is better than none?
m_warn	db	' [Loop Read Active, RESET to exit]...',0
;+
;	On entry, the command line is in line_buf1.
;	The tokenized list is in tok_list1.
;	The number of tokens are in tok_count1.
;-
cmd_lrb:
	pusha
	invoke	getaddr_range,1		; fill addr_low,addr_high (L=1 byte)
	cmp	ebx,0			; status ok?
	jne	@f
	invoke	putstr_cs,addr bad_hex
	jmp	cmd_ret2		; stop now

@@:
	invoke	putstr_cs,addr m_warn
	mov	esi,dword ptr addr_low	; get addr_low value
	mov	ebx,dword ptr addr_high	; get high value
	sub	ebx,esi			; difference
	inc	ebx			; +1 for loop value

cmd_lrb40:
	mov	ecx,ebx			; loop counter
	mov	esi,dword ptr addr_low	; get addr_low value

@@:	mov	al,[esi]
	inc	esi
	loop	@b
	jmp	cmd_lrb40		; repeat forever

cmd_lrw:
	pusha
	invoke	getaddr_range,2		; fill addr_low,addr_high (L=2 bytes)
	cmp	ebx,0			; status ok?
	jne	@f
	invoke	putstr_cs,addr bad_hex
	jmp	cmd_ret2		; stop now

@@:
	invoke	putstr_cs,addr m_warn
	mov	esi,dword ptr addr_low	; get addr_low value
	mov	ebx,dword ptr addr_high	; get high value
	sub	ebx,esi			; difference
	shr	ebx,1			; scale for words
	inc	ebx			; +1 for loop value

cmd_lrw40:
	mov	ecx,ebx			; loop counter
	mov	esi,dword ptr addr_low	; get addr_low value

@@:	mov	ax,[esi]
	add	esi,2
	loop	@b
	jmp	cmd_lrw40		; repeat forever

cmd_lrd:
	pusha
	invoke	getaddr_range,4		; fill addr_low,addr_high (L=4 bytes)
	cmp	ebx,0			; status ok?
	jne	@f
	invoke	putstr_cs,addr bad_hex
	jmp	cmd_ret2		; stop now

@@:
	invoke	putstr_cs,addr m_warn
	mov	esi,dword ptr addr_low	; get addr_low value
	mov	ebx,dword ptr addr_high	; get high value
	sub	ebx,esi			; difference
	shr	ebx,2			; scale for dwords
	inc	ebx			; +1 for loop value

cmd_lrd40:
	mov	ecx,ebx			; loop counter
	mov	esi,dword ptr addr_low	; get addr_low value

@@:	mov	eax,[esi]
	add	esi,4
	loop	@b
	jmp	cmd_lrd40		; repeat forever

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
