;+
; File: x.asm
;
; Purpose: microPOST, hex char echo command (type stuff, see the hex values)
;
; Edits:
;
; 001 19-Dec-1991 RAO Creation
; 002 24-Dec-1991 RAO Fix limit check code for input
; 003 26-Dec-1991 RAO Use pusha/popa
;-
	title	microPOST hex char command (just for debugging)
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
	public	cmd_x

ROM_CodeP	SEGMENT
	assume	ds:ROM_DataP
;+
; locally used strings
;-
m_1	db	CR,LF,'Type characters (no echo), end with ^C. Input> ',0
m_2	db	CR,LF,'Char values: ',0

;+
;	On entry, the command line is in line_buf1.
;	The tokenized list is in tok_list1.
;	The number of tokens are in tok_count1.
;-
cmd_x:
	pusha
	invoke	putstr_cs,addr m_1

	mov	esi,offset edit_buf1	; will write chars into this buffer
	xor	ecx,ecx			; count how many chars we read

@@:	invoke	getc			; get a char
	jisattn	@f			; break the loop

	mov	[esi],al		; store char in buffer
	inc	ecx
	inc	esi
	cmp	ecx,IN_BUFF_LENGTH-1	; limit check
	jl	@b			; get more

@@:					; here if attn or buffer full
	cmp	ecx,0
	je	cmd_ret			; if no chars found, don't dump
	invoke	putstr_cs,addr m_2	; dump message
	mov	esi,offset edit_buf1	; back to start of buffer

@@:	movzx	eax,byte ptr [esi]	; get one char back
	invoke	puthex2,eax		; format as hex value
	invoke	space
	inc	esi			; bump ptr
	loop	@b			; count, loop

cmd_ret:
;+
; common return
;-
	popa

	jmp	parse_top		; return to parser

ROM_CodeP	ENDS
	end
