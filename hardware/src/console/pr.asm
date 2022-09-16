;+
; File: pr.asm
;
; Purpose: microPOST, processor register read command
;
; Edits:
;
; 001 24-Dec-1991 RAO Creation
; 002 26-Dec-1991 RAO Use pusha/popa
; 003 29-Dec-1991 RAO Added seg, dr; small bugs fixed in formatting
;-
	title	microPOST processor register read command
	.xlist
	include am00.inc
	include	am05.inc
	include	am07.inc
	include	amsegs32.inc
	include	limits.inc
	include	segass32.inc
	include	proto.inc
	.list

	extrn	line_buf1:near,parse_top:near,tok_count1:near,tok_list1:near
	extrn	addr_low:near,addr_high:near,last_addr:near
	public	cmd_pr

ROM_CodeP	SEGMENT
	assume	ds:ROM_DataP
;+
; messages
;-
m_args		db	CR,LF,'? args',0
m_cr0_cr3	db	CR,LF,'CR0..CR3: ',0
m_cr0		db	'CR0:',0
m_cr2		db	'CR2:',0
m_cr3		db	'CR3:',0

m_dr0_dr7	db	CR,LF,'DR0..DR3,DR6..DR7: ',0
m_dr0		db	'DR0: ',0
m_dr1		db	'DR1: ',0
m_dr2		db	'DR2: ',0
m_dr3		db	'DR3: ',0
m_dr6		db	'DR6: ',0
m_dr7		db	'DR7: ',0

m_segs		db	CR,LF,'CS,DS,ES,FS,GS: ',0

;+
; locally used strings
;-
s_cr		db	'cr',0
s_cr0		db	'cr0',0
s_cr2		db	'cr2',0
s_cr3		db	'cr3',0

s_dr		db	'dr',0
s_dr0		db	'dr0',0
s_dr1		db	'dr1',0
s_dr2		db	'dr2',0
s_dr3		db	'dr3',0
s_dr6		db	'dr6',0
s_dr7		db	'dr7',0

s_seg		db	'seg',0		; allow both versions
s_segs		db	'segs',0

;+
; we have a processor register read cmd, there is one arg for this command.
; Get it using a simple, brute force search mechanism
;-
cmd_pr:
	pusha

	mov	eax,dword ptr tok_count1	; how many tokens?
	sub	eax,1				; get rid of the PR str itself
	cmp	eax,1				; must now be one
	je	@f				; yes, ok
	invoke	putstr_cs,addr m_args		; wrong number of args
	jmp	cmd_ret				; leave

@@:	mov	esi,offset tok_list1		; start of cmd line
	invoke	nextnull,esi			; end of 1st token (C)
	inc	eax				; start of next token
	mov	esi,eax

	invoke	stricmp_cs,addr s_cr,esi	; match?
	cmp	eax,0
	je	cmd_cr				; yes

	invoke	stricmp_cs,addr s_cr0,esi	; match?
	cmp	eax,0
	je	cmd_cr0				; yes

	invoke	stricmp_cs,addr s_cr2,esi	; match?
	cmp	eax,0
	je	cmd_cr2				; yes

	invoke	stricmp_cs,addr s_cr3,esi	; match?
	cmp	eax,0
	je	cmd_cr3				; yes

	invoke	stricmp_cs,addr s_dr,esi	; match?
	cmp	eax,0
	je	cmd_dr				; yes

	invoke	stricmp_cs,addr s_dr0,esi	; match?
	cmp	eax,0
	je	cmd_dr0				; yes

	invoke	stricmp_cs,addr s_dr1,esi	; match?
	cmp	eax,0
	je	cmd_dr1				; yes

	invoke	stricmp_cs,addr s_dr2,esi	; match?
	cmp	eax,0
	je	cmd_dr2				; yes

	invoke	stricmp_cs,addr s_dr3,esi	; match?
	cmp	eax,0
	je	cmd_dr3				; yes

	invoke	stricmp_cs,addr s_dr6,esi	; match?
	cmp	eax,0
	je	cmd_dr6				; yes

	invoke	stricmp_cs,addr s_dr7,esi	; match?
	cmp	eax,0
	je	cmd_dr7				; yes

	invoke	stricmp_cs,addr s_segs,esi	; match?
	cmp	eax,0
	je	cmd_segs			; yes

	invoke	stricmp_cs,addr s_seg,esi	; match?
	cmp	eax,0
	je	cmd_segs			; yes

