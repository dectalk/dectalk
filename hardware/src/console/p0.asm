;+
; File: p0.asm
;
; Purpose: microPOST, main, top level parsing
;
; Edits:
;
; 001 10-Dec-1991 RAO Creation
; 002 14-Dec-1991 RAO More commands added
; 003 16-Dec-1991 RAO Changed main parse loop
; 004 17-Dec-1991 RAO Fix ptr segment override
; 005 18-Dec-1991 RAO Added more commands
; 006 19-Dec-1991 RAO Added mt command
; 007 24-Dec-1991 RAO Added du command,x cmd enabled, added guard vars
; 008 27-Dec-1991 RAO Added pr command, fix sense of guard compares, added ma
; 009 02-Jan-1992 RAO Added io commands
; 010 06-Jan-1992 RAO Added g, cp commands
; 011 09-Jan-1992 RAO Added b, bc, be commands
; 012 15-Jan-1992 RAO Added cls command
; 013 16-Jan-1992 RAO Command recall support added
; 014 18-Jan-1992 RAO More guard fields added, symbol table command added
; 015 22-Jan-1992 RAO Added comment char
; 016 23-Jan-1992 RAO Added load command and intel HEX prefix handler
; 017 24-Jan-1992 RAO Minor fixes for last features
; 018 05-Feb-1992 RAO Added more commands
; 019 08-Mar-1992 RAO Added cmd_mp
;-
	title	microPOST main module
	.xlist
	include am00.inc
	include	am05.inc
	include	am07.inc
	include	amsegs32.inc
	include	limits.inc
	include	segass32.inc
	include	proto.inc
	.list

	extrn	line_buf1:near,line_buf2:near,tok_list1:near,tok_count1:near
	extrn	trace_value:near
	extrn	cmd_b:near,cmd_bc:near,cmd_be:near
	extrn	cmd_cls:near
	extrn	cmd_cpb:near,cmd_cpw:near,cmd_cpd:near
	extrn	cmd_db:near,cmd_dw:near,cmd_dd:near,cmd_du:near
	extrn	cmd_help:near
	extrn	cmd_history:near,history_len:near
	extrn	cmd_ctl:near
	extrn	cmd_pr:near
	extrn	cmd_trace:near
	extrn	cmd_eb:near,cmd_ew:near,cmd_ed:near
	extrn	cmd_fb:near,cmd_fw:near,cmd_fd:near
	extrn	cmd_go:near

	extrn	cmd_load:near,cmd_ihex:near
	extrn	cmd_lrb:near,cmd_lrw:near,cmd_lrd:near
	extrn	cmd_lwb:near,cmd_lww:near,cmd_lwd:near
	extrn	cmd_mt:near,cmd_x:near
	extrn	cmd_ma:near
	extrn	cmd_ib:near,cmd_iw:near,cmd_id:near
	extrn	cmd_ob:near,cmd_ow:near,cmd_od:near

	extrn	cmd_rb:near, cmd_talk:near, cmd_t0:near, cmd_cf:near

	extrn	cmd_recall:near,cmd_recall_last:near
	extrn	cmd_sym:near,cmd_quit:near,cmd_mp:near

	extrn	guard1:near,guard2:near,guard3:near,guard4:near,guard5:near
	extrn	guard6:near,guard7:near,guard8:near,guard9:near,guard10:near
	extrn	guard11:near,guard12:near,guard13:near,guard14:near

	public	parse_top,cmd_table,re_parse, parse_top2

ROM_CodeP	SEGMENT
	assume	ds:ROM_DataP

