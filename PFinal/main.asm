%include "asm_io.inc"
    extern _printf, _scanf	
segment .data
    format_float: db "Resultado: %f", 10, 0
    x1 dq 1.0
    a  dq 4.0
    b  dq 1.0
    d  dq 1.0
segment .bss
    fx:  resq 1
    fxa:    resd 1
    num1:  rest 1
    num2:  rest 1
    c:     resb 1
    xa:    resb 1
    xb:    resd 1
    erro:  resb 1
    temp    resd 1
segment .text
	global _asm_main
_asm_main:
    enter 	0,0
	pusha
    ;f(x) = x^(2)-4+1 = x1^2-a+b
    fldz
    fld qword [x1]
    fmul st0,st0
    fsub qword[a]
    fadd qword[b]
    fist dword[fxa] 
    mov eax, [fxa] 
    call print_int
    call print_nl 
    ;sub esp, 8
    ;fild qword[fxa]
    ;fst qword[fxa]
    
    ;add esp, 12
    ;intervalo c = d + passo / if (f(d) * f(c)) < 0:
    
    ;secante c = -(b * f(a) - a * f(b)) / (f(b) - f(a))

    
    
    ;flinha(x) = (2*x)*x^(2)-4
    ;mov eax, 2
    ;mov ebx, x1
    ;mul ebx
    ;mov [num1], eax
    ;mov eax, x1
    ;mov ebx, x1
    ;mul ebx
    ;mov [pow1], eax
    ;mov eax, [num1]
    ;mov ebx, [pow1]
    ;mul ebx
    ;sub eax, 4      ;alerta de sinal trocado
    ;mov [b], eax
    ;push format_float
    ;call _printf

    ;intervalo 



    popa
	mov	eax, 0		; return back to C
	leave
	ret