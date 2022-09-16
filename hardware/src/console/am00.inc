;+
; File: am00.inc
;
; Purpose: various configuration details for am
;
; Edits:
;
; 001 10-May-1991 RAO Creation
; 002 13-May-1991 RAO Added unix stuff
; 003 14-May-1991 RAO Added bios mode
; 004 21-May-1991 RAO Changed NPVOID
; 005 29-May-1991 RAO Edit to reflect release date
; 006 04-Jun-1991 RAO New source module organization
; 007 18-Jun-1991 RAO Reflect other source edits
; 008 19-Jun-1991 RAO ""
; 009 06-Aug-1991 RAO Debug switches
; 010 07-Nov-1991 RAO Added more bits for CR0
; 011 16-Nov-1991 RAO Added lca_reserved_end macro
; 012 20-Nov-1991 RAO Added NW bit defs
; 013 22-Nov-1991 RAO Fixed ifdef for rommode
; 014 03-Jan-1992 RAO Changed monitor_base_address
; 015 12-Jan-1992 RAO Added DR6 bits
; 016 18-Jan-1992 RAO Added eflags bits
;-
	subttl	Assembler options
	page
	.486p
	option language:c
;+
; Change this next value to indicate where code will be placed after
; LCA data in prom space. LCA data occupies the prom from address 0 and up.
;
; Please make this a paragraph aligned value (mod 16)
;
; Don't forget to change the JMPTARGETx symbols in the makefile as well.
;-
monitor_base_address	equ	04f00h
;
; macro to start code *after* the end of the lca data
;
lca_reserved_end MACRO
	org	monitor_base_address
ENDM

;dosmode equ 1			; this assumes bios is present, too
;biosmode equ 1
rommode equ 1
;unixmode equ 1

EditDateString	MACRO
	db "11/16/91",0		; Change this as we edit
ENDM

	ifdef unixmode
	.386p
	endif

	ifdef rommode
	.486p
	endif

	ifdef	dosmode
biosordos equ 1
	.486
	endif

	ifdef	biosmode
biosordos equ 1
	.486
	endif

	.sall		; suppress macro expansions

;NPVOID	TYPEDEF NEAR PTR VOID
;
; hardware constants
;
;
; cache stuff
;
;	Note:
;
;	CD	NW	State
;	--	--	--------------------------------------------------
;	0	0	Normal cache operations
;	0	1	Invalid; GP fault if you try this
;	1	0	Cache fills disable, write through + invalidates ok
;	1	1	Diabled completely
;
CD_CLEAR	equ	0bfffffffh	; and with cr0 to clear CD Bit
CD_SET		equ	040000000h	; or  with cr0 to set   CD Bit
CD_TEST		equ	040000000h	; test with cr0 to query CD Bit

NW_CLEAR	equ	0dfffffffh	; and with cr0 to clear NW bit
NW_SET		equ	020000000h	; or  with cr0 to set   NW bit
NW_TEST		equ	020000000h	; test with cr0 to query NW bit

;
; Protected mode enable
;
PE_SET		equ	000000001h	; or with cr0 to set PE bit

;
; Numeric processor related stuff in cr0
;
EM_CLEAR	equ	0fffffffbh	; and with cr0 to clear EM bit
EM_SET		equ	000000004h	; or with cr0 to set EM bit
EM_TEST		equ	000000004h	; test with cr0 to query EM bit

DR6_BS		equ	000004000h	; single step

;+
; eflag bits
;-
AC_BIT		equ	1000000000000000000y
VM_BIT		equ	0100000000000000000y
RF_BIT		equ	0010000000000000000y

NT_BIT		equ	0000100000000000000y

OF_BIT		equ	0000000100000000000y
DF_BIT		equ	0000000010000000000y
IF_BIT		equ	0000000001000000000y
TF_BIT		equ	0000000000100000000y
SF_BIT		equ	0000000000010000000y
ZF_BIT		equ	0000000000001000000y

AF_BIT		equ	0000000000000010000y

PF_BIT		equ	0000000000000000100y

CF_BIT		equ	0000000000000000001y
