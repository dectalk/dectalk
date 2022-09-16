;+
; File: dmp.asm
;
; Purpose: microPOST, dump commands
;
; Edits:
;
; 001 11-Dec-1991 RAO Creation
; 002 16-Dec-1991 RAO Add getadd_range parameter
; 003 17-Dec-1991 RAO Allow attention class characters to stop long dumps
;			yes, this eats type ahead; oh well...simple monitors
;			act in simple ways
; 004 20-Dec-1991 RAO Added control O, output cancel (still do the reads)
; 005 24-Dec-1991 RAO Added DU
; 006 26-Dec-1991 RAO Use pusha/Popa
; 007 07-Jan-1992 RAO Added formatted ascii to db output
; 008 12-Jan-1992 RAO Last line of db didn't show formatted ascii, fix it
;-
	title	microPOST dump commands
	.xlist
	include am00.inc
	include	am05.inc
	include	am07.inc
	include	amsegs32.inc
	include	limits.inc
	include	segass32.inc
	include	proto.inc
	.list

	extrn	line_buf1:near,parse_top:near
	extrn	addr_low:near,addr_high:near,last_addr:near
	extrn	last_dropped:near
	extrn	db_ascii_buffer:near

	public	cmd_db,cmd_dw,cmd_dd,cmd_du

ROM_CodeP	SEGMENT
	assume	ds:ROM_DataP
;+
; locally used strings
;-
bad_hex	db	CR,LF,'? Bad address value(s)',0 ; is better than none?

;+
; Note:
;	We could grab all the data required for one line of output,
;	format it, and write it at once to the console port. However,
;	if some failure were triggered by a read, we wouldn't really
;	find out about it until too late. So, don't buffer more than
;	one value.
;
;	On entry, the command line is in line_buf1.
;	The tokenized list is in tok_list1.
;	The number of tokens are in tok_count1.
;-
cmd_db:
	pusha
	xor	edx,edx			; output off flag cleared
	invoke	getaddr_range,1		; fill addr_low,addr_high (L=1 byte)
	cmp	ebx,0
	jne	@f
	invoke	putstr_cs,addr bad_hex
	jmp	cmd_ret2		; stop now

@@:	mov	esi,dword ptr addr_low	; get addr_low value
	mov	edi,offset db_ascii_buffer

cmd_db10:
	cmp	edx,0
	jne	@f			; output off?
	invoke	crlf			; new line
	invoke	addrprompt,esi		; dump address to console
	mov	byte ptr [edi],' '	; formatted ascii values, too
	inc	edi
	mov	byte ptr [edi],' '
	inc	edi

@@:	mov	ecx,16			; number of bytes/line
;
; *** check when the console output line is full (every 16 bytes?)
;
cmd_db20:
	cmp	edx,0
	jne	@f
	invoke	space

@@:	xor	eax,eax
	cld
	lodsb				; get value into al<-[esi++]
	cmp	edx,0
	jne	cmd_db25		; flush output
	invoke	puthex2,eax		; write 2 digit value

;+
; show the ascii representation of the byte, if printable
;-
	cmp	al,32			;
	jb	@f			; not printable
	cmp	al,127
	ja	@f			; not printable
	mov	[edi],al		; store char itself
	inc	edi
	jmp	cmd_db25

@@:
	mov	byte ptr [edi],'.'	; show that it isn't printable
	inc	edi
	
cmd_db25:
	cmp	esi,dword ptr addr_high	; done?
	jg	cmd_dbend		; yes
	loop	cmd_db20		; count down 16 bytes/line
	mov	byte ptr [edi],0	; make asciz
	mov	edi,offset db_ascii_buffer
	invoke	putstr,edi		; show ascii representation
;+
; did anyone type ^O or ^C
;-

	invoke	stopme			; interrupt?
	jnc	cmd_db10		; start another line
	cmp	byte ptr last_dropped,C_CTRLO
	jne	cmd_ret			; must be attention
	mov	edx,1			; set output off flag
	jmp	cmd_db10		; start line (with no output)

cmd_dbend:
;+
; end of this db command, if any db_ascii_buffer data should be written, do
; it now...
;
; a little wrinkle, assure that the ascii data starts as far to the
; right of the output line as a normal full line would be displayed
;
;-
	mov	byte ptr [edi],0
	sub	ecx,1			; loop counter less one
	mov	eax,ecx
	add	ecx,ecx
	add	ecx,eax			; eax = (loop ctr - 1)*3
	jecxz	cmd_dbend10		; forget writing any spaces
@@:
	invoke	space
	loop	@b			; write a bunch of spaces

