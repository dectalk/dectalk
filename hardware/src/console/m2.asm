;+
; Purpose: microPOST, enter protected mode
;
; Edits:
;
; 001 07-Dec-1991 RAO Creation from rootp2 module
; 002 17-Dec-1991 RAO Add debugging stuff
; 003 24-Dec-1991 RAO Get rid of same
; 004 27-Dec-1991 RAO Changed selector for ROM CS
;  31 jan 94 ...tek	change banner.
;-
	title	micrPOST m2 module
	.list			; tek 8/17
	include am00.inc
	include	am05.inc
	include	am07.inc
	include	amsegs32.inc
	include	limits.inc
	include	segass16.inc
	include	com.inc
	include	m2.inc		; tek 8/26
        include datetime.asm    ; tek 9/22
	.list

	.listmacro		; tek 8/17
	public	setup_end

	public	abrtable	; for debug tek 9/21
ROM_Code	SEGMENT

	extrn	start_prot:near,gdt_base:near

mkdatetime

;+
; used to generate temporary label names
;-
tcount = 0
ghcount = 0
ghhcount = 0
ghspcount = 0
phcount = 0
abrtable:
br_table	label	word
	dw	br_110	;110 baud
        dw      br_150  ;150 baud
	dw	br_300	;300 baud
	dw	br_600	;600 baud
	dw	br_1200 ;1200 baud
	dw	br_2400 ;2400 baud
	dw	br_4800 ;4800 baud
	dw	br_9600 ;9600 baud
	dw	br_19200;19200 baud

prompt	db	CR,LF,'DECtalk Express Speech Synthesizer. '
        db      0

final	db	'1.. ',0


; actual code here..
	
setup_end:


	; (tek) SetLED		11y
	ComInit
	putstr	prompt
        putstr  datetime
	putstr	final
;+
; set protected mode
;-
	mov	eax,cr0			; get ready, get cr0
	or	eax,PE_SET		; set protected mode bit
	mov	cr0,eax			; set machine state

;+
; next step, do a long jump using the cs selector and the offset to 'protect2'
;-
	db	0eah			; interseg jmp opcode
;+
; *** We are still in 16 bit segment until CS is reloaded by far jmp.
; *** That is why the offset must be dw instead of dd.
;
;-
	dw	0			; this is the start_prot offset
;	dw	offset	start_prot	; offset to 32-bit segment
	dw	Rselector	<4,0,0>	; CS selector/32bit

ROM_Code	ENDS
	end
