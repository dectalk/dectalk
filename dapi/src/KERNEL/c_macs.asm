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
;*    File Name:	c_macs.asm
;*    Author:
;*    Creation Date:
;*
;*    Functionality:
;*  c_entry_code defines the common code to start a 'c' function written
;*  in macro for a small model.
;*
;***********************************************************************
;*    Revision History:
;*
;-

c_near_entry	macro	pname,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10


	entry_type = 0
	entry_name equ <pname>

		public	&pname
&pname	proc	near

	ifnb	<p1>
	 p1 equ	<word ptr ss:[bp+4]>
	endif
	ifnb	<p2>
	 p2 equ	<word ptr ss:[bp+6]>
	endif
	ifnb	<p3>
	 p3 equ	<word ptr ss:[bp+8]>
	endif
	ifnb	<p4>
	 p4 equ	<word ptr ss:[bp+10]>
	endif
	ifnb	<p5>
	 p5 equ	<word ptr ss:[bp+12]>
	endif
	ifnb	<p6>
	 p6 equ	<word ptr ss:[bp+14]>
	endif
	ifnb	<p7>
	 p7 equ	<word ptr ss:[bp+16]>
	endif
	ifnb	<p8>
	 p9 equ	<word ptr ss:[bp+18]>
	endif
	ifnb	<p9>
	 p8 equ	<word ptr ss:[bp+20]>
	endif
	ifnb	<p10>
	 p10 equ <word ptr ss:[bp+22]>
	endif

	push	bp
	mov	bp,sp
	push	ds
	push	di
	push	si
	
	
		endm

c_far_entry	macro	pname,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10

	entry_type = 1

	public	&pname
&pname	proc	far
	
	ifnb	<p1>
	 p1 equ	<word ptr ss:[bp+6]>
	endif
	ifnb	<p2>
	 p2 equ	<word ptr ss:[bp+8]>
	endif
	ifnb	<p3>
	 p3 equ	<word ptr ss:[bp+10]>
	endif
	ifnb	<p4>
	 p4 equ	<word ptr ss:[bp+12]>
	endif
	ifnb	<p5>
	 p5 equ	<word ptr ss:[bp+14]>
	endif
	ifnb	<p6>
	 p6 equ	<word ptr ss:[bp+16]>
	endif
	ifnb	<p7>
	 p7 equ	<word ptr ss:[bp+18]>
	endif
	ifnb	<p8>
	 p9 equ	<word ptr ss:[bp+20]>
	endif
	ifnb	<p9>
	 p8 equ	<word ptr ss:[bp+22]>
	endif
	ifnb	<p10>
	 p10 equ <word ptr ss:[bp+24]>
	endif

	push	bp
	mov	bp,sp	
	push	ds
	push	di
	push	si

		endm



c_sys_entry	macro	pname,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10


	entry_type = 2
	public	&pname
&pname	proc	near

	ifnb	<p1>
	 p1 equ	<word ptr ss:[bp+4]>
	endif
	ifnb	<p2>
	 p2 equ	<word ptr ss:[bp+6]>
	endif
	ifnb	<p3>
	 p3 equ	<word ptr ss:[bp+8]>
	endif
	ifnb	<p4>
	 p4 equ	<word ptr ss:[bp+10]>
	endif
	ifnb	<p5>
	 p5 equ	<word ptr ss:[bp+12]>
	endif
	ifnb	<p6>
	 p6 equ	<word ptr ss:[bp+14]>
	endif
	ifnb	<p7>
	 p7 equ	<word ptr ss:[bp+16]>
	endif
	ifnb	<p8>
	 p9 equ	<word ptr ss:[bp+18]>
	endif
	ifnb	<p9>
	 p8 equ	<word ptr ss:[bp+20]>
	endif
	ifnb	<p10>
	 p10 equ <word ptr ss:[bp+22]>
	endif


		endm

;
;  macro code entry ... does automatic process bracketing ...
;

near_entry		macro	pname

	entry_type = 3

		public	&pname
&pname	proc	near

			endm

far_entry		macro	pname

	entry_type = 3
	entry_name equ <pname>

		public	pname
pname	proc	far

			endm

;+
; exit defines the common code to return from a 'c' function ...
;-

exit	macro	pname

;
;  'c' compatable near entry ...
;

	if	entry_type EQ	0

		pop	si
		pop	di
		pop	ds
		pop	bp
		ret
	endif
;
;  'c' compatable far entry
;
	if	entry_type EQ	1

		pop	si
		pop	di
		pop	ds
		pop	bp
		ret
	endif
;
;  system code entry ...
;

	if	entry_type EQ	2
		
		ret
	endif
;
;  macro process entry ...
;

	if	entry_type EQ	3
		ret
	endif

&pname	endp

		endm

