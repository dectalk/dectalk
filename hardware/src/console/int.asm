;+
; File: int.asm
;
; Purpose: microPOST, protected mode interrupt handlers
;
; Edits:
;
; 001 10-Jan-1992 RAO Creation, moved int handlers out of m3 module
; 002 12-Jan-1992 RAO More specific handling for debug reg traps
; 003 17-Jan-1992 RAO Added options when exception 1 is taken
; 004 18-Jan-1992 RAO Tune trap resumes and what the console options are
;		following debug traps...
; 005 22-Jan-1992 RAO Fix register dump after SST and trap
; 006 24-Jan-1992 RAO Added mPOST int21 function access
; 007 25-Jan-1992 RAO Added more function codes to int 21 handler
; 008 26-Jan-1992 RAO Added tokenize to int 21h list
; 009 28-Jan-1992 RAO Added nextnull to int 21h list
; 010 07-Feb-1992 RAO Added hexbin32 to int 21h list
;-
	title	microPOST protected mode int handlers
	.xlist
	include am00.inc
	include	am05.inc
	include	am07.inc
	include	amsegs32.inc
	include	limits.inc
	include	segass32.inc
	include	proto.inc
	include	com.inc
	include	func.inc
	.list

	extrn	last_go_address:near

ROM_CodeP	SEGMENT


	public	pint_00,pint_01,pint_02,pint_03,pint_04,pint_05,pint_06
	public	pint_07,pint_08,pint_09,pint_10,pint_11,pint_12,pint_13
	public	pint_14,pint_15,pint_16,pint_17
	public	pint_reserved
	public	pint_user
	public	pint_funcs

	extrn	guard1:near,guard2:near,guard3:near,guard4:near,guard5:near
	extrn	guard6:near,guard7:near,guard8:near,guard9:near,guard10:near
	extrn	guard11:near,guard12:near,guard13:near,guard14:near
	extrn	parse_top2:near, m_corrupt:near, m_under:near, m_over:near
	extrn	within_int:near
	assume	ds:ROM_DataP
;+
; local strings
;-


m_reserved	db	CR,LF,'#? Interrupt, Intel reserved (18..32)',CR,LF,0
m_int_handler	db	'#? Interrupt  ',0
m_id0		db	CR,LF,'[00] ',0
m_id1		db	CR,LF,'[01] ',0
m_id2		db	CR,LF,'[02] ',0
m_id3		db	CR,LF,'[03] ',0
m_id4		db	CR,LF,'[04] ',0
m_id5		db	CR,LF,'[05] ',0
m_id6		db	CR,LF,'[06] ',0
m_id7		db	CR,LF,'[07] ',0
m_id8		db	CR,LF,'[08] ',0
m_id9		db	CR,LF,'[09] ',0
m_id10		db	CR,LF,'[10] ',0
m_id11		db	CR,LF,'[11] ',0
m_id12		db	CR,LF,'[12] ',0
m_id13		db	CR,LF,'[13] ',0
m_id14		db	CR,LF,'[14] ',0
m_id15		db	CR,LF,'[15] ',0
m_id16		db	CR,LF,'[16] ',0
m_id17		db	CR,LF,'[17] ',0

m_ssesp		db	CR,LF,'ss:esp ',0
m_fatal_abort	db	CR,LF,'Abort.',CR,LF,0
m_stack_abort	db	CR,LF,'? bad stack! ',0

m_user		db	CR,LF,'#? Interrupt, user (33..255)',CR,LF,0
m_cs_eip_flg	db	' cs:eip eflg ',0
m_bad_func	db	CR,LF,'? Bad int 21h function = ',0

m_other		db	' (other) ',0
m_bkpt		db	'Bkpt ',0
m_ss		db	'SST  ',0
m_ss_spaces	db	'                   ',0

m_what_now	db	'<RTCB?>',0
m_what_help	db	CR,LF,'R: Regs, T: Trace, '
		db	'C: Clr Trace, B: Bkpt Off, else GO',CR,LF,0
m_data		db	' *data* ',0
m_code		db	' *inst* ',0

m_eax_edi	db	'EAX..EDI ',0

