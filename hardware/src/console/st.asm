;+
; File: st.asm
;
; Purpose: microPOST string utilities, protected mode, near, 32-bit
;
; Edits:
;
; 001 11-Dec-1991 RAO Creation, re-deployed older code, tested under DOS
; 002 16-Dec-1991 RAO Added strlen, toupper, stricmp_cs
; 003 24-Dec-1991 RAO Fixed problem with returned string ptr in bindec16
; 004 08-Jan-1992 RAO Added bindec8
; 005 15-Jan-1992 RAO Added decbin32
; 006 18-Jan-1992 RAO Added strncpy, stricmp
; 007 22-Jan-1992 RAO Added gethex2, gethex4
;-
	title	microPOST string utilities
	.xlist
	include am00.inc
	include	am05.inc
	include	amsegs32.inc
	include	limits.inc
	include	segass32.inc
	include	proto.inc
	.list

ROM_CodeP	SEGMENT
;
; simple table for converting hex to binary and back
;
binhextab	db '0','1','2','3','4','5','6','7','8','9',	\
			'A','B','C','D','E','F'

;
; map of characters and their value when converting hex nibbles to binary
; a 256 table is needed for xlat
; illegal (end of number) characters are signalled with a -1 marker
;
hexbintab	db 16 dup (-1)	; 00..15
		db 16 dup (-1)	; 16..31
		db 16 dup (-1)	; 32..47
		db 0,1,2,3,4,5,6,7,8,9,6 dup (-1) ; 48..63 "0".."9"
		db -1,0Ah,0Bh,0Ch,0Dh,0Eh,0Fh,9 dup (-1)  ; 64..79
		db 16 dup (-1)				  ; 80..95
		db -1,0ah,0bh,0ch,0dh,0eh,0fh,9 dup (-1)  ; 96..111
		db 16 dup(-1)				  ; 112..128
		db 128 dup (-1)

powers_of_10	dw	10000,1000
p_of_10_at_100	dw	100,10,1

;	public	strcmp,strcmp_cs,strcat,strcpy,strcpy_cs,binhex32,binhex16, \
;		tokenize,hexbin32
	page +
;+
; Routine: strcmp
;
; Inputs:
;	arg1 byte ptr to asciz string
;	arg2 byte ptr to asciz string
;
; Returns:
;	0 if strings are equal
;	non-zero if strings don't compare
;
;-
strcmp	PROC NEAR32  uses ebx ecx,
	arg1:DWORD, arg2:DWORD

	mov	ebx,arg1		; get ptr1 to string1
	mov	ecx,arg2		; get ptr2 to string2

strcmp50:
	mov	ah,[ebx]		; *ptr1
	mov	al,[ecx]		; *ptr2
	inc	ebx			; ptr1++
	inc	ecx			; ptr2++

	cmp	ah,al			; equal? (RAO 11/18/91)
	jne	strcmp90		; no, return, strings don't match

;+
; equal, but is one or both == 0? (i. e. time to quit compare)
;-
	cmp	ah,0			; == 0?
	je	strcmp90		; yes
	cmp	al,0			; == 0?
	jne	strcmp50		; more

strcmp90:
	cwde				; ax word -> signed eax double word
	ret

strcmp	endp
	page +
;+
; Routine: strcmp_cs
;
; Inputs:
;	arg1 byte ptr to asciz string (assume offset relative to current
;		cs selector...)
;	arg2 byte ptr to asciz string
;
; Note:
;	This thing is useful when you have fixed strings in code tables...
;
; Returns:
;	0 if strings are equal
;	non-zero if strings don't compare
;
;-
strcmp_cs	PROC NEAR32 uses ebx ecx,
	arg1:DWORD, arg2:DWORD

	mov	ebx,arg1		; get ptr1 to string1
	mov	ecx,arg2		; get ptr2 to string2

strcmp_cs50:
	mov	ah,cs:[ebx]		; *ptr1
	mov	al,[ecx]		; *ptr2
	inc	ebx			; ptr1++
	inc	ecx			; ptr2++

	cmp	ah,al			; equal? (RAO 11/17/91)
	jne	strcmp_cs90		; no, return, strings don't match

