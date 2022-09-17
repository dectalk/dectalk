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
;*    File Name:	disp.asm
;*    Author:
;*    Creation Date:
;*
;*    Functionality:
;*	Kernel dispatcher
;*
;***********************************************************************
;*    Revision History:
;*
;-

	title	Kernel dispatcher

	.xlist
	include os_macs.asm
	include c_macs.asm
	include 186_macs.asm
	.list


	.code

;
;  Kernel dispatch table ...
;

service		macro	pname

	extrn	pname:near
	dw	offset &pname

		endm

kernel_services:

;
;  Servs is the file that has all the services that this kernel supports
;

	include	servs.asm


		public	kernel_dispatch
kernel_dispatch	proc	near

	push	es
	push	ds
	push	si
	push	di
;
;  remap to the kernel ... call with dx == callers ds, and ds,es set 
;  to kernel mapping ...
;
	mov	dx,ds
	mov	ax,DGROUP
	mov	ds,ax
	mov	es,ax
	mov	bx,word ptr cs:kernel_services[bx]
	call	bx

	pop	di
	pop	si
	pop	ds
	pop	es
	iret

kernel_dispatch	endp

		end


