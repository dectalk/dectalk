;+
; File: sym.asm
;
; Purpose: microPOST sym command
;
; Edits:
;
; 001 18-Jan-1992 RAO Creation
; 002 22-Jan-1992 RAO Added symbols for debug, added symlook proc
;-
	title	microPOST sym command
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
	extrn	symidx:near,symval:near,symname:near

	extrn	trace_value:near

	public	cmd_sym

ROM_CodeP	SEGMENT
	assume	ds:ROM_DataP
;+
; locally used strings
;-
bad_hex		db	CR,LF,'? Bad hex address',0
m_args		db	CR,LF,'? args',0
full_table	db	CR,LF,'? full symtab',0
m_pause	db	'<hit any char to continue>',CR,0

;+
; Note:
;	On entry, the command line is in line_buf1.
;	The tokenized list is in tok_list1.
;	The number of tokens are in tok_count1.
;
;	Case1:
;
;	SYM				! list all symbols
;	SYM foo				! show value of symbol foo
;	SYM foo f1234			! assign foo value 1234
;-
cmd_sym:
	pusha
	mov	ecx,dword ptr tok_count1	; number of tokens
	cmp	ecx,1			; must be 1,2,3
	je	cmd_sym_all		; show all symbols

	cmp	ecx,2			;
	je	cmd_sym_look		; lookup just one

	cmp	ecx,3			; normal SYM foo f1234
	jne	do_bad_args		; not ok

cmd_sym_add:
;+
; If a whole symbol table is loaded, the history list would get clobbered,
; so ignore this version of SYM
;-
	invoke	edit_history

;+
; if symbol table is full...complain
;-
	cmp	DWORD PTR symidx,symtab_entries
	jge	do_cmd_full		; no room

	invoke	nextnull,addr tok_list1	; find end of 1st token 'SYM'
	inc	eax			; just past null char

	mov	edi,eax			; get symbol name address
	invoke	nextnull,edi		; find end of 2nd token 'foo'
	inc	eax			; just past null char
	mov	esi,eax

	invoke	hexbin32,esi		; get symbol value
	cmp	ebx,0			; hex to bin ok?

	je	do_bad_hex		; no

	mov	ecx,eax			; save symbol value

	mov	ebx,DWORD PTR symidx	; 0..n
	mov	eax,offset symval
	mov	[eax][ebx*4],ecx

	mov	eax,SYM_BUFF_LENGTH
	mov	ecx,eax
	imul	ebx
	mov	esi,offset symname
	add	esi,eax			; points to symbol string entry

	invoke	strncpy,esi,edi,ecx	; fill with name
	inc	DWORD PTR symidx
	jmp	cmd_ret			; done
	
cmd_sym_all:
;+
; Show all symbols
;-
	mov	esi,offset symval	; symbol value table
	mov	edi,offset symname	; symbol name table
	mov	edx,DWORD PTR symidx	; next available index
	xor	ebx,ebx			; start at index 0
	push	LINES_PER_PAGE		; ***--- output line ctr

cmd_sym_all50:
	cmp	ebx,edx			; end of table?
	jl	@f			; no, continue
	pop	eax			; ***+++ lines per page
	jmp	cmd_ret			; done
@@:
	sub	dword ptr ss:[esp],1	; end of page?
	jne	@f			; no

	mov	dword ptr ss:[esp],LINES_PER_PAGE ; reset line counter
	invoke	crlf			; next line (this is tricky!)
	invoke	putstr_cs,addr m_pause	; message
	invoke	getc			; wait for char
	invoke	erase_line		; clear the message
	invoke	up_line			; go back to previous line

@@:
	invoke	crlf
	invoke	putstr,edi		; show name
	invoke	strlen,edi		; get how long it was -> eax
	mov	ecx,SYM_BUFF_LENGTH+2
	sub	ecx,eax			; get difference -> ecx

@@:	invoke	space			; make columns line up
	loop	@b

	mov	eax,[esi]		; get value
	invoke	puthex8,eax		; show it
	inc	ebx
	add	esi,4
	add	edi,SYM_BUFF_LENGTH
	jmp	cmd_sym_all50

cmd_sym_look:
;+
; string looks like "SYM FOO"
;-
	invoke	nextnull,addr tok_list1	; find end of 1st token 'SYM'
	inc	eax


	mov	ecx,eax			; symbol name pointed to by ecx
	invoke	symlook,ecx		; value returned in eax

	cmp	eax,-1			; match?
	je	cmd_ret			; no
;+
; show value
;-
	mov	ebx,eax			; save value of symbol
	invoke	crlf
	invoke	putstr,ecx		; show name of symbol
	invoke	strlen,ecx		; get how long it was -> eax
	mov	ecx,SYM_BUFF_LENGTH+2
	sub	ecx,eax			; get difference -> ecx

@@:	invoke	space			; make columns line up
	loop	@b

	invoke	puthex8,ebx		; show value of symbol
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

do_cmd_full:
	invoke	putstr_cs,addr full_table
	jmp	cmd_ret

cmd_ret:
;+
; common return
;-
cmd_ret2:
	popa
	jmp	parse_top		; return to parser

;+
; Routine: symlook
;
; Purpose: Lookup a symbol (by name) in the symbol table
;
; Inputs:
;	Ptr to string (ds relative)
;
; Outputs:
;	eax returns value if found, else ffffffff
;
; Notes:
;	no symbol with a value of ffffffff can be looked up with this routine
;-
symlook	PROC	NEAR32 uses ebx ecx edx esi edi,sptr:DWORD

	mov	ecx,sptr		; ptr to symbol string

;+
; now look for this string somewhere in the symbol table, allow for dups!
;-
	mov	esi,offset symval	; symbol value table
	mov	edi,offset symname	; symbol name table
	mov	edx,DWORD PTR symidx	; next available index
	xor	ebx,ebx			; start at index 0

symlook50:
	cmp	ebx,edx			; end of table?
	jge	symlook90		; yes, done (w/o finding it)

	invoke	stricmp,ecx,edi
	cmp	eax,0			; match?
	jne	symlook80		; no
;+
; we have the value!
;-

	mov	eax,[esi]		; get value
	jmp	symlook95		; return it in eax

symlook80:
	inc	ebx
	add	esi,4
	add	edi,SYM_BUFF_LENGTH
	jmp	symlook50

symlook90:
	mov	eax,-1			; return ffffffff (did not find)

symlook95:
	ret

symlook	ENDP

ROM_CodeP	ENDS
	end
