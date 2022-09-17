 	title	interface to the protected-mode loader helpers

; 14dec93	...tek		initial for DE.

	.xlist
	include os_macs.asm
	include c_macs.asm
	include	de.asm
	.list


	.code

c_far_entry	_read_rom,src_lo,src_hi,count,buff_lo,buff_hi

	push	bx
	push	cx
	push	dx
	push	si

	; dest addr is 24-bit flat
	mov	ax, buff_hi
	shl	ax, 8
	mov	bx, buff_lo

	; function
	mov	al, READROM

	; src addr is 32-bit flat.
	mov	cx, src_hi
	mov	dx, src_lo
	mov	si, count

	int	pm_vector

	pop	si
	pop	dx
	pop	cx
	pop	bx
	xor	ax,ax	; return(0)

exit	_read_rom
end