;+
; command tables
;-
cmd_table:
	dd	offset	ROM_CodeP:cmd_b
	dd	offset	cmd_b_string

	dd	offset	ROM_CodeP:cmd_bc
	dd	offset	cmd_bc_string

	dd	offset	ROM_CodeP:cmd_be
	dd	offset	cmd_be_string

	dd	offset	ROM_CodeP:cmd_cf
	dd	offset	cmd_cf_string

	dd	offset	ROM_CodeP:cmd_cls
	dd	offset	cmd_cls_string

	dd	offset	ROM_CodeP:cmd_cls
	dd	offset	cmd_clr_string		; alias

	dd	offset	ROM_CodeP:cmd_ctl
	dd	offset	cmd_ctl_string

	dd	offset	ROM_CodeP:cmd_cpb
	dd	offset	cmd_cpb_string

	dd	offset	ROM_CodeP:cmd_cpw
	dd	offset	cmd_cpw_string

	dd	offset	ROM_CodeP:cmd_cpd
	dd	offset	cmd_cpd_string

	dd	offset	ROM_CodeP:cmd_db
	dd	offset	cmd_db_string

	dd	offset	ROM_CodeP:cmd_dw
	dd	offset	cmd_dw_string

	dd	offset	ROM_CodeP:cmd_dd
	dd	offset	cmd_dd_string

	dd	offset	ROM_CodeP:cmd_du
	dd	offset	cmd_du_string

	dd	offset	ROM_CodeP:cmd_eb
	dd	offset	cmd_eb_string

	dd	offset	ROM_CodeP:cmd_ew
	dd	offset	cmd_ew_string

	dd	offset	ROM_CodeP:cmd_ed
	dd	offset	cmd_ed_string

	dd	offset	ROM_CodeP:cmd_fb
	dd	offset	cmd_fb_string

	dd	offset	ROM_CodeP:cmd_fw
	dd	offset	cmd_fw_string

	dd	offset	ROM_CodeP:cmd_fd
	dd	offset	cmd_fd_string

	dd	offset	ROM_CodeP:cmd_go
	dd	offset	cmd_go_string1

	dd	offset	ROM_CodeP:cmd_go
	dd	offset	cmd_go_string2

	dd	offset	ROM_CodeP:cmd_help
	dd	offset	cmd_help_string1

	dd	offset	ROM_CodeP:cmd_help
	dd	offset	cmd_help_string2		; alias

	dd	offset	ROM_CodeP:cmd_help
	dd	offset	cmd_help_string3		; alias

	dd	offset	ROM_CodeP:cmd_history
	dd	offset	cmd_history_string1

	dd	offset	ROM_CodeP:cmd_history
	dd	offset	cmd_history_string2		; alias

	dd	offset	ROM_CodeP:cmd_ib
	dd	offset	cmd_ib_string

	dd	offset	ROM_CodeP:cmd_iw
	dd	offset	cmd_iw_string

	dd	offset	ROM_CodeP:cmd_id
	dd	offset	cmd_id_string

	dd	offset	ROM_CodeP:cmd_load
	dd	offset	cmd_load_string

	dd	offset	ROM_CodeP:cmd_ob
	dd	offset	cmd_ob_string

	dd	offset	ROM_CodeP:cmd_ow
	dd	offset	cmd_ow_string

	dd	offset	ROM_CodeP:cmd_od
	dd	offset	cmd_od_string

	dd	offset	ROM_CodeP:cmd_lrb
	dd	offset	cmd_lrb_string

	dd	offset	ROM_CodeP:cmd_lrw
	dd	offset	cmd_lrw_string

	dd	offset	ROM_CodeP:cmd_lrd
	dd	offset	cmd_lrd_string

	dd	offset	ROM_CodeP:cmd_lwb
	dd	offset	cmd_lwb_string

	dd	offset	ROM_CodeP:cmd_lww
	dd	offset	cmd_lww_string

	dd	offset	ROM_CodeP:cmd_lwd
	dd	offset	cmd_lwd_string

	dd	offset	ROM_CodeP:cmd_mt
	dd	offset	cmd_mt_string

	dd	offset	ROM_CodeP:cmd_ma
	dd	offset	cmd_ma_string

	dd	offset	ROM_CodeP:cmd_pr
	dd	offset	cmd_pr_string

	dd	offset	ROM_CodeP:cmd_quit
	dd	offset	cmd_quit_string1

	dd	offset	ROM_CodeP:cmd_quit
	dd	offset	cmd_quit_string2

	dd	offset	ROM_CodeP:cmd_rb
	dd	offset	cmd_rb_string

	dd	offset	ROM_CodeP:cmd_recall
	dd	offset	cmd_recall_string

	dd	offset	ROM_CodeP:cmd_recall_last
	dd	offset	cmd_recall_last_string

	dd	offset	ROM_CodeP:cmd_sym
	dd	offset	cmd_sym_string

	dd	offset	ROM_CodeP:cmd_t0
	dd	offset	cmd_t0_string

	dd	offset	ROM_CodeP:cmd_talk
	dd	offset	cmd_talk_string

	dd	offset	ROM_CodeP:cmd_trace
	dd	offset	cmd_trace_string

	dd	offset	ROM_CodeP:cmd_mp
	dd	offset	cmd_mp_string

	dd	offset	ROM_CodeP:cmd_x
	dd	offset	cmd_x_string

	dd	-1			; end marker; *must* be the end
	dd	-1			; end marker; *must* be the end
