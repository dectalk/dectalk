;+
; File: g.asm
;
; Purpose: microPOST Go command
;  .. also rb, t0, and talk.
;
; Edits:
;
; 001 06-Jan-1992 RAO Creation
; 002 24-Jan-1992 RAO Add last_go_address update prior to long jump
; 003 03-feb-1994 tek added DE-specific commands.
;-
	title	microPOST Go command
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
	extrn	last_dropped:near,last_go_address:near
	extrn	loader_error:near, g_saved_sp:near

	public	cmd_go

ROM_CodeP	SEGMENT
	assume	ds:ROM_DataP
;+
; locally used strings
;-
m_bye		db	CR,LF,'{Go} ',0
m_hello		db	CR,LF,'[Target code executed a far return]',0
bad_hex		db	CR,LF,'? Bad hex address',0
m_args		db	CR,LF,'? args',0
bad_load_sum	db	CR,LF,'? loader checksum error flag is set - no blasting.',0
m_ssesp		db	CR,LF,' ss:esp ',0
m_semi		db	':',0
;+
; Note:
;	On entry, the command line is in line_buf1.
;	The tokenized list is in tok_list1.
;	The number of tokens are in tok_count1.
;
; **** This command does *not* return ****
;-
cmd_go:
	pusha
	mov	ecx,dword ptr tok_count1	; number of tokens
	cmp	ecx,2			; must be 2 (i. e. Go 12345)
	jne	do_bad_args		; not ok

	invoke	nextnull,addr tok_list1	; find end of 1st token 'Go'
	inc	eax			; just past null char

	mov	esi,eax			; get jump address
	invoke	hexbin32,esi
	cmp	ebx,0			; hex to bin ok?

	je	do_bad_hex		; no

	mov	edx,eax			; save target address
	mov	DWORD PTR last_go_address,eax

exe_edx: ; enter here to jump to what's in eax..
	; leave a recognizable pattern on the stack in the guard area..
	mov	ecx, 0deadbeefh
	push	ecx	; space for a slight over-pop..
	push	ecx	; space for a slight over-pop..
	push	ecx	; space for a slight over-pop..
	push	ecx	; space for a slight over-pop..
	push	ecx	; space for a slight over-pop..
	push	ecx	; space for a slight over-pop..
	push	ecx	; space for a slight over-pop..
	push	ecx	; space for a slight over-pop..
	push	ecx	; space for a slight over-pop..
	push	ecx	; space for a slight over-pop..
	mov	ecx, 0cacacacah
	push	ecx
	mov	ecx, esp
	mov	dword ptr g_saved_sp, ecx

	invoke	putstr_cs, addr m_ssesp
	mov	eax, es
	invoke	puthex8,eax
 	invoke	putstr_cs, addr m_semi
	mov	eax, esp
	invoke	puthex8,eax
	invoke	putstr_cs,addr m_bye

	xor	eax,eax
	mov	ax,cs			; this current code segment
	push	eax			; save on stack (padded)
	push	offset @f		; if we're lucky, a far return will
					; bring us back...

	mov	ax,Rselector <3,0,0>	; code segment from 0 to ffffffff
	push	eax			; selector (padded to 32 bits)
	push	edx			; eip from command line
	retf				; this is like a long jump
;
; (never) gets here
;
@@:
	; get back the old SP..
	mov	ecx, dword ptr g_saved_sp
	pop	ecx
	pop	ecx
	pop	ecx
	pop	ecx
	pop	ecx
	pop	ecx
	pop	ecx
	pop	ecx
	pop	ecx
	pop	ecx
	pop	ecx


	invoke	putstr_cs, addr m_hello	; unexpected surprise
	jmp	cmd_ret

;+
; command error conditions
;-
do_bad_args:
	invoke	putstr_cs,addr m_args	; bad number of args
	jmp	cmd_ret

do_bad_hex:
	invoke	putstr_cs,addr bad_hex
	jmp	cmd_ret




public	cmd_rb
cmd_rb:		; reblast the roms.
	pusha
	mov	eax, dword ptr loader_error
	cmp	eax,0
	jne	load_bad

	mov	eax, 0c70000h	; where in the rom the blaster lives
	jmp	copyandgo


load_bad:	; checksum flag was set.
	invoke	putstr_cs, addr bad_load_sum
	jmp	cmd_ret


public	cmd_talk
cmd_talk:	; start the resident code.
	pusha
	mov	eax, 0c71000h	; destart..
	jmp	copyandgo

public	cmd_t0
cmd_t0:		; start the test code.
	pusha
	mov	eax, 0c72000h	; pd_test2
	jmp	copyandgo



copyandgo:
	; copy 01000h bytes from [eax] to 0fe000h, and then jump to it.
	mov	esi, eax
	mov	edi, 0fe000h
	; make sure we have an ES..
	mov	cx, ds
	mov	es, cx
	mov	ecx, 0800h ; move this many words
	rep	movsw

	mov	edx, 0fe000h	; start addr
	jmp	exe_edx



public	cmd_cf
cmd_cf:		; clear the checksum flag..
	xor	eax,eax
	mov	dword ptr loader_error, eax
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
