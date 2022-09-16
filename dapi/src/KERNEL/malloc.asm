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
;*    File Name:        malloc.asm
;*    Author:
;*    Creation Date:
;*
;*    Functionality:
;*      Memory allocation routines 
;*
;***********************************************************************
;*    Revision History:
;*
;* 1apr97      ...tek          fix the memory leak problem for Compower
;-

	title   Memory allocation routines 

	.xlist
	include os_macs.asm
	include c_macs.asm
	.list

	queue_defs
	memory_defs
	kernel_data

	.code

;
;  malloc() allocates atleast paras of memory.  Full paragraphs (16 bytes)
;  are allocated for odd bytes and a paragraph header is used for free.
;

c_sys_entry     malloc,paras

	mov     ax,seg ram_queue                ; Point a queue head
	mov     ds,ax
	mov     si,offset ram_queue
;
;  adjust to an even number of paras plus 1 (for free)
;
	mov     cx,paras
	inc     cx

;
;  find the first fit block ...
;
	xor     dx,dx           ; Assume no block found

find_block:

	cmp     mem$seg,0
	je      done_malloc

	cmp     mem$size,cx
	je      take_block
	ja      take_some
	lds     si,mem$pointer
	jmp     find_block
;
;  take the block off the queue ...
;

take_block:

	les     bx,mem$pointer
	mov     ax,es:[bx]
	mov     ds:[si],ax
	mov     ax,es:[bx+2]
	mov     ds:[si+2],ax
	mov     ax,es:[bx+4]
	mov     ds:[si+4],ax    

	mov     es:[bx],cx
	mov     dx,es
	inc     dx
	jmp     done_malloc
;
;  take the end of this block ...
;

take_some:

	sub     mem$size,cx             ; Drop down the size
	mov     dx,mem$seg              ; Get the segment pointer
	add     dx,mem$size             ; Point at allocated block

	mov     es,dx                   ; Point a block chain
	xor     bx,bx
	mov     es:[bx],cx              ; Save it's size
	inc     dx

;
;  now, dx:ax returns block ...
;

done_malloc:

	xor     ax,ax

exit            malloc


;
;  free() is used to return a block of ram to the free pool ..
;


c_sys_entry     free,block_off,block_seg


;
;  Point at real block head and get the size ...
;

	mov     bx,block_seg
	dec     bx
	mov     es,bx
	xor     bx,bx
	mov     cx,es:[bx]

	mov     dx,es
;
;  Now, for those of you who missed that cx has the size, dx:0 points at
;  block start (because a malloc'd block only contains the size in the
;  header.. tek 01apr97)
;

start_search:

	mov     ax,seg ram_queue
	mov     ds,ax
	mov     si,offset ram_queue

	jmp     check_end

next_block:

	lds     si,mem$pointer

check_end:

	cmp     mem$seg,0               ; Are we at the end ??
	jne     check_merge             ; Nope, so keep going
	jmp     add_block               ; Yep, add it and exit
	
;
;  check to see if we can merge this with another block on the
;  queue, first, see if this block we are looking at runs up to
;  this one ie ds:[si]+size = dx:0
;

check_merge:

	mov     ax,mem$size
	add     ax,mem$seg
	cmp     dx,ax
	jne     merge_head      
;
;  if this fits on the end to the merge and see if the new block 
;  fills a previous hole ...
;
	mov     dx,mem$seg
	jmp     update_queue

;
;  Now see if the block fits in behind of this one ...
;

merge_head:

	mov     bx,dx
	add     bx,cx
	cmp     bx,mem$seg
	jne     next_block

;
;  if we merge here, dx is still correct, and only cx need to be
;  updated with the new size
;


;
; if two blocks were merged, then the merged results are now in
; dx:0 and cx.  Update the chain and see if this new block merges
; in somewhere else ...
;

update_queue:

	add     cx,mem$size
	les     bx,mem$pointer
	mov     ax,es:[bx]      
	mov     ds:[si],ax
	mov     ax,es:[bx+2]
	mov     ds:[si+2],ax
	mov     ax,es:[bx+4]
	mov     ds:[si+4],ax
	jmp     start_search

;
;  finally, it fit no   
;

add_block:
	mov     ax,seg ram_queue
	mov     ds,ax
	mov     si,offset ram_queue
	; here we have 
	;       dx:     seg of block to add (remember, off is always 0)
	;       cx:     size of block to add
	;       ds:si:  ram_queue
	;
	; we would like to march through the list to insert this block
	; just before first block that is larger than this block. Because
	; we don't have back-pointers, we'll have to use both ds and es
	; to walk the list and still have the pointer to the insertion
	; point.. 
ab_next:        les     bx, mem$pointer         ; get next element..
		xor     ax, ax
		cmp     ax,es:[bx+2]            ; is seg 0 ?
		je      ab_insert_here          ; yes, end of list.

		cmp     cx, es:[bx+4]           ; how's the size?
		ja      ab_insert_here          ; bigger; insert here.

		; move on to the next element
		lds     si, mem$pointer
		jmp     ab_next

	
ab_insert_here:
	; here we have
	;       ds:si:  entry before the insert
	;       es:bx:  entry after the insert
	;       dx:0:   block to insert
	;       cx:     size of block to insert
	;
	;
	; first, update the prior element to point to the inserted
	; element
	mov     ds:[si+2],dx    ; seg of insert
	xor     ax,ax
	mov     ds:[si], ax     ; off of insert
	; careful.. need to keep the size of the block after ..
	mov     ax, ds:[si+4]   ; size of after block
	; now store the inserted size in the prior block
	mov     ds:[si+4],cx    ; size of insert
	; now, point ds:si at this newly inserted block
	lds     si, mem$pointer
	;update the contents..
	mov     ds:[si+4],ax    ; size
	mov     ds:[si], bx     ; off
	mov     ax, es          ; seg
	mov     ds:[si+2],ax

	; make a note that we're been here.. 
	mov     ax, 0feedh    ; block after flag
	mov     es:[bx+8], ax
	mov     ax, 0deadh    ; block insert flag
	mov     ds:[si+8], ax


;       mov     mem$seg,dx
;       mov     mem$size,cx
;       mov     es,dx
;       xor     bx,bx
;       mov     word ptr es:[bx],0
;       mov     word ptr es:[bx+2],0
;       mov     word ptr es:[bx+4],0

free_done:

exit            free



;
;  return the total free memory ...
;
;
;c_sys_entry    max_block
;
;       mov     ax,0
;       lds     si,ram_queue
;
;find_biggest:
;
;       cmp     mem$seg,0               ; at end?
;       je      found_biggest
;       add     ax,mem$size
;       lds     si,mem$pointer
;       jmp     find_biggest
;
;found_biggest:
;
;exit           max_block


;
;  return the total free memory ...
;  tek 24mar97 corrected version

c_sys_entry     max_block

	mov     ax,0
	mov     dx, 0           ; tek 12mar97 biggest so far
	mov     ax,seg ram_queue                ; Point a queue head
	mov     ds,ax
	mov     si,offset ram_queue

;       lds     si,ram_queue

find_biggest:

	cmp     mem$seg,0               ; at end?
	je      found_biggest
	cmp     dx,mem$size             ; 12mar97 ..
	ja      not_bigger
	mov     dx, mem$size
not_bigger:
	lds     si,mem$pointer
	jmp     find_biggest

found_biggest:

	mov     ax, dx                  ; return the biggest.
exit            max_block




	end


