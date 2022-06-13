%include "asm_io.inc"

segment .data
    entrada1    db "Informe X: ",0
    entrada2    db "Informe Y: ",0
    x1           dd 1,2,3,4,5
    y1           dd 0.54,-0.41,-0.98,-0.65,0.28

segmente .ssb
    L   resd 1

segment .text
	global _asm_main	
_asm_main:
    enter 	0,0
	pusha
    
    mov eax, entrada1
    call print_string
    call read_int
    mov [x], eax

    mov eax, entrada2
    call print_string
    call read_int
    mov [y], eax

    mov eax, 0
    mov ecx, 5
_for:
    mov eax, 1
    mov [L], eax

    add eac, ecx
    loop _for

Fim:
    popa
	mov	eax, 0		; return back to C
	leave
	ret