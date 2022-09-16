;+
; File: ctl.asm
;
; Purpose: microPOST, control commands
;
; Edits:
;
; 001 14-Dec-1991 RAO Creation
; 002 18-Dec-1991 RAO Activate some com commands, and the led stuff
; 003 24-Dec-1991 RAO Added C INT x test
; 004 26-Dec-1991 RAO use pusha/popa
; 005 03-Jan-1992 RAO Added msr, mcr
; 006 08-Jan-1992 RAO Debug int3 stuff, added c ints (to test a range of int
;				handlers)
; 007 15-Jan-1992 RAO Added cls (not really a ctl command but close enough)
; 008 05-Feb-1992 RAO More sponging, added quit commmand and Combo option
; 009 12-Feb-1991 RAO Fixed combo length error
; 010 05-Mar-1992 RAO Added C COFF and C CINV
;-
	title	microPOST control command
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
	public	cmd_ctl,cmd_cls,cmd_quit

ROM_CodeP	SEGMENT
	assume	ds:ROM_DataP
;+
; messages
;-
m_notready	db	CR,LF,'Control command is not implemented',0
m_args		db	CR,LF,'? args',0
m_com_delta	db	'...[changing com, type any key to continue] ',0
m_int3		db	'...[starting debug interrupt] ',0
m_ints		db	'...[starting a range of ints] ',0
m_msr		db	CR,LF,'msr: DCD* RI* DSR* CTS* delCTS* delDSR* delRI* del DCD* ',0
m_bad_hex	db	CR,LF,'? bad hex value',0
m_quit		db	'...[starting BIOS/RRD] ',0
m_quit_failed	db	CR,LF,'? HLT failed.',0

;+
; locally used strings
;-
s_combo		db	'combo',0

s_led00		db	'led00',0
s_led01		db	'led01',0
s_led10		db	'led10',0
s_led11		db	'led11',0

s_mcr		db	'mcr',0
s_msr		db	'msr',0

s_b9600		db	'b9600',0
s_b2400		db	'b2400',0
s_b38400	db	'b38400',0
s_b57600	db	'b57600',0

s_coff		db	'coff',0
s_cinv		db	'cinv',0

s_int3		db	'int3',0
s_ints		db	'ints',0
;+
; data
;-

combo_table	db 69h,017h	; addr, value
		db 6ah,0ffh
		db 6bh,0f8h
		db 6ch,003h
		db 6dh,087h
		db 6eh,0f8h
		db 6fh,002h
		db 70h,087h
		db 71h,078h
		db 72h,003h
		db 73h,087h
		db 74h,0f0h
		db 75h,003h
		db 76h,087h
		db 7ah,0f2h
		db 7bh,000h
		db 7ch,080h
		db 7dh,0f3h
		db 7eh,000h
		db 7fh,080h

combo_table_len equ $ - combo_table
 
;+
; cls command
;-
cmd_cls:			; don't bother with pusha
	invoke	cls
	jmp	cmd_quick_ret

;+
; quit command
;-
cmd_quit:
	invoke	putstr_cs,addr m_quit	; issue a short warning

	hlt				; don't try this at home...

	invoke	putstr_cs,addr m_quit_failed
	jmp	cmd_quit		; we should never get here
;+
; we have a control command, there is one arg for this command, get it.
; use a simple, brute force search mechanism
;-
cmd_ctl:
	pusha

	mov	eax,dword ptr tok_count1	; how many tokens?
	sub	eax,1				; get rid of the C itself
	cmp	eax,1				; must now be one or more
	jge	@f				; yes, ok
	invoke	putstr_cs,addr m_args		; wrong number of args
	jmp	cmd_ret				; leave

@@:	mov	esi,offset tok_list1		; start of cmd line
	invoke	nextnull,esi			; end of 1st token (C)
	inc	eax				; start of next token
	mov	esi,eax

	invoke	stricmp_cs,addr s_combo,esi	; match?
	cmp	eax,0
	je	cmd_combo			; match

	invoke	stricmp_cs,addr s_led00,esi	; match?
	cmp	eax,0
	je	cmd_led00			; yes

	invoke	stricmp_cs,addr s_led01,esi	; match?
	cmp	eax,0
	je	cmd_led01			; yes

	invoke	stricmp_cs,addr s_led10,esi	; match?
	cmp	eax,0
	je	cmd_led10			; yes

	invoke	stricmp_cs,addr s_led11,esi	; match?
	cmp	eax,0
	je	cmd_led11			; yes
