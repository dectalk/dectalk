;+
; File: his.asm
;
; Purpose: microPOST, history commands; history routines
;
; Edits:
;
; 001 15-Jan-1992 RAO Creation
; 002 16-Jan-1992 RAO Numerous debug fixes
;-
	title	microPOST history commands
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
	extrn	line_buf2:near
	extrn	re_parse:near
	extrn	history_idx:near,history:near,history_len:near
	extrn	trace_value:near

	public	cmd_history,cmd_recall,cmd_recall_last

ROM_CodeP	SEGMENT
	assume	ds:ROM_DataP
;+
; messages
;-
m_args		db	CR,LF,'? args',0
m_bad_hist_num	db	CR,LF,'? bad decimal arg',0
m_summ1		db	CR,LF,'***History count: ',0
m_addh		db	CR,LF,'***add_history (off,add,str): ',0
m_edith		db	CR,LF,'***edit_history',0
m_fetch		db	CR,LF,'***fetch_history (i,off,add,str) : ',0
m_pause	db	'<hit any char to continue>',CR,0

;+
; locally used strings
;-

;+
; history command
;-
cmd_history:
	pusha
	invoke	edit_history		; no history commands in history

	mov	ecx,DWORD PTR history_len

	cmp	DWORD PTR trace_value,0	;***DEBUG
	je	@f

	invoke	putstr_cs,addr m_summ1
	invoke	putdec8,ecx
	invoke	space

@@:	cmp	ecx,0
	jle	cmd_ret			; no history
	mov	edx,1			; history element (starts at 1)
	mov	esi,LINES_PER_PAGE	; output line counter

cmd_hist40:
	cmp	esi,0			; end of page
	jne	@f			; no

	mov	esi,LINES_PER_PAGE	; reset line counter
	invoke	crlf			; next line (this is tricky!)
	invoke	putstr_cs,addr m_pause	; message
	invoke	getc			; wait for char
	invoke	erase_line		; clear the message
	invoke	up_line			; go back to previous line

@@:
	mov	edi,offset line_buf2	; alternate buffer
	invoke	fetch_history,edi,edx
	invoke	crlf			; new line
	invoke	putdec8,edx		; history index
	invoke	space
	invoke	putstr,edi		; write out history element
	inc	edx
	sub	esi,1			; line counter
	loop	cmd_hist40

	jmp	cmd_ret

;+
; recall last command
;-
cmd_recall_last:
	pusha
	invoke	edit_history	; don't place recall commands in the buffer
	mov	edx,1		; get last history command
	invoke	fetch_history,addr line_buf1,edx

	jmp	cmd_got_one_ret	; careful, we really want to run this

;+
; recall nth
;-
cmd_recall:
	pusha

	mov	eax,dword ptr tok_count1	; how many tokens?
	sub	eax,1				; get rid of the C itself
	cmp	eax,1				; must now be one
	je	@f				; yes, ok
	invoke	putstr_cs,addr m_args		; wrong number of args
	jmp	cmd_ret				; leave

@@:	mov	esi,offset tok_list1		; start of cmd line
	invoke	nextnull,esi			; end of 1st token (C)
	inc	eax				; start of next token
	mov	esi,eax

	invoke	decbin32,esi			; get decimal value from input line
	cmp	ebx,0				; ok?

	mov	ecx,eax				; save "n"
	jne	@f				; yes

	invoke	putstr_cs,addr m_bad_hist_num
	jmp	cmd_ret

@@:
;+
; history commands don't go into the history lists
;-
	invoke	edit_history			; get rid of "this" command
	invoke	fetch_history,addr line_buf1,ecx	; fetch "nth" command
	jmp	cmd_got_one_ret			; use this

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

;+
; return which causes a new command to be re-parsed
;-
cmd_got_one_ret:
	popa
	jmp	re_parse

;+
; Routine: init_history
;
; Purpose:
;	initialize the history subsystem
;
; Inputs:
;	none
;
; Returns:
;	none
;-
init_history	PROC	uses eax

	xor	eax,eax
	mov	DWORD PTR history_len,eax
	mov	DWORD PTR history_idx,eax
	ret

init_history	endp

;+
; Routine: fetch_history
;
; Purpose:
;	Get one command line from the history list
;
; Inputs:
;	ptr to target buffer which will be filled with recalled command
;	index into history buffer + 1 (1 => previous command)
;
; Returns:
;	None, the target buffer is modified.
;
; Notes:
;
;	If the index is out of range:
;
;	if 0, recall 1
;	if > active length, recall oldest history item
;-
fetch_history	PROC	uses eax ebx ecx edx,
	target:DWORD,
	val:DWORD

	cmp	DWORD PTR trace_value,0	; ****DEBUG
	je	@f

	invoke	putstr_cs,addr m_fetch
	mov	ecx,val
	invoke	putdec8,ecx
	invoke	space
