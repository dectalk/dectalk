;+
; File: io.asm
;
; Purpose: microPOST, input, output port commands
;
; Edits:
;
; 001 30-Dec-1991 RAO Creation
; 002 05-Feb-1992 RAO Changed port mask size for IB commands (was too limiting)
;			also fixed bug which caused port address to replace
;			data value...
;-
	title	microPOST io commands
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
	extrn	tok_list1:near,tok_count1:near
	extrn	last_dropped:near
	public	cmd_ib,cmd_iw,cmd_id,cmd_ob,cmd_ow,cmd_od

ROM_CodeP	SEGMENT
	assume	ds:ROM_DataP
;+
; locally used strings
;-
bad_port	db	CR,LF,'? Bad port value',0 ; is better than none?
bad_hex		db	CR,LF,'? Bad hex value',0
m_args		db	CR,LF,'? args',0
port_65535	db	CR,LF,'? Port address must be in range 00..FFFF',0

;+
; Note:
;	On entry, the command line is in line_buf1.
;	The tokenized list is in tok_list1.
;	The number of tokens are in tok_count1.
;-
cmd_ob:
	pusha
	mov	ecx,dword ptr tok_count1	; number of tokens
	cmp	ecx,3			; must be 3 (i.e. 'OB 2F0 F5')
	jne	do_bad_args		; not ok

	invoke	nextnull,addr tok_list1	; find end of 1st token 'OB'
	inc	eax			; just past null char

	mov	esi,eax			; get port address
	invoke	hexbin32,esi
	cmp	ebx,0			; hex to bin ok?

	je	do_bad_port		; no

	mov	edx,eax			; save port address
	and	eax,0ffff0000h		; limit check (was too small before)
	jne	do_port_65535		; not less than 65535

	invoke	nextnull,esi
	inc	eax			; points to hex number
	mov	esi,eax

	invoke	hexbin32,esi
	cmp	ebx,0			; got number ok?

	je	do_bad_hex		; no

	out	dx,al			; do the out
	jmp	cmd_ret

cmd_ow:
	pusha
	mov	ecx,dword ptr tok_count1	; number of tokens
	cmp	ecx,3			; must be 3 (i.e. 'OW 2F0 F5F5')
	jne	do_bad_args		; not ok

	invoke	nextnull,addr tok_list1	; find end of 1st token 'OW'
	inc	eax			; just past null char

	mov	esi,eax			; get port address
	invoke	hexbin32,esi
	cmp	ebx,0			; hex to bin ok?

	je	do_bad_port		; no

	mov	edx,eax			; save port address
	and	eax,0ffff0000h		; limit check
	jne	do_port_65535		; not less than 65535

	invoke	nextnull,esi
	inc	eax			; points to hex number
	mov	esi,eax

	invoke	hexbin32,esi
	cmp	ebx,0			; got number ok?

	je	do_bad_hex		; no

	out	dx,ax			; do the out
	jmp	cmd_ret

cmd_od:
	pusha
	mov	ecx,dword ptr tok_count1	; number of tokens
	cmp	ecx,3			; must be 3 (i.e. 'OD 2F0 F5F51234')
	jne	do_bad_args		; not ok

	invoke	nextnull,addr tok_list1	; find end of 1st token 'OD'
	inc	eax			; just past null char

	mov	esi,eax			; get port address
	invoke	hexbin32,esi
	cmp	ebx,0			; hex to bin ok?

	je	do_bad_port		; no

	mov	edx,eax			; save port address
	and	eax,0ffff0000h		; limit check
	jne	do_port_65535		; not less than 65535

	invoke	nextnull,esi
	inc	eax			; points to hex number
	mov	esi,eax

	invoke	hexbin32,esi
	cmp	ebx,0			; got number ok?

	je	do_bad_hex		; no

	out	dx,eax			; do the out
	jmp	cmd_ret

cmd_ib:
	pusha
	mov	ecx,dword ptr tok_count1	; number of tokens
	cmp	ecx,2			; must be 2 (i.e. 'IB 2F0')
	jne	do_bad_args		; not ok

	invoke	nextnull,addr tok_list1	; find end of 1st token 'IB'
	inc	eax			; just past null char

	mov	esi,eax			; get port address
	invoke	hexbin32,esi
	cmp	ebx,0			; hex to bin ok?

	je	do_bad_port		; no

	mov	edx,eax			; save port address
	xor	eax,eax			; zero

	in	al,dx			; do the input
	invoke	crlf
	invoke	puthex2,eax		; write the value
	jmp	cmd_ret

cmd_iw:
	pusha
	mov	ecx,dword ptr tok_count1	; number of tokens
	cmp	ecx,2			; must be 2 (i.e. 'IW 2F0')
	jne	do_bad_args		; not ok

	invoke	nextnull,addr tok_list1	; find end of 1st token 'IW'
	inc	eax			; just past null char

	mov	esi,eax			; get port address
	invoke	hexbin32,esi
	cmp	ebx,0			; hex to bin ok?

	je	do_bad_port		; no

	mov	edx,eax			; save port address
	xor	eax,eax			; zero

	in	ax,dx			; do the input
	invoke	crlf
	invoke	puthex4,eax		; write the value
	jmp	cmd_ret

cmd_id:
	pusha
	mov	ecx,dword ptr tok_count1	; number of tokens
	cmp	ecx,2			; must be 2 (i.e. 'ID 2F0')
	jne	do_bad_args		; not ok

	invoke	nextnull,addr tok_list1	; find end of 1st token 'ID'
	inc	eax			; just past null char

	mov	esi,eax			; get port address
	invoke	hexbin32,esi
	cmp	ebx,0			; hex to bin ok?

	je	do_bad_port		; no

	mov	edx,eax			; save port address

	in	eax,dx			; do the input
	invoke	crlf
	invoke	puthex8,eax		; write the value
	jmp	cmd_ret

;+
; command error conditions
;-
do_bad_args:
	invoke	putstr_cs,addr m_args	; bad number of args
	jmp	cmd_ret

do_bad_port:
	invoke	putstr_cs,addr bad_port	; bad port value
	jmp	cmd_ret

do_port_65535:
	invoke	putstr_cs,addr port_65535
	jmp	cmd_ret

do_bad_hex:
	invoke	putstr_cs,addr bad_hex
	jmp	cmd_ret

cmd_ret:
;+
; common return
;-
cmd_ret2:
	popa
	jmp	parse_top		; return to parser

ROM_CodeP	ENDS
	end
