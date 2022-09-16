;+
; File: limits.inc
;
; Purpose: Constants for data defs
;
; Edits:
;
; 001 16-Oct-1991 RAO Creation
; 002 20-Oct-1991 RAO Add csr values
; 003 23-Oct-1991 RAO CSR local base changes, add limits for xcache tests
; 004 29-Oct-1991 RAO CbusII changes to CSR offsets
; 005 14-Nov-1991 RAO Edac setup for debugging hardware
; 006 21-Nov-1991 RAO Edac setup, update; added SetLED, SetLEDP
; 007 25-Nov-1991 RAO Renamed SetLEDP
; 008 02-Dec-1991 RAO Added gdt/idt base addresses in ram
; 009 17-Dec-1991 RAO EdacInitP for protected mode init
; 010 24-Dec-1991 RAO Added RSIGN for corruption watch
; 011 16-Jan-1992 RAO Changed HISTORY_DEPTH, added LINES_PER_PAGE
; 012 18-Jan-1992 RAO Added symtab_entries, SYM_BUFF_LENGTH, base of gdt, idt
;				and ram areas lowered
; 013 20-Jan-1992 RAO Tune RAM bases
; 014 22-Jan-1992 RAO Tune table sizes again
; 015 23-Jan-1992 RAO Added HEX_ERR constants
; 016 05-Feb-1992 RAO Combo chip port addresses, peripheral ctl address
; 017 08-Mar-1992 RAO Added mpic local address
;
; (tek)
;18 oct 93	tek	move the RAM areas up high so we can load the 
;			kernel under the monitor. This might not work.
;-
	subttl	Data definitions

STACK_SIZE	equ	4096
STACK_TOP	equ	0F0000h - 4	; 64K under 1M
;STACK_TOP	equ	0e000h - 4	; just under 64K
STACK_BOTTOM	equ	(STACK_TOP)-(STACK_SIZE)

RSIGN		equ	08badf00dh	; and got sick

LINES_PER_PAGE	equ	22		; go those output routines that care

HISTORY_DEPTH	equ	5      	; save 5 lines of cmd input
IN_BUFF_LENGTH	equ	128		; make this a power of 2!

symtab_entries	equ	10		; how many symbols to store
SYM_BUFF_LENGTH	equ	22		; max length of each symbol name

IDT_ENTRIES	equ	32

;GDT_IN_RAM	equ	0400h		; 32 bit flat address, gdt starts here (was 2000h)
;IDT_IN_RAM	equ	0500h		; 32 bit flat address, idt starts here (was 2800h)

;RAM_AREA_BASE	equ	01000h		; general RAM, start (was 4000h)

GDT_IN_RAM	equ	0ed000h		; 32 bit flat address, gdt starts here (was 2000h)
IDT_IN_RAM	equ	0ed100h		; 32 bit flat address, idt starts here (was 2800h)

RAM_AREA_BASE	equ	0ee000h		; general RAM, start (was 4000h)

CPU_INT_GATE	equ	0eh		; TYPE field, gate descriptor

;+
; descriptor fields for ds gdt entry
;-
ddes_Gbit	equ	1
ddes_Dbit	equ	1
ddes_Pbit	equ	1
ddes_DPL	equ	0
ddes_Sbit	equ	1
ddes_TYP	equ	1
ddes_Abit	equ	1

;+
; descriptor fields for cs gdt entry
;-
cdes_Gbit	equ	1
cdes_Dbit	equ	1
cdes_Pbit	equ	1
cdes_DPL	equ	0
cdes_Sbit	equ	1
cdes_TYP	equ	5
cdes_Abit	equ	1

;+
; external cache tests, definitions
;-
RB_0K		equ	0	; ram base address
RB_SEG_0K	equ	0	; ram segment

RB_64K		equ	10000h	; ram base address
RB_SEG_64K	equ	1000h	; ram segment

RB_128K		equ	20000h	; ram base address
RB_SEG_128K	equ	2000h	; ram segment

X_64K_Bytes	equ	10000h	; extent of 64Kb, using bytes. Won't fit
				; into 16 bit counters (like cx)!
X_64K_Words	equ	8000h	; extent of 64Kb, using words
X_64K_Dwords	equ	4000h	; extent of 64Kb, using dwords

;+
; Diag RAM stuff
;-
MAX_IDS			equ	32	; max number of processors
DIAG_RAM_SEG		equ	0e000h
DIAG_LEN_RESERVED	equ	0100h

;+
; Combo chip port addresses
;-
COMBO_ADDRESS	equ	170h
COMBO_DATA	equ	171h

;+
; Peripheral control and status register port address
;-
PERIPHERAL_CTL	equ	0f2h

;+
; Bits for above register
;-
PRPH_CTL_COLOR	equ	00000001y	; enable color
PRPH_CTL_VPPEN	equ	00000010y	; enable flash rom power
PRPH_CTL_ENDISK	equ	10000000y	; enable on-board floppy ctrl