cmd_bad:
	invoke	putstr_cs,addr m_args		; no match
	jmp	cmd_ret
;+
; Here for showing all cr's or just one of them (cr0..cr3)
;-
cmd_cr:				; show them all
	invoke	putstr_cs,addr m_cr0_cr3
	mov	eax,cr0
	invoke	puthex8,eax
	invoke	space
	mov	eax,cr2
	invoke	puthex8,eax
	invoke	space
	mov	eax,cr3
	invoke	puthex8,eax
	invoke	space
	jmp	cmd_ret

cmd_cr0:			; show just one of them
	mov	eax,cr0
	mov	esi,offset m_cr0
	jmp	cmd_crdo

cmd_cr2:
	mov	eax,cr2
	mov	esi,offset m_cr2
	jmp	cmd_crdo

cmd_cr3:
	mov	eax,cr3
	mov	esi,offset m_cr3
	jmp	cmd_crdo

cmd_crdo:		; here with id string ptr as cs:esi, value in eax
	invoke	crlf			; new line
	invoke	putstr_cs,esi		; write id string
	invoke	puthex8,eax		; write value
	jmp	cmd_ret			; done

;+
; Here for showing all dr's or just one of them (dr0..dr7)
;-
cmd_dr:				; show them all
	invoke	putstr_cs,addr m_dr0_dr7
	mov	eax,dr0
	invoke	puthex8,eax
	invoke	space
	mov	eax,dr1
	invoke	puthex8,eax
	invoke	space
	mov	eax,dr2
	invoke	puthex8,eax
	invoke	space
	mov	eax,dr3
	invoke	puthex8,eax
	invoke	space
	mov	eax,dr6
	invoke	puthex8,eax
	invoke	space
	mov	eax,dr7
	invoke	puthex8,eax
	jmp	cmd_ret

cmd_dr0:			; show just one of them
	mov	eax,dr0
	mov	esi,offset m_dr0
	jmp	cmd_drdo

cmd_dr1:			; show just one of them
	mov	eax,dr1
	mov	esi,offset m_dr1
	jmp	cmd_drdo

cmd_dr2:			; show just one of them
	mov	eax,dr2
	mov	esi,offset m_dr2
	jmp	cmd_drdo

cmd_dr3:			; show just one of them
	mov	eax,dr3
	mov	esi,offset m_dr3
	jmp	cmd_drdo

cmd_dr6:			; show just one of them
	mov	eax,dr6
	mov	esi,offset m_dr6
	jmp	cmd_drdo

cmd_dr7:			; show just one of them
	mov	eax,dr7
	mov	esi,offset m_dr7
	jmp	cmd_drdo

cmd_drdo:		; here with id string ptr as cs:esi, value in eax
	invoke	crlf
	invoke	putstr_cs,esi		; write id string
	invoke	puthex8,eax		; write the register value in hex
	jmp	cmd_ret			; bye

cmd_segs:
	invoke	putstr_cs,addr m_segs
	xor	eax,eax
	mov	ax,cs
	invoke	puthex4,eax
	invoke	space

	xor	eax,eax
	mov	ax,ds
	invoke	puthex4,eax
	invoke	space

	xor	eax,eax
	mov	ax,es
	invoke	puthex4,eax
	invoke	space

	xor	eax,eax
	mov	ax,fs
	invoke	puthex4,eax
	invoke	space

	xor	eax,eax
	mov	ax,gs
	invoke	puthex4,eax
	jmp	cmd_ret

cmd_ret:
;+
; common return
;-
	popa
	jmp	parse_top		; return to parser
ROM_CodeP	ENDS
	end
