;+
; File: cp.asm
;
; Purpose: microPOST, copy commands
;
; Edits:
;
; 001 06-Jan-1992 RAO Creation
;-
	title	microPOST copy commands
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
	public	cmd_cpb,cmd_cpw,cmd_cpd

ROM_CodeP	SEGMENT
	assume	ds:ROM_DataP
;+
; locally used strings
;-
bad_hex	db	CR,LF,'? Bad address value(s)',0 ; is better than none?
m_dest	db	CR,LF,'dest: ',0

;+
;	On entry, the command line is in line_buf1.
;	The tokenized list is in tok_list1.
;	The number of tokens are in tok_count1.
;-
cmd_cpb:
	pusha
	invoke	getaddr_range,1		; copy's addr_low,addr_high (L=1 byte)
	cmp	ebx,0			; status ok?
	jne	@f
	invoke	putstr_cs,addr bad_hex
	jmp	cmd_ret2		; stop now

@@:	invoke	putstr_cs,addr m_dest	; prompt for dest value
	invoke	getcmdline,addr edit_buf1	; get a line (holds dest value)
	jc	cmd_ret			; no good
	invoke	strlen,addr edit_buf1	; how long is the line?
	cmp	eax,0			; just hit return?
	je	cmd_ret2		; yes, done
	invoke	tokenize,addr edit_tokens1,addr edit_buf1
	cmp	eax,0			; any tokens?
	je	cmd_ret2		; no
	invoke	hexbin32,addr edit_tokens1	; get hex number
	cmp	ebx,0
	jne	cmd_cpb30		; got it (in eax)

	invoke	putstr_cs,addr bad_hex
	jmp	cmd_ret2

cmd_cpb30:
	mov	edi,eax			; destination address
	mov	ax,ds			; make sure es is correct
	mov	es,ax
	cld				; direction is now up
	mov	esi,dword ptr addr_low	; get addr_low value
	mov	ecx,dword ptr addr_high	; get high value
	sub	ecx,esi			; difference
	inc	ecx			; +1 for loop value

@@:	movsb				; ds:[esi++]->es:[edi++]
	loop	@b
	jmp	cmd_ret			; done

cmd_cpw:
	pusha
	invoke	getaddr_range,2		; copy's addr_low,addr_high (L=2 bytes)
	cmp	ebx,0			; status ok?
	jne	@f
	invoke	putstr_cs,addr bad_hex
	jmp	cmd_ret2		; stop now

@@:	invoke	putstr_cs,addr m_dest	; prompt for dest value
	invoke	getcmdline,addr edit_buf1	; get a line (holds dest value)
	jc	cmd_ret2
	invoke	strlen,addr edit_buf1	; how long is the line?
	cmp	eax,0			; just hit return?
	je	cmd_ret
	invoke	tokenize,addr edit_tokens1,addr edit_buf1
	cmp	eax,0			; any tokens?
	je	cmd_ret2
	invoke	hexbin32,addr edit_tokens1	; get hex number
	cmp	ebx,0
	jne	cmd_cpw30		; got it (in eax)

	invoke	putstr_cs,addr bad_hex
	jmp	cmd_ret2

cmd_cpw30:
	mov	edi,eax			; destination address
	mov	ax,ds			; make sure es is correct
	mov	es,ax
	cld				; direction is now up
	mov	esi,dword ptr addr_low	; get addr_low value
	mov	ecx,dword ptr addr_high	; get high value
	sub	ecx,esi			; difference
	shr	ecx,1			; scale for words
	inc	ecx			; +1 for loop value

@@:	movsw				; ds:[esi++]->es:[edi++]
	loop	@b
	jmp	cmd_ret			; done


cmd_cpd:
	pusha
	invoke	getaddr_range,4		; copy's addr_low,addr_high (L=4 bytes)
	cmp	ebx,0			; status ok?
	jne	@f
	invoke	putstr_cs,addr bad_hex
	jmp	cmd_ret2		; stop now

@@:	invoke	putstr_cs,addr m_dest	; prompt for dest value
	invoke	getcmdline,addr edit_buf1	; get a line (holds dest value)
	jc	cmd_ret			; no good
	invoke	strlen,addr edit_buf1	; how long is the line?
	cmp	eax,0			; just hit return?
	je	cmd_ret2		; yes, done
	invoke	tokenize,addr edit_tokens1,addr edit_buf1
	cmp	eax,0			; any tokens?
	je	cmd_ret2		; no
	invoke	hexbin32,addr edit_tokens1	; get hex number
	cmp	ebx,0
	jne	cmd_cpd30		; got it (in eax)

	invoke	putstr_cs,addr bad_hex
	jmp	cmd_ret2

cmd_cpd30:
	mov	edi,eax			; destination address
	mov	ax,ds			; make sure es is correct
	mov	es,ax
	cld				; direction is now up
	mov	esi,dword ptr addr_low	; get addr_low value
	mov	ecx,dword ptr addr_high	; get high value
	sub	ecx,esi			; difference
	shr	ecx,2			; scale for dwords
	inc	ecx			; +1 for loop value

@@:	movsd				; ds:[esi++]->es:[edi++]
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
