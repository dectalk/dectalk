;+
; File: t.asm
;
; Purpose: microPOST, trace command
;
; Edits:
;
; 001 14-Dec-1991 RAO Creation
; 002 17-Dec-1991 RAO Fix message, return linkage (jmp)
; 003 26-Dec-1991 RAO Use pusha/popa
;-
	title	microPOST trace command
	.xlist
	include am00.inc
	include	am05.inc
	include	am07.inc
	include	amsegs32.inc
	include	limits.inc
	include	segass32.inc
	include	proto.inc
	.list

	extrn	trace_value:near
	extrn	parse_top:near

	public	cmd_trace

ROM_CodeP	SEGMENT
	assume	ds:ROM_DataP
;+
; locally used strings
;-
msg_on	db	' [Trace on]',0
msg_off	db	' [Trace off]',0

cmd_trace:
	xor	dword ptr trace_value,1
	je	cmd20				; off

	invoke	putstr_cs,addr msg_on
	jmp	parse_top

cmd20:
	invoke	putstr_cs,addr msg_off
	jmp	parse_top

ROM_CodeP	ENDS
	end
