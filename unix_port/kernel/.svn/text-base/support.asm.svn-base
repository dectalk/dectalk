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
;*    File Name:	support.asm
;*    Author:
;*    Creation Date:
;*
;*    Functionality:
;*  Misc hardware support routines
;*
;***********************************************************************
;*    Revision History:
;* 09 aug 95	...tek	dtpc-2 stuff
;* 14dec95	...tek		merge dtex
;*
;-
	title	Misc hardware support routines

        dosseg

	.xlist
	include os_macs.asm
	include c_macs.asm
	include 186_macs.asm
	.list

	_186_regs
	mem_map
	kernel_data

        .code

;******************************************************************
;  i/o input and output routines from 'c'
;******************************************************************

c_sys_entry	port_out_186,port,value

        mov     dx,port
        mov     ax,value
        out     dx,ax

exit		port_out_186

c_sys_entry	port_in_186,port

        mov     dx,port
        in      ax,dx

exit		port_in_186


;*********************************************************************
;  gpio support ...
;*********************************************************************
IFNDEF DTEX
c_sys_entry	set_gpio,bits

IFDEF DTPC2
	hlt
ELSE
        mov     ax,bits
        or      ax,_gpio_image
        mov     _gpio_image,ax
        mov     dx,GPIO
        out     dx,ax
ENDIF ; DTPC2
exit	set_gpio

c_sys_entry	clr_gpio,bits
IFDEF DTPC2
	hlt	; this should never be called  on DTPC2!
ELSE
        mov     ax,bits
        not     ax

        and     ax,_gpio_image
        mov     _gpio_image,ax
        mov     dx,GPIO
        out     dx,ax
ENDIF ;DTPC2
exit	clr_gpio
ENDIF ;DTEX

;*********************************************************************
;  misc support routines ...
;*********************************************************************

c_sys_entry	error_hang

        pushf
        cli
	hlt
        popf
        ret

exit	error_hang

;
;  restart from the boot address ... shut everything down first ...
;

IFDEF DTEX

c_sys_entry	pcdt_init

	cli
;
;  mask off DMA ...
;
	mov	ax,0Fh		; set all mask bits
       	mov	dx, 0DEh	; in the write-mask register
	out	dx,al		; bang.


	mov	ax,03h		; Stop the spc (reset | v5boff)
        mov     dx,02e0h
        out     dx,al
;
;  Do a bunch of eois (no loop to avoid hangs ...)
;
	mov	ax,020h
        mov	dx,020
	out	dx,al
	out	dx,al
	out	dx,al
 
;
;  Now, back to the rom ...
;

	mov	dx, 0ech
	mov	al,014h
	out	dx,al		; point at MISCSET
	mov	dx, 0edh
	in	al,dx		; get MISCSET
	and	al,07Fh		; enable the registers
	out	dx,al		; write the VSF on..

	mov	dx,0efh		; port A
	mov	al, 02h		; clear the reset bit in port A.
	out	dx, al
	
	; a dummy read of the register at 0xef generates a reset.
	in	al,dx		; bang..
	; hang in a loop until the reset hits..
hung:	nop
	jmp 	hung

	exit	pcdt_init

ELSE

c_sys_entry	pcdt_init

	cli
;
;  disable the timers (this shuts down the spc too) ...
;
	mov	ax,0h
	mov	dx,_186_t0_mc
	out	dx,ax
        mov	dx,_186_t1_mc
	out	dx,ax
;
;  mask off all interrupts ...
;
	mov	ax,8h
       	mov	dx,_186_time_ctrl
	out	dx,ax
        mov	dx,_186_dma0_ctrl
	out	dx,ax
        mov	dx,_186_dma1_ctrl
	out	dx,ax
        mov	dx,_186_int0_ctrl
	out	dx,ax
        mov	dx,_186_int1_ctrl
	out	dx,ax
        mov	dx,_186_int2_ctrl
	out	dx,ax
        mov	dx,_186_int3_ctrl
	out	dx,ax
;
;  Specify the 'change' bit for the dma control ...
;
	mov	ax,4h
	mov	dx,_186_dma0_cnt
	out	dx,ax
        mov	dx,_186_dma1_cnt
	out	dx,ax

	xor	ax,ax		; Stop the spc    
IFDEF DTPC2
	mov	dx, GPIO2
ELSE
        mov     dx,GPIO
ENDIF
        out     dx,ax
;
;  Do a bunch of eois (no loop to avoid hangs ...)
;
	mov	ax,08000h
        mov	dx,_186_eoi
	out	dx,ax		; one per sourse timer 0
	out	dx,ax		;   timer 1
	out	dx,ax		;   dma 0
	out	dx,ax		;   dma 1
	out	dx,ax		; isa int
 
;
;  Now, back to the rom ...
;
	push	0ffffh
	push	0
	retf

exit		pcdt_init

ENDIF ;DTEX

c_sys_entry	get_share

	mov	dx,_kernel_share+2
	mov	ax,_kernel_share

exit		get_share	

;*****************************************************
;  shared library support 

c_near_entry	_kernel_ds

	mov	ax,DGROUP

exit		_kernel_ds

	end