m_div		db	', Divide Error',CR,LF,0
m_dbg		db	CR,LF,'Dbg ',0
m_nmi		db	', NMI',CR,LF,0
m_1byte		db	', one byte interrupt',CR,LF,0
m_into		db	', INTO',CR,LF,0
m_bound		db	', Array Bounds',CR,LF,0
m_opcode	db	', Invalid Opcode',CR,LF,0
m_device	db	', ESC, WAIT device not available',CR,LF,0
m_dblflt	db	', Double Fault',CR,LF,0
m_res		db	', Intel Reserved',CR,LF,0
m_tss		db	', Invalid TSS',CR,LF,0
m_segpres	db	', Segment not present',CR,LF,0
m_stkflt	db	', Stack Fault',CR,LF,0
m_gpflt		db	', General Protection Fault',CR,LF,0
m_pgflt		db	', Page Fault',CR,LF,0
m_fp		db	', Floating Point, WAIT',CR,LF,0
m_ac		db	', Align Check',CR,LF,0

m_continue	db	CR,LF,'hit any char to dismiss interrupt ',0

	align	16

pint_00:
	invoke	putstr_cs, addr m_id0
	invoke	putstr_cs,addr m_int_handler
;	invoke	putdec8,0
	invoke	putstr_cs,addr m_div
;	jmp	int_common
	jmp	stack_abort

pint_01:
;+
; This vector will field the hardware debug register interrupts...
;-
;	invoke	putstr_cs,addr m_bkpt
;	invoke	putstr_cs,addr m_int_handler
	invoke	putstr_cs,addr m_id1
	invoke	putstr_cs,addr m_dbg
;+
; Is it the debug registers or is it a trace?
;-
	push	eax
	push	ebx
	push	ecx
	push	edx

	mov	ecx,dr6
	mov	edx,dr7

	mov	ebx,-1			; indicator that we have a SST
	test	ecx,DR6_BS		; single step?
	jnz	pint_01_ss		; yes

;+
; check B0 against enabled globals
;-
	xor	ebx,ebx			; 0 => Bkpt 0

pint_01_a:
	shr	edx,1			; Gn at lsb
	mov	eax,edx
	and	eax,ecx			; Bn at lsb
	test	eax,1			; match?

	jnz	pint_01_bkpt		; found breakpoint

	shr	ecx,1			; Bn at lsb
	shr	edx,1			; prepare dr7
	inc	ebx			; next bkpt
	cmp	ebx,3
	jle	pint_01_a

;+
; here if we found *no* bkpt, could be a task switch?
;-	
	invoke	putstr_cs,addr m_other
	jmp	pint_01_end

pint_01_ss:
	invoke	putstr_cs,addr m_ss		; show that SST caused trap
	invoke	putstr_cs,addr m_ss_spaces	; pad output line
	jmp	pint_01_end

pint_01_bkpt:
;+
; ebx contains bkpt # (0..3)
;-
	invoke	putstr_cs,addr m_bkpt
	mov	eax,ebx
	add	eax,'0'
	invoke	putc,eax		; show bkpt # as '0'..'3'
	invoke	space
	invoke	putc,'@'

	cmp	ebx,0			; which bkpt was entered?
	jne	@f

	mov	eax,dr0			; get address for this bkpt
	jmp	pint_01_bkpt10		; from debug address register

@@:	cmp	ebx,1
	jne	@f
	mov	eax,dr1

	jmp	pint_01_bkpt10

@@:	cmp	ebx,2
	jne	@f

	mov	eax,dr2
	jmp	pint_01_bkpt10

@@:	mov	eax,dr3			; assume bkpt #3

pint_01_bkpt10:
	invoke	puthex8,eax		; write bkpt address
;+
; Now, decide whether it is data or instruction which caused trap
;
;	ebx contains bkpt (0..3)
;-
	mov	ecx,ebx
	shl	ecx,2			; bkpt * 4
	add	ecx,16
	mov	eax,dr7
	shr	eax,cl			; len, rw fields now at lsb
	test	eax,11y			; 00 => instruction
	jnz	@f			; no, data

	invoke	putstr_cs,addr m_code	; no, code
;+
; Inhibit the breakpoint just this once so we can re-execute the instruction.
; Note that instruction breakpoints will trap *prior* to the instruction
; actually being executed. If you just do an iret, the bkpt will cause a
; bounce right back here. RF does a 1-instruction inhibit, just enough to
; get you past the bkpted inst.
;
;-
	mov	eax,10000h		; RF flag
	or	ss:[esp+24],eax		; eflags on current stack, set RF
	jmp	pint_01_end

@@:
	invoke	putstr_cs,addr m_data	; data

pint_01_end:
	xor	eax,eax
	mov	dr6,eax			; clear DR6 (source of trap state)
