;+
; File: com.inc
;
; Purpose: Constants for communications, used by real mode (16 bit) stuff
;		after fatal errors are detected...and by the protected mode
;		com routines...
;
; Edits:
;	19jul93	...tek		initial for PD.
;	26mar96	...tek		added fcr define.
;
;-
	subttl	Data definitions

; use this file to hold the GPIO defs too..

GPIOPORT	equ	02e0h
gpio_dspreset	equ	01h
gpio_v5boff	equ	02h
gpio_vppon	equ	04h
; there's more, read only..


COM_INIT_DEFAULT	equ	0e300h	; see INT 14 in any PC BIOS


COMPORT		equ	02F8h			;
;
;	Baud Rate Divisors
;	assumes 6.25 MHz oscillator input
;

BR_110		equ	3351
BR_150          equ     2606
BR_300		equ	1302
BR_600		equ	 651
BR_1200 	equ	 326
BR_2400 	equ	 163
BR_4800 	equ	  81
BR_9600 	equ	  41
BR_19200	equ	  20

;+
;	The various serial interface device registers are represented as
;	offsets from the base register. The two serial interfaces found
;	in most ISA PC systems are located at 2F8h and 3F8h.
;
;
;-
com_data	equ	0			; Data buffer (read & write)
com_dl_lsb	equ	0			; Divisor latch
com_dl_msb	equ	01h			; Divisor latch
com_int_enab	equ	01h			; Interrupt enable register
com_int_id	equ	02h			; Interrupt identification reg
com_line_ctl	equ	03h			; Line control reg
com_modem_ctl	equ	04h			; Modem control reg
com_line_status equ	05h			; Line status reg
com_modem_status equ	06h			; Modem status reg
com_fcr		equ	02h

;+
; bits
;-
LCR_DLAB	equ	80H			; Divisor latch access bit

LSR_DR		equ	01H			; Data ready
LSR_OR		equ	02H			; Overrun error
LSR_PE		equ	04H			; Parity error
LSR_FE		equ	08H			; Framing error
LSR_BI		equ	10H			; Break interrupt
LSR_THRE	equ	20H			; Transmitter holding register
LSR_TSRE	equ	40H			; TX shift register empty

MSR_DCTS	equ	01H			; Delta clear to send
MSR_DDSR	equ	02H			; Delta data set ready
MSR_TERI	equ	04H			; Trailing edge ring indicator
MSR_DRLSD	equ	08H			; Delta RX line signal detect
MSR_CTS 	equ	10H			; Clear to send
MSR_DSD 	equ	20H			; Data set ready
MSR_RI		equ	40H			; Ring indicator
MSR_RLSD	equ	80H			; Receive signal line detect

MCR_DTR 	equ	01H			; Data terminal ready
MCR_RTS 	equ	02H			; Request to send
MCR_OUT1	equ	04H			; Out1
MCR_OUT2	equ	08H			; Out2
MCR_LOOP	equ	10H			; Loopback test

;+
; layout of the word passed to ComSet
;
; High order byte = 00
; Low  order byte =
;
;	  765   43   2   01
;	+-----+----+---+----+
;	| bbb | pp | s | ww |
;	+-----+----+---+----+
;
;	bbb (Baud rate)
;
;	000	110
;	001	150
;	010	300
;	011	600
;	100	1200
;	101	2400
;	110	4800
;	111	9600
;
;	pp	(Parity)
;
;	00	none
;	01	odd
;	10	none
;	11	even
;
;	s	(Stop bits)
;
;	0	1
;	1	2
;
;	ww	(Word length)
;
;	10	7 bits
;	11	8 bits
;
;-
