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
;*    File Name:	bootup.asm
;*    Author:
;*    Creation Date:
;*
;*    Functionality:
;*	PC-DECtalk boot and diagnostic rom
;*	Startup
;*  This file does some simple checks and gets us into the land of
;*  'c' as soon as possible ...
;*
;***********************************************************************
;*    Revision History:
;* 06 jul 95	...tek		Initial for DTPC-II
;* 13 jul 95	...tek		add more status reporting
;* 30 aug 95 ...cjl		ifdef around clr_isa_int
;*
;-

	TITLE	PC-DECtalk boot and diagnostic rom
	NAME	Startup

        .model  small
	dosseg
        .186

;
;  80186 register definitions ...
; 

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

	_186_dma0_cw	equ	0ffcah		; Dma 0 control word
	_186_dma1_cw	equ	0ffdah		; Dma 1 control word

;+
;  Output to a far port ...
;-

outp		macro	port,value

	mov	ax,value
	mov	dx,port
	out	dx,ax

		endm


inp		macro   port

	mov	dx,port
	in	ax,dx

		endm
;
;  Module memory map addresses ...
;


	io_base		equ	00400h		; Base for all i/o

IFDEF	DTPC2
	; dtpc-II
	isa_cmd		equ	io_base+000h	
	isa_data	equ	io_base+002h
	gpio0		equ	io_base+004h
	gpio2		equ	io_base+006h
	sram_addr	equ	io_base+080h
	spcio		equ	io_base+100h
	isa_int		equ	io_base+180h
	clr_isa_int	equ	io_base+300h
	ram_enable	equ	io_base+200h

ELSE
	; dtpc-I
	isa_cmd		equ	io_base+000h	
	isa_data	equ	io_base+080h
	spcio		equ	io_base+100h
	isa_int		equ	io_base+180h
	in_vol		equ	io_base+200h
	dma_buff	equ	io_base+280h
	ram_enable	equ	io_base+300h
ENDIF ;dtpc2
;
;  Keep the linker, locator, etc, happy (I hate warning messages)...
;

	.data
;
;  reloc base for 'c' tasks ...
;
		public	_R186_io_base
_R186_io_base	dw	0

	.stack
	dw	0

        .code				

	extrn	_pcdt_boot:near
;
;  The initial boot code is placed by the prom utility at the end of
;  the rom, this code, in essence does ...
;
;
;	mov	dx,UMCS
;	mov	ax,0fc3a
;	out	dx,ax
;	jmp	pcdt_start
;
;   Now we have the whole rom/module to play with ...  so we be off ...
;

ram_patterns:

	dw	0ffffh
;	dw	0a5a5h		;...tek added a few patterns 7/13/95
;	dw	05a5ah
	dw	00000h

		public	pcdt_start
pcdt_start	proc	far

	cli
	xor	ax,ax
	mov	ds,ax
	mov	es,ax
	mov	ss,ax

;
;  Init the internal 186 registers, place the ram at zero, with one
;  wait state, and i/o starts at 400h ... release any interrupts latched
;  due to power-up glitches ...	the umcs is reset just incase we are
;  using the Intel ICE to debug this (no init code executed) ...
;

	outp	_186_umcs,0fc3ah	; ROM in last 16K, 2WS+RDY
        outp	_186_pacs,0007ah	; 2ws, peripheral chip sel at 0x400-0x7FF
	outp	_186_mpcs,000bah	; 2WS, rdy, 7PCS lines, PCS in IO space
        outp	_186_eoi,08000h		; clear out any ints..
IFDEF	DTPC2
	; dtpc-II
	outp	clr_isa_int,0h		; clear any ISA ints..
ENDIF ;dtpc2
	outp	_186_int1_ctrl,0h	; set ISA int to prio 0 (highest!), edge.

	; let the world know we've started, and then update this later..
	outp	isa_cmd,08800h		; Testing ... this is really 
					;   mode status + self_test + post_init
	
;
;  reset the spc and dma com channel
;

	outp	_186_dma0_cw,4h
	outp	_186_dma1_cw,4h
;
;  do some dummy reads to drive the logic into the correct states ...
;
IFDEF	DTPC2
	; set up some DTPS-II specific registers..
	outp	gpio0, 015h		; no sampclk, no volume strobes, no rfrsh
	outp	gpio2, 0		; no IRQ, IRQ not shared, no SRAM access, 
					; DSP reset.

	; DTPC-II needs some refresh setup..
	; first, we need to do 8 refreshes before we access memory;
	; do this by setting the refresh time to "very fast" and sitting
	; around.. 
	outp	_186_t1_maxb, 15	; this is the low time; about 3us
	outp	_186_t1_maxa, 2		; this is the high time; 2 ticks.
	outp	_186_t1_cnt, 0		; good initialization practice..
	outp	_186_t1_mc, 0c003h	; should spit out pulses at 3.1us intervals..
	; mark this state for diagnostic purposes..
	outp	isa_cmd, 08801h		; status + self_test + post_timer_init
	outp	gpio0, 095h		; turn on refresh..

	
	
	; sit for a long time .. at least about 15us..
	mov	ax, 50			; check this value on the ICE..