;+
; show cs:eip and flags
;-
	invoke	putstr_cs,addr m_cs_eip_flg
	invoke	puthex8,ss:[esp+20]		; who cs
	invoke	putc,':'
	invoke	puthex8,ss:[esp+16]		; show eip
	invoke	space
	invoke	puthex8,ss:[esp+24]		; show flags
	invoke	space

pint_01_what:
	invoke	putstr_cs,addr m_what_now	; 'RTCB? or other'

pint_01_what5:
	invoke	getc			; get one char, no echo
	cmp	al,'?'			; ...a few ways to...
	je	@f
	cmp	al,'H'			;  ...ask for help...
	je	@f
	cmp	al,'h'			;  ...about options...
	jne	pint_01_what6

@@:
	invoke	putstr_cs,addr m_what_help	; show help
	jmp	pint_01_what		; again

pint_01_what6:
	cmp	al,'R'
	je	pint_01_reg

	cmp	al,'r'
	je	pint_01_reg

	cmp	al,'T'
	je	pint_01_trace

	cmp	al,'t'
	je	pint_01_trace

	cmp	al,'C'
	je	pint_01_notrace

	cmp	al,'c'
	je	pint_01_notrace

	cmp	al,'B'
	je	pint_01_bkptoff

	cmp	al,'b'
	je	pint_01_bkptoff

;+
; default: continue from debug exception
;-
	pop	edx
	pop	ecx
	pop	ebx
	pop	eax

pint_01_ret:
	iretdf

pint_01_reg:
;+
; have to add register dump here...
;-
	invoke	crlf
	invoke	putstr_cs,addr m_eax_edi
	invoke	puthex8,ss:[esp+12]	; trapped routine's eax
	invoke	space
	invoke	puthex8,ss:[esp+8]	; ebx
	invoke	space
	invoke	puthex8,ss:[esp+4]	; ecx
	invoke	space
	invoke	puthex8,ss:[esp]	; edx
	invoke	space
	invoke	puthex8,esi
	invoke	space
	invoke	puthex8,edi
	invoke	crlf
;+
; now symbolically show the flags
;-
	invoke	show_eflags,ss:[esp+24]
	invoke	crlf
	jmp	pint_01_what

pint_01_trace:
	or	DWORD PTR ss:[esp+24],100h		; trap flag for SST enable
	and	DWORD PTR ss:[esp+24],NOT 10000h	; RF *off*
	jmp	pint_01_what5			; user had *better* cleared Bkpt!

pint_01_notrace:
	and	DWORD PTR ss:[esp+24],NOT 100h	; clear trap flag in callers eflags
	jmp	pint_01_what5

pint_01_bkptoff:
	cmp	ebx,-1
	je	pint_01_what5		; we didn't hit a bkpt, don't clear
	mov	eax,11y
	mov	ecx,ebx
	shl	eax,cl			; cl in range 0..3
	not	eax			; mask with 0's in GL<n>
	mov	ecx,dr7
	and	ecx,eax
	mov	dr7,ecx			; current bkpt has been cleared
	jmp	pint_01_what5

pint_02:
	invoke	putstr_cs,addr m_id2
	invoke	putstr_cs,addr m_int_handler
;	invoke	putdec8,02
	invoke	putstr_cs,addr m_nmi
	; see if we're in a death spiral.
	cmp	dword ptr within_int, 0
	jne	bailout
	mov	dword ptr within_int, 1

	jmp	int_common

pint_03:
	invoke	putstr_cs,addr m_id3
	invoke	putstr_cs,addr m_int_handler
;	invoke	putdec8,03
	invoke	putstr_cs,addr m_1byte
	; see if we're in a death spiral.
	cmp	dword ptr within_int, 0
	jne	bailout
	mov	dword ptr within_int, 1

	jmp	int_common

pint_04:
	invoke	putstr_cs,addr m_id4
	invoke	putstr_cs,addr m_int_handler
;	invoke	putdec8,04
	invoke	putstr_cs,addr m_into
	; see if we're in a death spiral.
	cmp	dword ptr within_int, 0
	jne	bailout
	mov	dword ptr within_int, 1

	jmp	int_common

pint_05:
	invoke	putstr_cs,addr m_id5
	invoke	putstr_cs,addr m_int_handler
;	invoke	putdec8,05
	invoke	putstr_cs,addr m_bound
	; see if we're in a death spiral.
	cmp	dword ptr within_int, 0
	jne	bailout
	mov	dword ptr within_int, 1

	jmp	int_common