;+
; equal, but is one or both == 0? (i. e. time to quit compare)
;-
	cmp	ah,0			; == 0?
	je	strcmp_cs90		; yes
	cmp	al,0			; == 0?
	jne	strcmp_cs50		; more

strcmp_cs90:
	cwde				; ax word -> signed eax double word
	ret

strcmp_cs	endp
	page +
;+
; Routine: stricmp_cs	(case insensitive)
;
; Inputs:
;	arg1 byte ptr to asciz string (assume offset relative to current
;		cs selector...)
;	arg2 byte ptr to asciz string
;
; Note:
;	This thing is useful when you have fixed strings in code tables...
;
; Returns:
;	0 if strings are equal
;	non-zero if strings don't compare
;
;-
stricmp_cs	PROC NEAR32 uses ebx ecx,
	arg1:DWORD, arg2:DWORD

	mov	ebx,arg1		; get ptr1 to string1
	mov	ecx,arg2		; get ptr2 to string2

stricmp_cs50:
	mov	ah,cs:[ebx]		; *ptr1
	mov	al,[ecx]		; *ptr2
	inc	ebx			; ptr1++
	inc	ecx			; ptr2++

	invoke	toupper			; uppercase(al)
	xchg	al,ah
	invoke	toupper
	xchg	al,ah			; both chars now uppercase

	cmp	ah,al			; equal? (RAO 11/17/91)
	jne	stricmp_cs90		; no, return, strings don't match

;+
; equal, but is one or both == 0? (i. e. time to quit compare)
;-
	cmp	ah,0			; == 0?
	je	stricmp_cs90		; yes
	cmp	al,0			; == 0?
	jne	stricmp_cs50		; more

stricmp_cs90:
	cwde				; ax word -> signed eax double word
	ret

stricmp_cs	endp

	page +
;+
; Routine: stricmp	(case insensitive)
;
; Inputs:
;	arg1 byte ptr to asciz string (assume offset relative to DS)
;	arg2 byte ptr to asciz string
;
; Note:
;	This thing is useful when you have strings in RAM
;
; Returns:
;	0 if strings are equal
;	non-zero if strings don't compare
;
;-
stricmp	PROC NEAR32 uses ebx ecx,
	arg1:DWORD, arg2:DWORD

	mov	ebx,arg1		; get ptr1 to string1
	mov	ecx,arg2		; get ptr2 to string2

stricmp50:
	mov	ah,[ebx]		; *ptr1
	mov	al,[ecx]		; *ptr2
	inc	ebx			; ptr1++
	inc	ecx			; ptr2++

	invoke	toupper			; uppercase(al)
	xchg	al,ah
	invoke	toupper
	xchg	al,ah			; both chars now uppercase

	cmp	ah,al			; equal?
	jne	stricmp90		; no, return, strings don't match

;+
; equal, but is one or both == 0? (i. e. time to quit compare)
;-
	cmp	ah,0			; == 0?
	je	stricmp90		; yes
	cmp	al,0			; == 0?
	jne	stricmp50		; more

stricmp90:
	cwde				; ax word -> signed eax double word
	ret

stricmp	endp
	page +
;+
; Routine: strcat
;
; Inputs:
;	arg1 byte ptr to asciz string
;	arg2 byte ptr to asciz string
;
; Actions:
;	copies string (arg2) onto the end of string (arg1), making the
;	new string null terminated as well
;
; Returns:
;	ptr to new string in eax
;-
strcat	PROC NEAR32 uses ebx ecx edx,
	arg1:DWORD, arg2:DWORD

	mov	ebx,arg1		; get ptr1 to string1
	mov	ecx,arg2		; get ptr2 to string2
	mov	edx,ebx			; save ptr to string1
;+
; go to the end of string1
;-
@@:
	mov	al,[ebx]		; *ptr1
	inc	ebx			; ptr1++
	cmp	al,0			; == 0?
	jnz	@b			; no, keep looking for the end
