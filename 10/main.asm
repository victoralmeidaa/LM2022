%include "asm_io.inc"

;   nasm -f win32 main.asm
;   nasm -f win32 asm_io.asm
;   gcc -c -o driver.obj driver.c
;   gcc -o main driver.obj main.obj asm_io.obj

;	Escreva um programa que leia as coordenadas x e y de pontos no R²
;	e calcule sua distância da origem (0,0).

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