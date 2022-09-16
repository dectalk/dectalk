;+
; File: fill.asm
;
; Purpose: microPOST, fill commands
;
; Edits:
;
; 001 18-Dec-1991 RAO Creation, bugs...
; 002 26-Dec-1991 RAO Use pusha/popa
; 003 24-Jan-1992 RAO Get rid of debug items
;-
	title	microPOST fill commands
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
	public	cmd_fb,cmd_fw,cmd_fd

ROM_CodeP	SEGMENT
	assume	ds:ROM_DataP
;+
; locally used strings
;-
bad_hex	db	CR,LF,'? Bad address value(s)',0 ; is better than none?
m_fill	db	CR,LF,'fill: ',0

;+
;	On entry, the command line is in line_buf1.
;	The tokenized list is in tok_list1.
;	The number of tokens are in tok_count1.
;-
cmd_fb:
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
	jne	cmd_fb30		; got it (in eax)

	invoke	putstr_cs,addr bad_hex
	jmp	cmd_ret2

cmd_fb30:
	mov	esi,dword ptr addr_low	; get addr_low value
	mov	ecx,dword ptr addr_high	; get high value
	sub	ecx,esi			; difference
	inc	ecx			; +1 for loop value

@@:	mov	[esi],al
	inc	esi
	loop	@b
	jmp	cmd_ret			; done

cmd_fw:
	pusha
	invoke	getaddr_range,2		; fill addr_low,addr_high (L=2 bytes)
	cmp	ebx,0			; status ok?
	jne	@f
	invoke	putstr_cs,addr bad_hex
	jmp	cmd_ret2		; stop now

@@:	invoke	putstr_cs,addr m_fill	; prompt for fill value
	invoke	getcmdline,addr edit_buf1	; get a line (holds fill value)
	jc	cmd_ret2

	invoke	strlen,addr edit_buf1	; how long is the line?
	cmp	eax,0			; just hit return?
	je	cmd_ret

	invoke	tokenize,addr edit_tokens1,addr edit_buf1
	cmp	eax,0			; any tokens?
	je	cmd_ret2

	invoke	hexbin32,addr edit_tokens1	; get hex number
	cmp	ebx,0
	jne	cmd_fw30		; got it (in eax)

	invoke	putstr_cs,addr bad_hex
	jmp	cmd_ret2

cmd_fw30:
	mov	esi,dword ptr addr_low	; get addr_low value
	mov	ecx,dword ptr addr_high	; get high value
	sub	ecx,esi			; difference
	shr	ecx,1			; scale for words
	inc	ecx			; +1 for loop value

@@:	mov	[esi],ax
	add	esi,2
	loop	@b
	jmp	cmd_ret			; done


cmd_fd:
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
	jne	cmd_fd30		; got it (in eax)

	invoke	putstr_cs,addr bad_hex
	jmp	cmd_ret2

cmd_fd30:
	mov	esi,dword ptr addr_low	; get addr_low value
	mov	ecx,dword ptr addr_high	; get high value
	sub	ecx,esi			; difference
	shr	ecx,2			; scale for dwords
	inc	ecx			; +1 for loop value

@@:	mov	[esi],eax
	add	esi,4
	loop	@b
	jmp	cmd_ret			; done

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