;
; a little boring, isn't it?
;

	invoke	stricmp_cs,addr s_b9600,esi	; match?
	cmp	eax,0
	je	cmd_b9600

	invoke	stricmp_cs,addr s_b2400,esi	; match?
	cmp	eax,0
	je	cmd_b2400

	invoke	stricmp_cs,addr s_b38400,esi	; match?
	cmp	eax,0
	je	cmd_b38400

	invoke	stricmp_cs,addr s_b57600,esi	; match?
	cmp	eax,0
	je	cmd_b57600

	invoke	stricmp_cs,addr s_msr,esi	; match?
	cmp	eax,0
	je	cmd_msr

	invoke	stricmp_cs,addr s_mcr,esi	; match?
	cmp	eax,0
	je	cmd_mcr

	invoke	stricmp_cs,addr s_int3,esi	; match?
	cmp	eax,0
	je	cmd_int3

	invoke	stricmp_cs,addr s_ints,esi	; match?
	cmp	eax,0
	je	cmd_ints

	invoke	stricmp_cs,addr s_coff,esi	; match?
	cmp	eax,0
	je	cmd_coff

	invoke	stricmp_cs,addr s_cinv,esi	; match?
	cmp	eax,0
	je	cmd_cinv

cmd_bad:
	invoke	putstr_cs,addr m_args		; no match
	jmp	cmd_ret
;+
; Initialize the combo chip on the bridge
;-
cmd_combo:
	cld					; go forward
	mov	ecx,combo_table_len		; loop counter
	shr	ecx,1				; bytes->loops
	mov	ebx,COMBO_ADDRESS		; address port
	mov	edi,COMBO_DATA			; data port
	mov	esi,offset combo_table

@@:	lodsb	cs:combo_table			; get addr
	mov	edx,ebx				; addr port
	out	dx,al				; write addr register
	lodsb	cs:combo_table			; get data
	mov	edx,edi				; data port
	out	dx,al				; write data register
	loop	@b				; do entire table

	jmp	cmd_ret				; ok, done
;+
; Set the baud rate (using defaults for other items)
;-
cmd_b9600:
	mov	ax,0e300h
	jmp	cmd_cdo

cmd_b2400:
	mov	ax,0a300h
	jmp	cmd_cdo

cmd_cdo:
	invoke	putstr_cs,addr m_com_delta
	invoke	xmitidle		; let output settle
	invoke	ComSet,ax		; change com parameters
	invoke	getc			; wait for input, eat char
	jmp	cmd_ret

cmd_b38400:	; a little different, because comset won't do this speed.
	invoke	xmitidle		; wait for tx done..
	mov	edx,COMPORT		; base of com port
	add	dx, com_line_ctl
	in	al,dx			;  and get it
	mov	bl, al			; remmeber it for later..
	or	al, lcr_dlab		; set dlab 
	out	dx, al
	
	; now we jam the baud divisor..
	; we cheat here, and only set the low-order divisor.
	mov	al, 10	 		; 38kb/s divisor..
	mov	edx,COMPORT		; base of com port
	add	dx, com_dl_lsb
	out	dx,al		;  and write it

	; and put back the LCR..
	mov	al,bl			;set DLAB bit
	mov	edx,COMPORT			; base of com port
	add	dx, com_line_ctl
	out	dx,al		;  and write it

	; done.
	jmp	cmd_ret

cmd_b57600:	; a little different, because comset won't do this speed.
	invoke	xmitidle		; wait for tx done..
	mov	edx,COMPORT		; base of com port
	add	dx, com_line_ctl
	in	al,dx			;  and get it
	mov	bl, al			; remmeber it for later..
	or	al, lcr_dlab		; set dlab 
	out	dx, al
	
	; now we jam the baud divisor..
	; we cheat here, and only set the low-order divisor.
	mov	al, 7	 		; 56kb/s divisor..
	mov	edx,COMPORT		; base of com port
	add	dx, com_dl_lsb
	out	dx,al		;  and write it

	; and put back the LCR..
	mov	al,bl			;set DLAB bit
	mov	edx,COMPORT			; base of com port
	add	dx, com_line_ctl
	out	dx,al		;  and write it

	; done.
	jmp	cmd_ret


