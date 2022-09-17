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
;*    File Name:	timer.asm
;*    Author:
;*    Creation Date:
;*
;*    Functionality:
;*	Clock timer service routines
;*
;***********************************************************************
;*    Revision History:
;* 20jul95	...tek		fixed clocks for dtpc2
;* 14dec95	...tek		merge dtex
;* 05apr96	...tek		trap zero arg to module_clocks for dtex
;* 26apr96	...tek		fix timer multiplier for dtex
;*
;-

  	title	Clock timer service routines

	.xlist
	include	os_macs.asm
	include	c_macs.asm
	include 186_macs.asm
	.list

	pcb_defs
	_186_regs
	queue_defs
	process_defs

	.data?

	extrn	clk_rate:word
	extrn	spc_ticks:word
	extrn	timer_ticks:word

	.code
IFDEF DTEX
timer0_vector	equ	020h		; where the clock tick comes in..
timer0_cw	equ	043h
timer0_ic	equ	040h
timer2_cw	equ	043h
timer2_ic	equ	042h
c315_portb	equ	061h
ELSE
timer0_vector	equ	013h
ENDIF ;DTEX

;+
;  init_timers sets up the sleep timer (tmr2), the timer queue, and the
;  timer used for serial command time outs (tmr0)
;;dtex comments:
;;  That doesn't make a whole lot of sense. Anyway, what we set up here is
;;  the sleep/queue timer (timer 0, IRQ 20h) and the DSP clock (timer 2).
;;  If code gets implemented to fall asleep during inactivity, the timer 2
;;  output should be gated off (port b, bit 1) before shutting down the 
;;  DSP power rail.
;-

	extrn _connect_int:near

c_near_entry	_init_timer

	mov	ax,seg timer_queue
	mov	ds,ax
	mov	si,offset timer_queue

	xor	ax,ax
	mov	ds:[si],ax
	mov	ds:2[si],ax
	mov	low_time,ax
	mov	high_time,ax
	mov	clock_on,ax
;
;  connect the isr via the kernel isr connect call ...
;

	push	seg timer_isr
	push	offset timer_isr
	push	timer0_vector
	call	_connect_int
	add	sp,6

exit	_init_timer

;+
;  timer_isr is called to handle a clock tick interrupt.
;-

	public	timer_isr
timer_isr	proc	far

;
;  Bump up the clock ticks ...
;

	add	low_time,1		; Always tick the clock
	adc	high_time,0
;
;  point at the queue head and set the depth to zero (cx)
;

	mov	ax,seg timer_queue
	mov	ds,ax
	mov	si,offset timer_queue
	xor	cx,cx
;
;  check to see if we have a pcb to check ...
;

check_head:

	les	bx,ds:[si]		; es:[bx] --> normal pcb pointer

	and	bx,bx			; Any offset (most likely)
	jnz	check_pcb

	mov	ax,es			; Nope, but it may be aligned
	and	ax,ax
	jnz	check_pcb

	jcxz	timer_off		; Done ... if queue is zero
	jmp	timer_exit		; Done and non-zero queue depth

check_pcb:

	inc	cx			; Up the depth
	dec	pcb$scratch_0		; Down the sleep time
	je	remove_pcb		; If not zero, then redo
	lds	si,ds:[si]		;   the queue
	jmp	check_head	

;
;  remove the pcb from the queue if the clock ticks have expired ...
;

remove_pcb:

	push	ds
	push	si

	mov	ax,es:[bx]
	mov	ds:[si],ax
	mov	ax,es:[bx+2]
	mov	ds:[si+2],ax

	lds	si,pcb$priority
	call	enqueue

	pop	si
	pop	ds
	dec	cx

	jmp	check_head

;
;  If queue depth was or is now zero, see if we need to keep the
;  clock running ...
;

timer_off:

	cmp	clock_on,1			; Is the timer enabled
	je	timer_exit
IFNDEF DTEX ; no easy wa to do this on the express..
	port_out _186_t2_mc,4000h
ENDIF ;DTEX

;
;  normal exit, ret since we are dispatched to ...
;

timer_exit:

	ret

timer_isr	endp

