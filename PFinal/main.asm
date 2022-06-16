%include "asm_io.inc"
extern _printf

segment .data
    entrada1    db "Informe X: ",0
    entrada2    db "Informe Y: ",0
    x1          db 1,2,3,4,5
    y1          db 0.54,-0.41,-0.98,-0.65,0.28
    format_float: db "Resultado: %f", 10, 0

segment .bss
    L   resb 1
    num1:  resb 4
    num2:  resb 4
    num3:  resb 4

segment .text
	global _asm_main	
_asm_main:
    enter 	0,0
	pusha
    
    mov dword [num1], 2
    mov dword [num2], __float32__(5.5)

    sub esp, 8
    fild dword [num1]
    fadd dword [num2]
    fstp qword [esp]
    push format_float
    call _printf
    add esp, 12

   ; mov eax, 0
    ;mov ecx, 5
;_for:
    ;mov eax, 1
    ;mov [L], eax

    ;add eax, ecx
   ; loop _for


    popa
	mov	eax, 0		; return back to C
	leave
	ret