pint_06:
	invoke	putstr_cs,addr m_id6
	invoke	putstr_cs,addr m_int_handler
;	invoke	putdec8,06
	invoke	putstr_cs,addr m_opcode
	; see if we're in a death spiral.
	cmp	dword ptr within_int, 0
	jne	bailout
	mov	dword ptr within_int, 1

	jmp	int_common

pint_07:
	invoke	putstr_cs,addr m_id7
	invoke	putstr_cs,addr m_int_handler
;	invoke	putdec8,07
	invoke	putstr_cs,addr m_device
	; see if we're in a death spiral.
	cmp	dword ptr within_int, 0
	jne	bailout
	mov	dword ptr within_int, 1

	jmp	int_common

pint_08:
	invoke	putstr_cs,addr m_id8
	invoke	putstr_cs,addr m_int_handler
;	invoke	putdec8,08
	invoke	putstr_cs,addr m_dblflt

	jmp	bailout	; just go away.
	; see if we're in a death spiral.
	cmp	dword ptr within_int, 0
	jne	bailout
	mov	dword ptr within_int, 1

	jmp	int_common

pint_09:
	invoke	putstr_cs,addr m_id9
	invoke	putstr_cs,addr m_int_handler
;	invoke	putdec8,09
	invoke	putstr_cs,addr m_res
	; see if we're in a death spiral.
	cmp	dword ptr within_int, 0
	jne	bailout
	mov	dword ptr within_int, 1

	jmp	int_common

pint_10:
	invoke	putstr_cs,addr m_id10
	invoke	putstr_cs,addr m_int_handler
;	invoke	putdec8,10
	invoke	putstr_cs,addr m_tss
	; see if we're in a death spiral.
	cmp	dword ptr within_int, 0
	jne	bailout
	mov	dword ptr within_int, 1

	jmp	int_common

pint_11:
	invoke	putstr_cs,addr m_id11
	invoke	putstr_cs,addr m_int_handler
;	invoke	putdec8,11
	invoke	putstr_cs,addr m_segpres
	; see if we're in a death spiral.
	cmp	dword ptr within_int, 0
	jne	bailout
	mov	dword ptr within_int, 1

	jmp	int_common

pint_12:
	invoke	putstr_cs,addr m_id12
	invoke	putstr_cs,addr m_int_handler
;	invoke	putdec8,12
	invoke	putstr_cs,addr m_stkflt
	; see if we're in a death spiral.
	cmp	dword ptr within_int, 0
	jne	bailout
	mov	dword ptr within_int, 1

	jmp	int_common

pint_13:
	; tek 3/20/96
	; see if we're in a death spiral.
	cmp	dword ptr within_int, 0
	jne	bailout
	mov	dword ptr within_int, 1

	invoke	putstr_cs,addr m_id13
real_int13:
	; end of 3/20/96

	invoke	putstr_cs,addr m_int_handler
;	invoke	putdec8,13
	invoke	putstr_cs,addr m_gpflt
	jmp	int_common

pint_14:
	invoke	putstr_cs,addr m_id14
	invoke	putstr_cs,addr m_int_handler
;	invoke	putdec8,14
	invoke	putstr_cs,addr m_pgflt
	; see if we're in a death spiral.
	cmp	dword ptr within_int, 0
	jne	bailout
	mov	dword ptr within_int, 1

	jmp	int_common

pint_15:
	invoke	putstr_cs,addr m_id15
	invoke	putstr_cs,addr m_int_handler
;	invoke	putdec8,15
	invoke	putstr_cs,addr m_res
	; see if we're in a death spiral.
	cmp	dword ptr within_int, 0
	jne	bailout
	mov	dword ptr within_int, 1

	jmp	int_common

pint_16:
	invoke	putstr_cs,addr m_id16
	invoke	putstr_cs,addr m_int_handler
;	invoke	putdec8,16
	invoke	putstr_cs,addr m_fp
	; see if we're in a death spiral.
	cmp	dword ptr within_int, 0
	jne	bailout
	mov	dword ptr within_int, 1

	jmp	int_common

pint_17:
	invoke	putstr_cs,addr m_id17
	invoke	putstr_cs,addr m_int_handler
;	invoke	putdec8,17
	invoke	putstr_cs,addr m_ac
	jmp	int_common

pint_reserved:
	invoke	putstr_cs,addr m_reserved
	jmp	int_common

