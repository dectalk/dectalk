;+
; File: mp.asm
;
; Purpose: microPOST, local mpic register reads/writes
;
; Edits:
;
; 001 08-Mar-1992 RAO Creation
; 002 09-Mar-1992 RAO Added writes to registers (those that aren't read-only)
; 003 10-Mar-1992 RAO Minor fixes
;-
	title	microPOST local MPIC register reads/writes
	.xlist
	include am00.inc
	include	am05.inc
	include	am07.inc
	include	amsegs32.inc
	include	limits.inc
	include	segass32.inc
	include	proto.inc
	include mpic.inc
	.list

	extrn	line_buf1:near,parse_top:near,tok_count1:near,tok_list1:near
	extrn	addr_low:near,addr_high:near,last_addr:near
	public	cmd_mp

ROM_CodeP	SEGMENT
	assume	ds:ROM_DataP
;+
; messages
;-
m_args		db	CR,LF,'? args',0
m_read_only	db	CR,LF,'? Read-only register',0
m_bad_hex	db	CR,LF,'? Bad hex value',0
m_id_ver	db	CR,LF,'ID, VER: ',0
m_pr		db	CR,LF,'PR0..PR3: ',0
m_tpr_rem	db	CR,LF,'TPR,EOI,REM: ',0
m_log_svr	db	CR,LF,'LOG,FMT,SVR: ',0
m_isr		db	CR,LF,'ISR: ',0
m_tmr		db	CR,LF,'TMR: ',0
m_irr		db	CR,LF,'IRR: ',0
m_icr		db	CR,LF,'ICR: ',0
m_lvt		db	CR,LF,'LVT: ',0
m_icnt0		db	CR,LF,'ICNT0: ',0
m_ccnt0		db	CR,LF,'CCNT0: ',0
m_icnt1		db	CR,LF,'ICNT1: ',0
m_ccnt1		db	CR,LF,'CCNT1: ',0
m_icnt2		db	CR,LF,'ICNT2: ',0
m_ccnt2		db	CR,LF,'CCNT2: ',0
m_dcr		db	CR,LF,'DCR: ',0

;+
; locally used strings (for matching command line args)
;-
s_id		db	'id',0
s_ver		db	'ver',0
s_pr0		db	'pr0',0
s_pr1		db	'pr1',0
s_pr2		db	'pr2',0
s_pr3		db	'pr3',0
s_tpr		db	'tpr',0
s_eoi		db	'eoi',0
s_rem		db	'rem',0
s_log		db	'log',0
s_fmt		db	'fmt',0
s_svr		db	'svr',0
s_isr		db	'isr',0
s_tmr		db	'tmr',0
s_irr		db	'irr',0
s_icr0		db	'icr0',0
s_icr1		db	'icr1',0
s_lvt0		db	'lvt0',0
s_lvt1		db	'lvt1',1
s_lvt2		db	'lvt2',2
s_lvt3		db	'lvt3',3
s_lvt4		db	'lvt4',4
s_lvt5		db	'lvt5',5
s_icnt0		db	'icnt0',0
s_ccnt0		db	'ccnt0',0
s_icnt1		db	'icnt1',0
s_ccnt1		db	'ccnt1',0
s_icnt2		db	'icnt2',0
s_ccnt2		db	'ccnt2',0
s_dcr		db	'dcr',0

;+
; we have an mpic register read/write cmd, there are 1 or 2 args for this command.
; Get it using a simple, brute force search mechanism.
;
; Format:
;
;	MP				! read (all registers implied)	tok=1
;	MP ID				! read ID register		tok=2
;	MP ID 123			! write ID <- 123		tok=3
;
;-
cmd_mp:
	pusha

	mov	edx,LOCAL_MPIC_BASE
	mov	eax,dword ptr tok_count1	; how many tokens?
	mov	ecx,eax				; save token count in ecx
						;  we will compare against ecx
						;  further in this code
	cmp	eax,1
	je	cmd_all				; read all (tok = 1)
	cmp	eax,2				; case for read one (tok = 2)
	je	@f				; yes, ok
	cmp	eax,3				; case for write one (tok = 3)
	jne	cmd_bad				; no, bad

@@:	mov	esi,offset tok_list1		; start of cmd line
	invoke	nextnull,esi			; end of 1st token (MP)
	inc	eax				; start of next token
	mov	esi,eax				; esi points to tok after 'MP'

	cmp	ecx,3				; need to fetch value, too?
	jne	@f				; no

	invoke	nextnull,esi
	inc	eax
	mov	edi,eax				; points to hex value
	invoke	hexbin32,edi			; cvt to binary
	cmp	ebx,0				; ok?

	je	bad_hex				; no
	mov	edi,eax				; save value in edi
						; and use if ecx = 3
;+
; compare 2nd token against fixed strings (get register name)
;-
@@:	invoke	stricmp_cs,addr s_id,esi	; match?
	cmp	eax,0
	je	cmd_id				; yes

	invoke	stricmp_cs,addr s_ver,esi	; match?
	cmp	eax,0
	je	cmd_ver				; yes

	invoke	stricmp_cs,addr s_pr0,esi	; match?
	cmp	eax,0
	je	cmd_pr0				; yes

	invoke	stricmp_cs,addr s_pr1,esi	; match?
	cmp	eax,0
	je	cmd_pr1				; yes

	invoke	stricmp_cs,addr s_pr2,esi	; match?
	cmp	eax,0
	je	cmd_pr2				; yes

	invoke	stricmp_cs,addr s_pr3,esi	; match?
	cmp	eax,0
	je	cmd_pr3				; yes

	invoke	stricmp_cs,addr s_tpr,esi	; match?
	cmp	eax,0
	je	cmd_tpr				; yes

	invoke	stricmp_cs,addr s_eoi,esi	; match?
	cmp	eax,0
	je	cmd_eoi				; yes

	invoke	stricmp_cs,addr s_rem,esi	; match?
	cmp	eax,0
	je	cmd_rem				; yes

	invoke	stricmp_cs,addr s_log,esi	; match?
	cmp	eax,0
	je	cmd_log				; yes

	invoke	stricmp_cs,addr s_fmt,esi	; match?
	cmp	eax,0
	je	cmd_fmt				; yes

	invoke	stricmp_cs,addr s_svr,esi	; match?
	cmp	eax,0
	je	cmd_svr				; yes

	invoke	stricmp_cs,addr s_isr,esi	; match?
	cmp	eax,0
	je	cmd_isr				; yes

	invoke	stricmp_cs,addr s_tmr,esi	; match?
	cmp	eax,0
	je	cmd_tmr				; yes

	invoke	stricmp_cs,addr s_irr,esi	; match?
	cmp	eax,0
	je	cmd_irr				; yes

	invoke	stricmp_cs,addr s_icr0,esi	; match?
	cmp	eax,0
	je	cmd_icr0			; yes

	invoke	stricmp_cs,addr s_icr1,esi	; match?
	cmp	eax,0
	je	cmd_icr1			; yes

	invoke	stricmp_cs,addr s_lvt0,esi	; match?
	cmp	eax,0
	je	cmd_lvt0			; yes

	invoke	stricmp_cs,addr s_lvt1,esi	; match?
	cmp	eax,0
	je	cmd_lvt1			; yes

	invoke	stricmp_cs,addr s_lvt2,esi	; match?
	cmp	eax,0
	je	cmd_lvt2			; yes

	invoke	stricmp_cs,addr s_lvt3,esi	; match?
	cmp	eax,0
	je	cmd_lvt3			; yes

	invoke	stricmp_cs,addr s_lvt4,esi	; match?
	cmp	eax,0
	je	cmd_lvt4			; yes

	invoke	stricmp_cs,addr s_lvt5,esi	; match?
	cmp	eax,0
	je	cmd_lvt5			; yes

	invoke	stricmp_cs,addr s_icnt0,esi	; match?
	cmp	eax,0
	je	cmd_icnt0			; yes

	invoke	stricmp_cs,addr s_ccnt0,esi	; match?
	cmp	eax,0
	je	cmd_ccnt0			; yes

	invoke	stricmp_cs,addr s_icnt1,esi	; match?
	cmp	eax,0
	je	cmd_icnt1			; yes

	invoke	stricmp_cs,addr s_ccnt1,esi	; match?
	cmp	eax,0
	je	cmd_ccnt1			; yes

	invoke	stricmp_cs,addr s_icnt2,esi	; match?
	cmp	eax,0
	je	cmd_icnt2			; yes

	invoke	stricmp_cs,addr s_ccnt2,esi	; match?
	cmp	eax,0
	je	cmd_ccnt2			; yes

	invoke	stricmp_cs,addr s_dcr,esi	; match?
	cmp	eax,0
	je	cmd_dcr			; yes

;+
; fall through on not finding a register name...as in 'MP REG'
;-
cmd_bad:
	invoke	putstr_cs,addr m_args		; no match
	jmp	cmd_ret

;+
; other failures
;-
bad_hex:
	invoke	putstr_cs,addr m_bad_hex
	jmp	cmd_ret

cmd_read_only:
	invoke	putstr_cs,addr m_read_only
	jmp	cmd_ret

;+
; We are here to show all the local mpic registers
;-
cmd_all:
	invoke	putstr_cs,addr m_id_ver
	mov	eax,[edx+MPIC_ID]
	invoke	puthex8,eax
	invoke	space
	mov	eax,[edx+MPIC_VER]
	invoke	puthex8,eax

	invoke	putstr_cs,addr m_pr
	mov	eax,[edx+MPIC_PR0]
	invoke	puthex8,eax
	invoke	space
	mov	eax,[edx+MPIC_PR1]
	invoke	puthex8,eax
	invoke	space
	mov	eax,[edx+MPIC_PR2]
	invoke	puthex8,eax
	invoke	space
	mov	eax,[edx+MPIC_PR3]
	invoke	puthex8,eax

	invoke	putstr_cs,addr m_tpr_rem
	mov	eax,[edx+MPIC_TPR]
	invoke	puthex8,eax
	invoke	space
	mov	eax,[edx+MPIC_EOI]
	invoke	puthex8,eax
	invoke	space
	mov	eax,[edx+MPIC_REM]
	invoke	puthex8,eax

	invoke	putstr_cs,addr m_log_svr
	mov	eax,[edx+MPIC_LOG]
	invoke	puthex8,eax
	invoke	space
	mov	eax,[edx+MPIC_FMT]
	invoke	puthex8,eax
	invoke	space
	mov	eax,[edx+MPIC_SVR]
	invoke	puthex8,eax

;+
; the following are 256 bit values, print as:
;
;      msb                                   lsb
;       |                                     |
;	xxxxxxxx.xxxxxxxx.xxxxxxxx ... xxxxxxxx
;-
	invoke	putstr_cs,m_isr
	call	show_isrs

	invoke	putstr_cs,m_tmr
	call	show_tmrs

	invoke	putstr_cs,m_irr
	call	show_irrs

	invoke	putstr,addr m_icr	; this is a 64 bit qty
	mov	eax,[edx+MPIC_ICR1]	; high order 1st
	invoke	puthex8,eax
	invoke	putc,'.'		; delimiter
	mov	eax,[edx+MPIC_ICR0]	; low order next
	invoke	puthex8,eax

	invoke	putstr_cs,addr m_lvt
	mov	eax,[edx+MPIC_LVT0]
	invoke	puthex8,eax
	invoke	space
	mov	eax,[edx+MPIC_LVT1]
	invoke	puthex8,eax
	invoke	space
	mov	eax,[edx+MPIC_LVT2]
	invoke	puthex8,eax
	invoke	space
	mov	eax,[edx+MPIC_LVT3]
	invoke	puthex8,eax
	invoke	space
	mov	eax,[edx+MPIC_LVT4]
	invoke	puthex8,eax
	invoke	space
	mov	eax,[edx+MPIC_LVT5]
	invoke	puthex8,eax

	invoke	putstr_cs,addr m_icnt0
	mov	eax,[edx+MPIC_ICNT0]
	invoke	puthex8,eax

	invoke	putstr_cs,addr m_ccnt0
	mov	eax,[edx+MPIC_CCNT0]
	invoke	puthex8,eax

	invoke	putstr_cs,addr m_icnt1
	mov	eax,[edx+MPIC_ICNT1]
	invoke	puthex8,eax

	invoke	putstr_cs,addr m_ccnt1
	mov	eax,[edx+MPIC_CCNT1]
	invoke	puthex8,eax

	invoke	putstr_cs,addr m_icnt2
	mov	eax,[edx+MPIC_ICNT2]
	invoke	puthex8,eax

	invoke	putstr_cs,addr m_ccnt2
	mov	eax,[edx+MPIC_CCNT2]
	invoke	puthex8,eax

	invoke	putstr_cs,addr m_dcr
	mov	eax,[edx+MPIC_DCR]
	invoke	puthex8,eax

	jmp	cmd_ret

cmd_id:					; show/set id
	cmp	ecx,3			; write?
	jne	@f			; no, read

	mov	[edx+MPIC_ID],edi	; write register
	jmp	cmd_ret			; done

@@:	mov	eax,[edx+MPIC_ID]	; just read it
	jmp	cmd_do1

cmd_ver:				; show ver
	cmp	ecx,3			; write?
	je	cmd_read_only		; we *can't* write this

	mov	eax,[edx+MPIC_VER]
	jmp	cmd_do1

cmd_pr0:				; show/set private register
	cmp	ecx,3			; write?
	jne	@f			; no

	mov	[edx+MPIC_PR0],edi
	jmp	cmd_ret

@@:	mov	eax,[edx+MPIC_PR0]	; just read it
	jmp	cmd_do1

cmd_pr1:				; show/set private register
	cmp	ecx,3			; write?
	jne	@f

	mov	[edx+MPIC_PR1],edi
	jmp	cmd_ret

@@:	mov	eax,[edx+MPIC_PR1]	; read
	jmp	cmd_do1

cmd_pr2:				; show/set private register
	cmp	ecx,3			; write?
	jne	@f

	mov	[edx+MPIC_PR2],edi
	jmp	cmd_ret

@@:	mov	eax,[edx+MPIC_PR2]	; just read
	jmp	cmd_do1

cmd_pr3:				; show/set private register
	cmp	ecx,3			; write?
	jne	@f

	mov	[edx+MPIC_PR3],edi
	jmp	cmd_ret

@@:	mov	eax,[edx+MPIC_PR3]	; read
	jmp	cmd_do1

cmd_tpr:				; show/set private register
	cmp	ecx,3			; write?
	jne	@f

	mov	[edx+MPIC_TPR],edi
	jmp	cmd_ret

@@:	mov	eax,[edx+MPIC_TPR]	; just read
	jmp	cmd_do1

cmd_eoi:				; show/set private register
	cmp	ecx,3			; write?
	jne	@f

	mov	[edx+MPIC_EOI],edi
	jmp	cmd_ret

@@:	mov	eax,[edx+MPIC_EOI]	; just read
	jmp	cmd_do1

cmd_rem:				; show private register (read-only)
	cmp	ecx,3
	je	cmd_read_only		; can't write!

	mov	eax,[edx+MPIC_REM]
	jmp	cmd_do1

cmd_log:				; show/set private register
	cmp	ecx,3
	jne	@f			; write?

	mov	[edx+MPIC_LOG],edi
	jmp	cmd_ret

@@:	mov	eax,[edx+MPIC_LOG]	; just read
	jmp	cmd_do1

cmd_fmt:				; show/set private register
	cmp	ecx,3			; write?
	jne	@f

	mov	[edx+MPIC_FMT],edi
	jmp	cmd_ret

@@:	mov	eax,[edx+MPIC_FMT]	; just read
	jmp	cmd_do1

cmd_svr:				; show/set spurious vec register
	cmp	ecx,3			; write?
	jne	@f

	mov	[edx+MPIC_SVR],edi
	jmp	cmd_ret

@@:	mov	eax,[edx+MPIC_SVR]	; just write
	jmp	cmd_do1

cmd_isr:			; show the long (256 bit) isr
	cmp	ecx,3		; write?
	je	cmd_read_only	; don't try to change this, we're read-only

	invoke	crlf
	call	show_isrs
	jmp	cmd_ret

cmd_tmr:			; show tmr (256 bit)
	cmp	ecx,3		; write?
	je	cmd_read_only	; don't try to change this

	invoke	crlf
	call	show_tmrs
	jmp	cmd_ret

cmd_irr:			; show irr (256 bit)
	cmp	ecx,3		; write?
	je	cmd_read_only	; don't try to change this

	invoke	crlf
	call	show_irrs
	jmp	cmd_ret

cmd_icr0:				; set/show
	cmp	ecx,3			; write?
	jne	@f

	mov	[edx+MPIC_ICR0],edi
	jmp	cmd_ret

@@:	mov	eax,[edx+MPIC_ICR0]	; just read
	jmp	cmd_do1

cmd_icr1:
	cmp	ecx,3			; write?
	jne	@f

	mov	[edx+MPIC_ICR1],edi
	jmp	cmd_ret

@@:	mov	eax,[edx+MPIC_ICR1]	; just read
	jmp	cmd_do1

cmd_lvt0:			; local vector table 0
	cmp	ecx,3		; write?
	jne	@f		; no

	mov	[edx+MPIC_LVT0],edi
	jmp	cmd_ret

@@:	mov	eax,[edx+MPIC_LVT0]	; just read
	jmp	cmd_do1

cmd_lvt1:			; local vector table 1
	cmp	ecx,3		; write?
	jne	@f		; no

	mov	[edx+MPIC_LVT1],edi
	jmp	cmd_ret

@@:	mov	eax,[edx+MPIC_LVT1]	; just read
	jmp	cmd_do1

cmd_lvt2:			; local vector table 2
	cmp	ecx,3		; write?
	jne	@f		; no

	mov	[edx+MPIC_LVT2],edi
	jmp	cmd_ret

@@:	mov	eax,[edx+MPIC_LVT2]	; just read
	jmp	cmd_do1

cmd_lvt3:			; local vector table 3
	cmp	ecx,3		; write?
	jne	@f		; no

	mov	[edx+MPIC_LVT3],edi
	jmp	cmd_ret

@@:	mov	eax,[edx+MPIC_LVT3]	; just read
	jmp	cmd_do1

cmd_lvt4:			; local vector table 4
	cmp	ecx,3		; write?
	jne	@f		; no

	mov	[edx+MPIC_LVT4],edi
	jmp	cmd_ret

@@:	mov	eax,[edx+MPIC_LVT4]	; just read
	jmp	cmd_do1

cmd_lvt5:			; local vector table 5
	cmp	ecx,3		; write?
	jne	@f		; no

	mov	[edx+MPIC_LVT5],edi
	jmp	cmd_ret

@@:	mov	eax,[edx+MPIC_LVT5]	; just read
	jmp	cmd_do1

cmd_icnt0:
	cmp	ecx,3		; write?
	jne	@f		; no

	mov	[edx+MPIC_ICNT0],edi
	jmp	cmd_ret

@@:	mov	eax,[edx+MPIC_ICNT0]	; just read
	jmp	cmd_do1

cmd_ccnt0:
	cmp	ecx,3		; write?
	je	cmd_read_only	; yes, bad news; we *can't* write this reg

	mov	eax,[edx+MPIC_CCNT0]
	jmp	cmd_do1

cmd_icnt1:
	cmp	ecx,3		; write?
	jne	@f		; no

	mov	[edx+MPIC_ICNT1],edi
	jmp	cmd_ret

@@:	mov	eax,[edx+MPIC_ICNT1]	; just read
	jmp	cmd_do1

cmd_ccnt1:
	cmp	ecx,3		; write?
	je	cmd_read_only	; yes, bad news; we *can't* write this reg

	mov	eax,[edx+MPIC_CCNT1]
	jmp	cmd_do1

cmd_icnt2:
	cmp	ecx,3		; write?
	jne	@f		; no

	mov	[edx+MPIC_ICNT2],edi
	jmp	cmd_ret

@@:	mov	eax,[edx+MPIC_ICNT2]	; just read
	jmp	cmd_do1

cmd_ccnt2:
	cmp	ecx,3		; write?
	je	cmd_read_only	; yes, bad news; we *can't* write this reg

	mov	eax,[edx+MPIC_CCNT2]
	jmp	cmd_do1

cmd_dcr:
	cmp	ecx,3		; write?
	jne	@f		; no

	mov	[edx+MPIC_DCR],edi
	jmp	cmd_ret

@@:	mov	eax,[edx+MPIC_DCR]	; just read
	jmp	cmd_do1

cmd_do1:		; write out 1 value
;+
; value in eax
;-
	invoke	crlf			; new line
	invoke	puthex8,eax		; write value
	jmp	cmd_ret			; done

;+
; local subroutine to dump 256 bit isr (in 32 bit parts)
;-
show_isrs:
	mov	eax,[edx+MPIC_ISR7]	; highest order bits
	invoke	puthex8,eax
	invoke	putc,'.'		; field delimiter
	mov	eax,[edx+MPIC_ISR6]	; highest order bits
	invoke	puthex8,eax
	invoke	putc,'.'		; field delimiter
	mov	eax,[edx+MPIC_ISR5]	; highest order bits
	invoke	puthex8,eax
	invoke	putc,'.'		; field delimiter
	mov	eax,[edx+MPIC_ISR4]	; highest order bits
	invoke	puthex8,eax
	invoke	putc,'.'		; field delimiter
	mov	eax,[edx+MPIC_ISR3]	; highest order bits
	invoke	puthex8,eax
	invoke	putc,'.'		; field delimiter
	mov	eax,[edx+MPIC_ISR2]	; highest order bits
	invoke	puthex8,eax
	invoke	putc,'.'		; field delimiter
	mov	eax,[edx+MPIC_ISR1]	; highest order bits
	invoke	puthex8,eax
	invoke	putc,'.'		; field delimiter
	mov	eax,[edx+MPIC_ISR0]	; highest order bits
	invoke	puthex8,eax
	ret

;+
; local subroutine to dump 256 bit tmr (in 32 bit parts)
;-
show_tmrs:
	mov	eax,[edx+MPIC_TMR7]	; highest order bits
	invoke	puthex8,eax
	invoke	putc,'.'		; field delimiter
	mov	eax,[edx+MPIC_TMR6]	; highest order bits
	invoke	puthex8,eax
	invoke	putc,'.'		; field delimiter
	mov	eax,[edx+MPIC_TMR5]	; highest order bits
	invoke	puthex8,eax
	invoke	putc,'.'		; field delimiter
	mov	eax,[edx+MPIC_TMR4]	; highest order bits
	invoke	puthex8,eax
	invoke	putc,'.'		; field delimiter
	mov	eax,[edx+MPIC_TMR3]	; highest order bits
	invoke	puthex8,eax
	invoke	putc,'.'		; field delimiter
	mov	eax,[edx+MPIC_TMR2]	; highest order bits
	invoke	puthex8,eax
	invoke	putc,'.'		; field delimiter
	mov	eax,[edx+MPIC_TMR1]	; highest order bits
	invoke	puthex8,eax
	invoke	putc,'.'		; field delimiter
	mov	eax,[edx+MPIC_TMR0]	; highest order bits
	invoke	puthex8,eax
	ret

;+
; local subroutine to dump 256 bit irr (in 32 bit parts)
;-
show_irrs:
	mov	eax,[edx+MPIC_IRR7]	; highest order bits
	invoke	puthex8,eax
	invoke	putc,'.'		; field delimiter
	mov	eax,[edx+MPIC_IRR6]	; highest order bits
	invoke	puthex8,eax
	invoke	putc,'.'		; field delimiter
	mov	eax,[edx+MPIC_IRR5]	; highest order bits
	invoke	puthex8,eax
	invoke	putc,'.'		; field delimiter
	mov	eax,[edx+MPIC_IRR4]	; highest order bits
	invoke	puthex8,eax
	invoke	putc,'.'		; field delimiter
	mov	eax,[edx+MPIC_IRR3]	; highest order bits
	invoke	puthex8,eax
	invoke	putc,'.'		; field delimiter
	mov	eax,[edx+MPIC_IRR2]	; highest order bits
	invoke	puthex8,eax
	invoke	putc,'.'		; field delimiter
	mov	eax,[edx+MPIC_IRR1]	; highest order bits
	invoke	puthex8,eax
	invoke	putc,'.'		; field delimiter
	mov	eax,[edx+MPIC_IRR0]	; highest order bits
	invoke	puthex8,eax
	ret

cmd_ret:
;+
; common return
;-
	popa
	jmp	parse_top		; return to parser
ROM_CodeP	ENDS
	end
