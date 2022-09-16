;+
; File: hlp.asm
;
; Purpose: microPOST, help command
;
; Edits:
;
; 001 11-Dec-1991 RAO Creation
; 002 17-Dec-1991 RAO Enable more commands
; 003 18-Dec-1991 RAO Added control, fill
; 004 19-Dec-1991 RAO Added mt command
; 005 24-Dec-1991 RAO Added du command, more ctl options
; 006 26-Dec-1991 RAO Added help new command, use pusha, Popa
; 007 27-Dec-1991 RAO Added ma command
; 008 29-Dec-1991 RAO Added seg, dr to pr options
; 009 03-Jan-1992 RAO Added C MSR, C MCR
; 010 06-Jan-1992 RAO Added Go and CPB, CPW, CPD commands
; 011 09-Jan-1992 RAO Added B, BC commands
; 012 10-Jan-1992 RAO Added current stack info to help output
; 013 15-Jan-1992 RAO Added cls command
; 014 16-Jan-1992 RAO Added pause in long help text (so it won't scroll off
;			the screen)
; 015 18-Jan-1992 RAO Added sym command
; 016 22-Jan-1992 RAO Added comment char/command
; 017 23-Jan-1992 RAO Added load command
; 018 25-Jan-1992 RAO Added int 21h, loadable code stuff
; 019 05-Feb-1992 RAO Added C COMBO, Quit
; 020 05-Mar-1992 RAO Added C CINV, C COFF
; 021 08-Mar-1992 RAO Added MP command
; 022 09-Mar-1992 RAO More MP options
;-
	title	microPOST help module
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
	extrn	first_data_ram:near,last_data_ram:near
	extrn	m_new_stuff:near
	extrn	tok_count1:near,tok_list1:near
	extrn	loader_error:near
	public	cmd_help

ROM_CodeP	SEGMENT
	assume	ds:ROM_DataP


;+
; messages (commented commands must be enabled later)
;-
help_main1 db	CR,LF
	db	'C [B9600 | B2400 ] (nyi)',CR,LF
	db	'CF                                Clear load checksum error flag',CR,LF
	db	'CLS                               Clear console screen',CR,LF
	db	'CPB | CPW | CPD   [AddrRange]     Copy range of memory',CR,LF
	db	'DB | DW | DD | DU [AddrRange]     Dump memory',CR,LF
	db	'EB | EW | ED      [Address]       Edit memory',CR,LF
	db	'FB | FW | FD      [AddrRange]     Fill memory w/ constant',CR,LF
	db	'G | Go Address                    Jump to code at address',CR,LF
	db	'H | Help | ? [new]                Help (this message)',CR,LF
	db	0		; *** 1st help string ends here

help_main2:
	db	'IB | IW | ID [Port]               Input from port',CR,LF
	db	'LOAD Address                      Load Intel HEX at Address',CR,LF
	db	'OB | OW | OD [Port Val]           Output val to port',CR,LF
	db	'LRB | LRW | LRD   [AddrRange]     Looped read memory',CR,LF
	db	'LWB | LWW | LWD   [AddrRange]     Looped write memory',CR,LF
	db	'MA [AddrRange] (L implies Dwords) Memory test, addr as data',CR,LF
	db	'PR [CR | CR0..CR3 | DR | DR0..DR7 | SEG] Processor reg read',CR,LF
;
;	db	'PW [EF | CR0..3 | DR0..7 | TR3..7]  Processor reg write',CR,LF
	db	'RB                                Reblast ROM *very dangerous!*',CR,LF
	db	'T0                                Run self-test',CR,LF
	db	'TALK                              Start the DECtalk Express system',CR,LF

;	db	'QUIT | Q                (nyi)     Start BIOS/RRD as base',CR,LF
	db	';                                 Comment line, ignored',CR,LF
	db	':LLAAAATTDD....CC                 Intel HEX line',CR,LF
					;
	db	0			; this entry *must be* last
					;

m_1	db	'GDT base: ',0
m_2	db	' IDT base: ',0
m_3	db	CR,LF
	db	'Variables start: ',0
m_4	db	', end: ',0
m_5	db	', Stack top: ',0
m_6	db	', esp: ',0

m_args	db	CR,LF,'? args',0
m_pause	db	'<hit any char to continue>',CR,0

s_new	db	'new',0

csclear	db	CR,LF,'Loader checksum flag is clear',0
csset	db	CR,LF,'Loader checksum flag is set!',0


cmd_help:
	pusha

;+
; before the standard help text is output, check to see if the
;
;	'Help new'
;
; command has been given...
;
; if it has, show the list of new microPOST features, else show help stuff
;-
	mov	eax,dword ptr tok_count1	; how many tokens?
	cmp	eax,2				; 2 => HELP xxx
	jne	cmd_help1			; no, assume just help

	mov	esi,offset tok_list1		; start of cmd line
	invoke	nextnull,esi			; end of 1st token (H, Help or ?)
	inc	eax				; start of next token
	mov	esi,eax

	invoke	stricmp_cs,addr s_new,esi	; match 'Help New' ?
	cmp	eax,0
	je	cmd_help_new			; yes

	invoke	putstr_cs,addr m_args		; no, error
	jmp	cmd_ret				; done

cmd_help_new:
	invoke	putstr_cs,addr m_new_stuff
	jmp	cmd_ret

cmd_help1:
;+
; print help text in parts
;-
	invoke	putstr_cs,addr help_main1	; print canned help message
	invoke	putstr_cs,addr m_pause
	invoke	getc
	invoke	erase_line
	invoke	putstr_cs,addr help_main2
;+
; Show some stats about memory use
;-
	invoke	putstr_cs,addr m_1
	mov	esi,GDT_IN_RAM
	invoke	puthex8,esi

	invoke	putstr_cs,addr m_2
	mov	esi,IDT_IN_RAM
	invoke	puthex8,esi

	invoke	putstr_cs,addr m_3
	lea	esi, first_data_ram
	invoke	puthex8,esi

	invoke	putstr_cs,addr m_4
	lea	esi, last_data_ram
	invoke	puthex8,esi

	invoke	putstr_cs,addr m_5
	mov	esi,STACK_TOP
	invoke	puthex8,esi

	invoke	putstr_cs,addr m_6
	invoke	puthex8,esp

	mov	eax, dword ptr loader_error
	cmp	eax, 0
	jne	flagset

	invoke	putstr_cs, addr csclear
	jmp 	cmd_ret
flagset:
	invoke	putstr_cs, addr csset
	jmp	cmd_ret

cmd_ret:
	popa

	jmp	parse_top		; return to mail command loop

ROM_CodeP	ENDS
	end