cmd_dbend10:				; write the ascii data, too
	mov	edi,offset db_ascii_buffer
	invoke	putstr,edi
	jmp	cmd_ret

cmd_dw:
	pusha
	xor	edx,edx			; output off flag cleared
	invoke	getaddr_range,2		; fill addr_low,addr_high (L=2bytes)
	cmp	ebx,0
	jne	@f
	invoke	putstr_cs,addr bad_hex
	jmp	cmd_ret2		; stop now

@@:	mov	esi,dword ptr addr_low	; get addr_low value

cmd_dw10:
	cmp	edx,0
	jne	@f			; output off?
	invoke	crlf			; new line
	invoke	addrprompt,esi		; dump address to console

@@:	mov	ecx,8			; number of words/line
;
; *** check when the console output line is full (every 8 words?)
;
cmd_dw20:
	cmp	edx,0
	jne	@f
	invoke	space

@@:	xor	eax,eax
	cld
	lodsw				; get value into ax<-[esi++]
	cmp	edx,0
	jne	@f
	invoke	puthex4,eax		; write 4 digit value

@@:	cmp	esi,dword ptr addr_high	; done?
	jg	cmd_ret			; yes, common return
	loop	cmd_dw20		; count down 32 bytes/line
	invoke	stopme			; interrupt?
	jnc	cmd_dw10		; start another line
	cmp	byte ptr last_dropped,C_CTRLO
	jne	cmd_ret			; must be attention
	mov	edx,1			; set output off flag
	jmp	cmd_dw10		; start line (with no output)


cmd_du:
	pusha
	xor	edx,edx			; output off flag cleared
	invoke	getaddr_range,2		; fill addr_low,addr_high (L=2bytes)
	cmp	ebx,0
	jne	@f
	invoke	putstr_cs,addr bad_hex
	jmp	cmd_ret2		; stop now

@@:	mov	esi,dword ptr addr_low	; get addr_low value

cmd_du10:
	cmp	edx,0
	jne	@f			; output off?
	invoke	crlf			; new line
	invoke	addrprompt,esi		; dump address to console

@@:	mov	ecx,8			; number of words/line
;
; *** check when the console output line is full (every 8 words?)
;
cmd_du20:
	cmp	edx,0
	jne	@f
	invoke	space

@@:	xor	eax,eax
	cld
	lodsw				; get value into ax<-[esi++]
	cmp	edx,0
	jne	@f
	invoke	putdec16,eax		; write decimal (unsigned) value

@@:	cmp	esi,dword ptr addr_high	; done?
	jg	cmd_ret			; yes, common return
	loop	cmd_du20		; count down 32 bytes/line
	invoke	stopme			; interrupt?
	jnc	cmd_du10		; start another line
	cmp	byte ptr last_dropped,C_CTRLO
	jne	cmd_ret			; must be attention
	mov	edx,1			; set output off flag
	jmp	cmd_du10		; start line (with no output)


cmd_dd:
	pusha
	xor	edx,edx			; output off flag cleared
	invoke	getaddr_range,4		; fill addr_low,addr_high (L=4bytes)
	cmp	ebx,0
	jne	@f
	invoke	putstr_cs,addr bad_hex
	jmp	cmd_ret2		; stop now

@@:	mov	esi,dword ptr addr_low	; get addr_low value

cmd_dd10:
	cmp	edx,0
	jne	@f			; output off?
	invoke	crlf			; new line
	invoke	addrprompt,esi		; dump address to console

@@:	mov	ecx,4			; number of dwords/line
;
; *** check when the console output line is full (every 4 dwords?)
;
cmd_dd20:
	cmp	edx,0
	jne	@f
	invoke	space

@@:	xor	eax,eax
	cld
	lodsd				; get value into eax<-[esi++]
	cmp	edx,0
	jne	@f
	invoke	puthex8,eax		; write 8 digit value

@@:	cmp	esi,dword ptr addr_high	; done?
	jg	cmd_ret			; yes, common return
	loop	cmd_dd20		; count down 32 bytes/line
	invoke	stopme			; interrupt?
	jnc	cmd_dd10		; start another line
	cmp	byte ptr last_dropped,C_CTRLO
	jne	cmd_ret			; must be attention
	mov	edx,1			; set output off flag
	jmp	cmd_dd10		; start line (with no output)

cmd_ret:
;+
; common return
;-
	mov	dword ptr last_addr,esi	; save the address we would have
					; dumped for next time
cmd_ret2:
	popa
	jmp	parse_top		; return to parser

ROM_CodeP	ENDS
	end
