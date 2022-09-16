;+
; File: ex.asm
;
; Purpose: microPOST, enter commands
;
; Edits:
;
; 001 17-Dec-1991 RAO Creation
; 002 18-Dec-1991 RAO Fix unmatched push,pop sequence
; 003 26-Dec-1991 RAO Use pusha/popa
; 004 05-Mar-1992 RAO Fixed bad loop target in ED command
;-
	title	microPOST enter commands
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
	public	cmd_eb,cmd_ew,cmd_ed

ROM_CodeP	SEGMENT
	assume	ds:ROM_DataP
;+
; locally used strings
;-
bad_hex	db	CR,LF,'? Bad number format',0 ; is better than none?

;+
;	On entry, the command line is in line_buf1.
;	The tokenized list is in tok_list1.
;	The number of tokens are in tok_count1.
;-
cmd_eb:
	pusha
	invoke	getaddr_range,1		; fill addr_low,addr_high (L=1 byte)
	cmp	ebx,0
	jne	@f
	invoke	putstr_cs,addr bad_hex
	jmp	cmd_ret2		; stop now

@@:	mov	esi,dword ptr addr_low	; get addr_low value

cmd_eb10:
	invoke	crlf			; new line
	invoke	addrprompt,esi		; dump address to console

	invoke	space
	xor	eax,eax
	cld
	lodsb				; get value into al<-[esi++]
	invoke	puthex2,eax		; write 2 digit value
	invoke	space
	invoke	getcmdline,addr edit_buf1
	jc	cmd_ret			; no good
	invoke	strlen,addr edit_buf1
	cmp	eax,0			; just hit return?
	je	cmd_ret			; yes, done
	invoke	tokenize,addr edit_tokens1,addr edit_buf1
	cmp	eax,0			; any tokens?
	je	cmd_ret			; no
	invoke	hexbin32,addr edit_tokens1	; get hex number
	cmp	ebx,0
	jne	cmd_eb30		; got it

	invoke	putstr_cs,addr bad_hex
	jmp	cmd_ret

cmd_eb30:
	mov	[esi-1],al		; modify memory
	jmp	cmd_eb10		; start another line

cmd_ew:
	pusha
	invoke	getaddr_range,2		; fill addr_low,addr_high (L=2bytes)
	cmp	ebx,0
	jne	@f
	invoke	putstr_cs,addr bad_hex
	jmp	cmd_ret2		; stop now

@@:	mov	esi,dword ptr addr_low	; get addr_low value

cmd_ew10:
	invoke	crlf			; new line
	invoke	addrprompt,esi		; dump address to console

	invoke	space
	xor	eax,eax
	cld
	lodsw				; get value into ax<-[esi++]
	invoke	puthex4,eax		; write 4 digit value
	invoke	space
	invoke	getcmdline,addr edit_buf1
	jc	cmd_ret			; no good
	invoke	strlen,addr edit_buf1
	cmp	eax,0			; just hit return?
	je	cmd_ret			; yes, done
	invoke	tokenize,addr edit_tokens1,addr edit_buf1
	cmp	eax,0			; any tokens?
	je	cmd_ret			; no
	invoke	hexbin32,addr edit_tokens1	; get hex number
	cmp	ebx,0
	jne	cmd_ew30		; got it

	invoke	putstr_cs,addr bad_hex
	jmp	cmd_ret

cmd_ew30:
	mov	[esi-2],ax		; modify memory
	jmp	cmd_ew10		; start another line

cmd_ed:
	pusha
	invoke	getaddr_range,4		; fill addr_low,addr_high (L=4bytes)
	cmp	ebx,0
	jne	@f
	invoke	putstr_cs,addr bad_hex
	jmp	cmd_ret2		; stop now

@@:	mov	esi,dword ptr addr_low	; get addr_low value

cmd_ed10:
	invoke	crlf			; new line
	invoke	addrprompt,esi		; dump address to console
	mov	ecx,4			; number of dwords/line

	invoke	space
	xor	eax,eax
	cld
	lodsd				; get value into eax<-[esi++]
	invoke	puthex8,eax		; write 8 digit value
	invoke	space
	invoke	getcmdline,addr edit_buf1
	jc	cmd_ret			; no good
	invoke	strlen,addr edit_buf1
	cmp	eax,0			; just hit return?
	je	cmd_ret			; yes, done
	invoke	tokenize,addr edit_tokens1,addr edit_buf1
	cmp	eax,0			; any tokens?
	je	cmd_ret			; no
	invoke	hexbin32,addr edit_tokens1	; get hex number
	cmp	ebx,0
	jne	cmd_ed30		; got it

	invoke	putstr_cs,addr bad_hex
	jmp	cmd_ret

cmd_ed30:
	mov	[esi-4],eax		; modify memory
	jmp	cmd_ed10		; start another line (RAO fixed)

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
