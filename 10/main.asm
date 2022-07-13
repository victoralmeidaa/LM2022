%include "asm_io.inc"

;   nasm -f win32 main.asm
;   nasm -f win32 asm_io.asm
;   gcc -c -o driver.obj driver.c
;   gcc -o main driver.obj main.obj asm_io.obj

segment .data

segment .bss

segment .text
	global _asm_main	

_asm_main:
	enter 	0,0
	pusha

    

    popa
	mov	eax, 0		; return back to C
	leave
	ret