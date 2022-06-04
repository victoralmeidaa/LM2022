%include "asm_io.inc"

;   masn -f win32 main.asm
;   nasm -f win32 asm_io.asm
;   gcc -c -o driver.obj driver.C
;   gcc -o main driver.obj main.obj masm_io.obj

;4. Desenvolva um algoritmo que dado os lados de um triângulo A, B e C. Dizer se os
;lados formam um triângulo:
;• Retângulo = (A² = B² + C²);
;• Obtusângulo = (A² > B² + C²);
;• Acutângulo = (A² < B² + C²).

segment .data
    entrada0    db "Informe lado A: " ,0
    entrada1    db "Informe lado B: " ,0
    entrada2    db "Informe lado C: " ,0
    saida1      db "Retangulo" ,0
    saida2      db "Obtusângulo" ,0
    saida3      db "Acutângulo" ,0

segment .bss
    inputA    resd 1
    inputB    resd 1
    inputC    resd 1
    inputR    resd 1
    A2        resd 1
    B2        resd 1
    C2        resd 1

segment .text
    global _asm_main

_asm_main:
    enter 0,0
    pusha

    ; Ler dados 
    mov eax, entrada0
    call print_string

    call read_int
    mov [inputA], eax
    call print_nl

    mov eax, entrada1
    call print_string

    call read_int
    mov [inputB], eax
    call print_nl

    mov eax, entrada2
    call print_string

    call read_int
    mov [inputC], eax
    call print_nl

    
    mov eax, [inputA]
    mov ebx, 2
    mul ebx
    mov [A2], eax

    mov eax, [inputB]
    mov ebx, 2
    mul ebx
    mov [B2], eax

    mov eax, [inputC]    
    mov ebx, 2
    mul ebx
    mov [C2], eax

    ;• Retângulo = (A² = B² + C²);
    mov eax, [B2]
    add eax, [C2]
    cmp [A2], eax
    je Retangulo

    ;• Obtusângulo = (A² > B² + C²);
    mov eax, [B2]
    add eax, [C2]
    cmp [A2], eax
    jg Obtusangulo

    ;• Acutângulo = (A² < B² + C²).
    mov eax, [B2]
    add eax, [C2]
    cmp [A2], eax
    jl Acutangulo

Retangulo:
    mov eax, saida1
    call print_string
    call print_nl
    jmp Fim
    
Obtusangulo:
    mov eax, saida2
    call print_string
    call print_nl
    jmp Fim

Acutangulo:
    mov eax, saida3
    call print_string
    call print_nl
    jmp Fim


Fim:
    popa
    mov eax, 0
    leave
    ret




