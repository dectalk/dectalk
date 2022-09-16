;+
; File: ld.asm
;
; Purpose: microPOST Load command and Intel Hex command (cmd_ihex)
;
; Edits:
;
; 001 23-Jan-1992 RAO Creation
; 	31 jan 94	...tek		support extended address.
;-
	title	microPOST Load, Intel Hex commands
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
	extrn	tok_list1:near,tok_count1:near
	extrn	last_dropped:near
	extrn	load_offset:near, load_adder:near, loader_error:near

	public	cmd_load,cmd_ihex

ROM_CodeP	SEGMENT
	assume	ds:ROM_DataP
;+
; locally used strings
;-
dbg0		db	' ** ',0
dbg1		db	' T= ',0	; *** DEBUG
bad_hex		db	CR,LF,'? Bad hex address',0
m_args		db	CR,LF,'? args',0

;+
; the following messages do not start with CR,LF
; and they will appear on the same input line which a comm program
; will echo as it is sending INTEL HEX records to this monitor...
;
; this gives us some measure of cheap synchronization and recovery after
; a single error
;-

bad_prefix	db	' ? HEX prefix ',0
bad_check	db	' ? HEX checksum ',0
bad_type	db	' ? HEX type ',0
bad_short	db	' ? HEX record short ',0
bad_long	db	' ? HEX record long ',0  
bad_addr	db	' ? HEX address ',0
bad_length	db	' ? HEX length ',0
bad_data	db	' ? HEX data ',0
bad_internal	db	' ? hexload internal err ',0

;+
; Note:
;	On entry, the command line is in line_buf1.
;	The tokenized list is in tok_list1.
;	The number of tokens are in tok_count1.
;
;-
cmd_load:
	pusha
	mov	ecx,dword ptr tok_count1	; number of tokens
	cmp	ecx,2			; must be 2 (i. e. Load 123456)
	jne	do_bad_args		; not ok

	invoke	nextnull,addr tok_list1	; find end of 1st token 'Load'
	inc	eax			; just past null char

	mov	esi,eax			; get load address string
	invoke	hexbin32,esi
	cmp	ebx,0			; hex to bin ok?

	je	do_bad_hex		; no

	mov	dword ptr load_offset,eax
	jmp	cmd_ret

;+
; Note:
;	It should be realized that this command will work w/o flow control
;	from the attached controlling PC. The processing of the Hex record
;	must happen in 1 character time. Easy...
;-
cmd_ihex:
	pusha
	invoke	hexload,addr line_buf1,DWORD PTR load_offset
	cmp	eax,HEX_OK		; check return code
	je	cmd_ret			; ok
;+
; we have a command code, translate, show error on current line
; so that the communications downloader doesn't see the return until
; the next prompt line is issued
;-
	cmp	eax,HEX_ERR_PREFIX
	jne	@f

	mov	esi,offset bad_prefix	; load error message address
	jmp	cmd_err			; common error will print it

@@:
	cmp	eax,HEX_ERR_CHECK
	jne	@f

	mov	esi,offset bad_check
	jmp	cmd_err

@@:
	cmp	eax,HEX_ERR_TYPE
	jne	@f

	mov	esi,offset bad_type
	jmp	cmd_err

@@:
	cmp	eax,HEX_ERR_SHORT
	jne	@f

	mov	esi,offset bad_short
	jmp	cmd_err

@@:
	cmp	eax,HEX_ERR_LONG
	jne	@f

	mov	esi,offset bad_long
	jmp	cmd_err

@@:
	cmp	eax,HEX_ERR_ADDR
	jne	@f

	mov	esi,offset bad_addr
	jmp	cmd_err

@@:
	cmp	eax,HEX_ERR_LENGTH
	jne	@f

	mov	esi,offset bad_length
	jmp	cmd_err

@@:
	cmp	eax,HEX_ERR_DATA
	jne	@f

	mov	esi,offset bad_data
	jmp	cmd_err

@@:
	mov	esi,offset bad_internal	; we *should* not have this error!
	jmp	cmd_err

cmd_err:
	invoke	putstr_cs,esi
	jmp	cmd_ret

;+
; command error conditions
;-
do_bad_args:
	invoke	putstr_cs,addr m_args	; bad number of args
	jmp	cmd_ret

do_bad_hex:
	invoke	putstr_cs,addr bad_hex
	jmp	cmd_ret

cmd_ret:
;+
; common return
;-
cmd_ret2:
	popa
	jmp	parse_top		; return to parser

