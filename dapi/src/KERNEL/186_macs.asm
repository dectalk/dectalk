;+
;***********************************************************************
;*
;*                           Coryright (c)
;*    © Digital Equipment Corporation 1995. All rights reserved.
;*
;*    Restricted Rights: Use, duplication, or disclosure by the U.S.
;*    Government is subject to restrictions as set forth in subparagraph
;*    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
;*    52.227-14 Alt. III, as applicable.
;*
;*    This software is proprietary to and embodies the confidential
;*    technology of Digital Equipment Corporation and other parties.
;*    Possession, use, or copying of this software and media is authorized
;*    only pursuant to a valid written license from Digital or an
;*    authorized sublicensor.
;*
;***********************************************************************
;*    File Name:	186_macs.asm
;*    Author:
;*    Creation Date:
;*
;*    Functionality:
;*  80186 register definitions ...
;*  Also contains the interface definitions for loader interface to the 
;*  protected-mode code that runs on the Express to get at high memory
;*  (ROM).
;*
;***********************************************************************
;*    Revision History:
; 06 jul 95	...tek		initial for dtpc-II
; 13dec95	...tek		merge DTEX (put de.asm here.)
;-

_186_regs	macro

	_186_reloc	equ	0fffeh		; 80186 processor reloc

	_186_umcs	equ	0ffa0h		; Upper memory chip select
	_186_lmcs	equ	0ffa2h		; Lower
	_186_mpcs	equ	0ffa8h		; Peripheral
	_186_mmcs	equ	0ffa6h		; Midrange
	_186_pacs	equ	0ffa4h		; Peripheral cs

	_186_t0_mc	equ	0ff56h		; Timer 0 mode/control
	_186_t0_maxa	equ	0ff52h		;     max count a
	_186_t0_maxb	equ	0ff54h		;     max count b
	_186_t0_cnt	equ	0ff50h		;     count

	_186_t1_mc	equ	0ff5eh		; Timer 1 mode/control
	_186_t1_maxa 	equ	0ff5ah		;     max count a
	_186_t1_maxb	equ	0ff5ch		;     max count b
	_186_t1_cnt	equ	0ff58h		;     count

	_186_t2_mc	equ	0ff66h		; Timer 2 mode/control
	_186_t2_maxa	equ	0ff62h		;     max count a
	_186_t2_cnt	equ	0ff60h		;     count	

	_186_dma0_cnt	equ	0ffcah		; Dma 0 control
	_186_dma0_tc	equ	0ffc8h		; Dma 0 transfer count
	_186_dma0_dha	equ	0ffc6h		; Dma 0 destination high
	_186_dma0_dla	equ	0ffc4h		; Dma 0 destination low
	_186_dma0_sha	equ	0ffc2h		; Dma 0 source high
	_186_dma0_sla	equ	0ffc0h		; Dma 0 source low

	_186_dma1_cnt	equ	0ffdah		; Dma 1 control
	_186_dma1_tc	equ	0ffd8h		; Dma 1 transfer count
	_186_dma1_dha	equ	0ffd6h		; Dma 1 destination high
	_186_dma1_dla	equ	0ffd4h		; Dma 1 destination low
	_186_dma1_sha	equ	0ffd2h		; Dma 1 source high
	_186_dma1_sla	equ	0ffd0h		; Dma 1 source low

	 DMA_dst_mem	equ	08000h
	 DMA_dst_io	equ	00000h
	 DMA_dst_inc	equ	02000h
	 DMA_dst_dec	equ	04000h
	 DMA_src_mem	equ	01000h
	 DMA_src_io	equ	00000h
	 DMA_src_inc	equ	00400h
	 DMA_src_dec	equ	00800h
	 DMA_stop_tc	equ	00200h
	 DMA_int_tc	equ	00100h
	 DMA_syn_none	equ	00000h
	 DMA_syn_dst	equ	00080h
	 DMA_syn_src	equ	00040h
	 DMA_pri_hi	equ	00020h
	 DMA_pri_low	equ	00000h
	 DMA_timer2	equ	00010h
	 DMA_chg	equ	00004h
	 DMA_start	equ	00002h
	 DMA_stop	equ	00000h
	 DMA_byte	equ	00000h
	 DMA_word	equ	00001h				  		

	_186_eoi	equ	0ff22h		; Interrupt end of service
	_186_poll	equ	0ff24h		;   poll
	_186_poll_stat	equ	0ff26h		;   poll status
	_186_mask	equ	0ff28h		;   mask
	_186_priority	equ	0ff2ah		;   priority
	_186_in_service	equ	0ff2ch		;   in-service
	_186_request	equ	0ff2eh		;   request
	_186_status	equ	0ff30h		;   status
	_186_time_ctrl	equ	0ff32h		;   timer control
	_186_dma0_ctrl	equ	0ff34h		;   dma 0 control
	_186_dma1_ctrl	equ	0ff36h		;   dma 1 control
	_186_int0_ctrl	equ	0ff38h		;   int 0 control
	_186_int1_ctrl	equ	0ff3ah		;   int 1 control
	_186_int2_ctrl	equ	0ff3ch		;   int 2 control
	_186_int3_ctrl	equ	0ff3eh		;   int 3 control

	endm