;+
;  _sleep is used to block a process for the specified number of  100 
;  millisecond intervals
;-


c_sys_entry	sleep,wait_time


	pcb_pointer

	mov	ax,wait_time
	inc	ax				; Insure + error
	mov	pcb$scratch_0,ax   		; Save it in the pcb
	call	timer_on

	mov	ax,seg timer_queue
	mov	ds,ax
	mov	si,offset timer_queue
	call	context_switch

exit	sleep

;+
;  module_clocks(rate) is used to change the default timer value for
;  the specified master clock rate ...
;
;  timer == 10ms so ...
;
;    (clk_rate*1000000/4/100) = clk_rate*2500
;
;  spc == 10Khz so ...
;
;    (clk_rate*1000000/4/10000) = clk_rate*25
;
; The bahavior of the module, fromthe host's perspective, should not change 
; when we change clocks; therefore, I have to correct all the factors
; here to make that be so. 
;-

IFDEF DTEX
; this appears to take, as it's parameter, the clock rate in MHz. For
; now, I'm going to adjust it to result in the same intervals as if the
; system had a 10MHz clock; this is wrong, but compatible.
; the tick rate for a 10MHz part in DTPC was (10MHz/4)=2.5MHz; the tick 
; rate for DE with a 25MHz CPU is (25MHz/24)=1.04167MHz.
;
;  timer == 10ms so ...
;
;    (clk_rate*1000000/4/100) = clk_rate*2500	; for dtpc
;    clk_rate * 2500 * (10/24) = clk_rate*3125/3  ; for DE
; tek 24apr96 this seems to give half the clock rate we expect. 
; Divide by 6 instead of three..
;
;  spc == 10Khz so ...
;
;    (clk_rate*1000000/4/10000) = clk_rate*25     ; for dtpc
;    (clk_rate * 25 * (10/24)) = clk_rate*125/12  ; for DE
;-

c_sys_entry	module_clocks,rate

	mov	ax,rate			; Get rate ...
	cmp	ax,0
	je	done_clocks		; rate was zero.
	mov	clk_rate,ax		;   save ...
	xor	dx,dx
	mov	bx,125
	mul	bx
	mov	bx,12			
	div	bx		; Save spc ticks ...
 	mov	spc_ticks,ax		
	mov	clk_rate, ax
	xor	dx,dx
	mov	bx, 3125
	mul	bx
	xor	dx,dx		
	mov	bx, 6
	div	bx		;    and timer ticks ...
	mov	timer_ticks,ax
;
;  change the spc and clock right now to match  ...
;
	port_outb timer0_cw, 0b4h	; mode 2 on timer 2
	mov	bx,spc_ticks
	mov	ax, bx
	port_outb timer2_ic, al
	mov	ax, cx
	shr	ax,8
	port_outb timer2_ic, al		; timer 2 now running.. we assume that
					; the SPC power is on, so we can also
					; gate the clock on.
	port_outb c315_portb, 03h	; spc clock gate

	; we always turn on the timer clock..
	;cmp	clock_on,1		; Timer queue empty, don't enable
	;je	done_clocks

	; set up the periodic interrupt timer.. 
	; timer runs in mode 2, generating a single-clock low pulse.
	port_outb timer0_cw,34h		; timer 0, mode 2, lobyte hibyte
	mov	ax, timer_ticks
	port_outb timer0_ic, al
	shr	ax, 8
	port_outb timer0_ic, al


ELSE ;DTEX

c_sys_entry	module_clocks,rate

	mov	ax,rate			; Get rate ...
	mov	clk_rate,ax		;   save ...
	xor	dx,dx
IFDEF DTPC2
	mov	bx,50
ELSE
	mov	bx,25
ENDIF
	mul	bx			; Save spc ticks ...
 	mov	spc_ticks,ax		
	mov	bx,100
	mul	bx			;    and timer ticks ...
	mov	timer_ticks,ax
;
;  change the spc and clock right now to match  ...
;
IFDEF DTPC2
        port_out _186_t0_mc,04000h
	mov	ax, spc_ticks
	dec	ax
	port_out _186_t0_maxa, ax
	port_out _186_t0_maxb, 1
	port_out _186_t0_mc, 0c003h