;+
; Routine: hexload
;
; Purpose: Intel HEX line parse and load into memory
;
; Inputs:
;	buffer	ptr to Intel HEX record (asciz)
;		 (DS relative)
;	val	Offset to add to Intel HEX addresses (relative to DS)
;
; Outputs:
;	eax	contains status return
;
; Notes:
;
;	: LL AAAA TT DD DD DD DD .. CC
;
; Intel HEX record fields
;
;	:	Prefix
;	LL	Length		Number of data bytes in record
;	AAAA	Address
;	TT	Record Type
;	DD	Data bytes
;	CC	Checksum	mod 256 sum of: {LL, all DDi, AAlo, AAhi, TT}
;
; This routine is very paranoid about bad formats in the hex record.
;-
hexload	PROC	NEAR32 uses ebx ecx edx esi edi,buffer:DWORD,val:DWORD
	LOCAL	buffer_len:DWORD,
		temp_string [8]:BYTE,
		len_field:DWORD,
		chk_field:DWORD,
		addr_field:DWORD

	mov	esi,buffer
	cmp	BYTE PTR [esi],':'	; assert prefix
	jne	hexl_91			; error, no prefix

	invoke	strlen,esi		; get length of whole string
	cmp	eax,11			; test length
	jl	hexl_92			; too short

	mov	DWORD PTR buffer_len,eax ; save length
	mov	edi,esi			; start of buffer
	add	edi,7			; record type starts here
	invoke	gethex2,edi		; cvt 2 hex digits -> binary
	cmp	ebx,0			; status?
	je	hexl_93			; bad type

;+
; we have the type, only process type 00 records (how ignorant!)
;-
; (tek) now process type 02 (extended address) as well.
	cmp	eax, 02h
	je	hexl_02			; is an address record.
	cmp	eax,0			; we want type 00 only (ignore others)
	jne	hexl_90

;+
; get the length
;-
	mov	edi,esi			; start of buffer
	inc	edi			; length field starts here
	invoke	gethex2,edi		; cvt 2 hex digits -> binary
	cmp	ebx,0			; status?
	je	hexl_94			; bad length

	mov	DWORD PTR len_field,eax	; save length field
	add	eax,eax			; 2*L
	add	eax,11			; prefix, address, type, check, len
	cmp	eax,DWORD PTR buffer_len ; does the length field make sense?
	jb	hexl_95			; no, string too big
	ja	hexl_96			; no, string too short
;+
; We have the length field and it makes sense...
;
; Verify the checksum, we *have* to do this before writing into RAM.
;
; Furthermore, this implies that we have to read the buffer twice:
;	1) to compute checksum and validate it
;	2) to read data and store it...
;-
	mov	edi,esi			; start of record
	add	edi,DWORD PTR buffer_len	; now points to trailing null
	sub	edi,2			; now points to start of 2 char checksum
	invoke	gethex2,edi		; get it
	cmp	ebx,0			; status?
	je	hexl_97			; checksum error

	mov	DWORD PTR chk_field,eax	; save this value

