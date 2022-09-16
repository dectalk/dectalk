C315INDEX	equ	0ech
C315DATA	equ	0edh

C_VER		equ	000h
C_SLTPTR	equ	002h
C_RAMMAP	equ	003h
C_RAMSET	equ	005h
C_REFCTL	equ	006h
C_CLKCTL	equ	007h
C_PMRA1		equ	008h
C_PMRR1		equ	009h
C_MCDCTL	equ	00ah
C_ABAXS		equ	00eh
C_CAXS		equ	00fh
C_DAXS		equ	010h
C_FEAXS		equ	011h
C_SLPCTL	equ	013h
C_MISCSET	equ	014h
C_ROMDMA	equ	015h
C_BUSCTL1	equ	016h
C_BUSCTL2	equ	017h
C_SMICTL	equ	018h
C_PMRA2		equ	019h
C_PMRR2		equ	01ah
C_RTCLSB	equ	01bh
C_RTCMSB	equ	01ch
C_KBDCTL	equ	01dh
C_SMMSKA	equ	080h
C_SMMSKB	equ	081h
C_SMSTSA	equ	082h
C_SMSTSB	equ	083h
C_PIO2HI	equ	084h
C_PIO2LO	equ	085h
C_PIO1HI	equ	086h
C_PIO1LO	equ	087h
C_IOTMR		equ	08ah
C_FDTMR		equ	08bh
C_HDTMR		equ	08ch
C_PIO1TMR	equ	08dh
C_PIO2TMR	equ	08eh



; access macros. 


; write p2 to register p1. ax and dx are destroyed. 
write315	 MACRO	 port,value
	mov	dx, C315INDEX
	mov	ax,port
	out	dx, ax

	mov	dx, C315DATA
	mov	ax, value
	out	dx, ax
ENDM

; read register p1 into ax. dx is destroyed.
read315		MACRO	port
	mov	dx, C315INDEX
	mov	ax,port
	out	dx, ax

	mov	dx, C315DATA
	in	ax, dx
ENDM