;+
; now make ptr1 point at the trailing null
;-
	dec	ebx

@@:
	mov	al,[ecx]		; *ptr2
	inc	ecx			; ptr2++
	mov	[ebx],al		;
	inc	ebx			; *ptr1++ = *ptr2++

	cmp	al,0			; end of string2?
	jnz	@b
	
	mov	eax,edx			; ptr to start of string1
	ret

strcat	endp
	page +
;+
; Routine: strlen
;
; Inputs:
;	arg1 byte ptr to asciz string
;
; Actions:
;	counts number of chars prior to terminating null byte
;
; Returns:
;	length of string (number of bytes before null) in eax
;-
strlen	PROC NEAR32 uses ebx,
	arg1:DWORD

	mov	ebx,arg1		; get ptr1 to string
	xor	eax,eax			; counter
;+
; go to the end of string, counting length
;-
@@:
	cmp	byte ptr [ebx][eax],0	; end of string?
	je	@f			; yes, done
	inc	eax			; no, keep looking, ptr1++
	jmp	@b			; loop

@@:
	ret

strlen	endp
	page +
;+
; Routine: nextnull
;
; Inputs:
;	arg1 byte ptr to asciz string
;
; Actions:
;	counts number of chars prior to terminating null byte
;
; Returns:
;	ptr to null byte in eax
;-
nextnull	PROC NEAR32,
	arg1:DWORD

	mov	eax,arg1		; get ptr1 to string
;+
; go to the end of string, counting length
;-
@@:
	cmp	byte ptr [eax],0	; end of string?
	je	@f			; yes, done
	inc	eax			; no, keep looking, ptr1++
	jmp	@b			; loop

@@:
	ret

nextnull	endp
	page +
;+
; Routine: toupper
;
; Inputs:
;	al contains character that, if in range 'a'..'z' will be transformed
;	to the corresponding upper case value; else do nothing.
;
; Returns:
;	al contains upper case version of input
;-
toupper	PROC NEAR32

	cmp	al,'a'			; range test
	jl	to90			; done, not in range
	cmp	al,'z'
	jg	to90			; done, not in range
;+
; adjust, make upper case
;-
	sub	al,'a'-'A'		; only works with ascii

to90:
	ret

toupper	endp
	page +
;+
; Routine: strcpy
;
; Inputs:
;	arg1 byte ptr to asciz string (target)
;	arg2 byte ptr to asciz string (source)
;
; Actions:
;	copies string (arg2) to the ptr arg1. Both strings will be null
;	terminated.
;
; Returns:
;	ptr to new string (arg1) in eax
;-
strcpy	PROC NEAR32 uses ebx ecx edx,
	arg1:DWORD, arg2:DWORD

	mov	ebx,arg1		; get ptr1 to string1
	mov	ecx,arg2		; get ptr2 to string2
	mov	edx,ebx			; save ptr to string1

@@:
	mov	al,[ecx]		; *ptr2
	inc	ecx			; ptr2++
	mov	[ebx],al		;
	inc	ebx			; *ptr1++ = *ptr2++

	cmp	al,0			; end of string2?
	jnz	@b
	
	mov	eax,edx			; ptr to start of string1
	ret

strcpy	endp
;+
; Routine: strncpy
;
; Inputs:
;	arg1 byte ptr to asciz string (target)
;	arg2 byte ptr to asciz string (source)
;	slen dword    len of target string (max)
; Actions:
;	copies string (arg2) to the ptr arg1. Both strings will be null
;	terminated.
;
; Returns:
;	ptr to new string (arg1) in eax
;-
strncpy	PROC NEAR32 uses ebx ecx edx,
	arg1:DWORD, arg2:DWORD, slen:DWORD

	mov	esi,slen		; max length (including null)

	mov	ebx,arg1		; get ptr1 to string1
	mov	ecx,arg2		; get ptr2 to string2
	mov	edx,ebx			; save ptr to string1

