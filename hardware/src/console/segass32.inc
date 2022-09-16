;+
; File: segass32.inc
;
; Purpose: Segment stuff, Protected mode
;
; Edits:
;
; 001 17-Oct-1991 RAO Creation
; 002 23-Oct-1991 RAO Changed names
;-
	assume	cs : ROM_CodeP
	assume	ds : ROM_DataP
	assume	es : ROM_DataP
	assume	fs : ROM_DataP
	assume	gs : ROM_DataP
