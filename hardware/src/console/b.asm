;+
; File: b.asm
;
; Purpose: microPOST, breakpoint commands
;
; Edits:
;
; 001 09-Jan-1992 RAO Creation
;-
	title	microPOST breakpoint commands
	.xlist
	include am00.inc
	include	am05.inc
	include	am07.inc
	include	amsegs32.inc
	include	limits.inc
	include	segass32.inc
	include	proto.inc
	include	com.inc
	.list

	extrn	line_buf1:near,parse_top:near,tok_count1:near,tok_list1:near
	extrn	addr_low:near,addr_high:near,last_addr:near
	public	cmd_b,cmd_bc,cmd_be

ROM_CodeP	SEGMENT
	assume	ds:ROM_DataP
;+
; messages
;-
m_notready	db	CR,LF,'Breakpoint command option is not implemented',0
m_args		db	CR,LF,'? args',0
m_bad_hex	db	CR,LF,'? bad hex value',0
m_bad_addr	db	CR,LF,'? bad address',0
m_bad_bnum	db	CR,LF,'? bad bkpt value (must be 0..3)',0
m_labels	db	CR,LF,'   Address L     Class    Enables',CR,LF,0
m_class		db	CR,LF,'? class must be I, B, W or D',0
m_access	db	CR,LF,'? access must be R or W',0
m_int_err01	db	CR,LF,'? fatal internal error01',0
m_r		db	'r',0
m_w		db	'w',0
m_i		db	'i',0
m_d		db	'd',0
m_b		db	'b',0

;+
; locally used strings
;-
s_c		db	'c',0

s_i		db	'i',0
s_b		db	'b',0
s_w		db	'w',0
s_d		db	'd',0
s_r		db	'r',0

;+
; Breakpoint commands:
;
; BC			clear all breakpoints (just disables them)
; BC n			clear only bkpt n
;
; BE			enable all breakpoints again
;
; BE n			enable bkpt n
; B C			same as BC
; B C n			clear bkpt n
;
; B			show all breakpoints
;
; B n Addr { I | B | W | D } { R | W }
;
; where n = 0..3
; I implies instruction bkpt and stands alone
; B,W,D are data bkpts and can be followed by R or W (for write or read/write)
;
; If R or W are missing, we default to R => read/write
;
;-

;+
; process 'BC...'
;-
cmd_bc:
	pusha

	mov	eax,dword ptr tok_count1	; how many tokens?
	sub	eax,1				; get rid of the BC itself
	cmp	eax,1				; one arg?
	jl	cmd_bc20			; no, clear all

	mov	esi,offset tok_list1		; start of cmd line
	invoke	nextnull,esi			; end of 1st token (BC)
	inc	eax				; start of next token
	mov	esi,eax
	invoke	hexbin32,esi
	cmp	ebx,0				; error?

	je	do_bad_hex			; yes

	cmp	eax,3
	ja	do_bad_bkpt_num			; not in range 0..3

	mov	ecx,eax
	mov	ebx,dr7				; get current value

	mov	eax,11y				; 2 bit mask
	add	ecx,ecx

	shl	eax,cl				; mask in position
	not	eax				; 00's in the field

	and	eax,NOT 1111110000000000y	; reserved bits must be zero
	and	eax,ebx				; dr7's new value
	mov	dr7,eax				; update
	jmp	cmd_ret				;

;+
; case for clearing all bkpts
;-
cmd_bc20:
	mov	eax,(NOT 11111111y) AND (NOT 1111110000000000y)
	mov	ebx,dr7
	and	eax,ebx
	mov	dr7,eax

	jmp	cmd_ret

;+
; process 'BE...'
;-
cmd_be:
	pusha

	mov	eax,dword ptr tok_count1	; how many tokens?
	sub	eax,1				; get rid of the BE itself
	cmp	eax,1				; one arg?
	jl	cmd_be20			; no, enable all

	mov	esi,offset tok_list1		; start of cmd line
	invoke	nextnull,esi			; end of 1st token (BE)
	inc	eax				; start of next token
	mov	esi,eax
	invoke	hexbin32,esi
	cmp	ebx,0				; error?

	je	do_bad_hex			; yes

	cmp	eax,3
	ja	do_bad_bkpt_num			; not in range 0..3

	mov	ecx,eax
	mov	ebx,dr7				; get current value

	mov	eax,10y				; 2 bit mask (Gn=1,Ln=0)
	add	ecx,ecx

	shl	eax,cl				; mask in position

	or	eax,ebx				; dr7's new value
	mov	dr7,eax				; update
	jmp	cmd_ret				;

;+
; case for re-enabling *all* bkpts
;-
cmd_be20:
	mov	eax,dr7
	and	eax,NOT 1101110011111111y	; mask out reserved and
						;  GnLn bits
	or	eax,10101010y			; re-enable G0..G3
	mov	dr7,eax

	jmp	cmd_ret

cmd_b:
	pusha

	mov	eax,dword ptr tok_count1	; how many tokens?
	sub	eax,1				; get rid of the B itself
	cmp	eax,1				; one arg?
	jl	cmd_b20				; no, display all, set none

;+
; if there are *any* args after the B, you have to see at least
;
;	B n xxxxxxxx
;-
	cmp	eax,2
	jl	do_args				; not enough args

	invoke	nextnull,addr tok_list1		; find end of 'B' token
	inc	eax				; next tok after 'B'

	mov	esi,eax
	invoke	hexbin32,esi			; get bkpt number
	cmp	ebx,0

	je	do_bad_bkpt_num

	cmp	eax,3				; enforce 0..3 range
	ja	do_bad_bkpt_num

	mov	edx,eax				; save bkpt number**
	invoke	nextnull,esi
	inc	eax
	mov	esi,eax				; should be at the address

	invoke	hexbin32,esi			; get bkpt address
	cmp	ebx,0
	je	do_bad_addr

	mov	edi,eax				; save bkpt address**