pint_funcs:
;+
; Access to mPOST functions via int 21h
;
; Fairly simple (for now) but effective...
;-
	cmp	ax,F_PUTSTR
	jne	@f

	push	ss:[esp+12]		; user placed his arg prior to int
					; we place it to be accessed by the
					; mPOST function...Caller cleans stack
					;
	call	putstr
	add	esp,4			; clear the thing we just pushed
	jmp	int_return		; return

@@:
	cmp	ax,F_GO_BASE
	jne	@f

	mov	eax,DWORD PTR last_go_address
	jmp	int_return

@@:
	cmp	ax,F_PUTC
	jne	@f

	push	ss:[esp+12]		; user arg
	call	putc
	add	esp,4			; restore stack
	jmp	int_return

@@:
	cmp	ax,F_PUTDEC8
	jne	@f

	push	ss:[esp+12]		; user arg
	call	putdec8
	add	esp,4			; restore stack
	jmp	int_return

@@:
	cmp	ax,F_PUTDEC16
	jne	@f

	push	ss:[esp+12]		; user arg
	call	putdec16
	add	esp,4			; restore stack
	jmp	int_return

@@:
	cmp	ax,F_PUTHEX2
	jne	@f

	push	ss:[esp+12]		; user arg
	call	puthex2
	add	esp,4			; restore stack
	jmp	int_return

@@:
	cmp	ax,F_PUTHEX4
	jne	@f

	push	ss:[esp+12]		; user arg
	call	puthex4
	add	esp,4			; restore stack
	jmp	int_return

@@:
	cmp	ax,F_PUTHEX8
	jne	@f

	push	ss:[esp+12]		; user arg
	call	puthex8
	add	esp,4			; restore stack
	jmp	int_return

@@:
	cmp	ax,F_CLS
	jne	@f

	call	cls
	jmp	int_return

@@:
	cmp	ax,F_CRLF
	jne	@f

	call	crlf
	jmp	int_return

@@:
	cmp	ax,F_GETHEX2
	jne	@f

	push	ss:[esp+12]		; user arg
	call	gethex2
					; return value in eax
	add	esp,4			; restore stack
	jmp	int_return

@@:
	cmp	ax,F_GETHEX4
	jne	@f

	push	ss:[esp+12]		; user arg
	call	gethex4
					; return value in eax
	add	esp,4			; restore stack
	jmp	int_return

@@:
	cmp	ax,F_GETC
	jne	@f

	call	getc
					; return value in eax
	jmp	int_return

@@:
	cmp	ax,F_GETCMDLINE
	jne	@f

	push	ss:[esp+12]		; user arg
	call	getcmdline
	add	esp,4			; restore stack
;+
; returns with carry set or clear, propagate carry bit to caller
;+
	jc	int_retc		; carry set return
	jmp	int_retnc		; carry clear return

@@:
	cmp	ax,F_KBHIT
	jne	@f

	call	kbhit
	jc	int_retc		; carry set return
	jmp	int_retnc		; carry clear return

@@:
	cmp	ax,F_SPACE
	jne	@f

	call	space
	jmp	int_return

@@:
	cmp	ax,F_STRICMP
	jne	@f

	push	ss:[esp+16]		; arg1 (watch it, stack just changed)
	push	ss:[esp+16]		; arg2
	call	stricmp
	add	esp,8			; return value in eax
	jmp	int_return

@@:
	cmp	ax,F_STRLEN
	jne	@f

	push	ss:[esp+12]		; arg1
	call	strlen
	add	esp,4
	jmp	int_return		; return value in eax

@@:
	cmp	ax,F_STRCPY
	jne	@f

	push	ss:[esp+16]		; arg2 (stack just changed)
	push	ss:[esp+16]		; arg1
	call	strcpy
	add	esp,8			; return value in eax
	jmp	int_return

@@:
	cmp	ax,F_TOKENIZE
	jne	@f

	push	ss:[esp+16]		; source arg
	push	ss:[esp+16]		; target arg
	call	tokenize
	add	esp,8			; adjust stack, return value in eax
	jmp	int_return

@@:
	cmp	ax,F_NEXTNULL
	jne	@f

	push	ss:[esp+12]		; arg1
	call	nextnull
	add	esp,4
	jmp	int_return		; return value in eax

@@:
	cmp	ax,F_HEXBIN32
	jne	@f

	push	ss:[esp+12]		; arg1
	call	binhex32
	add	esp,4
	jmp	int_return		; return values in eax,ebx

