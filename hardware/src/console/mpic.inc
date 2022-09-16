;+
; File: mpic.inc
;
; Purpose: register definitions
;
; Edits:
;
; 001 08-Mar-1992 RAO Creation
;-
	subttl	Definitions

;+
; offsets of local MPIC registers relative to LOCAL_MPIC_BASE.
;
; Note that each register is aligned on a 64 bit boundary.
;-

MPIC_ID		equ	0000100000y	; rw ID
MPIC_VER	equ	0000110000y	; r  Version

MPIC_PR0	equ	0001000000y	; rw Private Register 0
MPIC_PR1	equ	0001010000y	; rw Private Register 1
MPIC_PR2	equ	0001100000y	; rw Private Register 2
MPIC_PR3	equ	0001110000y	; rw Private Register 3

MPIC_TPR	equ	0010000000y	; rw Task Priority Register
MPIC_EOI	equ	0010110000y	; rw EOI Register
MPIC_REM	equ	0011000000y	; r  Remote Register
MPIC_LOG	equ	0011010000y	; rw Logical Destination Register
MPIC_FMT	equ	0011100000y	; rw Destination Format Register
MPIC_SVR	equ	0011110000y	; rw Spurious Vector Register

MPIC_ISR0	equ	0100000000y	; r  ISR (31:0)
MPIC_ISR1	equ	0100010000y	; r  ISR (63:32)
MPIC_ISR2	equ	0100100000y	; r  ISR (95:64)
MPIC_ISR3	equ	0100110000y	; r  ISR (127:96)
MPIC_ISR4	equ	0101000000y	; r  ISR (159:128)
MPIC_ISR5	equ	0101010000y	; r  ISR (191:160)
MPIC_ISR6	equ	0101100000y	; r  ISR (223:192)
MPIC_ISR7	equ	0101110000y	; r  ISR (255:224)

MPIC_TMR0	equ	0110000000y	; r  TMR (31:0)
MPIC_TMR1	equ	0110010000y	; r  TMR (63:32)
MPIC_TMR2	equ	0110100000y	; r  TMR (95:64)
MPIC_TMR3	equ	0110110000y	; r  TMR (127:96)
MPIC_TMR4	equ	0111000000y	; r  TMR (159:128)
MPIC_TMR5	equ	0111010000y	; r  TMR (191:160)
MPIC_TMR6	equ	0111100000y	; r  TMR (223:192)
MPIC_TMR7	equ	0111110000y	; r  TMR (255:224)

MPIC_IRR0	equ	1000000000y	; r  IRR (31:0)
MPIC_IRR1	equ	1000010000y	; r  IRR (63:32)
MPIC_IRR2	equ	1000100000y	; r  IRR (95:64)
MPIC_IRR3	equ	1000110000y	; r  IRR (127:96)
MPIC_IRR4	equ	1001000000y	; r  IRR (159:128)
MPIC_IRR5	equ	1001010000y	; r  IRR (191:160)
MPIC_IRR6	equ	1001100000y	; r  IRR (223:192)
MPIC_IRR7	equ	1001110000y	; r  IRR (255:224)

MPIC_ICR0	equ	1100000000y	; rw Interrupt Count Register (31:0)
MPIC_ICR1	equ	1100010000y	; rw Interrupt Count Register (63:32)

MPIC_LVT0	equ	1100100000y	; rw Local Vec Table [timer 0]
MPIC_LVT1	equ	1100110000y	; rw Local Vec Table [timer 1]
MPIC_LVT2	equ	1101000000y	; rw Local Vec Table [timer 2]
MPIC_LVT3	equ	1101010000y	; rw Local Vec Table [local int 0]
MPIC_LVT4	equ	1101100000y	; rw Local Vec Table [local int 1]
MPIC_LVT5	equ	1101110000y	; rw Local Vec Table [parity err]

MPIC_ICNT0	equ	1110000000y	; rw Initial Count Register 0
MPIC_CCNT0	equ	1110010000y	; r  Current Count Register 0
MPIC_ICNT1	equ	1110100000y	; rw Initial Count Register 1
MPIC_CCNT1	equ	1110110000y	; r  Current Count Register 1
MPIC_ICNT2	equ	1111000000y	; rw Initial Count Register 2
MPIC_CCNT2	equ	1111010000y	; r  Current Count Register 2

MPIC_DCR	equ	1111100000y	; rw Divider Configuration Register