sloop:	dec	ax			; this is a fairly tight loop that 
	jne	sloop			; depends on memory access speed - so
					; if you touch the UMCS wait-states, you'll
					; want to be careful here.
					; at best, this is a 7-cycle loop.. so
					; each loop takes at least 350ns, and 50 loops 
					; should be enough.
	; now set the timer for normal refresh..
	; we set for 31.x us interval, continuous run, and a two-clock
	; output pulse (where the clock is clk/4) (pulse width controlled by
	; maxa...)
	outp _186_t1_maxb, 156		; 31us
	
	

ELSE	; don't do this on DTPC-II
	inp	isa_cmd
	inp	isa_data
	inp	dma_buff
ENDIF ;dtpc2

;
;  Now, do a check on the low ram ... basically, bx sets the start segment
;  and si sets the max segment ...
;

start_ram:

	outp	isa_cmd,08803h		; Testing ... this is really 
					;   mode status + self_test + post_ram_patt
	cld				; Go up
	xor	bx,bx			; Start at segment 0
	mov	si,0fc00h		;  and stop at rom segment

check_ram:

	mov     di,0			; Set offset to zero
        xor     ax,ax			; First, clear out the bank
	mov	es,bx			; Point at the bank
	mov	cx,02000h		; do 8k words
	rep	stosw			; Fill er up			
	mov	bp,offset ram_patterns	; Now point at first pattern

set_pattern:

	mov     cx,02000h		;  do 32k again
	mov	di,0			;   from the begining 

	mov	dx,ax			;     save the old pattern
	mov	ax,cs:[bp]		;       get new pattern
	add	bp,2			;         point at next

check_bank:

	cmp	dx,es:[di]		; Is this what should be there
	jne	bad_ram			; Nope
	stosw				; Yep, replace it with new
	cmp	ax,es:[di-2]
	jne	bad_write

	loop	check_bank		;    and do the next

	cmp	ax,0			; Done all patterns
	jne	set_pattern		; Nope, get the next
	add	bx,00400h		; Point at next bank
	cmp	bx,si			; Done ram
	jne	check_ram		; Nope
	je	done_ram		;   all done quick tests

	nop
	nop	; debug; avoid stray fetch triggers..
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
;
;  okay, we're broken, so just hang here ...
;

bad_write:
	nop	; just fall into bad_ram after a trigger..
	nop
	nop
	nop
	nop
	nop
	nop
	nop

bad_ram:
	mov	dx, isa_data
	outp	dx, ax			; mark the pattern.
	outp	isa_cmd,0ff03h		; General failure
	jmp	bad_ram
;	jmp	start_ram		; debug

;
;  when we're all done the power-up tests, fall into the normal code ...
;

done_ram:

		public       _pcdt_init
_pcdt_init	proc 	far

	; mark progress
	outp	isa_cmd, 08804h		; self_test + post_call_c
;
;  Set up the segment registers ... again
;


	cld
	mov	ax,0f800h
	mov	ds,ax
	mov	es,ax
	mov	ss,ax

	xor	di,di
	xor	ax,ax
	mov	cx,2000h
	rep stosw


;
;  Now that we have good ram, set up the segment registers and go
;  off to 'c' for the rest of the boot control code ..
;

cstartup:

	mov	ax,0ff00h		; I/O at top
	mov	_R186_io_base,ax

	mov	ax,0f800h		; Use top 16k ram for
	mov	ds,ax			;   boot control 
	mov	es,ax
	mov	ss,ax
	mov	sp,04000h
	call	_pcdt_boot

_pcdt_init	endp
pcdt_start	endp

;
;  support routines ...
;
		public	_port_out
_port_out	proc	near

	push	si
	push	di
	push	bp
	mov	bp,sp

	mov	dx,[bp+8]		; Port
	mov	ax,[bp+10]		; Value
	out	dx,ax

	pop	bp
	pop	di
	pop	si
	ret
	
_port_out	endp

		public	_port_in
_port_in	proc	near

	push	si
	push	di
	push	bp
	mov	bp,sp

	mov	dx,[bp+8]		; Port
	in	ax,dx

	pop	bp
	pop	di
	pop	si
	ret
	
_port_in	endp


		public	_get_ds
_get_ds		proc	near

	mov	ax,ds
	ret

_get_ds		endp
		end pcdt_start