;+
; ok, some options. If no other args are present, assume Byte access, read
; and writes...
;+
	mov	eax,dword ptr tok_count1
	cmp	eax,3				; just B n xxxxxxxx?
	ja	@f				; no, we have more args

	mov	ebx,0011y			; len = 00 (bytes), rw = 11
	jmp	cmd_b100			; set it

;+
; we still have to get some args like I, B, W, D and perhaps W or R
;-
@@:
	invoke	nextnull,esi
	inc	eax
	mov	esi,eax

	invoke	stricmp_cs,addr m_i,esi		; did we see 'I'?
	cmp	eax,0
	jne	@f				; no

	mov	ebx,0000y			; len=00, rw=00 (instruction)
	jmp	cmd_b100			; set

@@:
	invoke	stricmp_cs,addr m_b,esi		; did we see 'B' (byte)?
	cmp	eax,0
	jne	@f				; no

	mov	ebx,0				; set len=00 (bytes)
	jmp	cmd_b30				; get next parameter

@@:
	invoke	stricmp_cs,addr m_w,esi		; did we see 'W' (word)?
	cmp	eax,0
	jne	@f				; no

	mov	ebx,0100y			; len=01 (words)
	jmp	cmd_b30				; get next parameter

@@:
	invoke	stricmp_cs,addr m_d,esi		; did we see 'D' (dword)?
	cmp	eax,0
	jne	do_class

	mov	ebx,1100y			; len=11 (dwords)

cmd_b30:
;+
; now have something like B 3 12345678 W. What is next? R or W possible.
;-
	mov	eax,dword ptr tok_count1
	cmp	eax,4			; more?
	jg	@f			; yes, more args to process

	or	ebx,11y			; implied R/W
	jmp	cmd_b100

@@:
;+
; have one left, either R or W
;-
	cmp	eax,5
	jg	do_args			; too many args

	invoke	nextnull,esi
	inc	eax
	mov	esi,eax

	invoke	stricmp_cs,addr m_r,esi
	cmp	eax,0				; = 'R'?
	jne	@f				; no

	or	ebx,11y				; rw enabled
	jmp	cmd_b100

@@:
	invoke	stricmp_cs,addr m_w,esi		; = 'W' write only?
	cmp	eax,0
	jne	do_access

	or	ebx,01y				; write only enabled
	jmp	cmd_b100

cmd_b100:
;+
; time to enable one bkpt.
;
; ebx holds 4 bit field LLRW
; edx holds bkpt index (0..3)
; edi holds bkpt address
;
; Be careful, first clear enable bits, then set the class, bits, address and
; only then, re-enable...
;-
	mov	ecx,edx
	add	ecx,ecx
	mov	eax,11y
	shl	eax,cl			; mask out GL bits for this bkpt
	not	eax
	and	eax,NOT 1101110000000000y
	mov	ecx,dr7
	and	eax,ecx
	mov	dr6,eax			; this bkpt is now off

	cmp	edx,0
	jne	@f

	mov	dr0,edi			; set bkpt address
	jmp	cmd_b110

@@:	cmp	edx,1
	jne	@f

	mov	dr1,edi			; set bkpt address
	jmp	cmd_b110

@@:	cmp	edx,2
	jne	@f

	mov	dr2,edi			; set bkpt address
	jmp	cmd_b110

@@:	cmp	edx,3
	jne	do_int_err01		; impossible case

	mov	dr3,edi			; set bkpt address
	
cmd_b110:
;+
; mask out the len,rw field first
;-
	mov	ecx,edx			;
	shl	ecx,2
	add	ecx,16
	mov	esi,1111y
	shl	esi,cl
	not	esi			; ready to mask out old len,r,w
	and	eax,esi			; done
	shl	ebx,cl			; move new bits into position
	or	eax,ebx			; done
	and	eax,NOT 1101110000000000y ; zap reserved bits
	mov	ebx,10y			; G=1,L=0
	mov	ecx,edx
	add	ecx,ecx			; how far to shift
	shl	ebx,cl
	or	eax,ebx			; set G,L bits
	mov	dr7,eax			; breakpoint is on
	jmp	cmd_ret
 
;+
; display all bkpts, change none
;-
cmd_b20:
	invoke	putstr_cs,addr m_labels
	invoke	show_bkpts

	jmp	cmd_ret

do_args:
	invoke	putstr_cs,addr m_args
	jmp	cmd_ret

do_bad_addr:
	invoke	putstr_cs,addr m_bad_addr
	jmp	cmd_ret

do_bad_hex:
	invoke	putstr_cs,addr m_bad_hex
	jmp	cmd_ret

do_class:
	invoke	putstr_cs,addr m_class
	jmp	cmd_ret

do_access:
	invoke	putstr_cs,addr m_access
	jmp	cmd_ret

do_bad_bkpt_num:
	invoke	putstr_cs,addr m_bad_bnum
	jmp	cmd_ret

do_int_err01:
	invoke	putstr_cs,addr m_int_err01
	jmp	cmd_ret

cmd_ret:
;+
; common return
;-
	popa
	jmp	parse_top		; return to parser
ROM_CodeP	ENDS
	end