;+
; command string prefixes
;-
cmd_b_string	db	'b',0
cmd_bc_string	db	'bc',0
cmd_be_string	db	'be',0

cmd_cls_string	db	'cls',0
cmd_clr_string	db	'clr',0
cmd_cf_String	db	'cf',0
cmd_ctl_string	db	'c',0

cmd_cpb_string	db	'cpb',0
cmd_cpw_string	db	'cpw',0
cmd_cpd_string	db	'cpd',0

cmd_db_string	db	'db',0
cmd_dw_string	db	'dw',0
cmd_dd_string	db	'dd',0
cmd_du_string	db	'du',0

cmd_eb_string	db	'eb',0
cmd_ew_string	db	'ew',0
cmd_ed_string	db	'ed',0

cmd_fb_string	db	'fb',0
cmd_fw_string	db	'fw',0
cmd_fd_string	db	'fd',0

cmd_go_string1	db	'g',0
cmd_go_string2	db	'go',0

cmd_help_string1 db	'?',0
cmd_help_string2 db	'h',0
cmd_help_string3 db	'help',0

cmd_history_string1	db 'hi',0
cmd_history_string2	db 'history',0

cmd_ib_string	db	'ib',0
cmd_iw_string	db	'iw',0
cmd_id_string	db	'id',0

cmd_load_string	db	'load',0

cmd_mp_string	db	'mp',0

cmd_ob_string	db	'ob',0
cmd_ow_string	db	'ow',0
cmd_od_string	db	'od',0

cmd_lrb_string	db	'lrb',0
cmd_lrw_string	db	'lrw',0
cmd_lrd_string	db	'lrd',0

cmd_lwb_string	db	'lwb',0
cmd_lww_string	db	'lww',0
cmd_lwd_string	db	'lwd',0

cmd_ma_string	db	'ma',0

cmd_mt_string	db	'mt',0

cmd_pr_string	db	'pr',0

cmd_quit_string1 db	'Quit',0
cmd_quit_string2 db	'Q',0

cmd_rb_string	db	'rb',0

cmd_recall_string db	'!',0
cmd_recall_last_string	db	'!!',0

cmd_sym_string	db	'sym',0

cmd_t0_string	db	't0',0
cmd_talk_string	db	'talk',0

cmd_trace_string db	'trace',0

cmd_x_string	db	'x',0

;+
; messages
;-
	public	m_corrupt, m_under, m_over
m_input		db	'Cmd>',0
m_corrupt	db	CR,LF,'?? Corrupted RAM area, please RESET ?? ',0
m_under		db	CR,LF,'?? Stack underflow, please RESET ?? ',0
m_over		db	CR,LF,'?? Stack overflow, please RESET ?? ',0

m_what		db	CR,LF,'?',0
m_d1		db	CR,LF,'calling dmptokens...',0
m_d2		db	CR,LF,'[got line]',0
m_d3		db	CR,LF,'[searching cmd_table]',0
m_d4		db	CR,LF,'[cmd == token?] ',0

parse_top:
;+
; look for evidence of corruption in ram data
;-
	mov	eax,RSIGN
	cmp	dword ptr guard1,eax		; changed?
	jne	@f				; yes, problem

	cmp	dword ptr guard2,eax		; changed?
	jne	@f				; yes, problem

	cmp	dword ptr guard3,eax		; changed?
	jne	@f				; yes, problem

	cmp	dword ptr guard4,eax		; changed?
	jne	@f				; yes, problem

	cmp	dword ptr guard5,eax		; changed?
	jne	@f				; yes, problem

	cmp	dword ptr guard6,eax		; changed?
	jne	@f				; yes, problem

	cmp	dword ptr guard7,eax		; changed?
	jne	@f				; yes, problem

	cmp	dword ptr guard8,eax		; changed?
	jne	@f				; yes, problem

	cmp	dword ptr guard9,eax		; changed?
	jne	@f				; yes, problem

	cmp	dword ptr guard10,eax		; changed?
	jne	@f				; yes, problem

	cmp	dword ptr guard11,eax		; changed?
	jne	@f				; yes, problem

	cmp	dword ptr guard12,eax		; changed?
	jne	@f				; yes, problem

	cmp	dword ptr guard13,eax		; changed?
	jne	@f				; yes, problem

	cmp	dword ptr guard14,eax		; changed?
	jne	@f				; yes, problem

	mov	ebx,STACK_TOP
	cmp	dword ptr ss:[ebx],eax		; underflow at one time?
	jne	stack_under			; yes

	sub	ebx,STACK_SIZE
	cmp	dword ptr ss:[ebx],eax		; overflow at one time?
	jne	stack_over			; yes

	jmp	parse_top2

