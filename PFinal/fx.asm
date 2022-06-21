%include "asm_io.inc"
extern _printf, _scanf

%define x1 1

segment .data


segment .bss
    ;x1  resb 4

segment .text
	global _fx	
_fx:
    enter 	0,0
	pusha

    mov eax, x1 
    mov ebx, 2
    mul ebx
    print
    
    popa
	mov	eax, 0		; return back to C
	leave
	ret