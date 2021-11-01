%include "asm_io.inc"
segment .data
entrada db "idade: ", 0
saida1  db "infantil", 0
saida2 db "juvenil", 0
saida3 db "adulto", 0

segment .bss
input1 resd 1
input2 resd 2

segment .text 
    global _asm_main

_asm_main:
    enter 0,0
    mov eax, entrada
    call print_string
    call read_int
    mov [input1], eax
    call print_nl

    cmp eax, 10
    jle infantil

    cmp eax, 17
    jle juvenil

    cmp eax, 18
    jge adulto
    
infantil:
    mov eax, saida1
    call print_string
    call print_nl
    jmp fim

juvenil:
    mov eax, saida2
    call print_string
    call print_nl
    jmp fim

adulto:
    mov eax, saida3
    call print_string
    call print_nl
    jmp fim

fim:
    call print_nl

    popa
    mov eax, 0
    leave
    ret 