ELSE
	port_out _186_t0_mc,4000h     	; Set up spc square wave
	mov	bx,spc_ticks
	shr	bx,1
	mov	cx,bx
	port_out _186_t0_maxa,cx
	mov	bx,spc_ticks
	and	bx,1
	add	bx,cx
	port_out _186_t0_maxb,bx
	port_out _186_t0_cnt,0
	port_out _186_t0_mc,0c003H
ENDIF
	port_out _186_time_ctrl,7

	cmp	clock_on,1		; Timer queue empty, don't enable
	je	done_clocks

	port_out _186_t2_mc,4000h
	port_out _186_t2_cnt,0
	port_out _186_t2_maxa,timer_ticks
	port_out _186_t2_mc,0E001h
ENDIF ;DTEX	
done_clocks:

exit	module_clocks

;+
;  spc_rate(rate) changes the current timer to the spc.  Zero resets to
;  module default.
;
;  spc ticks ==
;
;   (clk_rate*1000000/4/(rate*1000)) == for accuracy ...
;
;       clk_rate*250/rate
;-
IFDEF DTEX
; that all was for dtpc. for DE, we have to multiply by 10/24.
;-

c_sys_entry	spc_rate,rate

	mov	si,spc_ticks		; Default clock rate
	cmp	rate,0			; Resetting to default
	je	set_rate		; Yep

	mov	ax,clk_rate
	xor	dx,dx
	mov	bx,250
	mul	bx
	mov	bx, rate
	div	bx
	mov	bx, 10
	mul	bx
	mov	bx, 24
	div	bx
	mov	si,ax

set_rate:
	port_outb timer0_cw, 0b4h	; mode 2 on timer 2
	mov	ax, si
	port_outb timer2_ic, al
	mov	ax, si
	shr	ax,8
	port_outb timer2_ic, al		; timer 2 now running..



ELSE ;DTEX
c_sys_entry	spc_rate,rate

	mov	si,spc_ticks		; Default clock rate
	cmp	rate,0			; Resetting to default
	je	set_rate		; Yep
IFDEF DTPC2
	mov	ax,20
ELSE
	mov	ax,clk_rate
ENDIF
	xor	dx,dx
	mov	bx,250
	mul	bx
	div	rate
	mov	si,ax

set_rate:
IFDEF DTPC2
        port_out _186_t0_mc,04000h
	mov	ax,si
	dec	ax
	port_out _186_t0_maxa, ax
	port_out _186_t0_maxb, 1
	port_out _186_t0_mc, 0c003h

ELSE

	port_out _186_t0_mc,4000h     	; Set up spc square wave
	mov	bx,si
	shr	bx,1
	mov	cx,bx
	port_out _186_t0_maxa,cx
	mov	bx,si
	and	bx,1
	add	bx,cx
	port_out _186_t0_maxb,bx
	port_out _186_t0_cnt,0
	port_out _186_t0_mc,0c003H
ENDIF
	port_out _186_time_ctrl,7
	mov	ax,si
ENDIF ;DTEX
exit		spc_rate


;+
;  interval timer value control ...
;-

	public	start_clock
	public	get_clock
	public	stop_clock
;
;  start the clock up ...
;

c_sys_entry	start_clock

	xor	ax,ax
	mov	high_time,ax
	mov	low_time,ax
	mov	clock_on,1 			; Say were timing something
	call	timer_on

exit   	start_clock

;
;  turn the clock off ...
;

c_sys_entry	stop_clock

	mov	clock_on,0 			; Stop the clock
	mov	dx,high_time
	mov	ax,low_time

exit	stop_clock

;
;  return the clock time ...
;

c_sys_entry	get_clock

	mov	dx,high_time
	mov	ax,low_time

exit	get_clock

;
;  Helper routine to turn the gp timer on ...
;
;    for now, run the timer at 10ms intervals
;

	 public timer_on
timer_on proc	near
IFNDEF DTEX
	port_out _186_t2_cnt,0
	port_out _186_t2_maxa,timer_ticks
	port_out _186_t2_mc,0E001h
ENDIF ;DTEX
	ret

timer_on	endp

	end