;+
; now get the address field (we need it later anyway and we have to have
; it to compute the checksum
;-
	mov	edi,esi			; start of record
	add	edi,3			; points to address
	invoke	gethex4,edi		; cvt 4 digits -> binary
	cmp	ebx,0
	je	hexl_98			; address error

	mov	DWORD PTR addr_field,eax ; save the field

;+
; compute the checksum in dl
;-
	xor	edx,edx
	add	dl,al			; address low
	add	dl,ah			; address high

	mov	ecx,DWORD PTR len_field
	add	dl,cl			; keep adding in checksum bytes

	mov	eax,DWORD PTR chk_field
	add	dl,al
;+
; don't add in the type (the type is 0)
;-

;+
; get the data bytes and add into the checksum counter
;-
	mov	edi,esi			; start of record
	add	edi,9			; start of 1st data character

@@:
	invoke	gethex2,edi		; get value of DD
	add	edi,2			; point to next data sequence
	cmp	ebx,0			; status?
	je	hexl_99			; data error

	add	dl,al			; add in data byte
	loop	@b			; repeat for entire data sequence

	jnz	hexl_97			; checksum != 0, fail...

;+
; ok, after all this checking and testing, we are convinced that the
; Intel HEX record is ok.
;
; Write out the data bytes to the correct address (taking into account the
; load bias as passed in the input arg 'val')...
;-
	mov	ecx,DWORD PTR len_field	; how many data bytes
	mov	edi,esi			; start of record
	add	edi,9			; start of data characters
	mov	edx,DWORD PTR val	; address bias
	add	edx,DWORD PTR load_adder; from the extended record.
	mov	esi,DWORD PTR addr_field ; base address from HEX record

@@:
	invoke	gethex2,edi
	add	edi,2			; point to next data
	mov	[esi+edx],al		; store in memory
	inc	esi			; bump target address
	loop	@b
;+
; fall throught, status ok
;-
hexl_90:
	mov	eax,HEX_OK		; ok status
	jmp	hexl_end

hexl_91:
	mov	eax,HEX_ERR_PREFIX	; error code
	jmp	hexl_badend

hexl_92:
	mov	eax,HEX_ERR_SHORT
	jmp	hexl_badend

hexl_93:
	mov	eax,HEX_ERR_TYPE
	jmp	hexl_badend

hexl_94:
	mov	eax,HEX_ERR_LENGTH
	jmp	hexl_badend

hexl_95:
	mov	eax,HEX_ERR_LONG
	jmp	hexl_badend

hexl_96:
	mov	eax,HEX_ERR_SHORT
	jmp	hexl_badend

hexl_97:
	mov	eax,HEX_ERR_CHECK
	jmp	hexl_badend

hexl_98:
	mov	eax,HEX_ERR_ADDR
	jmp	hexl_badend

hexl_99:
	mov	eax,HEX_ERR_DATA
	jmp	hexl_badend

hexl_02:
	;this is a extended address record. 
	; the checksumming is copied from the load record section;
	; it could use the same one, but then we need to keep the record
	; type laying around..

;+
; get the length
;-
	mov	edi,esi			; start of buffer
	inc	edi			; length field starts here
	invoke	gethex2,edi		; cvt 2 hex digits -> binary
	cmp	ebx,0			; status?
	je	hexl_94			; bad length

	mov	DWORD PTR len_field,eax	; save length field
	add	eax,eax			; 2*L
	add	eax,11			; prefix, address, type, check, len
	cmp	eax,DWORD PTR buffer_len ; does the length field make sense?
	jb	hexl_95			; no, string too big
	ja	hexl_96			; no, string too short
;+
; We have the length field and it makes sense...
;
; Verify the checksum, we *have* to do this before writing into RAM.
;
; Furthermore, this implies that we have to read the buffer twice:
;	1) to compute checksum and validate it
;	2) to read data and store it...
;-
	mov	edi,esi			; start of record
	add	edi,DWORD PTR buffer_len	; now points to trailing null
	sub	edi,2			; now points to start of 2 char checksum
	invoke	gethex2,edi		; get it
	cmp	ebx,0			; status?
	je	hexl_97			; checksum error

	mov	DWORD PTR chk_field,eax	; save this value

;+
; now get the address field (we need it later anyway and we have to have
; it to compute the checksum
;-
	mov	edi,esi			; start of record
	add	edi,3			; points to address
	invoke	gethex4,edi		; cvt 4 digits -> binary
	cmp	ebx,0
	je	hexl_98			; address error

	mov	DWORD PTR addr_field,eax ; save the field

;+
; compute the checksum in dl
;-
	xor	edx,edx
	add	dl,al			; address low
	add	dl,ah			; address high

	mov	ecx,DWORD PTR len_field
	add	dl,cl			; keep adding in checksum bytes

	mov	eax,DWORD PTR chk_field
	add	dl,al
;+
; add in the type (the type is 02h)
;-
	add	dl, 02h

;+
; get the data bytes and add into the checksum counter
;-
	mov	edi,esi			; start of record
	add	edi,9			; start of 1st data character

@@:
	invoke	gethex2,edi		; get value of DD
	add	edi,2			; point to next data sequence
	cmp	ebx,0			; status?
	je	hexl_99			; data error

	add	dl,al			; add in data byte
	loop	@b			; repeat for entire data sequence

	jnz	hexl_97			; checksum != 0, fail...

;+
; ok, after all this checking and testing, we are convinced that the
; Intel HEX record is ok.
;
; find the extended address and put it in memory.
;-

	mov	edi,esi			; start of record
	add	edi,9			; points to ext address
	invoke	gethex4,edi		; cvt 4 digits -> binary
	cmp	ebx,0
	je	hexl_98			; address error

	shl	eax,4			; it's paragraphs, tho..

	mov	DWORD PTR load_adder,eax ; save the field

	jmp	hexl_90			; normal exit.


hexl_end:
	ret


hexl_badend:
	mov	edx,1
	mov	dword ptr loader_error,edx
	ret

hexload	ENDP
ROM_CodeP	ENDS
	end