@@:
	mov	ebx,DWORD PTR history_len
	mov	ecx,val			; index value
	cmp	ecx,0			; too small...
	jne	@f			; = 0?

	inc	ecx			; make it 1 instead
@@:
	cmp	ecx,ebx			; too large???
	jle	@f			; in range

	mov	ecx,ebx			; force to be oldest one
@@:
	cmp	ecx,0				; is the history list empty?
	jne	@f
	
	mov	ecx,target			; get target buffer
	mov	byte ptr [ecx],0		; zero buffer
	jmp	fetch_90			; done

@@:
;+
; recall the nth (where 1 = latest)
;
; current (lastest) entry is at history_idx, the history list is a ring
; buffer with HISTORY_DEPTH entries.
;
;-
	mov	edx,DWORD PTR history_idx
	sub	edx,ecx
	xchg	edx,ecx
;	inc	ecx			; history_idx - adjusted "n"
	cmp	ecx,0
	jge	@f

	add	ecx,HISTORY_DEPTH	; keep within list

@@:
	mov	eax,IN_BUFF_LENGTH
	imul	ecx			; edx:eax offset from base of history

	cmp	DWORD PTR trace_value,0	; ****DEBUG
	je	@f

	invoke	puthex8,eax		; show it
	invoke	space

@@:
	mov	edx,offset  history
	lea	ebx,[edx][eax]		; source ptr (in history list)
	mov	edx,target		; where to write to
	invoke	strcpy,edx,ebx		; move command

	cmp	DWORD PTR trace_value,0
	je	@f

	invoke	space
	invoke	puthex8,ebx
	invoke	space
	invoke	putstr,edx
@@:
;+
; done
;-
fetch_90:
	ret

fetch_history	endp

;+
; Routine: add_history
;
; Purpose:
;	Place one command line into the history list
;
; Inputs:
;	ptr to src buffer which will contain a command to store in the history
;
; Returns:
;	None, the target buffer is modified.
;
; Notes:
;
;-
add_history	PROC	uses eax ebx edx,
	src:DWORD

	cmp	DWORD PTR trace_value,0	;***DEBUG
	je	@f

	invoke	putstr_cs,addr m_addh

@@:
	mov	ebx,DWORD PTR history_len
	inc	ebx
	cmp	ebx,HISTORY_DEPTH
	jle	@f			; exceeded max?

	mov	ebx,HISTORY_DEPTH	; max value
@@:
	mov	DWORD PTR history_len,ebx	; update value

	mov	ebx,DWORD PTR history_idx
	mov	eax,IN_BUFF_LENGTH
	imul	ebx				; edx:eax = history offset

	cmp	DWORD PTR trace_value,0		; ***DEBUG
	je	@f

	invoke	puthex8,eax

@@:
	mov	ebx,offset history		; points to history base
	lea	edx,[eax][ebx]			; edx = history element

	cmp	DWORD PTR trace_value,0		; ***DEBUG
	je	@f

	invoke	space
	invoke	puthex8,edx
	invoke	space

@@:	mov	ebx,src
	invoke	strcpy,edx,ebx			; save command

	mov	ebx,DWORD PTR history_idx	; update idx
	inc	ebx
	cmp	ebx,HISTORY_DEPTH
	jl	@f

	xor	ebx,ebx				; wrap back to idx = 0

@@:
	mov	DWORD PTR history_idx,ebx	; with new value

	cmp	DWORD PTR trace_value,0		;***DEBUG
	je	@f

	invoke	putstr,edx
@@:
;+
; done
;-
add90:
	ret

add_history	endp

;+
; Routine: edit_history
;
; Purpose: get rid of the most recent history entry
;
; Notes:
;
;	This is called to get rid of a history command that gets into
;	the history list through normal p0 module actions
;-
edit_history	PROC	uses ebx

	cmp	DWORD PTR trace_value,0		;***DEBUG
	je	@f

	invoke	putstr_cs,addr m_edith
@@:
	mov	ebx,DWORD PTR history_len
	cmp	ebx,0
	je	edit_90				; done, already empty

	sub	ebx,1				; adjust
	mov	DWORD PTR history_len,ebx
	mov	ebx,DWORD PTR history_idx
	sub	ebx,1
	jge	@f				; not less than 0

	mov	ebx,HISTORY_DEPTH-1		; wrap
@@:
	mov	DWORD PTR history_idx,ebx	; update
edit_90:
	ret

edit_history	endp

ROM_CodeP	ENDS
	end