;+
; Csr offsets
;-
CSR_PROC_RESET	equ	0
CSR_DIR_NMI	equ	8
CSR_LED		equ	4
CSR_IDENT	equ	0ch
CSR_INT_CTL	equ	110h
CSR_INT_IND	equ	118h

;+
; Local MPIC base address
;-
LOCAL_MPIC_BASE	equ	0fffde000h

;+
; Local Csr base address
;-
LOCAL_CSR_BASE	equ	0df000h

;+
; Use these values for real mode access to the local csr register set
;-
LOCAL_CSR_SEG	equ	0df00h
LOCAL_CSR_OFF	equ	0000h

;+
; LED patterns
;-
LED_00		equ	00
LED_01		equ	01
LED_10		equ	2
LED_11		equ	3

LED_FATAL	equ	2

;+
; Processor state values
;-
STATE_RESET	equ	10h		; don't start at 0
STATE_SLV_DBG	equ	11h		; slave debug mode
STATE_COM_DBG	equ	12h		; com port debug mode

STATE_VOTING	equ	80h		; voting in-process, we're ok
STATE_GO_WAIT	equ	81h		; waiting for the GO bit (not base)
STATE_BASE	equ	88h		; assuming base processor role

;+
; for hexload PROC status
;-
HEX_OK			equ	0
HEX_ERR_PREFIX		equ	1
HEX_ERR_CHECK		equ	2
HEX_ERR_TYPE		equ	3
HEX_ERR_SHORT		equ	4
HEX_ERR_LONG		equ	5
HEX_ERR_ADDR		equ	6
HEX_ERR_LENGTH		equ	7
HEX_ERR_DATA		equ	8

;+
; Macro to set current processor state (16 bit real mode assumed) in
; a diag RAM field reserved for this processor
;
; Uses:
;	eax
;	ebx
;	es
;-
SetProcState16	MACRO	value
	mov	ax,LOCAL_CSR_SEG	; segment value (in real mode)
	mov	es,ax			;  for base of CSRs
	mov	eax,LOCAL_CSR_OFF	; offset for same
	add	eax,CSR_IDENT		; es:ax now pts to ident reg
	mov	ebx,es:[eax]		; get ident register value for me
	and	ebx,01fh		; get the element id field only
	mov	ax,DIAG_RAM_SEG		; segment of DIAG_RAM
	mov	es,ax
	lea	eax,DIAG_STATE		; status vector starts here
	add	eax,ebx			; element id is the byte offset
	mov	byte ptr es:[eax],value	; set the state
ENDM
;+
; New version of EdacInit for protected mode code
;-
EdacInitP	MACRO
	mov	eax,093f00240h	; do a memapio to EDAC address
	mov	ebx,0
	mov	[eax],bx	; write
	mov	eax,093f00200h	; EDAC
	mov	ebx,18h
	mov	[eax],bx
	mov 	ebx,13h
	mov	[eax],bx
	ENDM
;+
; macro to initialize edac for system memory accesses in real mode...
; just for hardware debug use
;
; macro uses:
;	ax,bx,es
;-
EdacInit	MACRO
	mov	ax,0c000h		; base
	mov	es,ax
;
; ECC control register C0200
;
	mov	bx,0200h		; offset (es:bx -> 0C0200h)
	mov	byte ptr es:[bx],18h	; 1st init value
	mov	byte ptr es:[bx],13h	; 2nd init value
	mov	bx,0280h
;
; ECC error clear register C0280
;
	mov	byte ptr es:[bx],0	; value is don't care
;
; Bank 0..Bank7 configuration registers
;
	mov	bx,0			; bank 0
	mov	byte ptr es:[bx],40h	; init bank 0
	add	bx,40h
	mov	byte ptr es:[bx],40h	; init bank 1
	add	bx,40h
	mov	byte ptr es:[bx],40h	; init bank 2
	add	bx,40h
	mov	byte ptr es:[bx],40h	; init bank 3
	add	bx,40h
	mov	byte ptr es:[bx],40h	; init bank 4
	add	bx,40h
	mov	byte ptr es:[bx],40h	; init bank 5
	add	bx,40h
	mov	byte ptr es:[bx],40h	; init bank 6
	add	bx,40h
	mov	byte ptr es:[bx],40h	; init bank 7
	add	bx,40h

ENDM

SetLED	MACRO	value
;+
; Value is used as 32 bit value. Lowest 2 bits set LEDs.
; Only good for real mode...
;
; Macro steps on eax,es
;-
	mov	ax,LOCAL_CSR_SEG
	mov	es,ax				; pts to base of locally addressable
	mov	eax,LOCAL_CSR_OFF+CSR_LED	;  csr registers
	mov	dword ptr es:[eax],value	; light them up
ENDM

SetLEDP	MACRO	value
;+
; Value is used as 32 bits value. Lowest 2 bits set LEDs.
; Only good for protected mode
;
; Macro steps on eax
;-
	mov	eax,LOCAL_CSR_BASE+CSR_LED	;  csr registers; point to LED
	mov	dword ptr [eax],value		; pattern to show in the LEDs
ENDM
