;+
; File: amsegs32.inc
;
; Purpose: Segment stuff
;
; Edits:
;
; 001 06-Aug-1991 RAO Creation
; 002 27-Aug-1991 RAO Messed with ordering for hextools
; 003 30-Aug-1991 RAO Cosmetic fixes
; 004 17-Oct-1991 RAO Use 16 for post reset but pre-protect mode code segs
; 005 20-Nov-1991 RAO Linker whining, change flat to use32
; 006 26-Dec-1991 RAO Added codeload segment
; 007 20-Jan-1992 RAO Get rid of obsolete segments
; 008 21-Jan-1992 RAO Data segments must be non-initialized
;-

;
; We have to fix the relocation tool before the flat model records can
; be relocated
;
;	.model	flat

;	.model small
;	dosseg

;ROM_AbsData	SEGMENT WORD at 000000
;ROM_AbsData	ENDS

ROM_Stack	SEGMENT PARA STACK use32 'STACK'
ROM_Stack	ENDS

;+
; This is for real mode 16-bit segments
;-
ROM_Code	SEGMENT	PARA PUBLIC use16 'CODE'
ROM_Code	ENDS

;+
; This is for protected mode 32-bits segments
;-
ROM_CodeP	SEGMENT	PARA PUBLIC use32 'CODE'
ROM_CodeP	ENDS

;+
; This is for downloaded code
;-
;ROM_CodeLoad	SEGMENT PARA PUBLIC use32 'CODE'
;ROM_CodeLoad	ENDS

;+
; start with bss
;-
_BSS	SEGMENT PARA PUBLIC use16 'BSS'
_BSS	ENDS
;+
; Real mode segments look at data this way
;-
;ROM_Data	SEGMENT PARA PUBLIC use16 'DATA'
ROM_Data	SEGMENT PARA PUBLIC use16 'BSS'
ROM_Data	ENDS

;+
; Protected mode segments look at data
;-
ROM_DataP	SEGMENT PARA PUBLIC use32 'BSS'
ROM_DataP	ENDS

;+
; Convenient way to look at external cache for testing
;-
;XCACHE		SEGMENT PARA PUBLIC use16 'DATA'
;XCACHE		ENDS

;+
; Diag RAM from 16-bit segments
;-
;DIAG_RAM	SEGMENT PARA PUBLIC use16 'DATA'
;DIAG_RAM	ENDS

;+
; Diag RAM from protected 32-bit segments
;-
;DIAG_RAMP	SEGMENT PARA PUBLIC flat 'DATA'
;DIAG_RAMP	ENDS