;+
;  Output to a far port ...
;-

port_out	macro	port,value

	mov	ax,value
	mov	dx,port
	out	dx,ax

		endm

port_outb	macro	port,value

	mov	al,value
	mov	dx,port
	out	dx,al

		endm


port_in		macro   port

	mov	dx,port
	in	ax,dx

		endm


port_inb		macro   port

	mov	dx,port
	in	al,dx

		endm

;+
;  Module memory map addresses ...
;-

mem_map		macro
IFDEF DTPC2
	io_base		equ	00400h		; Base for all i/o

	ISA_CMD		equ	(io_base+00h)
	ISA_DATA	equ	(io_base+02h)
	SPCIO		equ	(io_base+0100h)
	ISA_INT		equ	(io_base+0180h)
        GPIO0           equ     (io_base+04h)         ; GP io register
	  NOT_LEFT_INC	equ	001h
	  LEFT_UP	equ	002h
	  NOT_RIGHT_INC	equ	004h
	  RIGHT_UP	equ	008h
	  SAMPCLK_OFF	equ	010h         
	  REFRESH_ON	equ	080h
	GPIO2		equ	(io_base+06h)
	  NOT_DSPRESET	equ	001h
	  DMA_TO_CPU	equ	002h
	  WRITE_SRAM	equ	004h
	  READ_SRAM	equ	008h
	  IRQ_SHARED	equ	010h
	  IRQSEL_MASK	equ	0e0h
	DMA_BUFF	equ	(io_base+0280h)
	RAM_ENABLE	equ	(io_base+0300h)
	CLR_ISA_INT	equ	(io_base+0300h)

ELSEIFNDEF DTEX ; implies dtpc2
	io_base		equ	00400h		; Base for all i/o

	ISA_CMD		equ	00400h
	ISA_DATA	equ	00480h
	SPCIO		equ	00500h
	ISA_INT		equ	00580h
        GPIO            equ     00600h          ; GP io register
	  GP_VINC	equ	002h
	  GP_VDIR	equ	004h
	  GP_VCS	equ	008h
	  GP_RESET	equ	010h
	  GP_STOP	equ	020h
	DMA_BUFF	equ	00680h
	RAM_ENABLE	equ	00700h
	CLR_ISA_INT	equ	00700h
; ELSE dtex doesn't use any of these.	
	
ENDIF ;DTPC2

		endm

IFDEF DTEX
; was in de.asm
; much as I hate to, I'm going to define the pm_vec function
; calls here. I really wish there was an easy way to do this from
; the c .h file..
ABORT		equ	0
READROM		equ	1
READROMWORD	equ	2
GETBUFFER	equ	4

LAST_USER_ADDR	equ	0ec000h		; boot code uses ram above this.

PIC0		equ	020h		; interrupt controllers.
PIC1		equ	080h

pm_vector	equ	030h		; the protected mode helper trap


dataseg	MACRO
	dseg	SEGMENT PARA PUBLIC USE32 'DATA'
	ENDM

codeseg	MACRO
	cseg	SEGMENT PARA PUBLIC USE32 'CODE'
	ENDM

ENDIF ;dtex