@@:
;+
; Unknown function:
;-
	invoke	putstr_cs,addr m_bad_func
	push	eax
	and	eax,0ffffh
	invoke	puthex4,eax
	pop	eax
	invoke	crlf
	jmp	int_common

pint_user:
	invoke	putstr_cs,addr m_user
	jmp	int_common

int_common:
;+
; This is the common int handler code
;-
	cmp	sp, STACK_BOTTOM
	jb	stack_abort

	invoke	putstr_cs,addr m_cs_eip_flg
	invoke	puthex8,ss:[esp+4]		; get cs
	invoke	putc,':'
	invoke	puthex8,ss:[esp]		; get eip
	invoke	space
	invoke	puthex8,ss:[esp+8]
	invoke	putstr_cs,addr m_continue
	push	eax			; don't clobber anything
	invoke	getc
	pop	eax
;	invoke	putstr_cs,addr bye_int_msg

int_retnc:
;+
; return with carry cleared
;-
	and	DWORD PTR ss:[esp+8],NOT 1	; clear caller's carry
	; clear the in-int flag
	mov	dword ptr within_int,0
	iretdf

int_retc:
;+
; return with carry set
;-
	or	DWORD PTR ss:[esp+8],1		; set caller's carry


int_return:
	iretdf			; dismiss

stack_abort:
	mov	eax, 010h	; hack; I know this is the answer.
	mov	es, eax
	mov	eax, 0400h	; secret hiding place.
	mov	edi, eax
	mov	eax, 0deadf00dh
	stosd
	mov	eax, ss
	stosd	
	mov	eax, esp
	stosd
    	mov	ebx, ss
	mov	ecx, esp
	mov	eax, STACK_TOP	; get us a good stack.
	sub	eax, 8
	mov	esp, eax
	mov	eax, 010h	; hack..
	mov	ss, eax

	; jump around the hackness for now
	jmp	b_1

	; save the old ss:esp
	push	ecx 	; esp
	push	ebx	; ss
	invoke	putstr_cs, addr m_stack_abort
	invoke	putstr_cs, addr m_ssesp
	pop	eax
	invoke	puthex8, eax	; ss
	invoke	putc, ':'
	pop	eax
	invoke	puthex8, eax 	; esp
	jmp	b_1

bailout:
	; go stash away the ss:esp in memory.. in case the print doesn't
	; work..
	mov	eax, 010h	; hack; I know this is the answer.
	mov	es, eax
	mov	eax, 0400h	; secret hiding place.
	mov	edi, eax
	mov	eax, 0deadfeedh
	stosd
	mov	eax, ss
	stosd	
	mov	eax, esp
	stosd

	public	b_1
b_1:	;mov	eax, ds
	;stosd
	;mov	eax, es
	;stosd
	;mov	eax, fs
	;stosd
	;mov	eax, gs
	;stosd
	; save the int controller data.. 
	mov	edx,020h
	mov	eax,0bh	;read is next
	out	dx,al
	in	al,dx	; is
	stosb
	mov	al, 0ah	; read ir next
	out	dx,al
	in	al,dx	; ir
	stosb
	mov	edx,021h	; imr
	in	al,dx
	stosb
	; leave a marker..
	mov	al, 0ffh
	stosb
	; now the other one..
	mov	edx,0a0h
	mov	eax,0bh	;read is next
	out	dx,al
	in	al,dx	; is
	stosb
	mov	al, 0ah	; read ir next
	out	dx,al
	in	al,dx	; ir
	stosb
	mov	edx,0a1h	; imr
	in	al,dx
	stosb
	; leave a marker..
	mov	al, 0feh
	stosb



	mov	eax, 0badbeefh
	stosd
	
	; don't try to use the puthex stuff for now
	jmp	b_2

	invoke	putstr_cs, addr m_ssesp
	mov	eax, ss
	invoke	puthex8, eax
	invoke	putc, ':'
	mov	eax, esp
	invoke	puthex8, eax
	invoke	putstr_cs, m_fatal_abort

b_2:	; back to the ROM, to come up in console mode..
	mov	al, 014h
	out	0ech,al		; point at MISCSET
	in	al,0edh		; get MISCSET
	and	al,07Fh		; enable the registers
	out	0edh,al		; write the VSF on..

	mov	al, 03h		; set the reset bit in port A.
	mov	edx, 092h
	out	dx,al
	; hang in a loop until the reset hits..
hung:	nop
	jmp 	hung


ROM_CodeP	ENDS
	end