;+
; Set the leds, the displayed value for a given 2 bit value b[1],b[0]
;
;	led0 = b[0]
;	led1 = 1 xor b[1]
;-
cmd_led00:
	SetLedP		10y		; 
	jmp		cmd_ret

cmd_led01:
	SetLedP		11y
	jmp		cmd_ret

cmd_led10:
	SetLedP		00y
	jmp		cmd_ret

cmd_led11:
	SetLedP		01y
	jmp		cmd_ret

cmd_msr:
;+
; get the msr and output the binary value
;-
	mov	ebx,'0'				; keep code small
	mov	edx,'1'				; save ascii constants
	invoke	getmsr				; msr -> eax
	mov	ecx,eax				; save
	invoke	putstr_cs,addr m_msr
	test	cl,MSR_RLSD			; bit on?
	je	@f				; no
	invoke	putc,edx			; yes, show '1'
	jmp	msr1				;
@@:	invoke	putc,ebx			; show '0'

msr1:
	test	cl,MSR_RI			; bit on?
	je	@f				; no
	invoke	putc,edx			; yes, show '1'
	jmp	msr2				;
@@:	invoke	putc,ebx			; show '0'

msr2:
	test	cl,MSR_DSD			; bit on?
	je	@f				; no
	invoke	putc,edx			; yes, show '1'
	jmp	msr3				;
@@:	invoke	putc,ebx			; show '0'

msr3:
	test	cl,MSR_CTS			; bit on?
	je	@f				; no
	invoke	putc,edx			; yes, show '1'
	jmp	msr4				;
@@:	invoke	putc,ebx			; show '0'

msr4:
	test	cl,MSR_DRLSD			; bit on?
	je	@f				; no
	invoke	putc,edx			; yes, show '1'
	jmp	msr5				;
@@:	invoke	putc,ebx			; show '0'

msr5:
	test	cl,MSR_TERI			; bit on?
	je	@f				; no
	invoke	putc,edx			; yes, show '1'
	jmp	msr6				;
@@:	invoke	putc,ebx			; show '0'

msr6:
	test	cl,MSR_DDSR			; bit on?
	je	@f				; no
	invoke	putc,edx			; yes, show '1'
	jmp	msr7				;
@@:	invoke	putc,ebx			; show '0'

msr7:
	test	cl,MSR_DCTS			; bit on?
	je	@f				; no
	invoke	putc,edx			; yes, show '1'
	jmp	msr8				;
@@:	invoke	putc,ebx			; show '0'

msr8:
	jmp	cmd_ret

cmd_mcr:
;+
; command line looks like 'C MCR 03'
;
; note that esi already points to MCR
;-
	mov	ecx,dword ptr tok_count1	; get number of tokens
	cmp	ecx,3				; must be like command line
	je	@f

	invoke	putstr_cs,addr m_args
	jmp	cmd_ret

@@:
	invoke	nextnull,esi		; end of 2nd token (MCR)
	inc	eax			; points to hex value
	mov	esi,eax

	invoke	hexbin32,esi		; get hex value from input line
	cmp	ebx,0			; ok?

	jne	@f			; yes

	invoke	putstr_cs,addr m_bad_hex
	jmp	cmd_ret

@@:
	invoke	setmcr,eax
	jmp	cmd_ret

cmd_int3:
	invoke	putstr_cs,addr m_int3
	int	3				; debugger int
	jmp	cmd_ret

cmd_ints:
	invoke	putstr_cs,addr m_ints
	int	0
	int	17
	int	32
	int	33
	int	255
	jmp	cmd_ret

cmd_coff:
;+
; C COFF, turn off the cache, don't do any invalidates
;-
	mov	eax,cr0				; get cr0
	or	eax,CD_SET			; CD = 1 (leave NW alone)
	mov	cr0,eax				; cache disabled
	jmp	cmd_ret

cmd_cinv:
;+
; C CINV, turn off the cache, with invalidates (like the BIOS code)
;-
	invd
	mov	eax,cr0				; get cr0
	or	eax,CD_SET OR NW_SET		; CD = 1, NW = 1
	mov	cr0,eax				; cache disabled
	invd
	jmp	cmd_ret
;
; hope we get back here
;
cmd_ret:
;+
; common return
;-
	popa
;+
; quick
;-
cmd_quick_ret:

	jmp	parse_top		; return to parser
ROM_CodeP	ENDS
	end
