;+
; File: dt.asm
;
; Purpose: microPOST, ram layout for local operations
;
; Edits:
;
; 001 07-Dec-1991 RAO Creation, adapted dx module
; 002 10-Dec-1991 RAO More data structures
; 003 16-Dec-1991 RAO More buffers added
; 004 20-Dec-1991 RAO Added 1 char int buffer
; 005 24-Dec-1991 RAO Added guard vars
; 006 07-Jan-1992 RAO Added db_ascii_buffer
; 007 15-Jan-1992 RAO Added history_len
; 008 18-Jan-1992 RAO Added simple symbol table support
; 009 20-Jan-1992 RAO Get rid of useless align
; 010 23-Jan-1992 RAO Add load_offset
; 011 24-Jan-1992 RAO Add last_go_address
;     21mar96	tek	added within_int flag
;-
	title	microPOST dt
	.xlist

	include am00.inc
	include	am07.inc
	include	amsegs32.inc
	include	limits.inc
	include	segass32.inc

	.list

	public	line_buf1,line_buf2,xon_flag,last_addr,addr_low,addr_high
	public	last_dropped
	public	length_val,history,history_idx,history_len
	public	edit_buf1,edit_tokens1
	public	tok_list1,tok_count1
	public	chip_id,base_32bit
	public	trace_value
	public	base_of_ram,first_data_ram,last_data_ram
	public	db_ascii_buffer
	public	load_offset, load_adder, loader_error, g_saved_sp
	public	last_go_address, within_int

	public	symname,symval,symidx
	public	guard1,guard2,guard3,guard4,guard5,guard6,guard7,guard8
	public	guard9,guard10,guard11,guard12,guard13,guard14


ROM_DataP	SEGMENT
base_of_ram label byte			; keep this as the first item in this
					; segment; used to get offsets in a
					; brute force manner from within
					; 16 bit code segments
	org	GDT_IN_RAM
	org	IDT_IN_RAM
	org	RAM_AREA_BASE

first_data_ram	label byte		; keep this before any RAM variables
guard1		dd	0		; guard value
chip_id		dd	0		; 486 id
base_32bit	dd	0		; base address of ROM_CodeP
history_idx	dd	0		; index of current history
history_len	dd	0		; valid entries in history
guard2		dd	0		; guard value
last_addr	dd	0		; for dump class
addr_low	dd	0		; " "
addr_high	dd	0		; " "
last_go_address	dd	0		; where GO went to (for loadable code)
guard3		dd	0		; guard value
length_val	dd	0		; " "
tok_count1	dd	0		; used with tok_list1
guard4		dd	0		; guard value
trace_value	dd	0		; 1 = trace, 0 = no trace
xon_flag	db	0		; active? (0 == clear)
guard5		dd	0		; guard value
symidx		dd	0		; top of symbol stack
load_offset	dd	0		; offset for Intel HEX loads
load_adder	dd	0		; base from extended HEX record
loader_error	dd	0		; flag load errors.
g_saved_sp	dd	0		; sp before a g command.
within_int	dd	0		; flag that we're in an int already

line_buf1	db	IN_BUFF_LENGTH DUP (0)
guard6		dd	0		; guard value
line_buf2	db	IN_BUFF_LENGTH DUP (0)
guard7		dd	0		; guard value
tok_list1	db	IN_BUFF_LENGTH DUP (0)
guard8		dd	0		; guard value
edit_buf1	db	IN_BUFF_LENGTH DUP (0)
guard9		dd	0		; guard value
edit_tokens1	db	IN_BUFF_LENGTH DUP (0)
guard10		dd	0		; guard value
db_ascii_buffer	db	IN_BUFF_LENGTH DUP (0)
last_dropped	db	0		; last char dropped in type-ahead(kak)
guard11		dd	0		; guard value


history label byte			; start of n recent input lines
	REPEAT	history_depth
	db	IN_BUFF_LENGTH	DUP(0)
	ENDM

guard12		dd	0		; guard value

symval	label	dword
	REPEAT	symtab_entries
	dd	0
	ENDM

guard13		dd	0		; guard value

symname	label	byte
	REPEAT	symtab_entries
	db	SYM_BUFF_LENGTH	DUP(0)
	ENDM
guard14		dd	0		; guard value

;+
; The next line must be the last one in the ROM_DataP segment
;-
last_data_ram	label byte		; last location+1 of data ram

ROM_DataP	ENDS
	end
