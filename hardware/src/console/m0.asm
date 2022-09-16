;+
; File: m0.asm
;
; Purpose: microPOST, base module, contains LCA data
;
; Edits:
;
; 001 07-Dec-1991 RAO Created from working debug modules
;
;-
	title	microPOST root
	.xlist
	include am00.inc
	include	amsegs32.inc
	include	limits.inc
	include	segass16.inc
	.list

;
; Note:
;	Included asm file of the converted LCA hex data will be at the base
;	(org 0000) of the physical prom device
;
;	This module should be the first in the link input file description
;
ROM_Code	SEGMENT
adummy 	word	0feedh
	.xlist
	;include	lca.asm
	.list
ROM_Code	ENDS

	page +
;+
; Note:
;
;	Code at reset vector will be included by forced JMP instruction
;	placed by the eh.exe utility. Code will start at base.
;-
ROM_Code	SEGMENT
	extrn xfer:near
	lca_reserved_end

	public	base

base:
	
	jmp	xfer



ROM_Code	ENDS
	end