@@:
	sub	esi,1			; downcount remaining space in target
	jle	strncpy_90		; we're full, add null and leave now
	mov	al,[ecx]		; *ptr2
	inc	ecx			; ptr2++
	mov	[ebx],al		;
	inc	ebx			; *ptr1++ = *ptr2++

	cmp	al,0			; end of string2?
	jnz	@b
	
	mov	eax,edx			; ptr to start of string1
	ret

strncpy_90:
	mov	byte ptr [ebx],0	; make asciz
	mov	eax,edx			; ptr to start of string1
	ret

strncpy	endp
	page +
;+
; Routine: tokenize
;
; Inputs:
;	arg1 byte ptr to asciz string (target)
;	arg2 byte ptr to asciz string (source)
;
; Actions:
;	copies string (arg2) to the ptr arg1. Every time a white space class
;	character is found within the arg2 source string, it is replaced by
;	a null character in the target string. Multiple, consecutive white
;	spaces are replaced by a single null character.
;
; Returns:
;	Number of token substrings written to target
;
; Strategy (in pseudo C code). Apologies in advance for the goto's; but
; we're about to use goto's allover the place in our assembler code...
;
;	int tokenize(ptr1,ptr2);
;	char
;		*ptr1,
;		*ptr2;
;	{
;	int
;		c,
;		count;
;
;	count = 0;		how many tokens found
;
;	c = *ptr2++;		get a char from input string
; top:	while(iswhite(c))	skip leading white space
;		c = *ptr2++;
;
;	while(! iswhite(c))	grab all non-spaces as next token
;		{
;		*ptr1++ = c;	copy to output string list
;		if(c == '\0')
;			return(count)
;		c = *ptr2++;	get next input char
;		}
;
;	*ptr1++ = '\0';		end the token with a null
;	count++;		count tokens found
;	goto top		sorry...
;
;-
tokenize	PROC NEAR32 uses esi ebx ecx edx,
	arg1:DWORD, arg2:DWORD

	xor	edx,edx			; clear count
	mov	ebx,arg1		; get ptr1 to string1
	mov	ecx,arg2		; get ptr2 to string2
	xor	esi,esi			; any real characters (set to 1 later)

	mov	al,[ecx]
	inc	ecx			; c = *ptr2++

toktop:
	jisnotwhite tokloop		; non-white space, useit
	mov	al,[ecx]		; c = *ptr2++; white space, skip it
	inc	ecx
	xor	esi,esi
	jmp	toktop

tokloop:
	jiswhite tokend			; silly the 1st time in here
	mov	[ebx],al
	inc	ebx			; *ptr1++ = c
	cmp	al,0			; if(c == '\0')
	je	tok99
	mov	esi,1			; in a non-space field

@@:
	mov	al,[ecx]		; get next char
	inc	ecx			; c = *ptr2++
	jmp	tokloop

tokend:
	mov	byte ptr [ebx],0	; end of token, mark it with null
	inc	ebx			; *ptr1++ = '\0'
	add	edx,esi			; count++
	jmp	toktop

tok99:
	add	edx,esi		; was last field non-space?
	mov	eax,edx		; number of tokens found
	ret

tokenize	endp
	page +
;+
; Routine: strcpy_cs
;
; Inputs:
;	arg1 byte ptr to asciz string (target) (assume in ds)
;	arg2 byte ptr to asciz string (source) (assumed in cs)
;
; Actions:
;	copies string (arg2) to the ptr arg1. Both strings will be null
;	terminated.
;
; Returns:
;	ptr to new string (arg1) in eax
;-
strcpy_cs	PROC NEAR32 uses ebx ecx edx,
	arg1:DWORD, arg2:DWORD

	mov	ebx,arg1		; get ptr1 to string1
	mov	ecx,arg2		; get ptr2 to string2 (in cs)
	mov	edx,ebx			; save ptr to string1

@@:
	mov	al,cs:[ecx]		; *ptr2	(RAO 11/17/91)
	inc	ecx			; ptr2++
	mov	[ebx],al		; (RA0 111/17/91)
	inc	ebx			; *ptr1++ = *ptr2++

	cmp	al,0			; end of string2?
	jnz	@b
	
	mov	eax,edx			; ptr to start of string1
	ret

strcpy_cs	endp
	page +
;+
; Routine: binhex32
;
; Inputs:
;	buffer	byte ptr to offset into ds where hex digits will be written
;	value	32 bit unsigned value to be converted to hex
;
; Implicit output:
;	buffer will have ascii hex digits written to it (and 1 trailing null)
;
; Return:
;	byte ptr to next null byte in the output buffer.
;-
binhex32	PROC NEAR32 uses ebx ecx edx,
		buffer:DWORD, value:DWORD
;**** DOS changes (old code follows)
;		buffer:DWORD, value:PTR DWORD

	mov	edx,buffer		; get output ptr
	mov	eax,value		; get the binary value
	mov	ecx,8			; how many digits?

@@:
	rol	eax,4			; get high order 4 bits into low
	mov	ebx,eax			; order and move to ebx
	and	ebx,0fh			; just one nibble

	mov	bl,cs:binhextab[ebx]	; get ascii char
	mov	[edx],bl		; store it
	inc	edx			; output ptr++
	dec	ecx
	jnz	@b			; do more

	mov	eax,edx			; return output byte ptr
	mov	byte ptr [eax],0	; trailing null
	ret

binhex32	endp

	page +
;+
; Routine: binhex16
;
; Inputs:
;	buffer	byte ptr to offset into ds where hex digits will be written
;	value	32 bit unsigned value to be converted to hex.
;		Careful! Only the lower 16 bits are formatted
;
; Implicit output:
;	buffer will have ascii hex digits written to it (and 1 trailing null)
;
; Return:
;	byte ptr to the null byte in the output buffer.
;-
binhex16	PROC NEAR32 uses ebx ecx edx,
		buffer:DWORD, value:DWORD
; *** DOS changes (old code follows)
;		buffer:DWORD, value:PTR DWORD

	mov	edx,buffer		; get output ptr
	xor	eax,eax			; clear eax
	mov	eax,value		; get the binary value
	mov	ecx,4			; how many digits?
	rol	eax,16			; move low word into high word of eax
@@:
	rol	eax,4			; get high order 4 bits into low
	mov	ebx,eax			; order and move to ebx
	and	ebx,0fh			; just one nibble

	mov	bl,cs:binhextab[ebx]	; get ascii char
	mov	[edx],bl		; store it
	inc	edx			; output ptr++
	dec	ecx
	jnz	@b			; do more

	mov	eax,edx			; return output byte ptr
	mov	byte ptr [eax],0	; trailing null
	ret

binhex16	endp

;+
; Routine: binhex8
;
; Inputs:
;	buffer	byte ptr to offset into ds where hex digits will be written
;	value	32 bit unsigned value to be converted to hex.
;		Careful! Only the lower 8 bits are formatted
;
; Implicit output:
;	buffer will have ascii hex digits written to it (and 1 trailing null)
;
; Return:
;	byte ptr to the null byte in the output buffer.
;-
binhex8	PROC NEAR32 uses ebx esi edi edx,
		buffer:DWORD, value:DWORD
; *** DOS changes (old code follows)
;		buffer:DWORD, value:PTR DWORD

	mov	esi,buffer		; get output ptr
	mov	edi,offset binhextab
	xor	eax,eax			; clear eax
	mov	ebx,value		; get the binary value
	ror	ebx,4			; high nibble -> low nibble
@@:
	mov	eax,ebx			; order and move to ebx
	and	eax,0fh			; just one nibble

	mov	dl,cs:[eax+edi]
	mov	[esi],dl
	inc	esi			; output ptr++

	rol	ebx,4			; get low nibble
	mov	eax,ebx
	and	eax,0fh
	mov	dl,cs:[eax+edi]
	mov	[esi],dl
	inc	esi
	mov	byte ptr [esi],0	; asciz
	mov	eax,esi			; return ptr to null byte
	ret

binhex8	endp

;+
; Routine: gethex2
;
; Purpose: Convert 1st 2 hex digits from input string into binary value
;
; Inputs:
;	buffer	byte ptr to offset into ds string of hex digits
;
; Outputs:
;	eax	Binary value
;	ebx	0 if error was detected
;	ebx	1 if return value is valid
;
; Notes:
;	Unlike hexbin32, this routine does *not* need or look for terminating
;	chars after the 2 good hex digits...
;-
gethex2	PROC	NEAR32	uses esi edi,buffer:DWORD
	LOCAL	temp [4]:BYTE

;+
; get two hex digits and make them into an ascii string
;-
	mov	esi,buffer		; address of string
	mov	ebx,esi			; save it
	lea	edi,temp[0]		; temporary target
	cld
	movsb
	movsb
	mov	byte ptr [edi],0	; asciz 2 byte string in temp
	invoke	hexbin32,addr temp[0]	; cvt -> binary
	ret				; returns: eax=value,ebx=status

gethex2	ENDP

;+
; Routine: gethex4
;
; Purpose: Convert 1st 4 hex digits from input string into binary value
;
; Inputs:
;	buffer	byte ptr to offset into ds string of hex digits
;
; Outputs:
;	eax	Binary value
;	ebx	0 if error was detected
;	ebx	1 if return value is valid
;
; Notes:
;	Unlike hexbin32, this routine does *not* need or look for terminating
;	chars after the 4 good hex digits...
;-
gethex4	PROC	NEAR32	uses ecx esi edi,buffer:DWORD
	LOCAL	temp [8]:BYTE

;+
; get 4 hex digits and make them into an ascii string
;-
	mov	esi,buffer		; address of string
	lea	edi,temp[0]		; temporary target
	cld
	mov	ecx,4			; how many digits to move
	rep	movsb
	mov	byte ptr [edi],0	; asciz the 4 char string in temp
	invoke	hexbin32,addr temp[0]	; cvt -> binary
	ret				; returns: eax=value,ebx=status

gethex4	ENDP

;+
; Routine: hexbin32
;
; Inputs:
;	buffer	byte ptr to offset into ds where hex digits will be read
;
; Return:
;	eax contains converted binary value
;	ebx contains status (1 = ok, 0 = bad cvt)
;	carry clear if we had a number, else set
;-
hexbin32	PROC NEAR32 uses ecx edx esi edi,
		buffer:DWORD

	mov	ebx,buffer		; ptr to input stream
	xor	eax,eax
	mov	edx,eax			; result, clear
	mov	ecx,9			; digit count+1 (no more than 8)
	mov	edi,offset hexbintab
@@:
	mov	al,[ebx]		; get next char in al
	mov	esi,eax			; treat as offset (range 0..255)
	inc	ebx			; bump byte ptr
	mov	al,cs:[esi+edi]		; get hex nibble (-1 for failure)
	cmp	al,-1			; illegal hex nibble to end cvt?
	je	hexbin80		; yes, done

	dec	ecx			; track digits
	je	hexbin99		; failed

	shl	edx,4			; make room for nibble
	or	edx,eax			; place nibble at low end
	jmp	@b

hexbin80:
	cmp	ecx,9
	je	hexbin99		; never got a valid digit
	mov	eax,edx			; setup return value
	mov	ebx,1			; status ok
	ret

hexbin99:
	xor	eax,eax			; return 0
	mov	ebx,eax			; status bad
	ret

hexbin32	endp

;+
; Routine: decbin32
;
; Inputs:
;	buffer	byte ptr to offset into ds where decimal digits will be read
;
; Return:
;	eax contains converted binary value
;	ebx contains status (1 = ok, 0 = bad cvt)
;	carry clear if we had a number, else set
;-
decbin32	PROC NEAR32 uses ecx edx edi,
		buffer:DWORD

	mov	ebx,buffer		; ptr to input stream
	xor	eax,eax
	mov	edx,eax			; result, clear
	mov	ecx,eax			; digit count

@@:
	mov	al,[ebx]		; get next char in al
	cmp	al,0
	je	decbin32_90		; found null
	cmp	al,'0'
	jb	decbin32_80		; error
	cmp	al,'9'
	ja	decbin32_80		; error
;+
; have a good digit
;-
	inc	ecx			; track number of digits found
	mov	edi,edx			; current value
	shl	edx,3			; val*8
	add	edx,edi			; val*9
	add	edx,edi			; val*10
	
	sub	al,'0'			; make into binary
	add	edx,eax			; shift in digit
	inc	ebx			; bump byte ptr
	jmp	@b

decbin32_90:
	mov	eax,edx			; setup return value
	mov	ebx,1			; status ok
	ret

decbin32_80:
	xor	eax,eax			; return 0
	mov	ebx,eax			; status bad
	ret

decbin32	endp

;+
; Routine: bindec16
;
; Inputs:
;	buffer	byte ptr to offset into ds where decimal digits will be written
;	value	16 bit unsigned value to be converted to decimal (unsigned)
;
; Implicit output:
;	buffer will have ascii decimal digits written to it (and 1 trailing null)
;
; Return:
;	byte ptr to next null byte in the output buffer.
;-
bindec16	PROC NEAR32 uses ebx ecx edx esi edi,
		buffer:DWORD, value:DWORD
;**** DOS changes (old code follows)
;		buffer:DWORD, value:PTR DWORD

	mov	esi,buffer		; get output ptr
	xor	ecx,ecx
	mov	edi,value		; get the binary value

	mov	ebx,offset powers_of_10	; divisor table

@@:
	mov	eax,edi			; get value being formatted
	mov	cx,cs:[ebx]		; divisor
	add	ebx,2			; ptr to next divisor
	cmp	ecx,1			; end?
	je	@f			; done, just do the ones

	xor	edx,edx
	div	ecx			; edx:eax/ecx; div->eax; rem->edx
	mov	edi,edx			; save remainder for loop
	add	al,'0'			; make into ascii
	mov	[esi],al		; write into buffer
	inc	esi			; bump buffer ptr
	jmp	@b

@@:
	add	al,'0'			; make units digit into ascii
	mov	[esi],al		; write to buffer
	inc	esi
	mov	byte ptr [esi],0	; asciz
	mov	eax,esi			; return ptr to null byte
	ret

bindec16	endp

;+
; Routine: bindec8
;
; Inputs:
;	buffer	byte ptr to offset into ds where decimal digits will be written
;	value	8 bit unsigned value to be converted to decimal (unsigned)
;
; Implicit output:
;	buffer will have ascii decimal digits written to it (and 1 trailing null)
;
; Return:
;	byte ptr to next null byte in the output buffer.
;-
bindec8	PROC NEAR32 uses ebx ecx edx esi edi,
		buffer:DWORD, value:DWORD
;**** DOS changes (old code follows)
;		buffer:DWORD, value:PTR DWORD

	mov	esi,buffer		; get output ptr
	xor	ecx,ecx
	mov	edi,value		; get the binary value

	mov	ebx,offset p_of_10_at_100	; divisor table (starts at 100)

@@:
	mov	eax,edi			; get value being formatted
	mov	cx,cs:[ebx]		; divisor
	add	ebx,2			; ptr to next divisor
	cmp	ecx,1			; end?
	je	@f			; done, just do the ones

	xor	edx,edx
	div	ecx			; edx:eax/ecx; div->eax; rem->edx
	mov	edi,edx			; save remainder for loop
	add	al,'0'			; make into ascii
	mov	[esi],al		; write into buffer
	inc	esi			; bump buffer ptr
	jmp	@b

@@:
	add	al,'0'			; make units digit into ascii
	mov	[esi],al		; write to buffer
	inc	esi
	mov	byte ptr [esi],0	; asciz
	mov	eax,esi			; return ptr to null byte
	ret

bindec8	endp

ROM_CodeP	ENDS
	end