@@:	invoke	putstr_cs,addr m_corrupt	; warn, but continue
	jmp	parse_top2

stack_under:
	invoke	putstr_cs,addr m_under
	jmp	parse_top2

stack_over:
	invoke	putstr_cs,addr m_over
	jmp	parse_top2

re_parse:					; get here from command recall
	invoke	crlf
	invoke	getcmd_pline,addr line_buf1,addr m_input
	jc	parse_top			; error
	jmp	parse_top_10			; do it

parse_top2:
	invoke	crlf
	mov	esi,offset line_buf1
	mov	byte ptr [esi],0		; start with empty line
;	invoke	putstr_cs,addr m_input		; ask for input
	invoke	getcmd_pline,esi,addr m_input	; fill this cmd line
	jc	parse_top			; error

parse_top_10:
;+
; ok, a line has been typed into line_buf1; break apart into tokens
; and place into tok_list1
;-
;	invoke	putstr_cs,addr m_d2		; ***DBG
	invoke	strlen,addr line_buf1
	cmp	eax,0				; use typed just return?
	je	parse_top			; yes
;+
; a few special cases should be handled prior to the tokenize call...
;-
	cmp	byte ptr line_buf1,';'		; is it a comment prefix char?
	je	parse_top			; yes, ignore it

	cmp	byte ptr line_buf1,':'		; is it an Intel HEX prefix?
	je	cmd_ihex			; yes, process command

	invoke	tokenize,addr tok_list1,addr line_buf1
	mov	dword ptr tok_count1,eax	; track how many we found

;	cmp	dword ptr trace_value,0		; ***DBG
;	invoke	dmptokens			; ***DBG
;+
; first string in tok_list1 should match a command keyword
;-
	mov	edi,offset tok_list1	; pts to 1st token
	mov	esi,offset cmd_table
	add	esi,4			; pts to string offset entry

@@:	cmp	dword ptr cs:[esi],-1	; end of table marker?
	je	parse_80		; no match, done with this command line
	mov	ebx,cs:[esi]		; get cmd string ptr value
;	invoke	putstr_cs,addr m_d4	; ***DBG
;	invoke	putstr_cs,ebx		; ***DBG
;	invoke	space			; ***DBG
;	invoke	putstr,edi		; ***DBG
;	invoke	space			; ***DBG

	invoke	stricmp_cs,ebx,edi	; match on this keyword?
	cmp	eax,0			; ?
	je	parse_20		; yes
	add	esi,8			; no, get next cmd keyword ptr
	jmp	@b

parse_20:
;+
; ok, the previous dword (from esi) contains the address of the action routine
;-
	sub	esi,4
	mov	ebx,cs:[esi]		; get address from table
;+
; if this command is identical to the previous (in the history),
; don't bother to add it.
;-
	cmp	DWORD PTR history_len,0
	je	@f			; empty, no previous command

	invoke	fetch_history,addr line_buf2,1 ; get previous command
	invoke	strcmp,addr line_buf1,addr line_buf2 ; match?
	cmp	eax,0
	je	parse_50		; match, don't add to history

@@:
	invoke	add_history,addr line_buf1 ; add all command lines->history

parse_50:
	jmp	ebx			; better be right...

parse_80:
	invoke	putstr_cs,addr m_what	; confusion

;+
; if duplicate to previous history entry, don't add it
;-
	cmp	DWORD PTR history_len,0
	je	@f			; empty, no previous command

	invoke	fetch_history,addr line_buf2,1 ; get previous command
	invoke	strcmp,addr line_buf1,addr line_buf2 ; match?
	cmp	eax,0
	je	parse_top		; match, don't add to history

@@:
	invoke	add_history,addr line_buf1 ; add all command lines->history
	jmp	parse_top

ROM_CodeP	ENDS
	end
